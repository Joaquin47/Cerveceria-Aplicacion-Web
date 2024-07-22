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
    public partial class ClienteComprar : System.Web.UI.Page
    {

        string consulta = "SELECT Cervezas.codCerveza_Ce, Cervezas.PrecioUnitario_Ce, Cervezas.Stock_Ce, Marcas_Cerveza.NombreMarca_MC, Tipos_Cerveza.NombreTipo_TC, Tipos_Cerveza.Descripcion_TC, Cervezas.Url_Imagen_Ce FROM Cervezas INNER JOIN Tipos_Cerveza ON Cervezas.codMarca_Ce = Tipos_Cerveza.codMarca_TC AND Cervezas.codTipo_Ce = Tipos_Cerveza.codTipo_TC INNER JOIN Marcas_Cerveza ON Tipos_Cerveza.codMarca_TC = Marcas_Cerveza.codMarca_MC WHERE Cervezas.Estado_Ce = 1 ";

        NegocioTipos negTip = new NegocioTipos();
        NegocioMarcas negMarca = new NegocioMarcas();

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

            if (!IsPostBack)
            {
                cargarDDLMarca();
                cargarDDLTipo();
            }
        }

        public void cargarDDLMarca()
        {
            DataTable tabla = negMarca.tablaMarcasDeCervezasExistentes("");
            ddlMarca.DataSource = tabla;

            ddlMarca.DataTextField = "NombreMarca_MC";
            ddlMarca.DataValueField = "codMarca_MC";

            ddlMarca.DataBind();

            ddlMarca.Items.Insert(0, new ListItem("--Selecionar Marca--", "0"));
            ddlTipo.Items.Insert(0, new ListItem("--Selecionar Tipo--", "0"));
        }

        public void cargarDDLTipo()
        {
            ddlTipo.Items.Clear();

            DataTable tablaModelo = negTip.tablaModelosDeCervezasExistentes("");
            ddlTipo.DataSource = tablaModelo;

            ddlTipo.DataTextField = "NombreTipo_TC";
            ddlTipo.DataValueField = "codTipo_TC";
            ddlTipo.DataBind();

            ddlTipo.Items.Insert(0, new ListItem("--Selecionar Tipo--", "0"));
        }

        protected void LimpiarMensajes()
        {
            lblSeleccionado.Text = "";
            lblMarca.Text = "";
            lblTipo.Text = "";
            lblMensajePrecio.Text = "";
            lblEliminados.Text = "";
        }

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            LimpiarMensajes();

            if (ddlMarca.SelectedIndex != 0)
            {
                ddlTipo.Items.Clear();

                int codMarca = Convert.ToInt32(ddlMarca.SelectedValue);
                string Filtro = " AND codMarca_TC =" + codMarca;

                DataTable tablaTipo = negTip.tablaModelosDeCervezasExistentes(Filtro);
                ddlTipo.DataSource = tablaTipo;

                ddlTipo.DataTextField = "NombreTipo_TC";
                ddlTipo.DataValueField = "codTipo_TC";
                ddlTipo.DataBind();

                ddlTipo.Items.Insert(0, new ListItem("--Selecionar Tipo--", "0"));
            }
            else
            {
                cargarDDLTipo();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text.Trim() != "")
            {
                SqlDataSource1.SelectCommand = consulta + "AND Marcas_Cerveza.NombreMarca_MC + ' ' + Tipos_Cerveza.NombreTipo_TC LIKE '%" + txtNombre.Text + "%'";
                txtNombre.Text = "";
            }

            LimpiarMensajes();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            int CodMarca = Convert.ToInt32(ddlMarca.SelectedValue);
            int CodModelo = Convert.ToInt32(ddlTipo.SelectedValue);

            if (ddlMarca.SelectedIndex != 0 || ddlTipo.SelectedIndex != 0)
            {
                LimpiarMensajes();
                if (ddlMarca.SelectedIndex != 0 && ddlTipo.SelectedIndex == 0)
                {
                    SqlDataSource1.SelectCommand = consulta + " AND codMarca_Ce = " + CodMarca;
                    cargarDDLTipo();
                }
                else
                {
                    if (ddlTipo.SelectedIndex != 0 && ddlMarca.SelectedIndex == 0)
                    {
                        SqlDataSource1.SelectCommand = consulta + " AND codTipo_Ce = " + CodModelo;
                    }
                    else
                    {
                        SqlDataSource1.SelectCommand = consulta + " AND codMarca_Ce = " + CodMarca + " AND codTipo_Ce = " + CodModelo;
                        cargarDDLTipo();
                    }
                }
            }
            else
            {
                lblMarca.Text = "Seleccionar";
                lblTipo.Text = "Seleccionar";
            }
            ddlMarca.SelectedIndex = 0;
            ddlTipo.SelectedIndex = 0;
        }

        protected void btnFiltroPrecio_Click(object sender, EventArgs e)
        {
            bool EsNumero1 = txtMinimo.Text.All(char.IsDigit);
            bool EsNumero2 = txtMaximo.Text.All(char.IsDigit);

            if ((txtMinimo.Text.Trim() != "" && EsNumero1) || (txtMaximo.Text.Trim() != "" && EsNumero2))
            {
                LimpiarMensajes();

                if (txtMinimo.Text.Trim() != "" && txtMaximo.Text.Trim() == "")
                {
                    decimal MINIMO = (decimal.Parse(txtMinimo.Text));
                    if (MINIMO > 0)
                    {
                        SqlDataSource1.SelectCommand = consulta + " AND PrecioUnitario_Ce >=" + MINIMO + " ORDER BY PrecioUnitario_Ce ASC";
                        cargarDDLTipo();
                    }
                    else
                    {
                        lblMensajePrecio.Text = "Debe ingresar Valor Minimo Mayor a 0";
                    }
                }
                else
                {
                    if (txtMaximo.Text.Trim() != "" && txtMinimo.Text.Trim() == "")
                    {
                        decimal MAXIMO = (decimal.Parse(txtMaximo.Text));
                        if (MAXIMO > 0)
                        {
                            SqlDataSource1.SelectCommand = consulta + " AND PrecioUnitario_Ce <=" + MAXIMO + " ORDER BY PrecioUnitario_Ce ASC";
                        }
                        else
                        {
                            lblMensajePrecio.Text = "Debe ingresar Valor Maximo Mayor a 0";
                        }
                    }
                    else
                    {
                        decimal MINIMO = (decimal.Parse(txtMinimo.Text));
                        decimal MAXIMO = (decimal.Parse(txtMaximo.Text));
                        if (MAXIMO > MINIMO)
                        {
                            SqlDataSource1.SelectCommand = consulta + " AND PrecioUnitario_Ce BETWEEN " + MINIMO + " AND " + MAXIMO + " ORDER BY PrecioUnitario_Ce ASC";
                            cargarDDLTipo();
                        }
                        else
                        {
                            lblMensajePrecio.Text = "El máximo debe ser mayor que el valor mínimo.";
                        }
                    }
                }
            }
            else
            {
                lblMensajePrecio.Text = "Debe Ingresar Numeros ";
            }
            txtMinimo.Text = "";
            txtMaximo.Text = "";
        }

        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "EventoSeleccionar")
            {
                lblEliminados.Text = "";

                string Fila = e.CommandArgument.ToString();

                string[] Columna = Fila.Split('|');

                string CodigoCerveza = Columna[0];
                string PRECIO = Columna[1];
                decimal PrecioUnitario = (decimal.Parse(PRECIO));

                Button btnSeleccionar = (Button)sender;
                ListViewItem item = (ListViewItem)btnSeleccionar.NamingContainer;
                TextBox textBox = (TextBox)item.FindControl("txtCantidad");

                if (textBox != null && !string.IsNullOrEmpty(textBox.Text) && EsNumeroPositivo(textBox.Text))
                {
                    string Cantidad = textBox.Text;
                    int cantidadIngresada = int.Parse(textBox.Text);

                    Label lblStock = (Label)item.FindControl("lbl_Stock");
                    int stockDisponible = int.Parse(lblStock.Text);

                    if(cantidadIngresada <= stockDisponible)
                    {
                        if (Session["tabla"] == null)
                        {
                            Session["tabla"] = crearTabla();
                        }

                        DataRow[] rows = ((DataTable)Session["tabla"]).Select("Codigo = '" + CodigoCerveza + "'");

                        if (rows.Length == 0)
                        {
                            agregarFila((DataTable)Session["tabla"], CodigoCerveza, PrecioUnitario, Cantidad);

                            lblSeleccionado.Text = "Ha Agregado al carrito la cerveza con el codigo: " + CodigoCerveza;
                            lblSeleccionado.ForeColor = System.Drawing.Color.Black;

                            textBox.Text = "";
                        }
                        else
                        {
                            Response.Write("<script>alert('Ya Agrego la cerveza con codigo " + CodigoCerveza + " al Carrito.');</script>");
                            textBox.Text = "";
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('La cantidad ingresada supera la cantidad disponible.');</script>");
                        textBox.Text = "";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Por favor ingrese una cantidad valida, no vacia y no negativa.');</script>");
                    textBox.Text = "";
                }
            }
        }

        private bool EsNumeroPositivo(string ingreso)
        {
            if (int.TryParse(ingreso, out int numero))
            {
                return numero > 0;
            }
            return false;
        }

        protected DataTable crearTabla()
        {
            DataTable dt = new DataTable();
            DataColumn columna = new DataColumn("Codigo", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Precio", System.Type.GetType("System.Decimal"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Cantidad", System.Type.GetType("System.Int32"));
            dt.Columns.Add(columna);

            return dt;
        }

        public void agregarFila(DataTable tabla, String CodigoCer, Decimal Precio, string Cantidad)
        {
            DataRow dr = tabla.NewRow();
            dr["Codigo"] = CodigoCer;
            dr["Precio"] = Precio;
            dr["Cantidad"] = Convert.ToInt32(Cantidad);

            tabla.Rows.Add(dr);
        }

        protected void lbProdSelec_Click(object sender, EventArgs e)
        {
            if (Session["tabla"] != null)
            {
                Session["tabla"] = null; 
                lblEliminados.Text = "Eliminacion Realizada con exito";

                lblSeleccionado.Text = "";
            }
            else
            {
                lblEliminados.Text = "Todavia no Selecciono ninguna cerveza ";
                lblEliminados.ForeColor = System.Drawing.Color.Red;

                lblSeleccionado.Text = "";

            }
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = consulta;

            LimpiarMensajes();
        }
    }
}