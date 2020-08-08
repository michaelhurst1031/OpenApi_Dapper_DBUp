using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Daper;
using QandA.Data.Models;
using Dapper;

namespace Daper.Data
{
    public class DataRepository : IDataREpository
    {

        private readonly string _connectionString;

        public DataRepository(IConfiguration configuration)
        {
            _connectionString =
            configuration["ConnectionStrings:DefaultConnection"];
        }

        public PetsGetSingleResponse GetPet(int petsID)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                var pet =
                  connection.QueryFirstOrDefault<PetsGetSingleResponse>(
                    @"EXEC dbo.Get_Pet_By_ID @Pets_ID = @Pets_ID",
                    new { Pets_ID = petsID }
                  );
                return pet;
            }
        }

        public PetsGetSingleResponse PostPet(PetPostRequest question)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                var petID = connection.QueryFirst<int>(
                  @"EXEC dbo.Post_Pets 
                    @Pet_Name = @Pet_Name
                    @Birth_Year = @Birth_Year
                    @Pet_Type_ID = @Pet_Type_ID",
                  question
                );

                return GetPet(petID);
            }
        }

        public PetsGetSingleResponse PutPet(int petID, PetPostRequest pet)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                connection.Execute(
                  @"EXEC dbo.Put_Pets 
        @Pets_ID = @Pets_ID, @Pet_Name = @Pet_Name, @Birth_Year = @Birth_Year, @Pet_Type_ID=@Pet_Type_ID",
                  new { Pets_ID = petID, pet.Pet_Name, pet.Birth_Year,pet.Pet_Type}
                );
                return GetPet(petID);
            }
        }

    }
}
