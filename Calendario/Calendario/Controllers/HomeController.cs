using Calendario._Repositorio.Core;
using Calendario.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Calendario.Controllers
{
    [Authorize]
    public class HomeController : BaseController
    {
        private readonly IEventoRepositorio _EventoRep;
        public HomeController(IEventoRepositorio EventoRep)
        {
            _EventoRep = EventoRep;
        }
        public IActionResult Index()
        {
            if (HttpExtensions.IsAjaxRequest(Request))
                return PartialView();
            else
                return View();
        }
        public JsonResult ListaTodosEventosJson()
        {
            var eventos = _EventoRep.ListarTodosEventos().ToList().Select(e => new
            {
                id = e.Id,
                title = e.Nome,
                description = e.Descricao,
                start = e.Inicio.ToString("yyyy-MM-ddThh:mm:ss"),
                end = e.Fim.ToString("yyyy-MM-ddThh:mm:ss"),
                allDay = e.DiaInteiro,
                color = e.Cor,
                textColor = "#fff"
            }).ToList();
            return new JsonResult(eventos);

        }
    }
}