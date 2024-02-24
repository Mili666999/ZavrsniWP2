using System.ComponentModel.DataAnnotations;

namespace DjelatniciAPP.Models
{
    /// <summary>
    /// Vršna nad klasa koja služi za osnovne atribute tipa šifra
    /// </summary>
    public abstract class Entitet
    {
        /// <summary>
        /// Ovo svojstvo mi služi kao primarni ključ u bazi
        /// s generiranjem vrijednosti identity(1,1)
        /// </summary>
        [Key]
        public int Id { get; set; }
    }
}
