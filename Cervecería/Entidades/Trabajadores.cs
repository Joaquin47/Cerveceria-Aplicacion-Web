using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Trabajadores
    {
        public string DNI_Tr { get; set; }
        public string Nombre_Tr { get; set; }
        public string Apellido_Tr { get; set; }
        public string Genero_Tr { get; set; }
        public string Legajo_Tr { get; set; }
        public string Contraseña_Tr { get; set; }
        public string Telefono_Tr { get; set; }
        public int IdLocalidad_Tr { get; set; }
        public int IdProvincia_Tr { get; set; }
        public string FechaIngreso_Tr { get; set; }
        public bool Estado_Tr { get; set; }
    }
}
