using Dissert.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Dissert.Domain.Repositiries.Interfaces
{
  public interface ILicenseRepository
    {
        License GetLicenseById(Guid id);
    }
}
