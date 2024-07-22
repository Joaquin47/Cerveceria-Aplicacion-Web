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
    public class DaoClientes
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable mostrarCliente(string filtro)
        {
            string consulta = "SELECT DNI_Cli AS [DNI], Nombre_Cli AS [Nombre], Apellido_Cli AS [Apellido], Legajo_Cli AS [Legajo], Genero_Cli AS [Genero], Telefono_Cli AS [Telefono], Contraseña_Cli AS [Contraseña], IdProvincia_Cli, NombreProvincia_Pr AS [Provincia], IdLocalidad_Cli, NombreLocalidad_Lo AS [Localidad], Estado_Cli AS [ESTADO] FROM Clientes INNER JOIN Localidades ON Clientes.IdProvincia_Cli = Localidades.IdProvincia_Lo AND Clientes.IdLocalidad_Cli = Localidades.IdLocalidad_Lo INNER JOIN Provincias ON Localidades.IdProvincia_Lo = Provincias.IdProvincia_Pr ";
            DataTable tabla = datos.ObtenerTabla("Clientes", consulta + filtro);
            return tabla;
        }

        public string NombreCliente(Clientes cli)
        {
            string consulta = "SELECT Nombre_Cli, Apellido_Cli from Clientes where Legajo_Cli = '" + cli.Legajo_Cli + "'";
            string Nom;
            Nom = datos.ObtenerNombre(consulta);
            return Nom;
        }

        public string obtenerDNICliente(Clientes cli)
        {
            string consulta = "SELECT DNI_Cli from Clientes where Legajo_Cli = '" + cli.Legajo_Cli + "'";
            string dni;
            dni = datos.ObtenerDNI(consulta);
            return dni;
        }

        public Boolean existeClienteLegajo(Clientes cli)
        {
            String consulta = "select * from Clientes where Legajo_Cli = '" + cli.Legajo_Cli + "'";
            return datos.existe(consulta);
        }

        public Boolean existeClienteContrasenia(Clientes cli)
        {
            String consulta = "select * from Clientes where Legajo_Cli = '" + cli.Legajo_Cli + "' and Contraseña_Cli = '" + cli.Contrasenia_Cli + "'";
            return datos.existe(consulta);
        }

        private void ArmarParametrosAgregarCliente(ref SqlCommand Comando, Clientes cli)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@DNI", SqlDbType.Char);
            SqlParametros.Value = cli.DNI_Cli;

            SqlParametros = Comando.Parameters.Add("@Nombre", SqlDbType.VarChar);
            SqlParametros.Value = cli.Nombre_Cli;

            SqlParametros = Comando.Parameters.Add("@Apellido", SqlDbType.VarChar);
            SqlParametros.Value = cli.Apellido_Cli;

            SqlParametros = Comando.Parameters.Add("@Legajo", SqlDbType.VarChar);
            SqlParametros.Value = cli.Legajo_Cli;

            SqlParametros = Comando.Parameters.Add("@Genero", SqlDbType.VarChar);
            SqlParametros.Value = cli.Genero_Cli;

            SqlParametros = Comando.Parameters.Add("@Telefono", SqlDbType.VarChar);
            SqlParametros.Value = cli.Telefono_Cli;

            SqlParametros = Comando.Parameters.Add("@Contrasenia", SqlDbType.VarChar);
            SqlParametros.Value = cli.Contrasenia_Cli;

            SqlParametros = Comando.Parameters.Add("@Provincia", SqlDbType.Int);
            SqlParametros.Value = cli.IdProvincia_Cli;

            SqlParametros = Comando.Parameters.Add("@Localidad", SqlDbType.Int);
            SqlParametros.Value = cli.IdLocalidad_Cli;
        }

        public int agregarcliente(Clientes cli)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarCliente(ref comando, cli);
            return datos.EjercutarProcedimientoAlmacenado(comando, "sp_AgregarCliente");
        }

        private void ArmarParametrosBajaCliente(ref SqlCommand Comando, Clientes cl)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@DNICliente", SqlDbType.Int);
            SqlParametros.Value = cl.DNI_Cli;
        }

        public int bajaCliente(Clientes cl)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosBajaCliente(ref comando, cl);
            return datos.EjercutarProcedimientoAlmacenado(comando, "sp_DarBajaCliente");
        }

        private void ArmarParametrosEditarCliente(ref SqlCommand Comando, Clientes cli)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@DNI", SqlDbType.Char);
            SqlParametros.Value = cli.DNI_Cli;

            SqlParametros = Comando.Parameters.Add("@Nombre", SqlDbType.VarChar);
            SqlParametros.Value = cli.Nombre_Cli;

            SqlParametros = Comando.Parameters.Add("@Apellido", SqlDbType.VarChar);
            SqlParametros.Value = cli.Apellido_Cli;

            SqlParametros = Comando.Parameters.Add("@Legajo", SqlDbType.VarChar);
            SqlParametros.Value = cli.Legajo_Cli;

            SqlParametros = Comando.Parameters.Add("@Genero", SqlDbType.VarChar);
            SqlParametros.Value = cli.Genero_Cli;

            SqlParametros = Comando.Parameters.Add("@Telefono", SqlDbType.VarChar);
            SqlParametros.Value = cli.Telefono_Cli;

            SqlParametros = Comando.Parameters.Add("@Contrasenia", SqlDbType.VarChar);
            SqlParametros.Value = cli.Contrasenia_Cli;

            SqlParametros = Comando.Parameters.Add("@Provincia", SqlDbType.Int);
            SqlParametros.Value = cli.IdProvincia_Cli;

            SqlParametros = Comando.Parameters.Add("@Localidad", SqlDbType.Int);
            SqlParametros.Value = cli.IdLocalidad_Cli;
        }

        public int ActualizarCliente(Clientes cli)
        {
            SqlCommand Comando = new SqlCommand();
            ArmarParametrosEditarCliente(ref Comando, cli);
            return datos.EjercutarProcedimientoAlmacenado(Comando, "Sp_EditarClientes");
        }

        public Boolean existeClienteEnAlta(Clientes cli)
        {
            String consulta = "select * from Clientes where Estado_Cli = 1 AND DNI_Cli = '" + cli.DNI_Cli + "'";
            return datos.existe(consulta);
        }

        public Boolean existeClienteEnBaja(Clientes cli)
        {
            String consulta = "select * from Clientes where Estado_Cli = 0 AND DNI_Cli = '" + cli.DNI_Cli + "'";
            return datos.existe(consulta);
        }
    }
}
