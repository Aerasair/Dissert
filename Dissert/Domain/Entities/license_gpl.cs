using Dissert.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Dissert.Domain.Entities
{
    public class license_gpl : AttributesBase
    {
        public long id { get; set; } 
        public string name { get; set; } 
        public double weight { get; set; } 
        public bool? attUsing { get; set; }

        public license_gpl()
        {

        }
        private AppDbContext db;

        public license_gpl(AppDbContext context)
        {
            db = context;
        }

        public NameWeight Calculate(List<bool> requestList)
        {
            NameWeight nameWeitItem = new NameWeight();

            List<license_gpl> items2 = (from _mit in this.db.license_gpl
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

            nameWeitItem.Name = "GPL";
            nameWeitItem.Weight = Math.Round(sum, 2) * 100;

            return nameWeitItem;
        }

    }
}
