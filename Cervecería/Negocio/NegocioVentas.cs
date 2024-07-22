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
    public class NegocioVentas
    {
        public DataTable tablaVentas(string filtro)
        {
            DaoVentas dao = new DaoVentas();
            return dao.MostrarVentas(filtro);
        }

        public DataTable tablaVentasTotal(string filtro)
        {
            DaoVentas dao = new DaoVentas();
            return dao.MostrarTotalRecaudado(filtro);
        }

        public DataTable tablaCantidadVentas(string filtro)
        {
            DaoVentas dao = new DaoVentas();
            return dao.MostrarCantidadVentas(filtro);
        }

        public bool AgregarVenta(string DNI_Cli, string DNI_Tr)
        {
            int cantfilas = 0;

            Ventas ven = new Ventas();

            ven.DNI_Cli_Ve1 = DNI_Cli;
            ven.DNI_Tr_Ve1 = DNI_Tr;

            DaoVentas dao = new DaoVentas();

            cantfilas = dao.AgregarVenta(ven);

            if (cantfilas == 1)
                return true;
            else
                return false;
        }
    }
}
