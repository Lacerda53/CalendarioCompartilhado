using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Calendario.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Calendario.Controllers
{
    public class UsuarioController : Controller
    {

        private readonly UserManager<ApplicationUser> _userManager;

        public UsuarioController(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }

        public IActionResult Index()
        {
            return View(_userManager.Users);
        }
    }
}