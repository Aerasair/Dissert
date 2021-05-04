using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Dissert.Domain.Entities
{
    public   class License :EntityBase
    {
       //[Required]
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
      
       // public Guid license_id { get; set; }

        [Display(Name = "Название пользователя")] //через свойство Display можно переопределять Title страницы
        public string license_name { get; set; } = "Краткое Название лицензии на английсском";

        public string lic_full_name { get; set; } = "Полное название лицензии на английсском";

        public string lic_full_name_rus { get; set; } = "Полное название лицензии на русском";
        public string lic_pluses { get; set; } = "Разрешения";
        public string lic_minuses { get; set; } = "Ограничения";
        public string lic_sameprograms { get; set; } = "Программы по данной лицензии";
        public string lic_description { get; set; } = "Описание";
        public string lic_url_agreement_ru { get; set; } = "url на текст лицензии русский";
        public string lic_url_agreement_en { get; set; } = "url на текст лицензии оригинал, английсский";

        [Display(Name = "id категории лицензии. 1 Non commercialm 2 commercial")]
        public int maincat_id { get; set; } = 0; /*После равно - значение по умолчанию в модели, вместо null*/
    }
}
