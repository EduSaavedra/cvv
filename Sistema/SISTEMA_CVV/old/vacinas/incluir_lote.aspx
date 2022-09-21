<%@ Page Title="Incluir Lote | Carteira de Vacinação Virtual" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="incluir_lote.aspx.cs" Inherits="SISTEMA_CVV.vacinas.incluir_lote" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <br/>
	    <div style="width: 100%; position: relative">
		    <fieldset>
			    <legend class="legenda" align="left"><b>Incluir Lote de Vacina</b></legend>
			    <table>
				    <tr>
					    <td>
						    <asp:Label ID="lblLote" runat="server" Text="Lote"></asp:Label><br />
                            <asp:TextBox CssClass="campo2" ID="txtLote" runat="server" placeholder="Número do Lote"></asp:TextBox>
					    </td>
				    </tr>
                </table>
                <table>
                    <tr>
                        <td style="width=480px;">
                            <asp:Label ID="lblCoren" runat="server" Text="Vacina"></asp:Label><br />
                            <asp:DropDownList ID="ddVacina" runat="server">
                                <asp:ListItem Value="0"> Selecione... </asp:ListItem>
                                <asp:ListItem Value="1"> Vacina 1 </asp:ListItem>
                                <asp:ListItem Value="2"> Vacina 2 </asp:ListItem>
                                <asp:ListItem Value="3"> Vacina 3 </asp:ListItem>
                                <asp:ListItem Value="4"> Vacina 4 </asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="lblNome" runat="server" Text="Fornecedor"></asp:Label><br />
                            <asp:DropDownList ID="ddFornecedor" runat="server">
                                <asp:ListItem Value="0"> Selecione... </asp:ListItem>
                                <asp:ListItem Value="1"> Fornecedor 1 </asp:ListItem>
                                <asp:ListItem Value="2"> Fornecedor 2 </asp:ListItem>
                                <asp:ListItem Value="3"> Fornecedor 3 </asp:ListItem>
                                <asp:ListItem Value="4"> Fornecedor 4 </asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Data de fabricação"></asp:Label><br />
                            <asp:TextBox CssClass="campo2" ID="txtDataFabricacao" runat="server" placeholder="DD/MM/AAAA"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Data de Validade"></asp:Label><br />
                            <asp:TextBox CssClass="campo2" ID="txtDataValidade" runat="server" placeholder="DD/MM/AAAA"></asp:TextBox>
                        </td>
                    </tr>
			    </table>
                <hr />
			    <table>
				    <tr>
					    <td>
                            <asp:Button CssClass="botao_azul" ID="btnIncluirLote" runat="server" Text="Incluir Lote" />
					    </td>
				    </tr>
			    </table>
		    </fieldset>
	    </div>
</body>
</html>
</asp:Content>
