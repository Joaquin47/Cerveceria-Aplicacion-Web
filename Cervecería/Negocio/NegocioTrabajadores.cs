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
    public class NegocioTrabajadores
    {
        public DataTable tablaTrabajadores(string filtro)
        {
            DaoTrabajadores dao = new DaoTrabajadores();
            return dao.mostrarTrabajador(filtro);
        }

        public DataTable tablaTrabajadoresDisponibles(string filtro)
        {
            DaoTrabajadores dao = new DaoTrabajadores();
            return dao.mostrarTrabajadorDisponible(filtro);
        }

        public bool AgregarTrabajador(string DNI, string Nombre, string Apellido, string Legajo, string Genero, string Telefono, string Contrasenia, string Provincia, string Localidad, string FechaIngreso)
        {
            int cantFilas = 0;

            Trabajadores vd = new Trabajadores();

            vd.DNI_Tr = DNI;
            vd.Nombre_Tr = Nombre;
            vd.Apellido_Tr = Apellido;
            vd.Legajo_Tr = Legajo;
            vd.Genero_Tr = Genero;
            vd.Telefono_Tr = Telefono;
            vd.Contraseña_Tr = Contrasenia;
            vd.IdProvincia_Tr = Convert.ToInt32(Provincia);
            vd.IdLocalidad_Tr = Convert.ToInt32(Localidad);
            vd.FechaIngreso_Tr = FechaIngreso;

            DaoTrabajadores dao = new DaoTrabajadores();

            cantFilas = dao.agregarTrabajador(vd);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool DarDeBaja(string DniTrabajador)
        {
            int cantFilas = 0;

            Trabajadores vd = new Trabajadores();
            vd.DNI_Tr = DniTrabajador;

            DaoTrabajadores dao = new DaoTrabajadores();

            cantFilas = dao.bajaTrabajador(vd);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool ExisteTrabajador(string Legajo)
        {
            Trabajadores vd = new Trabajadores();
            vd.Legajo_Tr = Legajo;

            DaoTrabajadores dao = new DaoTrabajadores();

            if (dao.existeTrabajadorLegajo(vd) == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool BuscarContrasenia(string Legajo, string Contra)
        {
            Trabajadores vd = new Trabajadores();
            vd.Legajo_Tr = Legajo;
            vd.Contraseña_Tr = Contra;

            DaoTrabajadores dao = new DaoTrabajadores();

            if (dao.existeTrabajadorContrasenia(vd) == true)
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

            Trabajadores ven = new Trabajadores();
            ven.Legajo_Tr = Legajo;

            DaoTrabajadores dao = new DaoTrabajadores();

            Nom = dao.NombreTrabajador(ven);

            return Nom;
        }

        public string ObtenerDNI(string Legajo)
        {
            string DNI;

            Trabajadores ven = new Trabajadores();
            ven.Legajo_Tr = Legajo;

            DaoTrabajadores dao = new DaoTrabajadores();

            DNI = dao.obtenerDNITrabajador(ven);

            return DNI;
        }

        public bool editarTrabajadores(string DNI, string Nombre, string Apellido, string Legajo, string Genero, string Telefono, string Contrasenia, string Provincia, string Localidad, string FechaIngreso)
        {
            int cantFilas = 0;

            Trabajadores vd = new Trabajadores();

            vd.DNI_Tr = DNI;
            vd.Nombre_Tr = Nombre;
            vd.Apellido_Tr = Apellido;
            vd.Legajo_Tr = Legajo;
            vd.Genero_Tr = Genero;
            vd.Telefono_Tr = Telefono;
            vd.Contraseña_Tr = Contrasenia;
            vd.IdProvincia_Tr = Convert.ToInt32(Provincia);
            vd.IdLocalidad_Tr = Convert.ToInt32(Localidad);
            vd.FechaIngreso_Tr = FechaIngreso;

            DaoTrabajadores dao = new DaoTrabajadores();

            cantFilas = dao.ActualizarTrabajador(vd);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }
    }
}
