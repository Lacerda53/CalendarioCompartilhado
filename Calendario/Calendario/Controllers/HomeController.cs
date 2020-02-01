using Calendario.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Calendario.Controllers
{
    public class HomeController : BaseController
    {
        List<Evento> eventos = new List<Evento>()
        {
            new Evento
            {
                Nome = "Hackday",
                Descricao = "Evento de hacking",
                Inicio = DateTime.Now,
                Fim = new DateTime(2020, 2, 3),
                DiaInteiro = false,
                Cor = "#ec3b83"
            }
        };
        public IActionResult Index()
        {
            if (HttpExtensions.IsAjaxRequest(Request))
                return PartialView();
            else
                return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Cadastrar(Evento item)
        {
            if(ModelState.IsValid)
            {
                if (HttpExtensions.IsAjaxRequest(Request))
                    return PartialView();
                else
                    return View();
            }
            else
            {
                return View();
            }
        }

        public JsonResult GetEvents()
        {
            var events = eventos.Select(e => new
            {
                id = e.Id,
                title = e.Nome,
                description = e.Descricao,
                start = e.Inicio.ToString("yyyy-MM-dd"),
                end = e.Fim.ToString("yyyy-MM-dd"),
                allDay = e.DiaInteiro,
                color= e.Cor,
                textColor = "#fff"
            }).ToList();
                return new JsonResult(events);
            
        }
    }
}