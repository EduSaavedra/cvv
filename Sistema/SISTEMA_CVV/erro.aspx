<%@ Page Title="Erro | Carteira de Vacinação Virtual" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="erro.aspx.cs" Inherits="SISTEMA_CVV.erro" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    </head>
    <body>
        <fieldset>
            <legend class="legenda"> Erro </legend>
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <asp:Label ID="lblErro" runat="server" Text="Ocorreu um erro ao tentar consumir o serviço." Font-Size="Large" ForeColor="#FF1000"></asp:Label><br /><br />
            <asp:Label ID="lblMensagem" runat="server" Font-Size="Large" 
                Text="Por favor, entre em contato com o email <b>vacinacaovirtual@outlook.com</b> e informe a página que esta tentando acessar ou o serviço que tentou executar."
                ForeColor="#0099FF">
            </asp:Label>
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        </fieldset>        
    </body>
</html>
</asp:Content>
