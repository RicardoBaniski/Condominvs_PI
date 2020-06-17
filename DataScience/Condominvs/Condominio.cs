using System;

namespace Condominvs
{
    public class Condominio
    {
        private string first_name;
        private string last_name;
        private string photo;
        private int block;
        private int apt;
        private string car;
        private string garage;
        private string pet;
        private string gender;
        private string phone;
        private float salary;
        private string job;
        private DateTime birthday;
        private string older;
        private int age;
        private string email;
        private string obs;

        public string First_name { get => first_name; set => first_name = value; }
        public string Last_name { get => last_name; set => last_name = value; }
        public string Photo { get => photo; set => photo = value; }
        public int Block { get => block; set => block = value; }
        public int Apt { get => apt; set => apt = value; }
        public string Car { get => car; set => car = value; }
        public string Garage { get => garage; set => garage = value; }
        public string Pet { get => pet; set => pet = value; }
        public string Gender { get => gender; set => gender = value; }
        public string Phone { get => phone; set => phone = value; }
        public float Salary { get => salary; set => salary = value; }
        public string Job { get => job; set => job = value; }
        public DateTime Birthday { get => birthday; set => birthday = value; }
        public string Older { get => older; set => older = value; }
        public int Age { get => age; set => age = value; }
        public string Email { get => email; set => email = value; }
        public string Obs { get => obs; set => obs = value; }
    }
}