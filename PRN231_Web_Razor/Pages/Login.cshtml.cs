using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using Project_Cinema_PRN231.domain.category;
using Project_Cinema_PRN231.domain.sysuser;
using Project_Cinema_PRN231.model;
using System.Net;
using System.Text.Json;

namespace PRN231_Web_Razor.Pages
{
	public class LoginModel : PageModel
	{

		public IActionResult OnGet()
		{

			return Page();
		}

		public async Task<IActionResult> OnPost()
		{
			var email = Request.Form["sign-in-email"];
			var password = Request.Form["sign-in-passwd"];

			var client = new HttpClient();
			var request = new HttpRequestMessage(HttpMethod.Post, $"http://localhost:5000/api/SysUser/login/{email}/{password}");
			request.Headers.Add("accept", "*/*");
			var response = await client.SendAsync(request);
			if (response.StatusCode == HttpStatusCode.NotFound)
			{
				var errorMessage = "username or password is incorrect";
				return RedirectToPage("Login", new { error = errorMessage });
			}

			var responseContent = response.Content.ReadFromJsonAsync<SysUserDto>().Result;

			HttpContext.Session.SetString("username", email);
            HttpContext.Session.SetString("userId", responseContent.Id.ToString());

            HttpContext.Session.SetString("fullname", responseContent.Fullname);
			HttpContext.Session.SetString("role", responseContent.IsAdmin?"admin":"user");


			if (responseContent.IsAdmin)
			{
				return RedirectToPage("Admin/Dashboard");
			}
			return RedirectToPage("Index");
		}

	}
}
