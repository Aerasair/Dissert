using Dissert.Domain.Entities;
//using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;

namespace Dissert.Domain
{
    public class AppDbContext : IdentityDbContext<IdentityUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<License> license { get; set; }
        public DbSet<license_gpl> license_gpl { get; set; }
        public DbSet<license_mit> license_mit { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<IdentityRole>().HasData(new IdentityRole
            {        
                Id = "34ae434f-6b24-4079-bad1-1e4b17ec15c1",
                Name = "admin",
                NormalizedName = "ADMIN"
            });
            modelBuilder.Entity<IdentityRole>().HasKey(u => u.Id);


            modelBuilder.Entity<IdentityUser>().HasData(new IdentityUser
            {
                Id = "995b4393-6796-4ae0-b58e-58028781f46d",
                UserName = "admin",
                NormalizedUserName = "ADMIN",
                Email = "mail@mail.ru",
                NormalizedEmail = "MAIL@MAIL.RU",
                EmailConfirmed = true,
                PasswordHash = new PasswordHasher<IdentityUser>().HashPassword(null, "superpassword"),
                SecurityStamp = string.Empty
            });

            modelBuilder.Entity<IdentityUserRole<string>>().HasData(new IdentityUserRole<string>
            {                 
                RoleId = "34ae434f-6b24-4079-bad1-1e4b17ec15c1",
                UserId = "995b4393-6796-4ae0-b58e-58028781f46d"
            });

            modelBuilder.Entity<License>().HasData(new License
            {
                Id = Guid.NewGuid(),
              // license_id = "ae6f0390-8c26-4139-b307-48e0400389d4",
                license_name = "GPL"
            });;

            modelBuilder.Entity<License>().HasData(new License
            { 
                Id = Guid.NewGuid(),
               // license_id = Id,
                license_name = "Creative common BY"
            });

        }
    }
}
