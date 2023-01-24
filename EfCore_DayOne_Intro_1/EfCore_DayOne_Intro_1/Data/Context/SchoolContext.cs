using EfCore_DayOne_Intro_1.Data.Models;
using Microsoft.EntityFrameworkCore;

namespace EfCore_DayOne_Intro_1.Data.Context;

public class SchoolContext : DbContext
{
    public DbSet<Teacher> Teachers { get; set; }
    public DbSet<Student> Students{ get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var connectionString = "Server = .; Database=SchoolDb; Trusted_Connection = true;";
        optionsBuilder.UseSqlServer(connectionString);
    }
}
