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

        public PetClass(string name, int age, string phone, string type) {
            _name = name;
            _age = age;
            _phone = PhoneClass.Parse(phone);
            _animal_type = type;
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

        // Лучше сделать отдельный класс с проверкой.
        public string AnimalType { get => _animal_type; 
            set => _animal_type = value; }

        public override string ToString()
        {
            return $"{Name};{AnimalType};{Age};{Phone}";
        }
    }
}
