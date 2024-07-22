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
    public class DaoTipos
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable mostrarTipos(string filtro)
        {
            string consulta = "select codTipo_TC, codMarca_TC, NombreMarca_MC as [Marca], NombreTipo_TC as [Tipo de Cerveza], Descripcion_TC as [Descripcion], from Tipos_Cerveza inner join Marcas_Cerveza on Tipos_Cerveza.codMarca_TC = Marcas_Cerveza.codMarca_MC ";
            DataTable tabla = datos.ObtenerTabla("Tipos", consulta + filtro);
            return tabla;
        }

        public DataTable mostrarTodosTipos(string filtro)
        {
            string consulta = "select * from Tipos_Cerveza ";
            DataTable tabla = datos.ObtenerTabla("TiposTodos", consulta + filtro);
            return tabla;
        }

        public DataTable mostrarTiposDeCervezasExistentes(string filtro)
        {
            string consulta = "SELECT DISTINCT Tipos_Cerveza.* FROM Tipos_Cerveza INNER JOIN Cervezas ON Tipos_Cerveza.codMarca_TC = Cervezas.codMarca_Ce AND Tipos_Cerveza.codTipo_TC = Cervezas.codTipo_Ce WHERE Cervezas.Estado_Ce = 1 ";
            DataTable tabla = datos.ObtenerTabla("TiposExistentes", consulta + filtro);
            return tabla;
        }
    }
}
