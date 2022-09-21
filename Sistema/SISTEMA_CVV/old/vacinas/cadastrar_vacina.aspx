<%@ Page Title="" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="cadastrar_vacina.aspx.cs" Inherits="SISTEMA_CVV.vacinas.cadastrar_vacina" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Cadastrar Vacina</title>
</head>
<body>
    <br>
    <div>
	    <div style="width: 100%; position: relative; height: 267px;">
		    <fieldset>
			    <legend class="legenda" align="left"><b>Cadastrar Vacina</b></legend>
			    <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label><br />
                            <asp:TextBox CssClass="campo2" ID="txtNomeVacina" runat="server" Width="291px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDose" runat="server" Text="Dose"></asp:Label><br />
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="0"> Selecione... </asp:ListItem>
                                <asp:ListItem Value="1"> Primeira </asp:ListItem>
                                <asp:ListItem Value="2"> Segunda </asp:ListItem>
                                <asp:ListItem Value="3"> Terceira </asp:ListItem>
                                <asp:ListItem Value="3"> Reforço </asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="lblPeriodicidade" runat="server" Text="Periodicidade"></asp:Label><br />
                            <asp:DropDownList ID="ddPeriodicidade" runat="server">
                                <asp:ListItem Value="0"> Selecione... </asp:ListItem>
                                <asp:ListItem Value="1"> Anual </asp:ListItem>
                                <asp:ListItem Value="2"> Semestral </asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Label ID="lblAplicavel" runat="server" Text="Aplicavel a:"></asp:Label><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="lbDoencas" runat="server" OnSelectedIndexChanged="lbDoencas_SelectedIndexChanged" Height="60px" AutoPostBack="True">
                                <asp:ListItem> Doeça 1</asp:ListItem>
                                <asp:ListItem> Doeça 2</asp:ListItem>
                                <asp:ListItem> Doeça 3</asp:ListItem>
                            </asp:ListBox>
                        </td>
                        <td style="width: 108px; padding-left: 30px">
                            <asp:LinkButton ID="lbIncluirDoenca" runat="server" OnClick="lbIncluirDoenca_Click" ForeColor="#003366"> Adicionar >> </asp:LinkButton><br />
                            <br />
                            <asp:LinkButton ID="lbRemoverDoenca" runat="server" ForeColor="#003366" OnClick="lbRemoverDoenca_Click"> << Remover </asp:LinkButton>
                        </td>
                        <td>
                            <asp:ListBox ID="lbDoencasAplicaveis" OnSelectedIndexChanged="lbDoencasAplicaveis_SelectedIndexChanged" runat="server" AutoPostBack="True">
                            </asp:ListBox>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <hr />
                            <asp:Button CssClass="botao_azul" ID="btnIncluirVacina" runat="server" Text="Incluir Vacina" OnClick="btnIncluirVacina_Click" />
                        </td>
                    </tr>
                </table>
		    </fieldset>
	    </div>
	</div>
</body>
</html>
                </table>
                </table>
</asp:Content>
