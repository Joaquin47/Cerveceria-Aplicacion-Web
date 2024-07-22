using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;

namespace Vistas
{
    public partial class ClienteListaCompras : System.Web.UI.Page
    {

        NegocioVentas negVentas = new NegocioVentas();
        NegocioDetalleVentas negDetalles = new NegocioDetalleVentas();
        string Cod_Venta = "";

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

            if (Session["PagoRealizado"] != null)
            {
                if (Session["PagoRealizado"].ToString() == "1")
                {
                    Session["PagoRealizado"] = "0";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Compra realizada con éxito')", true);
                }
            }

            if (!IsPostBack)
            {
                string dni = Session["DNI_Cliente"].ToString();
                string aux = "where DNI_Cli_Ve = " + dni;
                cargarGridView(aux);
            }
        }

        public void cargarGridView(string filtro)
        {
            DataTable tabla = negVentas.tablaVentas(filtro);
            grdCompras.DataSource = tabla;
            grdCompras.DataBind();
        }

        public void cargarGridViewDetalles(string filtro)
        {
            DataTable tabla = negDetalles.tablaDetalleVentas(filtro);
            grdDetalleCompras.DataSource = tabla;
            grdDetalleCompras.DataBind();
        }

        protected void grdCompras_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Cod_Venta = grdCompras.Rows[e.NewSelectedIndex].Cells[1].Text;

            lblDetalle.Text = "Detalles de la compra";
            cargarGridViewDetalles(" where codVenta_DV = '" + Cod_Venta + "'");
        }

        protected void grdCompras_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCompras.PageIndex = e.NewPageIndex;

            string id = Session["DNI_Cliente"].ToString();
            string aux = "where DNI_Cli_Ve = " + id;
            cargarGridView(aux);
        }

        protected void grdDetalleCompras_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdDetalleCompras.PageIndex = e.NewPageIndex;

            cargarGridViewDetalles(" where codVenta_DV = '" + Cod_Venta + "'");
        }
    }
}