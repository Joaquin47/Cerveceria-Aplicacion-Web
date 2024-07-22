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
    public class NegocioTipos
    {
        public DataTable tablaTipos(string filtro)
        {
            DaoTipos dao = new DaoTipos();
            return dao.mostrarTipos(filtro);
        }

        public DataTable tablaTipossNormal(string filtro)
        {
            DaoTipos dao = new DaoTipos();
            return dao.mostrarTodosTipos(filtro);
        }

        public DataTable tablaModelosDeCervezasExistentes(string filtro)
        {
            DaoTipos dao = new DaoTipos();
            return dao.mostrarTiposDeCervezasExistentes(filtro);
        }
    }
}
