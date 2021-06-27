using Dissert.Models;
using System;
using System.Collections.Generic;
using System.Linq;



namespace Dissert.Domain.Entities
{
    public class license_cc_by_nd : AttributesBase
    {
        public long id { get; set; } 
        public string name { get; set; } 
        public double weight { get; set; } 
        public bool? attUsing { get; set; }

        public license_cc_by_nd()
        {
          
        }
        private AppDbContext db;

        public license_cc_by_nd(AppDbContext context)
        {
            db = context;
        }


        public NameWeight Calculate(List<bool> requestList)
        {
            NameWeight nameWeitItem = new NameWeight();

            List<license_bsd3> items2 = (from _mit in this.db.license_bsd3
                                         select _mit).ToList();
            double sum = 0.0;

            for (int i = 0; i <= 15; i++)
            {
                if (items2[i].attUsing == null) continue;

                if (items2[i].attUsing == requestList[i])
                    sum += items2[i].weight;
                else
                    sum -= items2[i].weight;
            }

            nameWeitItem.Name = "Лицензия Creative common BY ND";
           nameWeitItem.Weight = sum * 100;
            nameWeitItem.urlGuid = "773ec4ed-f886-4a70-9651-a5595abcdb8e";

            return nameWeitItem;
        }
    }
}
