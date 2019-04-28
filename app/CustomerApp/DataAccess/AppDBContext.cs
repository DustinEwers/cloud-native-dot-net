using CustomerApp.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace CustomerApp.DataAccess
{
    public class AppDbContext: DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options): base(options) {}

        public DbSet<Customer> Customers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<Customer>().HasData(DataGenerators.GenerateCustomers().ToArray());
        }
    }
}
