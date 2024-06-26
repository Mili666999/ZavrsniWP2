﻿using DjelatniciAPP.Data;
using DjelatniciAPP.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace DjelatniciAPP.Controllers
{
    /// <summary>
    /// Namjenjeno za CRUD operacije nad entitetom djelatnik u bazi
    /// </summary>
    [ApiController]
    [Route("api/v1/[controller]")]
    public class DjelatnikController : ControllerBase
    {
        /// <summary>
        /// Kontekst za rad s bazom koji će biti postavljen pomoću Dependency Injectiona
        /// </summary>
        private readonly DjelatniciContext _context;

        /// <summary>
        /// Konstrukotr klase koja prima Djelatnici context pomoću DI
        /// </summary>
        /// <param name="context"></param>
        public DjelatnikController(DjelatniciContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Dohvaća sve djelatnike iz baze
        /// </summary>
        /// <remarks>
        /// Primjer upita
        ///     
        ///     GET api/vi/Djelatnik
        /// 
        /// </remarks>
        /// <returns>Djelatnici u bazi</returns>
        /// <response code="200">Sve OK, ako nema podataka content length - 0</response>
        /// <response code="400">Zahtjev nije valjan</response>
        /// <response code="503">Baza na koju se spajam nije dostupna</response>
        [HttpGet]
        public IActionResult Get()
        {
            //Kontrola ukoliko upit nije valjan
            if (!ModelState.IsValid)
            { 
                return BadRequest(ModelState);
            }

            try 
            {
                var Djelatnici = _context.Djelatnici.ToList();
                if(Djelatnici == null || Djelatnici.Count == 0)
                {
                    return new EmptyResult();
                }
                return new JsonResult(Djelatnici);
            }
            catch (Exception ex) 
            {
                return StatusCode(StatusCodes.Status503ServiceUnavailable, ex.Message);
            }
        }

        [HttpGet]
        [Route("{id:int}")]
        public IActionResult GetById(int id)
        {
            //Kontrola ukoliko upit nije valjan
            if (!ModelState.IsValid || id<=0)
            {
                return BadRequest(ModelState);
            }

            try
            {
                var Djelatnik = _context.Djelatnici.Find(id);
                if (Djelatnik == null)
                {
                    return new EmptyResult();
                }
                return new JsonResult(Djelatnik);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status503ServiceUnavailable, ex.Message);
            }
        }

        /// <summary>
        /// Dodaje novog djelatnika u bazu
        /// </summary>
        /// <remarks>
        /// 
        ///     POST api/v1/Djelatnik
        ///     {naziv: "Primjer naziva"}
        ///     
        /// </remarks>
        /// <param name="djelatnik">Djelatnik za unjeti u JSON formatu</param>
        /// <response code="201">Kreirano</response>
        /// <response code="400">Zahtjev nije valjan (BadRequest)</response>
        /// <response code="503">Baza nedostupna iz razno raznih razloga</response>
        /// <returns>Djelatnik s Id-em koju je dala baza</returns>
        [HttpPost]
        public IActionResult Post(Djelatnik djelatnik)
        {
            if (!ModelState.IsValid || djelatnik == null)
            {
                return BadRequest();
            }
            try
            { 
                _context.Djelatnici.Add(djelatnik);
                _context.SaveChanges();
                return StatusCode(StatusCodes.Status201Created, djelatnik);
            }
            catch (Exception ex) 
            {
                return StatusCode(StatusCodes.Status503ServiceUnavailable, ex.Message);
            }
        }

        /// <summary>
        /// Mijenja podatke postojećeg djelatnika u bazi
        /// </summary>
        /// <remarks>
        /// Primjer upita:
        ///
        ///    PUT api/v1/Djelatnik
        ///
        /// </remarks>
        /// <param name="sifra">Šifra djelatnika koji se mijenja</param>  
        /// <param name="djelatnik">Djelatnik za unijeti u JSON formatu</param>  
        /// <returns>Svi poslani podaci od djelatnika koji su spremljeni u bazi</returns>
        /// <response code="200">Sve je u redu</response>
        /// <response code="204">Nema u bazi djelatnika kojeg želimo promijeniti</response>
        /// <response code="415">Nismo poslali JSON</response> 
        /// <response code="503">Baza nedostupna</response> 
        [HttpPut]
        [Route("{id:int}")]
        public IActionResult Put(int id, Djelatnik djelatnik)
        {
            if (id <= 0 || !ModelState.IsValid || djelatnik == null)
            {
                return BadRequest();
            }

            try
            {
                var DjelatnikIzBaze = _context.Djelatnici.Find(id);

                if (DjelatnikIzBaze == null)
                {
                    return StatusCode(StatusCodes.Status204NoContent, id);
                }

                DjelatnikIzBaze.Ime = djelatnik.Ime;
                DjelatnikIzBaze.Prezime = djelatnik.Prezime;
                DjelatnikIzBaze.Email = djelatnik.Email;
                DjelatnikIzBaze.Mobitel = djelatnik.Mobitel;
                DjelatnikIzBaze.Oib = djelatnik.Oib;
                DjelatnikIzBaze.Iban = djelatnik.Iban;

                _context.Djelatnici.Update(DjelatnikIzBaze);
                _context.SaveChanges();

                return StatusCode(StatusCodes.Status200OK, DjelatnikIzBaze);
            }
            catch (Exception ex) 
            {
                return StatusCode(StatusCodes.Status503ServiceUnavailable, ex.Message);
            }
        }

        /// <summary>
        /// Briše djelatnika iz baze
        /// </summary>
        /// <remarks>
        /// Primjer upita:
        ///
        ///    DELETE api/v1/Djelatnik
        ///    
        /// </remarks>
        /// <param name="Id">Šifra djelatnika koji se briše</param>  
        /// <returns>Odgovor da li je obrisano ili ne</returns>
        /// <response code="200">Sve je u redu, obrisano je u bazi</response>
        /// <response code="204">Nema u bazi djelatnika kojeg želimo obrisati</response>
        /// <response code="503">Problem s bazom</response> 
        [HttpDelete]
        [Route("{id:int}")]
        [Produces("application/json")]
        public IActionResult Delete(int id)
        {
            if (!ModelState.IsValid || id <= 0)
            {
                return BadRequest();
            }

            try
            {
                var DjelatnikIzBaze = _context.Djelatnici.Find(id);

                if (DjelatnikIzBaze == null)
                {
                    return BadRequest("Ne postoji djelatnik sa šifrom " + id + " u bazi");
                }
                
                _context.Djelatnici.Remove(DjelatnikIzBaze);
                _context.SaveChanges();

                return new JsonResult(new { poruka = "Obrisano" });


            }

            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status503ServiceUnavailable, ex.Message);
            }
        }
    }
}
