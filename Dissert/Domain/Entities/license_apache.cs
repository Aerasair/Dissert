using Dissert.Models;
using System;
using System.Collections.Generic;
using System.Linq;



namespace Dissert.Domain.Entities
{
    public class license_apache : AttributesBase
    {
        public long id { get; set; } 
        public string name { get; set; } 
        public double weight { get; set; } 
        public bool? attUsing { get; set; }

        public license_apache()
        {
          
        }
        private AppDbContext db;

        public license_apache(AppDbContext context)
        {
            db = context;
        }


        public NameWeight Calculate(List<bool> requestList)
        {
            NameWeight nameWeitItem = new NameWeight();

            List<license_apache> items2 = (from _mit in this.db.license_apache
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

            nameWeitItem.Name = "Лицензия Apache";
           nameWeitItem.Weight = sum * 100;
            nameWeitItem.urlGuid = "38c05056-c9bd-4eaa-add4-46d7bcea2337";

            return nameWeitItem;
        }
    }
}
