using DjelatniciAPP.Models;
using Microsoft.EntityFrameworkCore;

namespace DjelatniciAPP.Data
{
    /// <summary>
    /// Datoteka gdje ću navoditi datasetove i načine spajanja u bazi
    /// </summary>
    public class DjelatniciContext : DbContext
    {
        /// <summary>
        /// Konstruktor
        /// </summary>
        /// <param name="options"></param>
        public DjelatniciContext(DbContextOptions<DjelatniciContext> options)
            : base(options)
        {
        
        }

        /// <summary>
        /// Djelatnici u bazi
        /// </summary>
        public DbSet<Djelatnik> Djelatnici { get; set; }
    }
}
