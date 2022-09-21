<%@ Page Title="Consultar Funcionário | Carteira de Vacinação Virtual" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="consulta.aspx.cs"  Inherits="SISTEMA_CVV.funcionario.consulta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 44px;
            width: 142px;
        }
        .auto-style2 {
            width: 313px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>    
</head>
<body>
    <div align="left">
	    <div style="width: 100%; position: relative">
		    <fieldset>
			    <legend class="legenda" align="left"><b>Consultar um Funcionário</b></legend>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblCoren" runat="server" Text="COREN"></asp:Label>
                                <asp:RegularExpressionValidator
                                    ID="revCartaoSUS" runat="server" 
                                    ErrorMessage="* Favor inserir apenas números e/ou letras." 
                                    SetFocusOnError="True" ControlToValidate="txtCoren" 
                                    Display="Dynamic" ForeColor="Red"
                                    ValidationExpression="^[0-9A-Za-z]*$"
                                ></asp:RegularExpressionValidator>
                                
                            <asp:RequiredFieldValidator 
                                    ID="rfvCartaoSUS" runat="server" 
                                    Text=" * Campo obrigatório "
                                    ForeColor="red"
                                    Display="Dynamic"
                                    ControlToValidate="txtCoren"
                            ></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox CssClass="campo2" placeholder="Coren" ID="txtCoren" Width="180px" runat="server" MaxLength="12"></asp:TextBox>
                            <asp:Button CssClass="botao_azul" ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                            <asp:Button CssClass="botao_azul" ID="btnLimparCampos" runat="server" Text="Limpar Campos" OnClick="btnLimparCampos_Click" />
                        </td>
                    </tr>
                </table>
                <div id="divDados" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label> <br />                          
                                <asp:TextBox CssClass="campo2" ID="txtNome" runat="server" Width="350px" ReadOnly="true" BackColor="#f2f2f2" MaxLength="45"></asp:TextBox>
                                <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNome" ErrorMessage="* O nome é obrigatório" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>-->
                            </td>
                            <td>
                                <asp:Label ID="lblCPF" runat="server" Text="CPF"></asp:Label><br />
                                <asp:TextBox CssClass="campo2" ID="txtCPF" runat="server" Width="130px" ReadOnly="true" BackColor="#f2f2f2" MaxLength="14"></asp:TextBox>
                                <!--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="O Cpf informado está em formato incorreto" ValidationExpression="^\d{3}\.\d{3}\.\d{3}-\d{2}$" ControlToValidate="txtCPF" ForeColor="Red"></asp:RegularExpressionValidator>-->
                            </td>
                            <td>
                                <asp:Label ID="lblDataNascimento" runat="server" Text="Data Nascimento"></asp:Label><br />
                                <asp:TextBox CssClass="campo2" ID="txtDataNascimeto" runat="server" Width="110px" ReadOnly="true" BackColor="#f2f2f2" MaxLength="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblMatricula" runat="server" Text="Matricula"></asp:Label><br />
                                <asp:TextBox CssClass="campo2" ID="txtMatricula" runat="server" ReadOnly="true" BackColor="#f2f2f2" MaxLength="15"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblEndereco" runat="server" Text="Endereço"></asp:Label><br/>
                                <asp:TextBox CssClass="campo2" ID="txtEndereco" runat="server" Width="348px" ReadOnly="true" BackColor="#f2f2f2" MaxLength="45"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblNumero" runat="server" Text="Numero"></asp:Label><br/>
                                <asp:TextBox CssClass="campo2" ID="txtNumero" runat="server" Width="120px" ReadOnly="true" BackColor="#f2f2f2" MaxLength="6"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblComplemento" runat="server" Text="Complemento"></asp:Label><br/>
                                <asp:TextBox CssClass="campo2" ID="txtComplemento" runat="server" Width="109px" ReadOnly="true" BackColor="#f2f2f2" MaxLength="45"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td style="height: 44px">
                                <asp:Label ID="lblCategoria" runat="server" Text="Categoria Funcionário"></asp:Label><br/>
                                <asp:TextBox CssClass="campo2" ID="txtCategoria" runat="server" Width="262px" ReadOnly="true" BackColor="#f2f2f2" MaxLength="45"></asp:TextBox>
                            </td>
                            <td style="height: 44px">
                                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label><br/>
                                <asp:TextBox CssClass="campo2" ID="txtEmail" runat="server" Width="350px" ReadOnly="true" BackColor="#f2f2f2" MaxLength="45"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:Label ID="lblTipoAcesso" runat="server" Text="Tipo de Acesso"></asp:Label><br/>
                                <asp:TextBox ID="txtTipoAcesso" CssClass="campo2" runat="server" ReadOnly="true" BackColor="#f2f2f2" Width="55px"></asp:TextBox>                         
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblEstado" runat="server" Text="Estado de Atuação"></asp:Label><br/>
                                <asp:TextBox ID="txtEstado" runat="server" CssClass="campo2" ReadOnly="true" BackColor="#f2f2f2" MaxLength="2"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblUnidade" runat="server" Text="Unidade de Atuação"></asp:Label><br/>
                                <asp:TextBox ID="txtUnidadeAtuacao" CssClass="campo2" ReadOnly="true" BackColor="#f2f2f2" runat="server" Width="470px" MaxLength="45"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label><br/>
                                <asp:TextBox ID="txtStatus" CssClass="campo2" runat="server" ReadOnly="true" BackColor="#f2f2f2" Width="55px" MaxLength="1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
		    </fieldset>
	    </div>
    </div>    
</body>
</html>
</asp:Content>
