using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication1.Models
{
    public class PhoneClass
    {
        private string _c_code;
        private string _abonent;

        public PhoneClass(string c_code, string abonent) {
            _c_code = c_code;
            _abonent = abonent;
        }

        public static PhoneClass Parse(string phone_number) { 
            if (phone_number.Length < 11 || phone_number.Length > 12)
            {
                throw new ArgumentOutOfRangeException("To long or to short phone" +
                    " number.");
            }

            if (phone_number.StartsWith("+7"))
            {
                return new PhoneClass("+7", phone_number.Substring(2));
            } else if (phone_number.StartsWith("8"))
            {
                return new PhoneClass("8", phone_number.Substring(1));
            } else
            {
                throw new ArgumentException("Wrong contry code.");
            }
        }

        public override string ToString() {
            return _c_code + _abonent;
        }
    }
}
