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
    public partial class TrabajadoresABML : System.Web.UI.Page
    {
        NegocioProvincias negProv = new NegocioProvincias();
        NegocioLocalidades negLoc = new NegocioLocalidades();
        NegocioTrabajadores negTra = new NegocioTrabajadores();
        NegocioClientes negCli = new NegocioClientes();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Session["nombreTrabajador"] == null && Session["DNI_Trabajador"] == null)
            {
                Response.Redirect("Inicio.aspx");
            }
            else
            {
                lblNombreLogin.Text = Session["nombreTrabajador"].ToString();
            }

            if (!IsPostBack)
            {
                cargarGridView("where Estado_Tr = 1");
                cargarDDLProvincia();
            }
        }

        public void cargarGridView(string filtro)
        {
            DataTable tabla = negTra.tablaTrabajadores(filtro);
            grdTrabajadores.DataSource = tabla;
            grdTrabajadores.DataBind();
        }

        public void cargarGridViewClientes(string filtro)
        {
            DataTable tabla = negCli.tablaClientes(filtro);
            grdChequeoLegajoCli.DataSource = tabla;
            grdChequeoLegajoCli.DataBind();
        }

        public void cargarDDLProvincia()
        {
            DataTable tabla = negProv.tablaProvincias("");
            ddlProvincia.DataSource = tabla;

            ddlProvincia.DataTextField = "NombreProvincia_Pr";
            ddlProvincia.DataValueField = "IdProvincia_Pr";
            ddlProvincia.DataBind();

            ddlProvincia.Items.Insert(0, new ListItem("--Selecionar Provincia--", "0"));
            ddlLocalidad.Items.Insert(0, new ListItem("--Selecionar Localidad--", "0"));
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlLocalidad.Items.Clear();

            int idProvincia = Convert.ToInt32(ddlProvincia.SelectedValue);
            string Filtro = " where IdProvincia_Lo =" + idProvincia;

            DataTable tablaModelo = negLoc.tablaLocalidadesNormal(Filtro);
            ddlLocalidad.DataSource = tablaModelo;

            ddlLocalidad.DataTextField = "NombreLocalidad_Lo";
            ddlLocalidad.DataValueField = "IdLocalidad_Lo";
            ddlLocalidad.DataBind();

            ddlLocalidad.Items.Insert(0, new ListItem("--Selecionar Localidad--", "0"));
        }

        private bool Validaciones()
        {
            int cont = 0;

            if (string.IsNullOrEmpty(txtDNI.Text.Trim()) || !txtDNI.Text.All(char.IsDigit))
            {
                lblDni.Text = "* Ingrese un DNI";
                cont++;
            }
            else
            {
                lblDni.Text = "";
                string Filtro = " where Estado_Tr = 1 AND DNI_Tr  = '" + txtDNI.Text + "'";
                cargarGridView(Filtro);

                if (grdTrabajadores.Rows.Count != 0)
                {
                    lblDni.Text = "* Ese DNI ya existe";
                    cargarGridView(" where Estado_Tr = 1");
                    cont++;
                }
            }

            if (txtLegajo.Text.Trim() == "")
            {
                lblLegajo.Text = "* Completar";
                cont++;
            }
            else
            {
                lblLegajo.Text = "";

                string Filtro = " where Legajo_Tr  = '" + txtLegajo.Text + "'";

                cargarGridView(Filtro);

                if (grdTrabajadores.Rows.Count != 0)
                {
                    lblLegajo.Text = "* Ese legajo ya existe";
                    cargarGridView(" where Estado_Tr = 1");
                    cont++;
                }

                Filtro = "";
                Filtro = " where Legajo_Cli = '" + txtLegajo.Text + "'";
                cargarGridViewClientes(Filtro);

                if (grdChequeoLegajoCli.Rows.Count != 0)
                {
                    lblLegajo.Text = "* Ese legajo ya existe";
                    cargarGridView(" where Estado_Tr = 1");
                    cont++;
                }
            }

            if (txtGenero.Text.Trim() == "" || (txtGenero.Text.Trim().ToLower() != "masculino" && txtGenero.Text.Trim().ToLower() != "femenino"))
            {
                lblGenero.Text = "* Completar Masculino/Femenino";
                cont++;
            }
            else
            {
                lblGenero.Text = "";
            }

            if (string.IsNullOrEmpty(txtTelefono.Text.Trim()))
            {
                lblTelefono.Text = "* Completar";
                cont++;
            }
            else
            {
                if (!txtTelefono.Text.All(char.IsDigit))
                {
                    lblTelefono.Text = "* Completar con números";
                    cont++;
                }
                else
                {
                    lblTelefono.Text = "";
                }
            }

            if (txtFechaIngreso.Text.Trim() == "")
            {
                lblIngreso.Text = "* Completar";
                cont++;
            }
            else
            {
                lblIngreso.Text = "";

                if (DateTime.Parse(txtFechaIngreso.Text + " 00:00:00") >= DateTime.Now)
                {
                    lblIngreso.Text = "* La fecha de ingreso debe ser menor/igual a la fecha actual";
                    cont++;
                }
            }
            return cont == 0;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Boolean estado = false;
            if (Validaciones())
            {
                estado = negTra.AgregarTrabajador(txtDNI.Text, txtNombre.Text, txtApellido.Text, txtLegajo.Text, txtGenero.Text, txtTelefono.Text, txtContra.Text, ddlProvincia.SelectedValue, ddlLocalidad.SelectedValue, txtFechaIngreso.Text);

                if (estado == true)
                {
                    lblAgregado.Text = "Trabajador agregado con exito";
                    cargarGridView("where Estado_Tr = 1");
                }

                // poner ddl en la posición 0
                ddlProvincia.SelectedIndex = 0;
                ddlLocalidad.SelectedIndex = 0;

                txtApellido.Text = "";
                txtContra.Text = "";
                txtRepetirContra.Text = "";
                txtLegajo.Text = "";
                txtDNI.Text = "";
                txtGenero.Text = "";
                txtFechaIngreso.Text = "";
                txtNombre.Text = "";
                txtTelefono.Text = "";
            }
        }

        protected void btnFiltradoLegajo_Click(object sender, EventArgs e)
        {
            bool EsNumero = txtLegajoBuscar.Text.All(char.IsDigit);

            if (txtLegajoBuscar.Text.Trim() != "" && EsNumero)
            {
                lblLegajoBuscar.Text = "";

                string Filtro = " where Estado_Tr = 1 AND Legajo_Tr  = " + txtLegajoBuscar.Text;
                cargarGridView(Filtro);

                if (grdTrabajadores.Rows.Count == 0)
                {
                    lblLegajoBuscar.Text = "Ese Legajo no se encuentra en la tabla";
                    cargarGridView("where Estado_Tr = 1");
                    lblAgregado.Text = "";
                }
                txtLegajoBuscar.Text = "";
            }
            else
            {
                lblLegajoBuscar.Text = "Ingrese un legajo";
                txtLegajoBuscar.Text = "";
            }
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            cargarGridView("where Estado_Tr = 1");
            lblAgregado.Text = "";
            lblLegajoBaja.Text = "";
        }

        protected void btnAceptarBaja_Click(object sender, EventArgs e)
        {
            bool EsNumero = txtTrabajadorBaja.Text.All(char.IsDigit);
            Boolean estado = false;

            if (txtTrabajadorBaja.Text.Trim() != "" && EsNumero)
            {
                estado = negTra.DarDeBaja(txtTrabajadorBaja.Text);
                if (estado == true)
                {
                    lblLegajoBaja.Text = "Trabajador dado de Baja con exito";
                    cargarGridView("where Estado_Tr = 1");
                }
                else
                {
                    lblLegajoBaja.Text = "No existe ese DNI";
                    lblLegajoBaja.ForeColor = System.Drawing.Color.Red;
                }

                txtTrabajadorBaja.Text = "";
            }
            else
            {
                lblLegajoBaja.Text = "Ingrese un DNI";
                lblLegajoBaja.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void grdTrabajadores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdTrabajadores.PageIndex = e.NewPageIndex;
            cargarGridView("where Estado_Tr = 1");
        }

        protected void grdTrabajadores_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdTrabajadores.EditIndex = e.NewEditIndex;
            cargarGridView("where Estado_Tr = 1");

            String ID_Provincia = ((Label)grdTrabajadores.Rows[e.NewEditIndex].FindControl("lbl_eit_provincia")).Text;
            String ID_Localidad = ((Label)grdTrabajadores.Rows[e.NewEditIndex].FindControl("lbl_eit_Localidad")).Text;
            String NOM_Localidad = ((Label)grdTrabajadores.Rows[e.NewEditIndex].FindControl("lbl_eit_NomLocalidad")).Text;

            DropDownList ddlProvinciaEDIT = (DropDownList)grdTrabajadores.Rows[e.NewEditIndex].FindControl("ddl_eit_Provincia");
            DropDownList ddlLocalidadEDIT = (DropDownList)grdTrabajadores.Rows[e.NewEditIndex].FindControl("ddl_eit_localidad");

            ddlProvinciaEDIT.SelectedValue = ID_Provincia.ToString();

            ddlLocalidadEDIT.Items.Add(new ListItem(NOM_Localidad, ID_Localidad));
        }

        protected void grdTrabajadores_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdTrabajadores.EditIndex = -1;
            cargarGridView("where Estado_Tr = 1");
        }

        private bool ValidarEdicion(string Nombre, string Apellido, string Genero, string Telefono, string Contrasenia, string FechaIngreso, int IDLocalidad)
        {
            bool noHayProblemas = true;
            lbl_Error_Edicion.Text = "";

            if (Nombre.Trim() == "" || Apellido.Trim() == "" || Genero.Trim() == "" || Contrasenia.Trim() == "")
            {
                noHayProblemas = false;
                lbl_Error_Edicion.Text += "Completar Todos los Campos - ";
            }

            if (Telefono.Trim() == "" || !Telefono.All(char.IsDigit))
            {
                noHayProblemas = false;
                lbl_Error_Edicion.Text += "Ingresar numeros en Telefono - ";
            }

            if (Genero.Trim() == "" || (Genero.Trim().ToLower() != "masculino" && Genero.Trim().ToLower() != "femenino"))
            {
                noHayProblemas = false;
                lbl_Error_Edicion.Text = "Completar con Masculino/Femenino - ";
            }

            if (IDLocalidad == 0)
            {
                noHayProblemas = false;
                lbl_Error_Edicion.Text += "Seleccionar Provincia - ";
            }

            if (FechaIngreso.Trim() == "")
            {
                noHayProblemas = false;
                lbl_Error_Edicion.Text += "Ingresar fecha de ingreso - ";
            }
            else
            {
                if (DateTime.Parse(FechaIngreso.Trim() + " 00:00:00") >= DateTime.Now)
                {
                    lbl_Error_Edicion.Text = "La fecha de ingreso debe ser menor/igual a la fecha actual - ";
                    noHayProblemas = false;
                }
            }
            return noHayProblemas;
        }

        protected void grdTrabajadores_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlProvinciaEDIT = (DropDownList)e.Row.FindControl("ddl_eit_Provincia");
                if (ddlProvinciaEDIT != null)
                {
                    DataTable tabla = negProv.tablaProvincias("");
                    ddlProvinciaEDIT.DataSource = tabla;

                    ddlProvinciaEDIT.DataTextField = "NombreProvincia_Pr";
                    ddlProvinciaEDIT.DataValueField = "IdProvincia_Pr";

                    ddlProvinciaEDIT.DataBind();

                }
            }
        }

        protected void ddl_eit_Provincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlProvincias = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlProvincias.NamingContainer;
            DropDownList ddlLocalidadEDIT = (DropDownList)row.FindControl("ddl_eit_localidad");

            ddlLocalidadEDIT.Items.Clear();

            int idProvincia = Convert.ToInt32(ddlProvincias.SelectedValue);
            string Filtro = " where IdProvincia_Lo =" + idProvincia;

            DataTable tablaModelo = negLoc.tablaLocalidadesNormal(Filtro);
            ddlLocalidadEDIT.DataSource = tablaModelo;

            ddlLocalidadEDIT.DataTextField = "NombreLocalidad_Lo";
            ddlLocalidadEDIT.DataValueField = "IdLocalidad_Lo";

            ddlLocalidadEDIT.DataBind();

            ddlLocalidadEDIT.Items.Insert(0, new ListItem("--Selecionar Localidad--", "0"));
        }

        protected void grdTrabajadores_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            string IDProvincia = ((DropDownList)grdTrabajadores.Rows[e.RowIndex].FindControl("ddl_eit_Provincia")).SelectedValue;
            string IDLocalidad = ((DropDownList)grdTrabajadores.Rows[e.RowIndex].FindControl("ddl_eit_localidad")).SelectedValue;

            string DNI = ((Label)grdTrabajadores.Rows[e.RowIndex].FindControl("lbl_eit_DNI")).Text;
            string Nombre = ((TextBox)grdTrabajadores.Rows[e.RowIndex].FindControl("txt_eit_Nombre")).Text;
            string Apellido = ((TextBox)grdTrabajadores.Rows[e.RowIndex].FindControl("txt_eit_Apellido")).Text;
            string Legajo = ((Label)grdTrabajadores.Rows[e.RowIndex].FindControl("lbl_eit_legajo")).Text;
            string Genero = ((TextBox)grdTrabajadores.Rows[e.RowIndex].FindControl("txt_eit_genero")).Text;
            string Telefono = ((TextBox)grdTrabajadores.Rows[e.RowIndex].FindControl("txt_eit_telefono")).Text;
            string Contrasenia = ((TextBox)grdTrabajadores.Rows[e.RowIndex].FindControl("txt_eit_Contra")).Text;
            string FechaIngreso = ((TextBox)grdTrabajadores.Rows[e.RowIndex].FindControl("txt_eit_fechaingreso")).Text;

            Boolean estado = false;
            int IDProvincia1 = Convert.ToInt32(IDProvincia);
            int IDLocalidad1 = Convert.ToInt32(IDLocalidad);

            if (ValidarEdicion(Nombre, Apellido, Genero, Telefono, Contrasenia, FechaIngreso, IDLocalidad1) == true)
            {
                estado = negTra.editarTrabajadores(DNI, Nombre, Apellido, Legajo, Genero, Telefono, Contrasenia, IDProvincia, IDLocalidad, FechaIngreso);
            }
            else
            {
                lbl_Error_Edicion2.Text = "No se pudo Actualizar: ";

            }

            if (estado == true)
            {
                lblAgregado.Text = "Trabajador Editado con exito";
                lbl_Error_Edicion2.Text = "";
            }

            grdTrabajadores.EditIndex = -1;
            cargarGridView("where Estado_Tr = 1");
        }
    }
}