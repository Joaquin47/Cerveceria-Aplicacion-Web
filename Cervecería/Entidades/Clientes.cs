using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Clientes
    {
        public string DNI_Cli { get; set; }
        public string Nombre_Cli { get; set; }
        public string Apellido_Cli { get; set; }
        public string Legajo_Cli { get; set; }
        public string Genero_Cli { get; set; }
        public string Contrasenia_Cli { get; set; }
        public string Telefono_Cli { get; set; }
        public int IdProvincia_Cli { get; set; }
        public int IdLocalidad_Cli { get; set; }
        public bool Estado_Cli { get; set; }
    }
}
