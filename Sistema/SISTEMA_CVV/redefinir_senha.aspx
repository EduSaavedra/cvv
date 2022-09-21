<%@ Page Title="Redefinir Senha | Carteira de Vacinacação Virtual" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="redefinir_senha.aspx.cs" Inherits="SISTEMA_CVV.redefinir_senha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="js/validadores.js"></script>
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <title></title>
            <meta http-equiv='Content-Type' content='text/html; charset=utf-8, width=device-width, initial-scale=1.0' />
        </head>
        <body>
            <fieldset>
                <legend class="legenda"> Redefinir minha senha </legend>
                <table>
                    <tr>
                        <td>
                            <asp:Label Text="Por favor, insira os dados abaixo solicitados e enviaremos a senha para o email cadastrado." runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text="E-mail"></asp:Label>
                            <asp:RequiredFieldValidator 
                                ID="rfvEmail" runat="server" 
                                ErrorMessage=" * "
                                ControlToValidate="txtEmail"
                                ForeColor="Red"
                            ></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtEmail" placeholder="E-mail do funcionário" CssClass="campo" Width="380px" runat="server" TextMode="Email" MaxLength="45"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCPF" runat="server" Text="CPF"></asp:Label>
                            <asp:RequiredFieldValidator 
                                ID="rfvCPF" runat="server" 
                                ErrorMessage=" * "
                                ControlToValidate="txtCPF"
                                ForeColor="Red"
                            ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator 
                                ID="revCPF" runat="server" 
                                ErrorMessage="Favor digitar o CPF no padrão: XXX.XXX.XXX-XX"
                                ValidationExpression="[0-9]{3}\.?[0-9]{3}\.?[0-9]{3}\-?[0-9]{2}"
                                ControlToValidate="txtCPF"
                                ForeColor="Red"
                            ></asp:RegularExpressionValidator>
                            <br />
                            <asp:TextBox 
                                placeholder="CPF (XXX.XXX.XXX-XX)"
                                ID="txtCPF" 
                                CssClass="campo2" 
                                Width="380px" 
                                runat="server"
                                MaxLength="14"
                                onKeyPress="MascaraCPF(this)"
                            ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCoren" runat="server" Text="Coren"></asp:Label>
                            <asp:RegularExpressionValidator
                                ID="revCoren" runat="server" 
                                ErrorMessage="   * Favor inserir apenas números e/ou letras." 
                                SetFocusOnError="True" ControlToValidate="txtCoren" 
                                Display="Dynamic" ForeColor="Red"
                                ValidationExpression="^[0-9A-Za-z]*$"
                            ></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator 
                                ID="rfvCoren" runat="server" 
                                ErrorMessage=" * "
                                ControlToValidate="txtCoren"
                                ForeColor="Red"
                            ></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="txtCoren" placeholder="Coren" CssClass="campo2" Width="380px" runat="server" MaxLength="12"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnEnviar" CssClass="botao_azul" runat="server" Text="Enviar nova senha" OnClick="btnEnviar_Click" /><br />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </body>
    </html>
</asp:Content>
