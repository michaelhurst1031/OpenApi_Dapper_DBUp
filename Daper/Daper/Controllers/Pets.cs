using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Daper.Model;
using Microsoft.AspNetCore.Mvc;

namespace Daper.Controllers
{
    public class Pets : Controller
    {
        public string[] Index()
        {
            return new[]
            {
                "Rosa",
                "Begura",
                "Skye",
                "Garson",
                "Maggie"
            };
        }


        [HttpGet("searchByPetName/{PetName}/")]
        public string[] SearchByPet(string PetName)
        {
            return new[]
            {
                $"Search Restult for Pet: {PetName}"
            };
        }

        [HttpPost("")]
        public async Task<ActionResult<NewPetDTO>> AddNewPet([FromBody] NewPetDTO newPet)
        {
            await Task.Delay(1000);

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            return Ok(newPet);
        }

    }
}
//}
