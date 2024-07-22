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
    public partial class TrabajadoresEstadisticas : System.Web.UI.Page
    {

        NegocioVentas negVentas = new NegocioVentas();
        NegocioDetalleVentas negDet = new NegocioDetalleVentas();
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
        }

        public void cargarGridViewGO(string filtro)
        {
            DataTable tabla = negVentas.tablaVentasTotal(filtro);
            grdEstadisticas.DataSource = tabla;
            grdEstadisticas.DataBind();
        }

        public void cargarGridViewCV(string filtro)
        {
            DataTable tabla = negDet.tablaCervezasVendidas(filtro);
            grdEstadisticas.DataSource = tabla;
            grdEstadisticas.DataBind();
        }

        public void cargarGridViewVH(string filtro)
        {
            DataTable tabla = negVentas.tablaVentas(filtro);
            grdEstadisticas.DataSource = tabla;
            grdEstadisticas.DataBind();
        }

        public void cargarGridViewCdV(string filtro)
        {
            DataTable tabla = negVentas.tablaCantidadVentas(filtro);
            grdCantidadVentas.DataSource = tabla;
            grdCantidadVentas.DataBind();
        }

        public void cargarGridViewDetalleVentas(string filtro)
        {
            DataTable tabla = negDet.tablaDetalleVentas(filtro);
            grdEstad_Detalles.DataSource = tabla;
            grdEstad_Detalles.DataBind();
        }

        protected void btnAplicar_Click(object sender, EventArgs e)
        {
            if (txtInicio.Text == "" || txtFinal.Text == "")
            {
                lblError.Text = "* Ingrese ambas fechas";
            }
            else
            {
                lblError.Text = "";
                string filtro = ddlEstadisticas.SelectedValue;
                string condicion = " WHERE FechaVenta_Ve >= '" + txtInicio.Text + "' AND FechaVenta_Ve <= '" + txtFinal.Text + "'";

                switch (filtro)
                {
                    case "1":
                        grdEstad_Detalles.Visible = false;
                        grdCantidadVentas.Visible = false;
                        lblDetalles.Visible = false;
                        grdEstadisticas.AutoGenerateSelectButton = false;
                        cargarGridViewGO(condicion);
                        break;
                    case "2":
                        grdEstad_Detalles.Visible = false;
                        lblDetalles.Visible = false;
                        grdCantidadVentas.Visible = false;
                        grdEstadisticas.AutoGenerateSelectButton = false;
                        cargarGridViewCV(condicion);
                        break;
                    case "3":
                        grdEstadisticas.AutoGenerateSelectButton = true;
                        grdCantidadVentas.Visible = true;
                        cargarGridViewCdV(condicion);
                        cargarGridViewVH(condicion);
                        break;
                    default:
                        lblError.Text = "* Filtro no válido";
                        break;
                }
            }
        }

        protected void grdEstadisticas_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Cod_Venta = grdEstadisticas.Rows[e.NewSelectedIndex].Cells[1].Text;

            grdEstad_Detalles.Visible = true;
            lblDetalles.Visible = true;
            lblDetalles.Text = "Detalles de la venta";
            cargarGridViewDetalleVentas(" where codVenta_DV = '" + Cod_Venta + "'");
            e.NewSelectedIndex = -1;
        }

        protected void grdEstadisticas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdEstadisticas.PageIndex = e.NewPageIndex;
            string condicion = " WHERE FechaVenta_Ve >= '" + txtInicio.Text + "' AND FechaVenta_Ve <= '" + txtFinal.Text + "'";

            switch (ddlEstadisticas.SelectedValue)
            {
                case "1":
                    cargarGridViewGO(condicion);
                    break;
                case "2":
                    cargarGridViewCV(condicion);
                    break;
                case "3":
                    cargarGridViewVH(condicion);
                    cargarGridViewCdV(condicion);
                    break;
            }
        }

        protected void grdEstad_Detalles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdEstad_Detalles.PageIndex = e.NewPageIndex;
            cargarGridViewDetalleVentas(" where codVenta_DV = '" + Cod_Venta + "'");
        }
    }
}