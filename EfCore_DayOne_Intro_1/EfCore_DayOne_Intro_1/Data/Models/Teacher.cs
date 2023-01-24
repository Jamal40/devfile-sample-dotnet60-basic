namespace EfCore_DayOne_Intro_1.Data.Models;

public class Teacher
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public DateTime DateOfBirth { get; set; }
}
