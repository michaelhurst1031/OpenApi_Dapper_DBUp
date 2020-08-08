using QandA.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace Daper.Data
{
    public interface IDataREpository
    {
        PetsGetSingleResponse GetPet(int petsID);

        PetsGetSingleResponse PostPet(PetPostRequest question);

        PetsGetSingleResponse PutPet(int petID, PetPostRequest pet);

        //PetsGetSingleResponse
        //GetQuestion(int questionId);

        //bool QuestionExists(int questionId);

        //AnswerGetResponse GetAnswer(int answerId);
    }
}
