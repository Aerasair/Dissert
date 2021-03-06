using Dissert.Models;
using System;
using System.Collections.Generic;
using System.Linq;



namespace Dissert.Domain.Entities
{
    public class license_cc_by_nc : AttributesBase
    {
        public long id { get; set; } 
        public string name { get; set; } 
        public double weight { get; set; } 
        public bool? attUsing { get; set; }

        public license_cc_by_nc()
        {
          
        }
        private AppDbContext db;

        public license_cc_by_nc(AppDbContext context)
        {
            db = context;
        }


        public NameWeight Calculate(List<bool> requestList)
        {
            NameWeight nameWeitItem = new NameWeight();

            List<license_cc_by_nc> items2 = (from _mit in this.db.license_cc_by_nc
                                         select _mit).ToList();
            double sum = 0;

            for (int i = 0; i <= 15; i++)
            {
                if (items2[i].attUsing == null) continue;

                if (items2[i].attUsing == requestList[i])
                    sum += items2[i].weight;
                else
                    sum -= items2[i].weight;
            }

            nameWeitItem.Name = "Лицензия Creative coomon BY NC";
           nameWeitItem.Weight = sum * 100;
            nameWeitItem.urlGuid = "257725ee-8970-4100-be9e-446e0d8797d0";

            return nameWeitItem;
        }
    }
}
