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
    public class NegocioProvincias
    {
        public DataTable tablaProvincias(string filtro)
        {
            DaoProvincias dao = new DaoProvincias();
            return dao.MostrarProvincias(filtro);
        }
    }
}
