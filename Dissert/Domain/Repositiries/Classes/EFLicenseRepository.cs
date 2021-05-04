using Dissert.Domain.Entities;
using Dissert.Domain.Repositiries.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Dissert.Domain.Repositiries.Classes
{
    public class EFLicenseRepository : ILicenseRepository
    {
        private readonly AppDbContext context;

        public EFLicenseRepository(AppDbContext context)
        {
            this.context = context;
        }

        public License GetLicenseById(Guid guid)
        {
            return context.license.FirstOrDefault(x => x.Id == guid);
        }

        public IQueryable<License> GetAllLicense ()
        {
            return context.license;
        }
        
      public void SaveLicense(License entity)
        {
            if (entity.Id == default)
                context.Entry(entity).State = EntityState.Added;
            else
                context.Entry(entity).State = EntityState.Modified;
            context.SaveChanges();
        }

        public void DeleteLicense(Guid guid)
        {
            context.license.Remove(new License() { Id = guid });
            context.SaveChanges();
        }

        public License GetLicenseById(long id)
        {
            throw new NotImplementedException();
        }
    }
}
