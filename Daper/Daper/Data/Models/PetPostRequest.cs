using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QandA.Data.Models
{
    public class PetPostRequest
    {
        public string Pet_Name { get; set; }
        public string Birth_Year { get; set; }
        public string Pet_Type { get; set; }
    }
}
