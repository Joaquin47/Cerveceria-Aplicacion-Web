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
    public class DaoCervezas
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable mostrarCervezas(string filtro)
        {
            string consulta = "SELECT codCerveza_Ce AS [CodigoCerveza], codMarca_Ce AS [CodigoMarca], NombreMarca_MC AS [Marca], codTipo_Ce AS [CodigoTipo], NombreTipo_TC AS [Tipo], PrecioUnitario_Ce AS [PrecioUnitario], Stock_Ce AS [Stock], Url_Imagen_Ce AS [URLimagen], Estado_Ce AS [Estado] FROM Cervezas INNER JOIN Tipos_Cerveza ON Cervezas.codMarca_Ce = Tipos_Cerveza.codMarca_TC AND Cervezas.codTipo_Ce = Tipos_Cerveza.codTipo_TC INNER JOIN Marcas_Cerveza ON Tipos_Cerveza.codMarca_TC = Marcas_Cerveza.codMarca_MC  ";
            DataTable tabla = datos.ObtenerTabla("Cervezas", consulta + filtro);
            return tabla;
        }

        private void ArmarParametrosAgregarCerveza(ref SqlCommand Comando, Cervezas ce)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@CodMarca", SqlDbType.Int);
            SqlParametros.Value = ce.getcodMarca_Ce();

            SqlParametros = Comando.Parameters.Add("@CodTipo", SqlDbType.Int);
            SqlParametros.Value = ce.getcodTipo_Ce();

            SqlParametros = Comando.Parameters.Add("@PrecioUnitario", SqlDbType.Decimal);
            SqlParametros.Value = ce.getPrecioUnitario_Ce();

            SqlParametros = Comando.Parameters.Add("@Stock", SqlDbType.Int);
            SqlParametros.Value = ce.getStock_Ce();

            SqlParametros = Comando.Parameters.Add("@URLImagenCerveza", SqlDbType.VarChar);
            SqlParametros.Value = ce.getUrl_Imagen_Ce();
        }

        public int agregarCerveza(Cervezas ce)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarCerveza(ref comando, ce);
            return datos.EjercutarProcedimientoAlmacenado(comando, "sp_AgregarCerveza");
        }

        private void ArmarParametrosBajaCerveza(ref SqlCommand Comando, Cervezas ch)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@CodCerveza", SqlDbType.Int);
            SqlParametros.Value = ch.getcodCerveza_Ce();
        }

        public int BajaCerveza(Cervezas ch)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosBajaCerveza(ref comando, ch);
            return datos.EjercutarProcedimientoAlmacenado(comando, "sp_DarDeBajaCerveza");
        }

        public int AltaCerveza(Cervezas vh)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosBajaCerveza(ref comando, vh);
            return datos.EjercutarProcedimientoAlmacenado(comando, "sp_DarDeAltaCerveza");
        }

        private void ArmarParametrosEditarCerveza(ref SqlCommand Comando, Cervezas ce)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@CodCerveza", SqlDbType.Int);
            SqlParametros.Value = ce.getcodCerveza_Ce();

            SqlParametros = Comando.Parameters.Add("@CodMarca", SqlDbType.Int);
            SqlParametros.Value = ce.getcodMarca_Ce();

            SqlParametros = Comando.Parameters.Add("@CodTipo", SqlDbType.Int);
            SqlParametros.Value = ce.getcodTipo_Ce();

            SqlParametros = Comando.Parameters.Add("@PrecioUnitario", SqlDbType.Decimal);
            SqlParametros.Value = ce.getPrecioUnitario_Ce();

            SqlParametros = Comando.Parameters.Add("@Stock", SqlDbType.Int);
            SqlParametros.Value = ce.getStock_Ce();

            SqlParametros = Comando.Parameters.Add("@URLImagenCerveza", SqlDbType.VarChar);
            SqlParametros.Value = ce.getUrl_Imagen_Ce();
        }

        public int ActualizarCerveza(Cervezas ce)
        {
            SqlCommand Comando = new SqlCommand();
            ArmarParametrosEditarCerveza(ref Comando, ce);
            return datos.EjercutarProcedimientoAlmacenado(Comando, "Sp_EditarCervezas");
        }

        public Boolean existeCervezaEnAlta(Cervezas ce)
        {
            String consulta = "select * from Cervezas where Estado_Ce = 1 AND codCerveza_Ce = '" + ce.getcodCerveza_Ce() + "'";
            return datos.existe(consulta);
        }

        public Boolean existeCervezaEnBaja(Cervezas ce)
        {
            String consulta = "select * from Cervezas where Estado_Ce = 0 AND codCerveza_Ce = '" + ce.getcodCerveza_Ce() + "'";
            return datos.existe(consulta);
        }
    }
}
