<%@ Page Title="" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="tws.aspx.cs" Inherits="SISTEMA_CVV.tws" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
        <body>
            <fieldset>
                <legend>Pesquisar Funcionário</legend>
                <table>
                    <tr>
                        <td>
                            Coren
                        </td>
                        <td>
                            <asp:TextBox ID="txtCoren" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnPesquisar" runat="server" OnClick="btnPesquisar_Click" Text="Pesquisar" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label><br />
                            <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <br />
            <div>
                <asp:GridView ID="gvwFuncionarios" runat="server" AutoGenerateColumns="False" Width="100%">
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="nome_unidadesaude" />
                        <asp:BoundField HeaderText="CPF" DataField="tipo_unidade" />
                        <asp:BoundField HeaderText="Nome" DataField="cidade" />
                        <asp:BoundField HeaderText="RG" DataField="cep" />
                        <asp:BoundField HeaderText="Email" DataField="endereco" />
                        <asp:BoundField HeaderText="Tel. Residencial" DataField="numero" />
                        <asp:BoundField HeaderText="Tel. Celular" DataField="bairro" />
                        <asp:BoundField HeaderText="Data Nasc." DataField="estado" />
                        <asp:BoundField HeaderText="Sexo" DataField="telefone" />
                    </Columns>
                </asp:GridView>
            </div>
        </body>
    </html>
</asp:Content>
