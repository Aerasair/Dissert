using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace Dissert.Models
{
    public class UserContext : DbContext
    {
        public DbSet<IdentityUser> Users { get; set; }
        public UserContext(DbContextOptions<UserContext> options)
            : base(options)
        {
            Database.EnsureCreated();
        }
    }
}
