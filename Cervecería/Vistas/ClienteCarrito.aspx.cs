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
    public partial class ClienteCarrito : System.Web.UI.Page
    {

        NegocioVentas negVenta = new NegocioVentas();
        NegocioDetalleVentas negDet = new NegocioDetalleVentas();
        NegocioTrabajadores negTra = new NegocioTrabajadores();

        protected void Page_Load(object sender, EventArgs e)
        {

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Session["nombreCliente"] != null && Session["DNI_Cliente"] != null)
            {
                lblNombre.Text = Session["nombreCliente"].ToString();
            }
            else
            {
                Response.Redirect("Inicio.aspx");
            }

            if (Session["tabla"] != null)
            {
                grdCarrito.DataSource = (DataTable)Session["tabla"];
                grdCarrito.DataBind();
                MostrarTotal();
            }
            else
            {
                lblMensaje.Text = "Todavia no se Seleccionaron cervezas";
                lblPrecioTotal.Text = "";
            }

            if (!IsPostBack)
            {
                cargarDDLTrabajadores();
            }
        }

        private void MostrarTotal()
        {
            Decimal Total = 0;
            for (int i = 0; i < grdCarrito.Rows.Count; i++)
            {
                Total = Total + (decimal.Parse(grdCarrito.Rows[i].Cells[1].Text) * int.Parse(grdCarrito.Rows[i].Cells[2].Text));
            }

            if (Total != 0)
            {
                lblPrecioTotal.Text = "Precio total: " + Total + "$";
            }
        }

        public void cargarDDLTrabajadores()
        {
            DataTable tabla = negTra.tablaTrabajadoresDisponibles("");
            ddlRepartidores.DataSource = tabla;

            ddlRepartidores.DataTextField = "NombreCompleto";
            ddlRepartidores.DataValueField = "DNI_Tr";

            ddlRepartidores.DataBind();

            ddlRepartidores.Items.Insert(0, new ListItem("--Selecionar Repartidor--", "0"));
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            lblMensaje.Visible = false;

            if (grdCarrito.Rows.Count > 0)
            {
                string DNICliente;
                string DNITrabajador;

                DNICliente = Session["DNI_Cliente"].ToString();
                DNITrabajador = ddlRepartidores.SelectedValue.ToString();

                bool Venta = negVenta.AgregarVenta(DNICliente, DNITrabajador);
                bool Detalle = false;

                for (int i = 0; i < grdCarrito.Rows.Count; i++)
                {
                    Detalle = negDet.AgregarDetalleVenta(grdCarrito.Rows[i].Cells[0].Text, grdCarrito.Rows[i].Cells[2].Text, grdCarrito.Rows[i].Cells[1].Text);
                }

                if (Venta == true)
                {
                    Session["PagoRealizado"] = "1";
                    Session["tabla"] = null;
                    Response.Redirect("ClienteListaCompras.aspx");
                }
            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "No se puede hacer una compra si no tenes cervezas en carrito";
            }
        }
    }
}