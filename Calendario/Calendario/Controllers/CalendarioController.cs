using Calendario.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using System;
using Calendario._Repositorio.Core;
using System.Collections.Generic;
using System.Linq;

namespace Calendario.Controllers
{
    [Authorize]
    public class CalendarioController : BaseController
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IEventoRepositorio _EventoRep;
        public CalendarioController(UserManager<ApplicationUser> userManager, IEventoRepositorio EventoRep)
        {
            _userManager = userManager;
            _EventoRep = EventoRep;
        }
        public IActionResult Index()
        {
            ViewBag.UserId = _userManager.FindByNameAsync(User.Identity.Name).GetAwaiter().GetResult().Id;
            if (HttpExtensions.IsAjaxRequest(Request))
                return PartialView();
            else
                return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Cadastrar(Evento item)
        {
            item.UsuarioId = _userManager.FindByNameAsync(User.Identity.Name).GetAwaiter().GetResult().Id;
            if (ModelState.IsValid)
            {
                _EventoRep.Adicionar(item);
                return View(nameof(CalendarioController.Index));
            }
            else
            {
                return View();
            }
        }

        public JsonResult ListaMeusEventosJson(int Id)
        {
            var eventos = _EventoRep.ListarMeusEventos(Id).ToList().Select(e => new
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