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

        ///// <summary>
        ///// Справочник всех лицензий
        ///// </summary>
        ///// <returns></returns>
        //public IActionResult Catalog()
        //{
        //    return View();
        //}

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
            ViewBag.NameWeightList = CalculateSum(request);
            //нам нужден лист List<string name_table,double percent)

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

        private List<NameWeight> CalculateSum(Models.UserOptions request)
        {
            List<NameWeight> nameWeightList = new List<NameWeight>();
          

            //и наверно тут будет вторая функция подающая все таблицы в виде листа
            List<license_gpl> items1 = (from _gpl in this.db.license_gpl
                                       select _gpl).ToList();


         
            List<license_mit> items2 = (from _mit in this.db.license_mit
                                              select _mit).ToList();


            var requestList = UserOptionWrapper.GetUserOptionWrapper(request);
            double sum = 0.0;

            NameWeight nameWeitItem = new NameWeight();
            
            

            for (int i = 0; i <= 15; i++)
            {//Второй цикл сверху по всем таблицам и лист сумм с сортировкой с Take(3)
                if (items2[i].attUsing == null) continue;

                if (items2[i].attUsing == requestList[i])
                    sum += items2[i].weight;
                else
                    sum -= items2[i].weight;
            }
            nameWeitItem.Name = items2.GetType().GetGenericArguments()[0].Name.ToString();
            nameWeitItem.Weight = Math.Round(sum, 2) * 100;
            nameWeightList.Add(nameWeitItem);

            return nameWeightList;
        }


    }
}
