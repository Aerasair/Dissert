using Dissert.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Dissert.Domain.Repositiries.Classes
{
    public class EFLicenseGPLRepository
    {
        private readonly AppDbContext context;

        public EFLicenseGPLRepository(AppDbContext context)
        {
            this.context = context;
        }
        public IQueryable<license_gpl> GetAllLicenseGpl()
        {
            return context.license_gpl;
        }
    }
}
