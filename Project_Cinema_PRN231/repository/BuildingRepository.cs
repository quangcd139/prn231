using Project_Cinema_PRN231.@interface;
using Project_Cinema_PRN231.model;

namespace Project_Cinema_PRN231.repository
{
    public class BuildingRepository:GenericRepository<Building>, IBuildingRepository
    {
        public BuildingRepository(Project_Cinema_PRN231Context context) : base(context)
        {

        }
    }
}
