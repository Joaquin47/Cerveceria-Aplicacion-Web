using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class Inicio : System.Web.UI.Page
    {
        NegocioClientes Cli = new NegocioClientes();
        NegocioTrabajadores Tra = new NegocioTrabajadores();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtLegajo.Text.Trim() == "" || txtContra.Text.Trim() == "")
            {
                lblError.Text = "Completar ambos campos";
            }
            else
            {
                if (Cli.ExisteCliente(txtLegajo.Text))
                {
                    if (Cli.BuscarContrasenia(txtContra.Text, txtLegajo.Text))
                    {
                        Session["nombreCliente"] = Cli.ObtenerNombre(txtLegajo.Text);
                        Session["DNI_Cliente"] = Cli.ObtenerDNI(txtLegajo.Text);
                        Server.Transfer("MenuClientes.aspx");
                    }
                    else
                    {
                        lblError.Text = "Legajo o Contraseña invalidos";
                        txtContra.Text = "";
                        txtLegajo.Text = "";
                    }
                }
                else
                {
                    if (Tra.ExisteTrabajador(txtLegajo.Text))
                    {
                        if (Tra.BuscarContrasenia(txtLegajo.Text, txtContra.Text))
                        {
                            Session["nombreTrabajador"] = Tra.ObtenerNombre(txtLegajo.Text);
                            Session["DNI_Trabajador"] = Tra.ObtenerDNI(txtLegajo.Text);
                            Server.Transfer("MenuTrabajadores.aspx");
                        }
                        else
                        {
                            lblError.Text = "Legajo o Contraseña invalidos";
                            txtContra.Text = "";
                            txtLegajo.Text = "";
                        }
                    }
                    else
                    {
                        lblError.Text = "Legajo o Contraseña invalidos";
                        txtContra.Text = "";
                        txtLegajo.Text = "";
                    }
                }
            }
        }
    }
}