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
    public partial class TrabajadoresVentasYDetalles : System.Web.UI.Page
    {

        NegocioDetalleVentas negdv = new NegocioDetalleVentas();
        NegocioVentas negv = new NegocioVentas();
        string Cod_Venta = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreTrabajador"] == null && Session["DNI_Trabajador"] == null)
            {
                Response.Redirect("Inicio.aspx");
            }
            else
            {
                lblNombre.Text = Session["nombreTrabajador"].ToString();
            }

            if (!IsPostBack)
            {
                cargarGridViewVentas("");
            }
        }

        public void cargarGridViewVentas(string filtro)
        {
            DataTable tabla = negv.tablaVentas(filtro);
            grdVentas.DataSource = tabla;
            grdVentas.DataBind();
        }

        public void cargarGridViewDetalleVentas(string filtro)
        {
            DataTable tabla = negdv.tablaDetalleVentas(filtro);
            grdDetalleVen.DataSource = tabla;
            grdDetalleVen.DataBind();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            bool EsNumero = txtCodVenta.Text.All(char.IsDigit);

            if (txtCodVenta.Text.Trim() != "" && EsNumero)
            {
                lblMensaje.Text = "";

                string Filtro = " where codVenta_Ve =" + txtCodVenta.Text;

                cargarGridViewVentas(Filtro);

                if (grdVentas.Rows.Count == 0)
                {
                    lblMensaje.Text = "Ese codigo no se encuentra en la tabla";
                    cargarGridViewVentas("");
                }
                txtCodVenta.Text = "";
            }
            else
            {
                lblMensaje.Text = "Solo se permiten numeros";
                txtCodVenta.Text = "";
            }
        }

        protected void grdVentas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdVentas.PageIndex = e.NewPageIndex;
            cargarGridViewVentas("");
        }

        protected void grdDetalleVen_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdDetalleVen.PageIndex = e.NewPageIndex;
            cargarGridViewDetalleVentas(" where codVenta_DV = '" + Cod_Venta + "'");
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "";
            cargarGridViewVentas("");
        }

        protected void grdVentas_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Cod_Venta = grdVentas.Rows[e.NewSelectedIndex].Cells[1].Text;

            lblDetalles.Text = "Detalles de la venta";
            cargarGridViewDetalleVentas(" where codVenta_DV = '" + Cod_Venta + "'");
        }
    }
}