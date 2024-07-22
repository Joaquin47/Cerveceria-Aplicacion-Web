using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Tipos
    {
        private int codMarca_TC;
        private int codTipo_TC;
        private string NombreTipo_TC;
        private string Descripcion_TC;

        public Tipos()
        {
        }

        public int getcodMarca_TC() { return codMarca_TC; }
        public void setcodMarca_TC(int cod) { codMarca_TC = cod; }

        public int getcodTipo_TC() { return codTipo_TC; }
        public void setcodTipo_TC(int cod) { codTipo_TC = cod; }

        public string getNombreTipo_TC() { return NombreTipo_TC; }
        public void setNombreTipo_TC(string nombre) { NombreTipo_TC = nombre; }

        public string getDescripcion_TC() { return Descripcion_TC; }
        public void setDescripcion_TC(string desc) { Descripcion_TC = desc; }
    }
}
