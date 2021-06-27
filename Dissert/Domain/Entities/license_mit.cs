using Dissert.Models;
using System;
using System.Collections.Generic;
using System.Linq;



namespace Dissert.Domain.Entities
{
    public class license_mit : AttributesBase
    {
        public long id { get; set; } 
        public string name { get; set; } 
        public double weight { get; set; } 
        public bool? attUsing { get; set; }

        public license_mit()
        {
          
        }
        private AppDbContext db;

        public license_mit(AppDbContext context)
        {
            db = context;
        }


        public NameWeight Calculate(List<bool> requestList)
        {
            NameWeight nameWeitItem = new NameWeight();

            List<license_mit> items2 = (from _mit in this.db.license_mit
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

            nameWeitItem.Name =  "Лицензия MIT";
            nameWeitItem.Weight = nameWeitItem.Weight = sum * 100;
            nameWeitItem.urlGuid = "185bd88b-d37b-401e-84af-030231542fa8";

            return nameWeitItem;
        }
    }
}
