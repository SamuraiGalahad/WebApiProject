using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    public class ScrollController : Controller
    {
        List<PetClass> ex_data = new List<PetClass> { new PetClass("Name1", 10, "89163386615", "Dog") };
            
        [HttpGet]
        public IEnumerable<PetClass> Get() {
            return ex_data;
        }
        
        //public IActionResult Index()
        //{
        //    return View();
        //}
    }
}
