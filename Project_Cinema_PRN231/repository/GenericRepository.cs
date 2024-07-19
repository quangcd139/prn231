using Microsoft.EntityFrameworkCore;
using Project_Cinema_PRN231.@interface;
using Project_Cinema_PRN231.model;

namespace Project_Cinema_PRN231.repository
{
    public class GenericRepository<T>:IGenericRepository<T> where T : class
    {
        protected Project_Cinema_PRN231Context context;
        protected DbSet<T> dbSet;

        public GenericRepository(Project_Cinema_PRN231Context context = null)
        {
            this.context = context ?? new Project_Cinema_PRN231Context();
            dbSet = context.Set<T>();
        }

        // getAllInfor
        public IList<T> GetAll()
        {
            var query = dbSet.AsQueryable();
            var navigations = context.Model.FindEntityType(typeof(T))
                .GetDerivedTypesInclusive()
                .SelectMany(type => type.GetNavigations())
                .Distinct();
            foreach (var property in navigations)
            {
                query = query.Include(property.Name);
            }
            return query.ToList();
        }

        //Find By Id
        public T Find(int id)
        {
            return dbSet.Find(id);
        }

        public T FindByCode(String code)
        {
            return dbSet.Find(code);
        }

        /// Add new Entity
        public void Add(T entity)
        {
            dbSet.Add(entity);

        }

        /// Update an Entity
        public void Update(T entity)
        {
            dbSet.Update(entity);
        }

        /// Delete an Entity, Using entity's id
        public void Delete(int id)
        {
            T entity = dbSet.Find(id);
            dbSet.Remove(entity);

        }
    }
}
