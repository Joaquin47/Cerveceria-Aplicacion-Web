using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleDeVentas
    {
        private int codCerveza_DV;
        private int codVenta_DV;
        private decimal PrecioUnitario_DV;
        private int CantVenta_DV;

        public int codCerveza_DV1 { get => codCerveza_DV; set => codCerveza_DV = value; }
        public int codVenta_DV1 { get => codVenta_DV; set => codVenta_DV = value; }
        public decimal PrecioUnitario_DV1 { get => PrecioUnitario_DV; set => PrecioUnitario_DV = value; }
        public int CantVenta_DV1 { get => CantVenta_DV; set => CantVenta_DV = value; }
    }
}
