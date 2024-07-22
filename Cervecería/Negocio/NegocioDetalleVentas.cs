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
    public class NegocioDetalleVentas
    {
        public DataTable tablaDetalleVentas(string filtro)
        {
            DaoDetalleVentas dao = new DaoDetalleVentas();
            return dao.MostrarDetalleVentas(filtro);
        }

        public DataTable tablaCervezasVendidas(string filtro)
        {
            DaoDetalleVentas dao = new DaoDetalleVentas();
            return dao.MostrarCervezasVendidas(filtro);
        }

        public bool AgregarDetalleVenta(string codCerveza_DV, string CantVenta_DV, string PrecioUnitario_DV)
        {
            int cantfilas = 0;

            DetalleDeVentas ddv = new DetalleDeVentas();

            ddv.codCerveza_DV1 = (Convert.ToInt32(codCerveza_DV));
            ddv.CantVenta_DV1 = (Convert.ToInt32(CantVenta_DV));
            ddv.PrecioUnitario_DV1 = decimal.Parse(PrecioUnitario_DV);

            DaoDetalleVentas dao = new DaoDetalleVentas();

            cantfilas = dao.AgregarDetalleVenta(ddv);

            if (cantfilas == 1)
                return true;
            else
                return false;
        }
    }
}
