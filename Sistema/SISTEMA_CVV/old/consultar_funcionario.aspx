<%@ Page Title="" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="consultar_funcionario.aspx.cs" Inherits="SISTEMA_CVV.funcionario.consultar_funcionario" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Consultar Funcionário | Carteira de Vacinação Virtual</title>    
</head>
<body>
    <div align="left">
	    <div style="width: 100%; position: relative">
		    <fieldset>
			    <legend class="legenda" align="left"><b>Consultar/Alterar um Funcionário</b></legend>
                <table>
                    <tr>
                        <td style="width: 141px">
                            <asp:Label ID="lblCoren" runat="server" Text="COREN"></asp:Label>
                            <br/>
                            <asp:TextBox CssClass="campo2" ID="txtCoren" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <br />
                            <asp:Button CssClass="botao_azul" ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td style="width: 141px">
                            <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label>                            
                            <asp:TextBox CssClass="campo2" ID="txtNome" runat="server" Width="350px"></asp:TextBox>
                            <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNome" ErrorMessage="* O nome é obrigatório" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>-->
                        </td>
                        <td>
                            <asp:Label ID="lblCPF" runat="server" Text="CPF"></asp:Label><br />
                            <asp:TextBox CssClass="campo2" ID="txtCPF" runat="server" Width="149px"></asp:TextBox>
                            <!--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="O Cpf informado está em formato incorreto" ValidationExpression="^\d{3}\.\d{3}\.\d{3}-\d{2}$" ControlToValidate="txtCPF" ForeColor="Red"></asp:RegularExpressionValidator>-->
                        </td>
                        <td>
                            <asp:Label ID="lblDataNascimento" runat="server" Text="Data Nascimento"></asp:Label><br />
                            <asp:TextBox CssClass="campo2" ID="txtDataNascimeto" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblMatricula" runat="server" Text="Matricula"></asp:Label><br />
                            <asp:TextBox CssClass="campo2" ID="txtMatricula" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
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
                            <asp:TextBox CssClass="campo2" ID="txtComplemento" runat="server" Width="109px"></asp:TextBox>
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
                            <asp:DropDownList cssclass="campo2" ID="ddTipoAcesso" runat="server" Width="190px">
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
                            <asp:DropDownList ID="ddUnidadeAtuacao" runat="server">
                                <asp:ListItem Value=""> Selecione... </asp:ListItem>
                                <asp:ListItem Value="1"> Posto Paulista </asp:ListItem>
                                <asp:ListItem Value="2"> UBS RIO PEQUENO - DR. PAULO DE BARROS FRANÇA </asp:ListItem>
                                <asp:ListItem Value="3"> UBS VILA ROMANA </asp:ListItem>
                                <asp:ListItem Value="4"> UBS VILA ANASTÁCIO </asp:ListItem>
                                <asp:ListItem Value="5"> AMA SOROCABANA </asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label><br/>
                            <asp:DropDownList ID="ddStatusFuncionario" runat="server" Width="155px">
                                <asp:ListItem Value="A"> Ativo </asp:ListItem>
                                <asp:ListItem Value="I"> Inativo </asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button CssClass="botao_azul" ID="btnAplicarAlteracoes" runat="server" Text="Aplicar Alterações" Width="119px" OnClick="btnAplicarAlteracoes_Click" />
                        </td>
                    </tr>
                </table>
		    </fieldset>
	    </div>
    </div>    
</body>
</html>
</asp:Content>
