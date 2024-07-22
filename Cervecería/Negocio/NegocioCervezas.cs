using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Datos;
using Entidades;

namespace Negocio
{
    public class NegocioCervezas
    {
        public DataTable tablaCervezas(string filtro)
        {
            DaoCervezas dao = new DaoCervezas();
            return dao.mostrarCervezas(filtro);
        }

        public bool agregarCerveza(string Marca, string Tipo, string PrecioUnidad, string Stock, string Url)
        {
            int cantFilas = 0;

            Cervezas cv = new Cervezas();

            cv.setcodMarca_Ce(Convert.ToInt32(Marca));
            cv.setcodTipo_Ce(Convert.ToInt32(Tipo));
            cv.setPrecioUnitario_Ce(decimal.Parse(PrecioUnidad));
            cv.setStock_Ce(Convert.ToInt32(Stock));
            cv.setUrl_Imagen_Ce(Url);

            DaoCervezas dao = new DaoCervezas();
            cantFilas = dao.agregarCerveza(cv);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool DardeBaja(string CodigoCerveza)
        {
            int cantFilas = 0;

            Cervezas cv = new Cervezas();
            cv.setcodCerveza_Ce(Convert.ToInt32(CodigoCerveza));
            DaoCervezas dao = new DaoCervezas();

            if (dao.existeCervezaEnAlta(cv) == true)
            {
                cantFilas = dao.BajaCerveza(cv);
            }

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool DardeAlta(string CodigoCerveza)
        {
            int cantFilas = 0;

            Cervezas cv = new Cervezas();
            cv.setcodCerveza_Ce(Convert.ToInt32(CodigoCerveza));
            DaoCervezas dao = new DaoCervezas();

            if (dao.existeCervezaEnBaja(cv) == true)
            {
                cantFilas = dao.AltaCerveza(cv);
            }

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool editarCerveza(string CodigoCerveza, string CodigoMarca, string CodigoTipo, string PrecioUnitario, string Stock, string Url)
        {
            int cantFilas = 0;

            Cervezas cv = new Cervezas();

            cv.setcodCerveza_Ce(Convert.ToInt32(CodigoCerveza));
            cv.setcodMarca_Ce(Convert.ToInt32(CodigoMarca));
            cv.setcodTipo_Ce(Convert.ToInt32(CodigoTipo));
            cv.setPrecioUnitario_Ce(decimal.Parse(PrecioUnitario));
            cv.setStock_Ce(Convert.ToInt32(Stock));
            cv.setUrl_Imagen_Ce(Url);

            DaoCervezas dao = new DaoCervezas();

            cantFilas = dao.ActualizarCerveza(cv);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }
    }
}
