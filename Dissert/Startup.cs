using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dissert.Domain.Repositiries.Interfaces;
using Dissert.Domain.Repositiries.Classes;
using Dissert.Service;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Dissert.Domain;
using Microsoft.EntityFrameworkCore;
using MySqlConnector;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authentication.Cookies;

namespace Dissert
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            Configuration.Bind("Project", new Config());

            services.AddTransient<ILicenseRepository, EFLicenseRepository>();
            services.AddTransient<DataManager>();

            services.AddCors();

            services.AddDbContextPool<AppDbContext>(options => options.UseMySql(Config.ConnectionString, ServerVersion.AutoDetect(Config.ConnectionString)));

            // установка конфигурации подключения
            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                 .AddCookie(options => //CookieAuthenticationOptions
                {
                     options.LoginPath = new Microsoft.AspNetCore.Http.PathString("/Login");
                 });
            services.AddControllersWithViews();


            services.AddIdentity<IdentityUser, IdentityRole>(opts =>
             {
                 opts.User.RequireUniqueEmail = true;
                 opts.Password.RequiredLength = 6;
                 opts.Password.RequireNonAlphanumeric = false;
                 opts.Password.RequireLowercase = false;
                 opts.Password.RequireDigit = false;
             }).AddEntityFrameworkStores<AppDbContext>().AddDefaultTokenProviders();

            services.ConfigureApplicationCookie(options =>
            {
                options.Cookie.Name="myAuth";
                options.Cookie.HttpOnly =true;
                options.LoginPath ="/login";
             //   options.AccessDeniedPath ="home/accessdenied";
                options.SlidingExpiration = true;
            });



            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

    
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1).AddSessionStateTempDataProvider();

           // services.AddSwaggerGen();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment()) { app.UseDeveloperExceptionPage(); }
            else { app.UseExceptionHandler("/Home/Error"); app.UseHsts(); }

   

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();

            //подключаем систему маршрутизации
            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();




            //регистриуруем нужные нам маршруты (ендпоинты)
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute("default", "{controller=Home}/{action=Index}/{id?}");
               // endpoints.MapControllerRoute("default", "{controller=Catalog}/{action=Index}/{id?}");
            });

            //  app.UseSwagger();
        }
    }
}
