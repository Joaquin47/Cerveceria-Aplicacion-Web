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
    public class DaoTrabajadores
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable mostrarTrabajador(string filtro)
        {
            string consulta = "SELECT DNI_Tr AS [DNI], Nombre_Tr AS [Nombre], Apellido_Tr AS [Apellido], Legajo_Tr as [Legajo], Genero_Tr AS [Genero], Telefono_Tr AS [Telefono], Contraseña_Tr AS [Contraseña], IdProvincia_Tr, NombreProvincia_Pr AS [Provincia], IdLocalidad_Tr, NombreLocalidad_Lo AS [Localidad], CONVERT(VARCHAR(10), FechaIngreso_Tr, 103) AS [FechaDeInicio], Estado_Tr as [ESTADO] FROM Trabajadores INNER JOIN Localidades ON Trabajadores.IdProvincia_Tr = Localidades.IdProvincia_Lo AND Trabajadores.IdLocalidad_Tr = Localidades.IdLocalidad_Lo INNER JOIN Provincias ON Localidades.IdProvincia_Lo = Provincias.IdProvincia_Pr ";
            DataTable tabla = datos.ObtenerTabla("Trabajadores", consulta + filtro);
            return tabla;
        }

        public DataTable mostrarTrabajadorDisponible(string filtro)
        {
            string consulta = "SELECT DNI_Tr, (Nombre_Tr + ' ' + Apellido_Tr) AS [NombreCompleto] FROM Trabajadores ";
            DataTable tabla = datos.ObtenerTabla("Trabajadores", consulta + filtro);
            return tabla;
        }

        private void ArmarParametrosAgregarTrabajador(ref SqlCommand Comando, Trabajadores TB)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@DNI", SqlDbType.Char);
            SqlParametros.Value = TB.DNI_Tr;

            SqlParametros = Comando.Parameters.Add("@Nombre", SqlDbType.VarChar);
            SqlParametros.Value = TB.Nombre_Tr;

            SqlParametros = Comando.Parameters.Add("@Apellido", SqlDbType.VarChar);
            SqlParametros.Value = TB.Apellido_Tr;

            SqlParametros = Comando.Parameters.Add("@Legajo", SqlDbType.VarChar);
            SqlParametros.Value = TB.Legajo_Tr;

            SqlParametros = Comando.Parameters.Add("@Genero", SqlDbType.VarChar);
            SqlParametros.Value = TB.Genero_Tr;

            SqlParametros = Comando.Parameters.Add("@Telefono", SqlDbType.VarChar);
            SqlParametros.Value = TB.Telefono_Tr;

            SqlParametros = Comando.Parameters.Add("@Contrasenia", SqlDbType.VarChar);
            SqlParametros.Value = TB.Contraseña_Tr;

            SqlParametros = Comando.Parameters.Add("@Provincia", SqlDbType.Int);
            SqlParametros.Value = TB.IdProvincia_Tr;

            SqlParametros = Comando.Parameters.Add("@Localidad", SqlDbType.Int);
            SqlParametros.Value = TB.IdLocalidad_Tr;

            SqlParametros = Comando.Parameters.Add("@FechaIngreso", SqlDbType.VarChar);
            SqlParametros.Value = TB.FechaIngreso_Tr;
        }

        public int agregarTrabajador(Trabajadores tb)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarTrabajador(ref comando, tb);
            return datos.EjercutarProcedimientoAlmacenado(comando, "sp_AgregarTrabajador");
        }

        private void ArmarParametrosBajaTrabajador(ref SqlCommand Comando, Trabajadores tb)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@DNITrabajador", SqlDbType.Int);
            SqlParametros.Value = tb.DNI_Tr;
        }

        public int bajaTrabajador(Trabajadores tb)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosBajaTrabajador(ref comando, tb);
            return datos.EjercutarProcedimientoAlmacenado(comando, "sp_DarBajaTrabajador");
        }

        public Boolean existeTrabajadorLegajo(Trabajadores tb)
        {
            String consulta = "select * from Trabajadores where Legajo_Tr = '" + tb.Legajo_Tr + "'";
            return datos.existe(consulta);
        }

        public Boolean existeTrabajadorContrasenia(Trabajadores tb)
        {
            String consulta = "select * from Trabajadores where Legajo_Tr = '" + tb.Legajo_Tr + "' and Contraseña_Tr = '" + tb.Contraseña_Tr + "'";
            return datos.existe(consulta);
        }

        public string NombreTrabajador(Trabajadores tb)
        {
            string consulta = "SELECT Nombre_Tr, Apellido_Tr from Trabajadores where Legajo_Tr =  '" + tb.Legajo_Tr + "'";
            string Nom;
            Nom = datos.ObtenerNombre(consulta);
            return Nom;
        }

        public string obtenerDNITrabajador(Trabajadores tb)
        {
            string consulta = "SELECT DNI_Tr from Trabajadores where Legajo_Tr = '" + tb.Legajo_Tr + "'";
            string dni;
            dni = datos.ObtenerDNI(consulta);
            return dni;
        }

        private void ArmarParametrosEditarTrabajador(ref SqlCommand Comando, Trabajadores TB)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@DNI", SqlDbType.Char);
            SqlParametros.Value = TB.DNI_Tr;

            SqlParametros = Comando.Parameters.Add("@Nombre", SqlDbType.VarChar);
            SqlParametros.Value = TB.Nombre_Tr;

            SqlParametros = Comando.Parameters.Add("@Apellido", SqlDbType.VarChar);
            SqlParametros.Value = TB.Apellido_Tr;

            SqlParametros = Comando.Parameters.Add("@Legajo", SqlDbType.VarChar);
            SqlParametros.Value = TB.Legajo_Tr;

            SqlParametros = Comando.Parameters.Add("@Genero", SqlDbType.VarChar);
            SqlParametros.Value = TB.Genero_Tr;

            SqlParametros = Comando.Parameters.Add("@Telefono", SqlDbType.VarChar);
            SqlParametros.Value = TB.Telefono_Tr;

            SqlParametros = Comando.Parameters.Add("@Contrasenia", SqlDbType.VarChar);
            SqlParametros.Value = TB.Contraseña_Tr;

            SqlParametros = Comando.Parameters.Add("@Provincia", SqlDbType.Int);
            SqlParametros.Value = TB.IdProvincia_Tr;

            SqlParametros = Comando.Parameters.Add("@Localidad", SqlDbType.Int);
            SqlParametros.Value = TB.IdLocalidad_Tr;

            SqlParametros = Comando.Parameters.Add("@FechaIngreso", SqlDbType.VarChar);
            SqlParametros.Value = TB.FechaIngreso_Tr;
        }

        public int ActualizarTrabajador(Trabajadores TA)
        {
            SqlCommand Comando = new SqlCommand();
            ArmarParametrosEditarTrabajador(ref Comando, TA);
            return datos.EjercutarProcedimientoAlmacenado(Comando, "Sp_EditarTrabajadores");
        }

        public Boolean existeTrabajadorEnAlta(Trabajadores TA)
        {
            String consulta = "select * from Trabajadores where Estado_Tr = 1 AND DNI_Tr = '" + TA.DNI_Tr + "'";
            return datos.existe(consulta);
        }

        public Boolean existeClienteEnBaja(Trabajadores TA)
        {
            String consulta = "select * from Clientes where Estado_Tr = 0 AND DNI_Tr = '" + TA.DNI_Tr + "'";
            return datos.existe(consulta);
        }
    }
}
