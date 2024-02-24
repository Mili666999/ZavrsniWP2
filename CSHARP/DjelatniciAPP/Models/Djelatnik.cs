using System.ComponentModel.DataAnnotations;

namespace DjelatniciAPP.Models
{
    /// <summary>
    /// Ovo mi je POCO koji je mapiran na bazu
    /// </summary>
    public class Djelatnik : Entitet
    {
        /// <summary>
        /// Ime djelatnika u bazi
        /// </summary>
        [Required(ErrorMessage = "Ime obavezno")]
        public string? Ime { get; set; }
        
        /// <summary>
        /// Prezime djelatnika
        /// </summary>
        [Required(ErrorMessage = "Prezime obavezno")]
        public string? Prezime { get; set; }
        
        /// <summary>
        /// Email djelatnika
        /// </summary>
        [Required(ErrorMessage = "Email obavezno")]
        public string? Email { get; set; }
        
        /// <summary>
        /// Mobitel djelatnika
        /// </summary>
        [Required(ErrorMessage = "Mobitel obavezno")]
        public string? Mobitel { get; set; }
        
        /// <summary>
        /// OIB djelatnika
        /// </summary>
        [Required(ErrorMessage = "OIB obavezno")]
        public string? Oib { get; set; }

        /// <summary>
        /// IBAN djelatnika
        /// </summary>
        [Required(ErrorMessage = "IBAN obavezno")]
        public string? Iban { get; set; }
    }
}
