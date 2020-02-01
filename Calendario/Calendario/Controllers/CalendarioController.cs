using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Calendario.Controllers
{
    public class CalendarioController : BaseController
    {
        public IActionResult Index()
        {
            if (HttpExtensions.IsAjaxRequest(Request))
                return PartialView();
            else
                return View();
        }
    }
}