using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication1.Models
{
    public class PetClass
    {
        private string _name;
        private int _age;
        private PhoneClass _phone;
        private string _animal_type;
        private int _gen;

        public PetClass(string name, int age, string phone, string type, int gen) {
            Name = name;
            Age = age;
            _phone = PhoneClass.Parse(phone);
            _animal_type = type;
            _gen = gen;
        }

        public string Name { get => _name; 
            set {
                if (value.Length > 20)
                {
                    throw new ArgumentException("To long data.");
                } else if (value.Length == 0)
                {
                    throw new ArgumentNullException("No data.");
                }
                _name = value;
            } 
        }

        public int Age { get => _age; 
            set {
                if (value > 100 || value < 0) {
                    throw new ArgumentException("Wrong age.");
                }
                _age = value;
            } 
        }

        public string Phone { get => _phone.ToString(); 
            set {
                _phone = PhoneClass.Parse(value);
            } 
        }

        public int Gen { get => _gen;
            set {
                if (_gen != 0 && _gen != 1)
                {
                    throw new ArgumentException("False gender.");
                }
                _gen = value;
            }
        }

        // Лучше сделать отдельный класс с проверкой.
        public string AnimalType { get => _animal_type; 
            set => _animal_type = value; }

        //public static PetClass Parse(string pet_string) {
        //    List<string> splited = pet_string.Split().ToList();
        //    if (splited.Count != 5)
        //    {
        //        throw new ArgumentException("Bad data.");
        //    }
            
        //}

        public override string ToString()
        {
            return $"{Name};{AnimalType};{Age};{Phone};{Gen}";
        }
    }
}
