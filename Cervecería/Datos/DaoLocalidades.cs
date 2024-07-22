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
    public class DaoLocalidades
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable MostrarLocalidades(string filtro)
        {
            string consulta = "select IdLocalidad_Lo, NombreProvincia_Pr AS [Provincia], NombreLocalidad_Lo from Localidades INNER JOIN Provincias ON Localidades.IdProvincia_Lo = Provincias.IdProvincia_Pr ";
            DataTable tabla = datos.ObtenerTabla("Localidades", consulta + filtro);
            return tabla;
        }

        public DataTable MostrarTodasLocalidades(string filtro)
        {
            string consulta = "select * from Localidades";
            DataTable tabla = datos.ObtenerTabla("TodasLocalidades", consulta + filtro);
            return tabla;
        }
    }
}
