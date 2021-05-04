using Dissert.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Dissert.Domain.Repositiries.Classes
{
    public class EFLicenseMITepository
    {
        private readonly AppDbContext context;

        public EFLicenseMITepository(AppDbContext context)
        {
            this.context = context;
        }
        public IQueryable<license_mit> GetAllLicenseMit()
        {
            return context.license_mit;
        }
    }
}
