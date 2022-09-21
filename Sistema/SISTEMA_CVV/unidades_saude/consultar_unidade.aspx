<%@ Page Title="Consultar Unidade | Carteira de Vacinacação Virtual" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="consultar_unidade.aspx.cs" Inherits="SISTEMA_CVV.unidades_saude.consultar_unidade" %>

<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
		<fieldset>
			<legend class="legenda" align="left"><b>Consultar Unidade de Saúde</b></legend>
            <br />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblEstado" runat="server" Text="Estado"></asp:Label>
                        <asp:DropDownList ID="ddEstado" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddEstado_SelectedIndexChanged1" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">Todos...</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label Visible="false" ID="lblCidade" runat="server" Text="Cidade"></asp:Label>
                        <asp:DropDownList Visible="false" ID="ddCidade" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddCidade_SelectedIndexChanged" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">Todas...</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblTipoUnidade" runat="server" Text="Tipo de Unidade"></asp:Label>
                        <br />
                        <asp:DropDownList ID="ddTipoUnidade" AutoPostBack="true" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddTipoUnidade_SelectedIndexChanged" Visible="False">
                            <asp:ListItem Value="0">Todas...</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <table Width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="gvUnidades" runat="server" AutoGenerateColumns="False" CellPadding="8" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource1" PageSize="12">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="tipo_unidade" HeaderText="Tipo" SortExpression="tipo_unidade" />
                                <asp:BoundField DataField="nome_unidadesaude" HeaderText="Unidade de Saude" SortExpression="nome_unidadesaude" />
                                <asp:BoundField DataField="endereco" HeaderText="Endereço" SortExpression="endereco" />
                                <asp:BoundField DataField="numero" HeaderText="Número" SortExpression="numero" />
                                <asp:BoundField DataField="telefone" HeaderText="Telefone" SortExpression="telefone" />
                                <asp:BoundField DataField="bairro" HeaderText="Bairro" SortExpression="bairro" />
                                <asp:BoundField DataField="cidade" HeaderText="Cidade" SortExpression="cidade" />
                                <asp:BoundField DataField="cep" HeaderText="CEP" SortExpression="cep" />
                                <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" Height="250px" />
                            <FooterStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle Height="30px" BackColor="#669999" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                            <PagerSettings FirstPageText="&lt;&lt; " LastPageText=" &gt;&gt;" NextPageText="&gt;" PageButtonCount="20" PreviousPageText="&lt;" />
                            <PagerStyle Height="30px" BackColor="#669999" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" Height="30px" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StringdeConexao %>" SelectCommand="SELECT [nome_unidadesaude], [cidade], [cep], [endereco], [numero], [bairro], [estado], [tipo_unidade], [telefone] FROM [t_unidadesaude] ORDER BY [bairro]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</asp:Content>
