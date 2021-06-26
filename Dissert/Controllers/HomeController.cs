using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Dissert.Models;
using Dissert.Domain;
using System.Data.Entity;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;
using Dissert.Domain.Entities;
using Dissert.ViewModels;


namespace Dissert.Controllers
{
  
    public class HomeController : Controller
    {

        private AppDbContext db;
        public HomeController(AppDbContext context)
        {
            db = context;
        }

        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(IdentityUser user)
        {
            db.Users.Add(user);
            await db.SaveChangesAsync();
            return RedirectToAction("Login");
        }

        /// <summary>
        /// Домашняя страница
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        public IActionResult Index()
        {
            if (User.Identity.IsAuthenticated)
            {
                return Content(User.Identity.Name);
            }
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Resources()
        {
            return View();
        }



        /// <summary>
        /// Генератор текста лицензии 
        /// </summary>
        /// <returns></returns>
        public IActionResult Legal()
        {
            return View();
        }

        public IActionResult OneLicense()
        {
            return View();
        }

        [HttpGet]
        public IActionResult OfferLicense()
        {
            List<license_gpl> lic_gpl_attr = (from _gpl in this.db.license_gpl
                                              select _gpl).ToList();
            ViewBag.lic_gpl_attr = lic_gpl_attr;
            return View();
        }

        [HttpPost]
        public IActionResult OfferLicense([FromForm] Models.UserOptions request) //[FromBody] List<Models.UserOptions> fields
        {

            var requestList = UserOptionWrapper.GetUserOptionWrapper(request);

            var l1 = new license_mit(db).Calculate(requestList);
            var l2 = new license_gpl(db).Calculate(requestList);

            var l3 = new license_apache(db).Calculate(requestList);
            var l4 = new license_bsd3(db).Calculate(requestList);
            var l5 = new license_cc_by(db).Calculate(requestList);
            var l6 = new license_cc_by_nc(db).Calculate(requestList);
            var l7 = new license_cc_by_nc_nd(db).Calculate(requestList);
            var l8 = new license_cc_by_nc_sa(db).Calculate(requestList);
            var l9 = new license_cc_by_nd(db).Calculate(requestList);
            var l10 = new license_cc_by_sa(db).Calculate(requestList);



            List<NameWeight> nameWeights = new List<NameWeight>();
            nameWeights.Add(l1);
            nameWeights.Add(l2);
            nameWeights.Add(l3);
            nameWeights.Add(l4);
            nameWeights.Add(l5);
            nameWeights.Add(l6);
            nameWeights.Add(l7);
            nameWeights.Add(l8);
            nameWeights.Add(l9);
            nameWeights.Add(l10);
      
      

            ViewBag.NameWeightList = nameWeights.OrderByDescending(r => r.Weight).Take(3) ;
           

            return View(request); //На вход в View подавать инфу нужно только в специальных случаях,
                                  //например когда нужно заполнить уже форму данными с формы прошлого экрана 
                                  //ЧТО в ДАННОМ случае и происходит
                                  //для всего остального есть ViewBag                                  
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public async Task<IActionResult> Login()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
