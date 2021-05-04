using Dissert.Domain;
using Dissert.Domain.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Dissert.Controllers
{
    public class LoginController : Controller
    {
        private AppDbContext Context { get; }
        public LoginController(AppDbContext _context)
        {
            this.Context = _context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Register()
        {
            return View();
        }
    }
}
