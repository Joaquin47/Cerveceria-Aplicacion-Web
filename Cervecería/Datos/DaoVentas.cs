using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Entidades;

namespace Datos
{
    public class DaoVentas
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable MostrarVentas(string filtro)
        {
            string consulta = "select codVenta_Ve AS [Codigo de Venta], DNI_Cli_Ve AS [DNI del Cliente], DNI_Tr_Ve AS [DNI del Trabajador], CONVERT(VARCHAR(10), FechaVenta_Ve, 103) AS [Fecha], TotalVenta_Ve AS [Precio Total] from Ventas " + filtro;
            DataTable tabla = datos.ObtenerTabla("Ventas", consulta);
            return tabla;
        }

        public DataTable MostrarTotalRecaudado(string filtro)
        {
            string consulta = "SELECT SUM(TotalVenta_Ve) AS [Total recaudado] FROM Ventas " + filtro;
            DataTable tabla = datos.ObtenerTabla("Ventas", consulta);
            return tabla;
        }

        public DataTable MostrarCantidadVentas(string filtro)
        {
            string consulta = "SELECT COUNT(codVenta_Ve) AS [Cantidad de Ventas] FROM Ventas " + filtro;
            DataTable tabla = datos.ObtenerTabla("Ventas", consulta);
            return tabla;
        }

        private void ArmarParametrosAgregarVenta(ref SqlCommand Comando, Ventas cc)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@Dni_Cliente", SqlDbType.Char);
            SqlParametros.Value = cc.DNI_Cli_Ve1;

            SqlParametros = Comando.Parameters.Add("@Dni_Trabajador", SqlDbType.Char);
            SqlParametros.Value = cc.DNI_Tr_Ve1;
        }

        public int AgregarVenta(Ventas cc)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarVenta(ref comando, cc);
            return datos.EjercutarProcedimientoAlmacenado(comando, "sp_AgregarVenta");
        }
    }
}
