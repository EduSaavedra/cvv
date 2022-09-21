<%@ Page Title="" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="cadastrar_funcionario.aspx.cs" Inherits="SISTEMA_CVV.funcionario.cadastrar_funcionario" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>
    
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Cadastro de Paciente | Carteira de Vacinação Virtual</title>
</head>
<body>
	<div style="width: 100%; position: relative">
		<fieldset>
			<legend class="legenda"><b>Cadastrar Funcionário</b></legend>
			<table>
                <tr>
                    <td style="width: 141px" aria-sort="none">
                        <asp:Label ID="lblCoren" runat="server" Text="COREN"></asp:Label>
                        <br/>
                        <asp:TextBox CssClass="campo2" ID="txtCoren" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="width: 141px">
                        <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label>
                        <asp:TextBox CssClass="campo2" ID="txtNome" runat="server" Width="350px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblCPF" runat="server" Text="CPF"></asp:Label><br />
                        <asp:TextBox CssClass="campo2" ID="txtCPF" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblDataNasc" runat="server" Text="Data de Nascimento"></asp:Label><br />
                        <asp:TextBox CssClass="campo2" ID="txtDataNasc" runat="server"></asp:TextBox>
                    </td>
                    <td style="height: 44px">
                        <asp:Label ID="lblMatricula" runat="server" Text="Matricula"></asp:Label>
                        <br />
                        <asp:TextBox CssClass="campo2" ID="txtMatricula" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblCep" runat="server" Text="CEP"></asp:Label><br />
                        <asp:TextBox ID="txtCEP" CssClass="campo2" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblEndereco" runat="server" Text="Endereço"></asp:Label>
                        <br/>
                        <asp:TextBox CssClass="campo2" ID="txtEndereco" runat="server" Width="348px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblNumero" runat="server" Text="Numero"></asp:Label>
                        <br/>
                        <asp:TextBox CssClass="campo2" ID="txtNumero" runat="server" Width="115px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblComplemento" runat="server" Text="Complemento"></asp:Label>
                        <br/>
                        <asp:TextBox CssClass="campo2" ID="txtComplemento" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="height: 44px">
                        <asp:Label ID="lblCategoria" runat="server" Text="Categoria Funcionário"></asp:Label>
                        <br/>
                        <asp:TextBox CssClass="campo2" ID="txtCategoria" runat="server" Width="262px"></asp:TextBox>
                    </td>
                    <td style="height: 44px">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        <br/>
                        <asp:TextBox CssClass="campo2" ID="txtEmail" runat="server" Width="214px"></asp:TextBox>
                    </td>
                    <td style="height: 44px">
                        <asp:Label ID="lblTipoAcesso" runat="server" Text="Tipo de Acesso"></asp:Label>
                        <br/>
                        <asp:DropDownList cssclass="campo2" ID="ddTipoAcesso" runat="server">
                            <asp:ListItem Value="0">Usuário Comum</asp:ListItem>
                            <asp:ListItem Value="1">Administrador</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblEstado" runat="server" Text="Estado de Atuação"></asp:Label>
                        <br/>
                        <asp:DropDownList ID="ddEstadoAtuacao" runat="server">
                            <asp:ListItem Value=""> Selecione... </asp:ListItem>
                            <asp:ListItem Value="1"> São Paulo </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblUnidade" runat="server" Text="Unidade de Atuação"></asp:Label>
                        <br/>
                        <!--<asp:TextBox CssClass="campo2" ID="txtUnidade" runat="server" Width="226px"></asp:TextBox>-->
                        <asp:DropDownList ID="ddUnidadeAtuacao" runat="server">
                            <asp:ListItem Value=""> Selecione... </asp:ListItem>
                            <asp:ListItem Value="1"> Posto Paulista </asp:ListItem>
                            <asp:ListItem Value="2"> UBS RIO PEQUENO - DR. PAULO DE BARROS FRANÇA </asp:ListItem>
                            <asp:ListItem Value="3"> UBS VILA ROMANA </asp:ListItem>
                            <asp:ListItem Value="4"> UBS VILA ANASTÁCIO </asp:ListItem>
                            <asp:ListItem Value="5"> AMA SOROCABANA </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <hr />
            <table>
                <tr>
                    <td>
                        <br />
                        <asp:Button CssClass="botao_azul" ID="btnCadastrar" runat="server" Text="Cadastrar" Width="119px" OnClick="btnCadastrar_Click" />
                    </td>
                </tr>
            </table>
		</fieldset>
	</div>
</body>
</html>
</asp:Content>
