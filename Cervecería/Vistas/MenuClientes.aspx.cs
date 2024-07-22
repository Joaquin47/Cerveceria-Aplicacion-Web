using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class MenuClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreCliente"] != null && Session["DNI_Cliente"] != null)
            {
                lblNombre.Text = Session["nombreCliente"].ToString();
            }
            else
            {
                Response.Redirect("Inicio.aspx");
            }
        }

        protected void lbSalir_Click(object sender, EventArgs e)
        {
            Session["nombreCliente"] = null;
            Session["DNI_Cliente"] = null;
            Response.Redirect("Inicio.aspx");
        }
    }
}