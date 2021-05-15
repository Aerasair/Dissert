using Dissert.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Dissert.Domain.Entities
{
    public interface AttributesBase
    {
        [Required]
        [Key]
        public long id { get; set; }

        public string name { get; set; }
        public double weight { get; set; }
        public bool? attUsing { get; set; }

        
    }
}
