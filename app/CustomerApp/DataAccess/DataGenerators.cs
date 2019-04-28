using CustomerApp.Models;
using Bogus;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace CustomerApp.DataAccess
{
    public class DataGenerators
    {

        public static List<Customer> GenerateCustomers(int numberOfCustomers = 10000)
        {
            Randomizer.Seed = new Random(8675309);
            var idx = 1;
            var customerFaker = new Faker<Customer>()
                .RuleFor(x => x.Id, f => idx++)
                .RuleFor(u => u.FirstName, (f, u) => f.Name.FirstName())
                .RuleFor(u => u.LastName, (f, u) => f.Name.LastName())
                .RuleFor(u => u.Address1, f => f.Address.FullAddress())
                .RuleFor(u => u.Address2, f => f.Address.SecondaryAddress())
                .RuleFor(u => u.City, f => f.Address.City())
                .RuleFor(u => u.State, f => f.Address.State())
                .RuleFor(u => u.PostalCode, f => f.Address.ZipCode());

            var fakeCustomers = customerFaker.Generate(numberOfCustomers);

            return fakeCustomers;
        }
    }
}
