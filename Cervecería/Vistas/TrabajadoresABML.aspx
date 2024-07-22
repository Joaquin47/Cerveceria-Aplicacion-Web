<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrabajadoresABML.aspx.cs" Inherits="Vistas.TrabajadoresABML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">


        .auto-style1 {
            width: 100%;
        }
        .auto-style10 {
            text-align: center;
            color: #FFFFFF;
            height: 40px;
            background-color: #000000;
        }
        .auto-style3 {
            height: 23px;
            text-align: center;
            background-color: #CCCCCC;
        }
        .auto-style40 {
            width: 175px;
            font-size: x-large;
        }
        .auto-style21 {
            width: 208px;
        }
        .auto-style30 {
            width: 158px;
        }
        .auto-style34 {
            width: 20px;
        }
        .auto-style46 {
            text-align: right;
        }
        .auto-style41 {
            width: 175px;
        }
        .auto-style42 {
            width: 175px;
            height: 26px;
        }
        .auto-style24 {
            width: 208px;
            height: 26px;
        }
        .auto-style31 {
            height: 26px;
            width: 158px;
        }
        .auto-style38 {
            width: 20px;
            background-color: #000000;
        }
        .auto-style25 {
            height: 26px;
        }
        .auto-style43 {
            width: 175px;
            height: 42px;
        }
        .auto-style28 {
            width: 208px;
            height: 42px;
        }
        .auto-style32 {
            height: 42px;
            width: 158px;
        }
        .auto-style29 {
            height: 42px;
        }
        .auto-style44 {
            height: 23px;
            width: 175px;
        }
        .auto-style22 {
            height: 23px;
            width: 208px;
            text-align: center;
        }
        .auto-style33 {
            height: 23px;
            width: 158px;
            text-align: center;
        }
        .auto-style37 {
            height: 23px;
            width: 20px;
        }
        .auto-style20 {
            height: 23px;
        }
        .auto-style45 {
            background-color: #000000;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style10">
                        <h1>ABML Trabajadores</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="hlInicio" runat="server" CssClass="auto-style16" NavigateUrl="~/MenuTrabajadores.aspx" style="text-decoration: none; color: #993333">Volver al menu</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style40"><strong>Lista de Trabajadores</strong></td>
                    <td class="auto-style21">&nbsp;</td>
                    <td class="auto-style30">&nbsp;</td>
                    <td class="auto-style34">&nbsp;</td>
                    <td class="auto-style46"><strong>
                        <asp:Label ID="lblNombreLogin" runat="server" CssClass="auto-style47"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style41"><strong>Agregar Trabajador:</strong></td>
                    <td class="auto-style21">&nbsp;</td>
                    <td class="auto-style30">&nbsp;</td>
                    <td class="auto-style34">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style42">Nombre:</td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txtNombre" runat="server" ValidationGroup="Grupo3" Width="190px"></asp:TextBox>
                    </td>
                    <td class="auto-style31">
                        <asp:Label ID="lblNombre" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" CssClass="auto-style26" style="color: #CC0000" ValidationGroup="Grupo3">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style38" rowspan="11"></td>
                    <td class="auto-style25"></td>
                </tr>
                <tr>
                    <td class="auto-style41">Apellido:</td>
                    <td class="auto-style21">
                        <asp:TextBox ID="txtApellido" runat="server" ValidationGroup="Grupo3" Width="190px"></asp:TextBox>
                    </td>
                    <td class="auto-style30">
                        <asp:Label ID="lblApellido" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" CssClass="auto-style26" style="color: #CC0000" ValidationGroup="Grupo3">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                    <td>Buscar por legajo:
                        <asp:TextBox ID="txtLegajoBuscar" runat="server" ValidationGroup="Grupo1" Width="165px"></asp:TextBox>
                        <asp:Button ID="btnFiltradoLegajo" runat="server" CssClass="auto-style39" OnClick="btnFiltradoLegajo_Click" Text="Aceptar" ValidationGroup="Grupo1" />
                        &nbsp;<asp:Button ID="btnMostrarTodos" runat="server" CssClass="auto-style39" OnClick="btnMostrarTodos_Click" Text="Mostrar todos" ValidationGroup="Grupo1" />
                        &nbsp;
                        <asp:Label ID="lblLegajoBuscar" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style41">DNI:</td>
                    <td class="auto-style21">
                        <asp:TextBox ID="txtDNI" runat="server" ValidationGroup="Grupo3" Width="190px"></asp:TextBox>
                    </td>
                    <td class="auto-style30">
                        <asp:Label ID="lblDni" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" CssClass="auto-style26" style="color: #CC0000" ValidationGroup="Grupo3">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style41">Genero:</td>
                    <td class="auto-style21">
                        <asp:TextBox ID="txtGenero" runat="server" ValidationGroup="Grupo3" Width="190px"></asp:TextBox>
                    </td>
                    <td class="auto-style30">
                        <asp:Label ID="lblGenero" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvGenero" runat="server" ControlToValidate="txtGenero" CssClass="auto-style26" style="color: #CC0000" ValidationGroup="Grupo3">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style41">Contraseña:</td>
                    <td class="auto-style21">
                        <asp:TextBox ID="txtContra" runat="server" ValidationGroup="Grupo3" Width="190px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style30">
                        <asp:Label ID="lblContraseña" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvContra" runat="server" ControlToValidate="txtContra" CssClass="auto-style26" style="color: #CC0000" ValidationGroup="Grupo3">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style43">Repetir contraseña:</td>
                    <td class="auto-style28">
                        <asp:TextBox ID="txtRepetirContra" runat="server" ValidationGroup="Grupo3" Width="190px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style32">
                        <asp:Label ID="lblContraRepeti" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvRepetirContra" runat="server" ControlToValidate="txtRepetirContra" CssClass="auto-style26" style="color: #CC0000" ValidationGroup="Grupo3">Complete el campo</asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="cvRepetirContra" runat="server" ControlToCompare="txtContra" ControlToValidate="txtRepetirContra" CssClass="auto-style26" style="color: #CC0000" ValidationGroup="Grupo3">Contraseña mal repetida</asp:CompareValidator>
                    </td>
                    <td class="auto-style29"></td>
                </tr>
                <tr>
                    <td class="auto-style41">Telefono:</td>
                    <td class="auto-style21">
                        <asp:TextBox ID="txtTelefono" runat="server" ValidationGroup="Grupo3" Width="190px"></asp:TextBox>
                    </td>
                    <td class="auto-style30">
                        <asp:Label ID="lblTelefono" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" CssClass="auto-style26" style="color: #CC0000" ValidationGroup="Grupo3">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                    <td>Dar de baja un trabajador:
                        <asp:TextBox ID="txtTrabajadorBaja" runat="server" ValidationGroup="Grupo2" Width="165px"></asp:TextBox>
                        <asp:Button ID="btnAceptarBaja" runat="server" CssClass="auto-style39" OnClick="btnAceptarBaja_Click" Text="Aceptar" ValidationGroup="Grupo2" />
                        &nbsp;&nbsp;
                        <asp:Label ID="lblLegajoBaja" runat="server"></asp:Label>
                        <br />
                        (Ingresar DNI)</td>
                </tr>
                <tr>
                    <td class="auto-style41">Provincia: </td>
                    <td class="auto-style21">
                        <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" ValidationGroup="Grupo3" Width="190px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style30">
                        <asp:Label ID="lblProvincia" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvProv" runat="server" ControlToValidate="ddlProvincia" CssClass="auto-style26" InitialValue="0" style="color: #CC0000" ValidationGroup="Grupo3">Seleccione una provincia</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style41">Localidad:</td>
                    <td class="auto-style21">
                        <asp:DropDownList ID="ddlLocalidad" runat="server" Height="16px" ValidationGroup="Grupo3" Width="190px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style30">
                        <asp:Label ID="lblLocalidad" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" CssClass="auto-style26" InitialValue="0" style="color: #CC0000" ValidationGroup="Grupo3">Seleccione una localidad</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style43">Legajo:</td>
                    <td class="auto-style28">
                        <asp:TextBox ID="txtLegajo" runat="server" ValidationGroup="Grupo3" Width="190px"></asp:TextBox>
                    </td>
                    <td class="auto-style32">
                        <asp:Label ID="lblLegajo" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo" CssClass="auto-style26" style="color: #CC0000" ValidationGroup="Grupo3">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style29"></td>
                </tr>
                <tr>
                    <td class="auto-style41">Fecha de ingreso:</td>
                    <td class="auto-style21">
                        <asp:TextBox ID="txtFechaIngreso" runat="server" TextMode="Date" ValidationGroup="Grupo3" Width="190px"></asp:TextBox>
                    </td>
                    <td class="auto-style30">
                        <asp:Label ID="lblIngreso" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvIngreso" runat="server" ControlToValidate="txtFechaIngreso" CssClass="auto-style26" style="color: #CC0000" ValidationGroup="Grupo3">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style44">
                        <asp:Label ID="lbl_Error_Edicion" runat="server" ForeColor="#CC0000"></asp:Label>
                        <br />
                        <asp:Label ID="lbl_Error_Edicion2" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                    <td class="auto-style22">
                        <asp:Label ID="lblAgregado" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style33">
                        <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" ValidationGroup="Grupo3" />
                    </td>
                    <td class="auto-style37"></td>
                    <td class="auto-style20"></td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:GridView ID="grdTrabajadores" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="grdTrabajadores_PageIndexChanging" OnRowCancelingEdit="grdTrabajadores_RowCancelingEdit" OnRowDataBound="grdTrabajadores_RowDataBound" OnRowEditing="grdTrabajadores_RowEditing" OnRowUpdating="grdTrabajadores_RowUpdating1">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderText="DNI">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_DNI" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_DNI" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Nombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Apellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Apellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Legajo">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_legajo" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_legajo" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Genero">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_genero" runat="server" Text='<%# Bind("Genero") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Genero" runat="server" Text='<%# Bind("Genero") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Telefono">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_telefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Telefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contraseña">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Contra" runat="server" Text='<%# Bind("Contraseña") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Contra" runat="server" Text='<%# Bind("Contraseña") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Provincia">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_eit_Provincia" runat="server" OnSelectedIndexChanged="ddl_eit_Provincia_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:Label ID="lbl_eit_provincia" runat="server" Text='<%# Bind("IdProvincia_Tr") %>' Visible="False"></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_provincia" runat="server" Text='<%# Bind("Provincia") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Localidad">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_eit_localidad" runat="server" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:Label ID="lbl_eit_Localidad" runat="server" Text='<%# Bind("IdLocalidad_Tr") %>' Visible="False"></asp:Label>
                                        <asp:Label ID="lbl_eit_NomLocalidad" runat="server" Text='<%# Bind("Localidad") %>' Visible="False"></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Localidad" runat="server" Text='<%# Bind("Localidad") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha de Ingreso">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_fechaingreso" runat="server" Text='<%# Bind("FechaDeInicio") %>' TextMode="Date"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_FechaIngreso" runat="server" Text='<%# Bind("FechaDeInicio") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chk_eit_Estado" runat="server" Checked='<%# Bind("ESTADO") %>' Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_it_Estado" runat="server" Checked='<%# Bind("Estado") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                        <br />
                        <asp:GridView ID="grdChequeoLegajoCli" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" PageSize="1" Visible="False">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style45" colspan="5">
                        <h1></h1>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
