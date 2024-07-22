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
    public class NegocioLocalidades
    {
        public DataTable tablaLocalidades(string filtro)
        {
            DaoLocalidades dao = new DaoLocalidades();
            return dao.MostrarLocalidades(filtro);
        }

        public DataTable tablaLocalidadesNormal(string filtro)
        {
            DaoLocalidades dao = new DaoLocalidades();
            return dao.MostrarTodasLocalidades(filtro);
        }
    }
}
