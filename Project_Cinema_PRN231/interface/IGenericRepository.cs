namespace Project_Cinema_PRN231.@interface
{
    public interface IGenericRepository<T> where T : class
    {
        IList<T> GetAll();
        T Find(int id);
        void Add(T entity);

        void Update(T entity);

        void Delete(int id);
    }
}
