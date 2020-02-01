using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace Calendario.Components
{
    [ViewComponent(Name = "AddEvento")]
    public class AddEventoViewComponent : ViewComponent
    {
        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View();
        }
    }
}
