using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Ventas
    {
        private string DNI_Cli_Ve;
        private string DNI_Tr_Ve;
        private decimal TotalVenta_Ve;

        public string DNI_Cli_Ve1 { get => DNI_Cli_Ve; set => DNI_Cli_Ve = value; }
        public string DNI_Tr_Ve1 { get => DNI_Tr_Ve; set => DNI_Tr_Ve = value; }
        public decimal TotalVenta_Ve1 { get => TotalVenta_Ve; set => TotalVenta_Ve = value; }
    }
}
