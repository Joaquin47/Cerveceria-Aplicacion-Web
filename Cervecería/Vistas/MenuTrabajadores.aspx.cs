using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class MenuTrabajadores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreTrabajador"] != null && Session["DNI_Trabajador"] != null)
            {
                lblNombre.Text = Session["nombreTrabajador"].ToString();
            }
            else
            {
                Response.Redirect("Inicio.aspx");
            }
        }

        protected void lbSalir_Click(object sender, EventArgs e)
        {
            Session["nombreTrabajador"] = null;
            Session["DNI_Trabajador"] = null;
            Response.Redirect("Inicio.aspx");
        }
    }
}