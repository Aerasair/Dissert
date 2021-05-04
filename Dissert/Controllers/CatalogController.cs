using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Dissert.Models;
using Dissert.Domain;
using Dissert.Domain.Entities;
using Dissert.Domain.Repositiries.Classes;

namespace Dissert.Controllers
{
    public class CatalogController : Controller
    {
        private AppDbContext appDbContext { get; }
        public CatalogController(AppDbContext _context)
        {
            this.appDbContext = _context;
        }
       
        [HttpGet]
        public IActionResult Index()
        {
            List<License> licenses = (from license in this.appDbContext.license
                                      select license).ToList();
            ViewBag.licenses = licenses;
            return View();

        }
       
        [HttpPost]
        public async Task<IActionResult> Index(string license_name)
        {
            List<License> licenses;
            if (license_name == null)
            {
                 licenses = (from license in this.appDbContext.license
                                          select license).ToList();
            } else 
                licenses = (from license in this.appDbContext.license.Where(r => r.license_name.Contains(license_name))
                                          select license).ToList();
            ViewBag.licenses = licenses;
            ViewBag.license_name = license_name;
            return await Task.Run(() => View()) ;
        }
      
        public IActionResult OneLicense(string id)
        {
            if(id == string.Empty) return Content($"Ошибка лицензии");            
            

            EFLicenseRepository repLic = new EFLicenseRepository(appDbContext);
            var lic = repLic.GetLicenseById(Guid.Parse(id));
            ViewBag.license = lic;

            return View();
        }
    
    }
}