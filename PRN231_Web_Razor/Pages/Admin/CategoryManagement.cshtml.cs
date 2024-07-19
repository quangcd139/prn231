using System.ComponentModel.DataAnnotations;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project_Cinema_PRN231.domain.category;
using Project_Cinema_PRN231.model;

namespace Library.Pages.Admin
{
    public class CategoryManagementModel : PageModel
    {

        public string mess { get; set; }
        public IList<Category> Categories { get; set; }
        [BindProperty]
        public Category Category { get; set; }

        [Required]
        public IFormFile Image { get; set; }
        public void OnGet()
        {
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/Category/GetCategory").Result;
            var list = response.Content.ReadFromJsonAsync<List<Category>>().Result;
            Categories = (IList<Category>)list.ToList();
        }

        public async Task<IActionResult> OnPostEditCategory()
        {
            var idUpdate = int.Parse(Request.Form["id"]);
            var nameUpdate = Request.Form["name"];

            HttpClient client = new HttpClient();
            HttpResponseMessage responseById = client.GetAsync("http://localhost:5000/api/Category/GetCategory/?$filter=id%20eq%20" + idUpdate).Result;
            var category = responseById.Content.ReadFromJsonAsync<List<Category>>().Result;
            Category c = category[0];
            c.Name = nameUpdate;
            var file = Request.Form.Files["newimage"];

            if (file != null && file.Length > 0)
            {
                var fileName = file.FileName;
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "assets", "images", "category", fileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }

                c.Image = "/assets/images/category/" + fileName;
            }

            //call api update
            var request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:5000/api/Category/Update");
            request.Headers.Add("Accept", "*/*");
            var jsonString = Newtonsoft.Json.JsonConvert.SerializeObject(c);
            var content = new StringContent(jsonString, Encoding.UTF8, "application/json");
            request.Content = content;
            // Await the asynchronous call to send the request
            var response = await client.SendAsync(request);

            return RedirectToPage();
        }

        public IActionResult OnPostAddCategory()
        {
            var fileName = Image.FileName;
            var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "img", "category", fileName);
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                Image.CopyTo(stream);
            }
            Category.Image = "/img/category/" + fileName;

            //_unitOfWork.CategoryRepository.Add(Category);
            //_unitOfWork.SaveChange();

            return RedirectToPage();
        }

        //public IActionResult OnGetDeleteCategory(int categoryId)
        //{
        //    try
        //    {
        //        _unitOfWork.CategoryRepository.Delete(categoryId);
        //        _unitOfWork.SaveChange();
        //        return new JsonResult("1");

        //    }
        //    catch (Exception e)
        //    {
        //        return new JsonResult("0");

        //    }

        //}
        public IActionResult OnGetExportFile()
        {
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/Category/GetCategory").Result;
            var list = response.Content.ReadFromJsonAsync<List<Category>>().Result;
            var data = (IList<Category>)list.ToList();

            MemoryStream memoryStream = new MemoryStream();
            StreamWriter streamWriter = new StreamWriter(memoryStream);

            streamWriter.WriteLine("CategoryId," + "CategoryName");
            // Ghi dữ liệu vào tập tin
            foreach (var item in data)
            {
                streamWriter.WriteLine(item.Id + "," + item.Name);
            }
            streamWriter.Flush();
            memoryStream.Seek(0, SeekOrigin.Begin);

            // Trả về tập tin đã tạo
            return File(memoryStream, "text/csv", "categories.csv");
        }
        //public string ImportMessage { get; set; }

        //public async Task<IActionResult> OnPostImportFile(IFormFile csvFile)
        //{
        //    if (csvFile == null || csvFile.Length == 0)
        //    {
        //        ImportMessage = "No file selected.";
        //        return RedirectToPage();
        //    }

        //    using (var reader = new StreamReader(csvFile.OpenReadStream(), Encoding.UTF8))
        //    {
        //        // Đọc dữ liệu từ tập tin CSV
        //        var csvData = await reader.ReadToEndAsync();
        //        List<Category> chiatay = new List<Category>();
        //        List<Category> all = _unitOfWork.CategoryRepository.GetAll().ToList();
        //        var lines = csvData.Split("\n");
        //        for (int i = 1; i < lines.Length; i++)
        //        {
        //            Category c;
        //            var line = lines[i].Trim();
        //            if (line == "")
        //            {
        //                break;
        //            }
        //            var value = line.Split(',');
        //            if (all.FirstOrDefault(x => x.CategoryId == int.Parse(value[0])) == null)
        //            {
        //                c = new Category
        //                {
        //                    CategoryName = value[1],
        //                    Image = ""
        //                };
        //                _unitOfWork.CategoryRepository.Add(c);
        //                _unitOfWork.SaveChange();
        //            }
        //        }

        //        ImportMessage = "File imported successfully.";
        //    }

        //    return RedirectToPage();
        //}
    }
}
