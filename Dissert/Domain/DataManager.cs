using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dissert.Domain.Repositiries.Interfaces;

namespace Dissert.Domain
{
    public class DataManager
    {
        public ILicenseRepository license { get; set; }

        public DataManager(ILicenseRepository user)
        {
            this.license = license;
        }


    }
}
