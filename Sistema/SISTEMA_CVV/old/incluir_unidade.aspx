<%@ Page Title="" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="incluir_unidade.aspx.cs" Inherits="SISTEMA_CVV.unidades_saude.incluir_unidade" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" type="text/css" href="../css/carrega.css"/>
	<title>Consultar Funcionário | Carteira de Vacinação Virtual</title>
    <script type="text/JavaScript" src="../js/validadores.js"></script>
</head>
<body>
	<div style="width: 100%; position: relative">
		<fieldset>
			<legend class="legenda" align="left"><b>Incluir Unidade de Saúde</b></legend>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblNome" runat="server" Text="Nome da Unidade de Saúde"></asp:Label>
                        <asp:RequiredFieldValidator
                            ID="reqNomeUnidade" runat="server" 
                            ControlToValidate="txtNomeUnidade"
                            ErrorMessage=" • Nome da Unidade de Saúde "
                            Display="Dynamic"
                            ForeColor="red"
                            Text=" * "
                        ></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox CssClass="campo2" ID="txtNomeUnidade" runat="server" Width="400px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblCep" runat="server" Text="CEP"></asp:Label>
                        <asp:RequiredFieldValidator
                            ID="reqCep" runat="server"
                            ControlToValidate="txtCep" 
                            ErrorMessage=" • CEP "
                            Display="Dynamic"
                            ForeColor="red"
                            Text=" * "
                        ></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox CssClass="campo2" name="cep" onkeypress="MascaraCep(this)" 
                            ID="txtCep" runat="server" OnTextChanged="validaCEP" AutoPostBack="True" MaxLength="9"></asp:TextBox>
                    </td>
                    <td class="auto-style2" id="tdNumero">
                        <asp:Label ID="lblNumero" runat="server" Text="Numero"></asp:Label>
                        <asp:RequiredFieldValidator
                            ID="reqNumero" runat="server" 
                            ControlToValidate="txtNumero"
                            ErrorMessage=" • Numero "
                            Display="Dynamic"
                            ForeColor="red"
                            Text=" * "
                        ></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox CssClass="campo2" ID="txtNumero" runat="server" Width="140px" TextMode="Number"></asp:TextBox>
                        <asp:CheckBox ID="cbSemNumero" Text="Sem número" runat="server" AutoPostBack="True" OnCheckedChanged="cbSemNumero_CheckedChanged" />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:Label  ID="lblEndereco" runat="server" Text="Endereço"></asp:Label>
                        <asp:RequiredFieldValidator
                            ID="reqEndereco" runat="server" 
                            ControlToValidate="txtEndereco"
                            ErrorMessage=" • Endereço "
                            Display="Dynamic"
                            ForeColor="red"
                            Text=" * "
                        ></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox CssClass="campo2" ID="txtEndereco" runat="server" Width="480px" ReadOnly="True" BackColor="#f2f2f2"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblEstado" runat="server" Text="Estado"></asp:Label><br />
                        <asp:TextBox ID="txtEstado" CssClass="campo2" runat="server" ReadOnly="True" BackColor="#f2f2f2"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblCidade" runat="server" Text="Cidade"></asp:Label><br />
                        <asp:TextBox ID="txtCidade" CssClass="campo2" runat="server" ReadOnly="True" BackColor="#f2f2f2"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblBairro" runat="server" Text="Bairro"></asp:Label><br />
                        <asp:TextBox ID="txtBairro" CssClass="campo2" runat="server" ReadOnly="True" BackColor="#f2f2f2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTipoUnidade" runat="server" Text="Tipo de Unidade"></asp:Label>
                        <asp:RequiredFieldValidator
                            ID="reqTipoUnidade" runat="server" 
                            ControlToValidate="ddTipoUnidade"
                            ErrorMessage=" • Tipo de Unidade "
                            Display="Dynamic"
                            ForeColor="red"
                            Text=" * "
                        ></asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="ddTipoUnidade" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table>
                <hr />
                <tr>
                    <td>
                        <asp:Button CssClass="botao_azul" ID="btnIncluir" runat="server" Text="Incluir" OnClick="btnIncluir_Click"/>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:ValidationSummary
                            ID="validaCadUnidade"
                            DisplayMode="List" 
                            EnableClientScript="true"
                            ForeColor="DarkBlue"
                            HeaderText="Campos obrigatórios: "
                            runat="server"
                        />
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</body>
</html>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 10px;
        }
        .auto-style2 {
            width: 313px;
        }
    </style>
</asp:Content>

