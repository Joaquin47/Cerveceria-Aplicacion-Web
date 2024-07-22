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
    public class DaoProvincias
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable MostrarProvincias(string filtro)
        {
            DataTable tabla = datos.ObtenerTabla("Provincias", "select * from Provincias " + filtro);
            return tabla;
        }

        public Boolean existeProvincia(Provincia prov)
        {
            String consulta = "select * from Provincias where NombreProvincia_Pr = '" + prov.NombreProvincia_Pr + "'";
            return datos.existe(consulta);
        }
    }
}
