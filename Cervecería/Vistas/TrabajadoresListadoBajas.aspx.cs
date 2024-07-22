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
    public partial class TrabajadoresListadoBajas : System.Web.UI.Page
    {
        NegocioCervezas negCerv = new NegocioCervezas();
        NegocioMarcas negMarca = new NegocioMarcas();

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
                cargarGridView("where Estado_Ce = 0");
                cargarDDLMarca();
            }

            if (grdCervezasBajas.Rows.Count == 0)
            {
                lblMensajeGrid.Text = "No hay cervezas dadas de Baja";
            }
        }

        public void cargarGridView(string filtro)
        {
            DataTable tabla = negCerv.tablaCervezas(filtro);
            grdCervezasBajas.DataSource = tabla;
            grdCervezasBajas.DataBind();
        }

        public void cargarDDLMarca()
        {
            DataTable tabla = negMarca.tablaMarcas("");
            ddlMarcaFiltro.DataSource = tabla;

            ddlMarcaFiltro.DataTextField = "NombreMarca_MC";
            ddlMarcaFiltro.DataValueField = "codMarca_MC";

            ddlMarcaFiltro.DataBind();

            ddlMarcaFiltro.Items.Insert(0, new ListItem("--Selecionar Marca--", "0"));
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Boolean estado = false;

            if (txtAltaCerveza.Text.Trim() != "")
            {
                estado = negCerv.DardeAlta(txtAltaCerveza.Text);

                if (estado == true)
                {
                    lblMensaje.Text = "Cerveza dada de Alta con exito";
                    lblMensaje.ForeColor = System.Drawing.Color.Black;
                    cargarGridView("where Estado_Ce = 0");
                }
                else
                {
                    lblMensaje.Text = "No existe ese codigo de cerveza";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
                txtAltaCerveza.Text = "";
            }
            else
            {
                lblMensaje.Text = "Ingrese numeros";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                txtAltaCerveza.Text = "";
            }
        }

        protected void btnFiltro_Click(object sender, EventArgs e)
        {
            if (ddlMarcaFiltro.SelectedIndex == 0)
            {
                lblMensajeFiltro.Text = "Seleccione una marca.";
            }
            else
            {
                lblMensajeFiltro.Text = "";
                string valorSeleccionado = ddlMarcaFiltro.SelectedValue;
                int valorSeleccionadoComoEntero = int.Parse(valorSeleccionado);

                string Filtro = " where Estado_Ce = 0 AND codMarca_Ce = " + valorSeleccionadoComoEntero;

                cargarGridView(Filtro);

                if (grdCervezasBajas.Rows.Count == 0)
                {
                    lblMensajeFiltro.Text = "No hay cervezas con esa Marca";
                    cargarGridView("where Estado_Ce = 0");
                }
                ddlMarcaFiltro.SelectedIndex = 0;
            }
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            cargarGridView("where Estado_Ce = 0");
            lblMensaje.Text = "";
            lblMensajeFiltro.Text = "";
        }
    }
}