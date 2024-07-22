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
    public class DaoDetalleVentas
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable MostrarDetalleVentas(string filtro)
        {
            DataTable tabla = datos.ObtenerTabla("Detalle_Ventas", "select codVenta_DV AS [Codigo de venta], codCerveza_DV AS [Codigo de Cerveza], CantVenta_DV AS [Cantidad], PrecioUnitario_DV AS [Precio Unitario] from Detalle_Ventas  " + filtro);
            return tabla;
        }

        public DataTable MostrarCervezasVendidas(string filtro)
        {
            DataTable tabla = datos.ObtenerTabla("Detalle_Ventas", "SELECT codCerveza_Ce as [Codigo De Cerveza], codMarca_Ce AS [Codigo Marca], codTipo_Ce AS [Codigo Tipo], PrecioUnitario_Ce AS [Precio Unitario], CantVenta_DV AS [Cantidad Vendida] FROM (Cervezas INNER JOIN Detalle_Ventas ON codCerveza_DV = codCerveza_Ce) INNER JOIN Ventas ON codVenta_DV = codVenta_Ve  " + filtro);
            return tabla;
        }

        private void ArmarParametrosDetalleVenta(ref SqlCommand Comando, DetalleDeVentas cc)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@CodCerveza", SqlDbType.Int);
            SqlParametros.Value = cc.codCerveza_DV1;

            SqlParametros = Comando.Parameters.Add("@Cantidad", SqlDbType.Int);
            SqlParametros.Value = cc.CantVenta_DV1;

            SqlParametros = Comando.Parameters.Add("@Precio", SqlDbType.Decimal);
            SqlParametros.Value = cc.PrecioUnitario_DV1;
        }

        public int AgregarDetalleVenta(DetalleDeVentas cc)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosDetalleVenta(ref comando, cc);
            return datos.EjercutarProcedimientoAlmacenado(comando, "sp_AgregarDetalleVenta");
        }
    }
}
