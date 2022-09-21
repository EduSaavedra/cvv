<%@ Page Title="" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="testes.aspx.cs" Inherits="SISTEMA_CVV.testes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
     
    <asp:Label runat="server">CEP</asp:Label>
    <asp:Textbox runat="server" AutoPostBack="True" id="txtCEP" OnTextChanged="txtCEP_TextChanged" ></asp:Textbox>
    <asp:textbox runat="server" ID="txtEndereco"></asp:textbox>
    <asp:textbox runat="server" ID="txtBairro"></asp:textbox>
    <asp:textbox runat="server" ID="txtCidade"></asp:textbox>
    <asp:textbox runat="server" ID="txtEstado"></asp:textbox>
    
    <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns = "false"
    AllowPaging = "true">
      <Columns>
         <asp:BoundField DataField = "CustomerId" HeaderText = "Customer Id" />
         <asp:BoundField DataField = "ContactName" HeaderText = "Contact Name" />
         <asp:BoundField DataField = "City" HeaderText = "City" />
         <asp:BoundField DataField = "Country" HeaderText = "Country" />
      </Columns>
    </asp:GridView>
    
</asp:Content>
