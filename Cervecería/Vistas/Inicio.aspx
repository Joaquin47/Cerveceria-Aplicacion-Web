<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vistas.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            text-align: center;
            font-size: x-large;
            height: 31px;
            color: #000000;
            background-color: #000000;
        }
        .auto-style7 {
            color: #FFFFFF;
        }
        .auto-style3 {
            height: 23px;
            background-color: #FFFFFF;
        }
        .auto-style5 {
            text-align: center;
            height: 23px;
            color: #000000;
            font-size: x-large;
            background-color: #FFFFFF;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style8 {
            text-align: center;
            background-color: #000000;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">
                        <h1 class="auto-style7"><strong>Bienvenid@ a &quot;El Barril de Moe&quot;</strong></h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Login del usuario:</strong></td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Legajo:</strong><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtLegajo" runat="server" Width="200px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo" ForeColor="#CC0000">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Contraseña:</strong><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:TextBox ID="txtContra" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="rfvContra" runat="server" ControlToValidate="txtContra" ForeColor="#CC0000">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnLogin" runat="server" CssClass="auto-style10" OnClick="btnLogin_Click" style="color: #FFFFFF; background-color: #000000" Text="Login" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblError" runat="server" CssClass="auto-style9" style="font-size: x-large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <h1></h1>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
