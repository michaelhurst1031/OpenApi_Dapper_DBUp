using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Daper.Model
{
    public class NewPetDTO
    {
        [Required]
        [MinLength(4)]
        [MaxLength(50)]
        public string PetName { get; set; }
        public string PetType { get; set; }

        public string Breed { get; set; }
    }
}
