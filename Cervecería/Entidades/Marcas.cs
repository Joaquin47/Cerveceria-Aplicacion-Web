using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Marcas
    {
        private int codMarca_MC;
        private string NombreMarca_MC;

        public Marcas()
        {
        }

        public int getcodMarca_MC() { return codMarca_MC; }
        public void setcodMarca_MC(int cod) { codMarca_MC = cod; }

        public string getNombreMarca_MC() { return NombreMarca_MC; }
        public void setNombreMarca_MC(string Nombre) { NombreMarca_MC = Nombre; }
    }
}
