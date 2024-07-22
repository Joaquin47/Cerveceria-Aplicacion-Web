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
    public class NegocioClientes
    {
        public DataTable tablaClientes(string filtro)
        {
            DaoClientes dao = new DaoClientes();
            return dao.mostrarCliente(filtro);
        }

        public bool AgregarCliente(string DNI, string Nombre, string Apellido, string Legajo, string Genero, string Telefono, string Contrasenia, string Provincia, string Localidad)
        {
            int cantFilas = 0;

            Clientes vd = new Clientes();

            vd.DNI_Cli = DNI;
            vd.Nombre_Cli = Nombre;
            vd.Apellido_Cli = Apellido;
            vd.Legajo_Cli = Legajo;
            vd.Genero_Cli = Genero;
            vd.Telefono_Cli = Telefono;
            vd.Contrasenia_Cli = Contrasenia;
            vd.IdProvincia_Cli = Convert.ToInt32(Provincia);
            vd.IdLocalidad_Cli = Convert.ToInt32(Localidad);

            DaoClientes dao = new DaoClientes();

            cantFilas = dao.agregarcliente(vd);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool DarDeBaja(string DniCliente)
        {
            int cantFilas = 0;

            Clientes vd = new Clientes();
            vd.DNI_Cli = DniCliente;

            DaoClientes dao = new DaoClientes();

            cantFilas = dao.bajaCliente(vd);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool ExisteCliente(string Legajo)
        {
            Clientes cli = new Clientes();
            cli.Legajo_Cli = Legajo;

            DaoClientes dao = new DaoClientes();

            if (dao.existeClienteLegajo(cli) == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool BuscarContrasenia(string Contra, string Legajo)
        {
            Clientes cli = new Clientes();
            cli.Legajo_Cli = Legajo;
            cli.Contrasenia_Cli = Contra;

            DaoClientes dao = new DaoClientes();

            if (dao.existeClienteContrasenia(cli) == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public string ObtenerNombre(string Legajo)
        {
            string Nom;

            Clientes cli = new Clientes();
            cli.Legajo_Cli = Legajo;

            DaoClientes dao = new DaoClientes();

            Nom = dao.NombreCliente(cli);

            return Nom;
        }

        public string ObtenerDNI(string Legajo)
        {
            string DNI;

            Clientes cli = new Clientes();
            cli.Legajo_Cli = Legajo;

            DaoClientes dao = new DaoClientes();

            DNI = dao.obtenerDNICliente(cli);
            return DNI;
        }

        public bool editarClientes(string DNI, string Nombre, string Apellido, string Legajo, string Genero, string Telefono, string Contrasenia, string Provincia, string Localidad)
        {
            int cantFilas = 0;

            Clientes vd = new Clientes();

            vd.DNI_Cli = DNI;
            vd.Nombre_Cli = Nombre;
            vd.Apellido_Cli = Apellido;
            vd.Legajo_Cli = Legajo;
            vd.Genero_Cli = Genero;
            vd.Telefono_Cli = Telefono;
            vd.Contrasenia_Cli = Contrasenia;
            vd.IdProvincia_Cli = Convert.ToInt32(Provincia);
            vd.IdLocalidad_Cli = Convert.ToInt32(Localidad);

            DaoClientes dao = new DaoClientes();

            cantFilas = dao.ActualizarCliente(vd);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }
    }
}
