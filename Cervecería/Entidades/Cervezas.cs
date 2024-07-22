using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Cervezas
    {
        private int codCerveza_Ce;
        private int codMarca_Ce;
        private int codTipo_Ce;
        private int Stock_Ce;
        private decimal PrecioUnitario_Ce;
        private string Url_Imagen_Ce;
        private bool Estado_Ce;

        public Cervezas()
        {
        }

        public int getcodCerveza_Ce() { return codCerveza_Ce; }
        public void setcodCerveza_Ce(int cod) { codCerveza_Ce = cod; }

        public int getcodMarca_Ce() { return codMarca_Ce; }
        public void setcodMarca_Ce(int cod) { codMarca_Ce = cod; }

        public int getcodTipo_Ce() { return codTipo_Ce; }
        public void setcodTipo_Ce(int cod) { codTipo_Ce = cod; }

        public int getStock_Ce() { return Stock_Ce; }
        public void setStock_Ce(int stock) { Stock_Ce = stock; }

        public decimal getPrecioUnitario_Ce() { return PrecioUnitario_Ce; }
        public void setPrecioUnitario_Ce(decimal precio) { PrecioUnitario_Ce = precio; }

        public string getUrl_Imagen_Ce() { return Url_Imagen_Ce; }
        public void setUrl_Imagen_Ce(string url) { Url_Imagen_Ce = url; }

        public bool getEstado_Ce() { return Estado_Ce; }
        public void setEstado_Ce(bool estado) { Estado_Ce = estado; }
    }
}
