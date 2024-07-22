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
    public class DaoMarcas
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable mostrarMarcas(string filtro)
        {
            DataTable tabla = datos.ObtenerTabla("Marcas", "select * from Marcas_Cerveza " + filtro);
            return tabla;
        }

        public DataTable mostrarMarcasDeCervezasExistentes(string filtro)
        {
            String Consulta = "SELECT DISTINCT codMarca_MC, NombreMarca_MC FROM Marcas_Cerveza INNER JOIN Tipos_Cerveza ON Marcas_Cerveza.codMarca_MC = Tipos_Cerveza.codMarca_TC INNER JOIN Cervezas ON Tipos_Cerveza.codMarca_TC = Cervezas.codMarca_Ce  AND Tipos_Cerveza.codTipo_TC = Cervezas.codTipo_Ce WHERE Cervezas.Estado_Ce = 1 ";
            DataTable tabla = datos.ObtenerTabla("MarcasExistentes", Consulta + filtro);
            return tabla;
        }
    }
}
