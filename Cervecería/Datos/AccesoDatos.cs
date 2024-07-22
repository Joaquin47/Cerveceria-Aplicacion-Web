using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    class AccesoDatos
    {
        private string ruta = "Data Source=localhost\\sqlexpress; Initial Catalog=TPIN_Cervezeria_Grupo5; Integrated Security=True";

        private SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(ruta);

            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private SqlDataAdapter ObtenerAdaptador(string ConsultaSql, SqlConnection cn)
        {
            SqlDataAdapter Adaptador;

            try
            {
                Adaptador = new SqlDataAdapter(ConsultaSql, cn);
                return Adaptador;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(string NombreTabla, string ConsultaSql)
        {
            DataSet ds = new DataSet();
            SqlConnection Conexion = ObtenerConexion();
            SqlDataAdapter adp = ObtenerAdaptador(ConsultaSql, Conexion);
            adp.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
        }

        public int EjercutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP)
        {
            int FilasCambiadas;
            SqlConnection cn = ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = cn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            cn.Close();
            return FilasCambiadas;
        }

        public bool existe(string ConsultaSql)
        {
            bool Estado = false;
            SqlConnection cn = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(ConsultaSql, cn);
            SqlDataReader Datos = cmd.ExecuteReader();

            if (Datos.Read())
            {
                Estado = true;
            }

            return Estado;
        }

        public int ObtenerMaximo(String consulta)
        {
            int max = 0;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                max = Convert.ToInt32(datos[0].ToString());
            }
            return max;
        }

        public string ObtenerNombre(String consulta)
        {
            string Nom;
            string Nombre;
            string Apellido;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                Nombre = datos[0].ToString();
                Apellido = datos[1].ToString();
                Nom = Nombre + " " + Apellido;
                return Nom;
            }
            else
            {
                Nom = "Error";
                return Nom;
            }
        }

        public int ObtenerID(String consulta)
        {
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                return datos.GetInt32(0);
            }
            else
            {
                return -1;
            }
        }

        public string ObtenerDNI(String consulta)
        {
            string DNI;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                DNI = datos[0].ToString();
                return DNI;
            }
            else
            {
                DNI = "Error";
                return DNI;
            }
        }
    }
}
