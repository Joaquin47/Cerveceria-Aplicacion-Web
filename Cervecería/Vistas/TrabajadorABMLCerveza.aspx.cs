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
    public partial class TrabajadorABMLCerveza : System.Web.UI.Page
    {
        NegocioMarcas negMar = new NegocioMarcas();
        NegocioTipos negTip = new NegocioTipos();
        NegocioCervezas negCer = new NegocioCervezas();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

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
                cargarGridView("where Estado_Ce = 1");
                cargarDDLMarcas();
                cargarDDLMarcasBuscar();
            }
        }

        public void cargarGridView(string filtro)
        {
            DataTable tabla = negCer.tablaCervezas(filtro);
            grdCervezas.DataSource = tabla;
            grdCervezas.DataBind();
        }

        public void cargarDDLMarcas()
        {
            DataTable tabla = negMar.tablaMarcas("");
            ddlMarca.DataSource = tabla;

            ddlMarca.DataTextField = "NombreMarca_MC";
            ddlMarca.DataValueField = "codMarca_MC";
            ddlMarca.DataBind();

            ddlMarca.Items.Insert(0, new ListItem("--Selecionar Marca--", "0"));
            ddlTipo.Items.Insert(0, new ListItem("--Selecionar Tipo--", "0"));
        }

        public void cargarDDLMarcasBuscar()
        {
            DataTable tabla = negMar.tablaMarcas("");
            ddlBuscarMarca.DataSource = tabla;

            ddlBuscarMarca.DataTextField = "NombreMarca_MC";
            ddlBuscarMarca.DataValueField = "codMarca_MC";
            ddlBuscarMarca.DataBind();

            ddlBuscarMarca.Items.Insert(0, new ListItem("--Selecionar Marca--", "0"));
        }

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlTipo.Items.Clear();

            int codMarca = Convert.ToInt32(ddlMarca.SelectedValue);
            string Filtro = " where codMarca_TC =" + codMarca;

            DataTable tablaModelo = negTip.tablaTipossNormal(Filtro);
            ddlTipo.DataSource = tablaModelo;

            ddlTipo.DataTextField = "NombreTipo_TC";
            ddlTipo.DataValueField = "codTipo_TC";
            ddlTipo.DataBind();

            ddlTipo.Items.Insert(0, new ListItem("--Selecionar Tipo--", "0"));
        }

        private bool Validaciones()
        {
            int cont = 0;

            if (ddlMarca.SelectedIndex == 0 && ddlTipo.SelectedIndex == 0 )
            {
                lblMarca.Text = "Seleccionar una marca";
                lblTipo.Text = "Seleccionar un tipo de cerveza";
                cont++;
            }
            else
            {
                lblMarca.Text = "";
                lblTipo.Text = "";
                string Filtro = " WHERE codMarca_Ce = " + ddlMarca.SelectedValue + " AND codTipo_Ce = " + ddlTipo.SelectedValue + "";

                cargarGridView(Filtro);

                if (grdCervezas.Rows.Count != 0)
                {
                    lblMarca.Text = "Esa combinacion ya existe";
                    lblTipo.Text = "Esa combinacion ya existe";
                    ddlMarca.SelectedIndex = 0;
                    ddlTipo.SelectedIndex = 0;
                    cargarGridView("where Estado_Ce = 1");
                    cont++;
                }
                cargarGridView("where Estado_Ce = 1");
            }

            if (string.IsNullOrEmpty(txtPrecioUnitario.Text.Trim()))
            {
                lblPrecioUnit.Text = "* Completar";
                cont++;
            }
            else
            {
                string Precio = txtPrecioUnitario.Text.Trim();
                if (!decimal.TryParse(txtPrecioUnitario.Text, out _) | Precio.Contains(','))
                {
                    lblPrecioUnit.Text = "* Completar con números y sin usar comas";
                    cont++;
                }
                else
                {
                    lblPrecioUnit.Text = "";
                    if (Precio.StartsWith("-"))
                    {
                        lblPrecioUnit.Text += "* El Precio Unitario no puede ser negativo";
                        cont++;
                    }
                }
            }

            if (string.IsNullOrEmpty(txtStockDisponible.Text.Trim()))
            {
                lblStockDisponible.Text = "* Completar";
                cont++;
            }
            else
            {
                if (!txtStockDisponible.Text.All(char.IsDigit))
                {
                    lblStockDisponible.Text = "* Completar con números";
                    cont++;
                }
                else
                {
                    lblStockDisponible.Text = "";
                    if (txtStockDisponible.Text.Trim().StartsWith("-"))
                    {
                        lblPrecioUnit.Text += "* El Precio Unitario no puede ser negativo";
                        cont++;
                    }
                }
            }

            if (txtImagen.Text.Trim() == "")
            {
                lblUrlImagen.Text = "* Completar";
                cont++;
            }
            else
            {
                lblUrlImagen.Text = "";
            }
            return cont == 0;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            lblAgregado.Text = "";
            Boolean estado = false;
            if (Validaciones())
            {
                estado = negCer.agregarCerveza(ddlMarca.SelectedValue, ddlTipo.SelectedValue, txtPrecioUnitario.Text, txtStockDisponible.Text, txtImagen.Text);

                if (estado == true)
                {
                    lblAgregado.Text = "Cerveza agregada con exito";
                    cargarGridView("where Estado_Ce = 1");
                }

                ddlMarca.SelectedIndex = 0;
                ddlTipo.SelectedIndex = 0;

                txtPrecioUnitario.Text = "";
                txtStockDisponible.Text = "";
                txtImagen.Text = "";
            }
        }

        protected void btnAceptarBuscar_Click(object sender, EventArgs e)
        {
            lblBuscaMarca.Text = "";

            string Filtro = " where Estado_Ce = 1 AND codMarca_Ce  = " + ddlBuscarMarca.SelectedValue;
            cargarGridView(Filtro);

            if (grdCervezas.Rows.Count == 0)
            {
                lblBuscaMarca.Text = "No encontramos cervezas activas de esa marca";
                cargarGridView("where Estado_Ce = 1");
                lblAgregado.Text = "";
            }
            ddlBuscarMarca.SelectedIndex = 0;
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            cargarGridView("where Estado_Ce = 1");
            lblAgregado.Text = "";
        }

        protected void btnAceptarBaja_Click(object sender, EventArgs e)
        {
            bool EsNumero = txtBajaCerveza.Text.All(char.IsDigit);
            Boolean estado = false;

            if (txtBajaCerveza.Text.Trim() != "" && EsNumero)
            {
                estado = negCer.DardeBaja(txtBajaCerveza.Text);
                if (estado == true)
                {
                    lblMensajeBaja.Text = "Cerveza dada de Baja con exito";
                    cargarGridView("where Estado_Ce = 1");
                }
                else
                {
                    lblMensajeBaja.Text = "No existe ese codigo";
                    lblMensajeBaja.ForeColor = System.Drawing.Color.Red;
                }

                txtBajaCerveza.Text = "";
            }
            else
            {
                lblMensajeBaja.Text = "Ingrese un codigo";
                lblMensajeBaja.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void grdCervezas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCervezas.PageIndex = e.NewPageIndex;
            cargarGridView("where Estado_Ce = 1");
        }

        protected void grdCervezas_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdCervezas.EditIndex = e.NewEditIndex;
            cargarGridView("where Estado_Ce = 1");

            String Cod_Marca = ((Label)grdCervezas.Rows[e.NewEditIndex].FindControl("lbl_eit_CodMarca")).Text;
            String Cod_Tipo = ((Label)grdCervezas.Rows[e.NewEditIndex].FindControl("lbl_eit_CodTipo")).Text;
            String Nom_Tipo = ((Label)grdCervezas.Rows[e.NewEditIndex].FindControl("lbl_eit_NomTipo")).Text;

            DropDownList ddlMarcaEDIT = (DropDownList)grdCervezas.Rows[e.NewEditIndex].FindControl("ddl_eit_CodMarca");
            DropDownList ddlTipoEDIT = (DropDownList)grdCervezas.Rows[e.NewEditIndex].FindControl("ddl_eit_CodTipo");

            ddlMarcaEDIT.SelectedValue = Cod_Marca.ToString();

            ddlTipoEDIT.Items.Add(new ListItem(Nom_Tipo, Cod_Tipo));
        }

        protected void grdCervezas_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdCervezas.EditIndex = -1;
            cargarGridView("where Estado_Ce = 1");
        }

        private bool ValidarEdicion(int CodTipo, string PrecioU, string Stock, string URL)
        {
            bool noHayProblemas = true;
            lbl_Error_Edicion.Text = "";

            if (PrecioU.Trim() == "" || Stock.Trim() == "" || URL.Trim() == "")
            {
                noHayProblemas = false;
                lbl_Error_Edicion.Text += "Completar Todos los Campos - ";
            }

            if (PrecioU.StartsWith("-"))
            {
                noHayProblemas = false;
                lbl_Error_Edicion.Text += "El Precio Unitario no puede ser negativo - ";
            }

            if (Stock.StartsWith("-"))
            {
                noHayProblemas = false;
                lbl_Error_Edicion.Text += "El Stock no puede ser negativo - ";
            }

            if (CodTipo == 0)
            {
                noHayProblemas = false;
                lbl_Error_Edicion.Text += "Seleccionar Tipo - ";
            }

            return noHayProblemas;
        }

        protected void grdCervezas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlMarcaEDIT = (DropDownList)e.Row.FindControl("ddl_eit_CodMarca");
                if (ddlMarcaEDIT != null)
                {
                    DataTable tabla = negMar.tablaMarcas("");
                    ddlMarcaEDIT.DataSource = tabla;

                    ddlMarcaEDIT.DataTextField = "NombreMarca_MC";
                    ddlMarcaEDIT.DataValueField = "codMarca_MC";

                    ddlMarcaEDIT.DataBind();
                }
            }
        }

        protected void ddl_eit_CodMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlMarcas = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlMarcas.NamingContainer;
            DropDownList ddlTiposEDIT = (DropDownList)row.FindControl("ddl_eit_CodTipo");

            ddlTiposEDIT.Items.Clear();

            int CodMarca = Convert.ToInt32(ddlMarcas.SelectedValue);
            string Filtro = " where codMarca_TC =" + CodMarca;

            DataTable tablaModelo = negTip.tablaTipossNormal(Filtro);
            ddlTiposEDIT.DataSource = tablaModelo;

            ddlTiposEDIT.DataTextField = "NombreTipo_TC";
            ddlTiposEDIT.DataValueField = "codTipo_TC";

            ddlTiposEDIT.DataBind();

            ddlTiposEDIT.Items.Insert(0, new ListItem("--Selecionar Tipo--", "0"));
        }

        protected void grdCervezas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string CodMarca = ((DropDownList)grdCervezas.Rows[e.RowIndex].FindControl("ddl_eit_CodMarca")).SelectedValue;
            string CodTipo = ((DropDownList)grdCervezas.Rows[e.RowIndex].FindControl("ddl_eit_CodTipo")).SelectedValue;

            string CodCerveza = ((Label)grdCervezas.Rows[e.RowIndex].FindControl("lbl_eit_CodCerv")).Text;
            string PrecioUnitario = ((TextBox)grdCervezas.Rows[e.RowIndex].FindControl("txt_eit_PrecioU")).Text;
            string Stock = ((TextBox)grdCervezas.Rows[e.RowIndex].FindControl("txt_eit_Stock")).Text;
            string UrlImagen = ((TextBox)grdCervezas.Rows[e.RowIndex].FindControl("txt_eit_Url")).Text;

            Boolean estado = false;
            int CodTipo1 = Convert.ToInt32(CodTipo);

            if (ValidarEdicion(CodTipo1, PrecioUnitario, Stock, UrlImagen) == true)
            {
                estado = negCer.editarCerveza(CodCerveza, CodMarca, CodTipo, PrecioUnitario, Stock, UrlImagen);
            }
            else
            {
                lbl_Error_Edicion2.Text = "No se pudo Actualizar: ";

            }

            if (estado == true)
            {
                lblAgregado.Text = "Cerveza Editada con exito";
                lbl_Error_Edicion2.Text = "";
            }

            grdCervezas.EditIndex = -1;
            cargarGridView("where Estado_Ce = 1");
        }
    }
}