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
    public class NegocioMarcas
    {
        public DataTable tablaMarcas(string filtro)
        {
            DaoMarcas dao = new DaoMarcas();
            return dao.mostrarMarcas(filtro);
        }
        public DataTable tablaMarcasDeCervezasExistentes(string filtro)
        {
            DaoMarcas dao = new DaoMarcas();
            return dao.mostrarMarcasDeCervezasExistentes(filtro);
        }
    }
}
