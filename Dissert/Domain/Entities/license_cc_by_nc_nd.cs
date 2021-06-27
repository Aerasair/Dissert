using Dissert.Models;
using System;
using System.Collections.Generic;
using System.Linq;



namespace Dissert.Domain.Entities
{
    public class license_cc_by_nc_nd : AttributesBase
    {
        public long id { get; set; } 
        public string name { get; set; } 
        public double weight { get; set; } 
        public bool? attUsing { get; set; }

        public license_cc_by_nc_nd()
        {
          
        }
        private AppDbContext db;

        public license_cc_by_nc_nd(AppDbContext context)
        {
            db = context;
        }


        public NameWeight Calculate(List<bool> requestList)
        {
            NameWeight nameWeitItem = new NameWeight();

            List<license_cc_by_nc_nd> items2 = (from _mit in this.db.license_cc_by_nc_nd
                                         select _mit).ToList();
            double sum = 0;

            for (int i = 0; i <= 15; i++)
            {
                if (items2[i].attUsing == null) continue;

                if (items2[i].attUsing == requestList[i])
                {
                    sum += Math.Round(items2[i].weight, 3);
                }
                else
                {
                    sum -= Math.Round(items2[i].weight, 3);
                }
            }

            nameWeitItem.Name = "Лицензия Creative Common BY NC ND";
           nameWeitItem.Weight = sum * 100;
            nameWeitItem.urlGuid = "d0004058-9c94-4e1d-8d5d-735152698d1a";

            return nameWeitItem;
        }
    }
}
