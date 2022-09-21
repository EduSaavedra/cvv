<%@ Page Title="Alterar Senha | Carteira de Vacinação Virtual" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="alterar_senha.aspx.cs" Inherits="SISTEMA_CVV.funcionario.muda_senha" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
    <div>
	    <div style="width: 100%; position: relative;">
		    <fieldset>
			    <legend class="legenda" align="left"><b>Alterar Senha</b></legend>
                <table>
                    <tr>
                        <td>
                            <br /><br />
                            <asp:Label Text="Por favor, os dados abaixo solicitados. <b>Lembre-se:</b> A senha deve conter apenas letras e números." runat="server" />
                            <br /><br /><br /><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblSenhaAnterior" runat="server" Text="Senha Atual"></asp:Label>
                            <asp:RegularExpressionValidator
                                ID="revSenhaAnterior" runat="server" 
                                ErrorMessage="   * Favor inserir apenas números e/ou letras." 
                                SetFocusOnError="True" ControlToValidate="txtSenhaAnterior" 
                                Display="Dynamic" ForeColor="Red"
                                ValidationExpression="^[0-9A-Za-z]*$"
                            ></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator 
                                ID="rfvSenhaAntiga" runat="server" 
                                Text=" * "
                                ErrorMessage = " • Senha Atual"
                                ForeColor="red"
                                Display="Dynamic"
                                ControlToValidate="txtSenhaAnterior"
                            ></asp:RequiredFieldValidator><br />
                            <asp:TextBox CssClass="campo2" placeholder="Senha Atual" MaxLength="45" ID="txtSenhaAnterior" runat="server" Width="291px" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblNovaSenha" runat="server" Text="Nova Senha"></asp:Label>
                            <asp:RegularExpressionValidator
                                ID="revNovaSenha" runat="server" 
                                ErrorMessage="   * Favor inserir apenas números e/ou letras." 
                                SetFocusOnError="True" ControlToValidate="txtNovaSenha" 
                                Display="Dynamic" ForeColor="Red"
                                ValidationExpression="^[0-9A-Za-z]*$"
                            ></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" runat="server" 
                                Text=" * "
                                ErrorMessage = " • Senha nova"
                                ForeColor="red"
                                Display="Dynamic"
                                ControlToValidate="txtNovaSenha"
                            ></asp:RequiredFieldValidator><br />
                            <asp:TextBox CssClass="campo2" placeholder="Nova Senha" MaxLength="45" ID="txtNovaSenha" runat="server" Width="291px" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNovaSenha2" runat="server" Text="Confirme a nova Senha"></asp:Label>
                            <asp:RegularExpressionValidator
                                ID="revConfirmarNovaSenha" runat="server" 
                                ErrorMessage="   * Favor inserir apenas números e/ou letras." 
                                SetFocusOnError="True" ControlToValidate="txtNovaSenha2" 
                                Display="Dynamic" ForeColor="Red"
                                ValidationExpression="^[0-9A-Za-z]*$"
                            ></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator 
                                ID="rfvConfirmaSenhaNova" runat="server" 
                                Text=" * "
                                ErrorMessage = " • Confirmação da nova senha"
                                ForeColor="red"
                                Display="Dynamic"
                                ControlToValidate="txtNovaSenha2"
                            ></asp:RequiredFieldValidator><br />
                            <asp:TextBox CssClass="campo2" placeholder="Confirmação da Nova Senha" MaxLength="45" ID="txtNovaSenha2" runat="server" Width="291px" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CompareValidator ID="cvSenha" runat="server" ErrorMessage="Senhas não conferem. Favor digite-as novamente." ForeColor="Red" ControlToCompare="txtNovaSenha" ControlToValidate="txtNovaSenha2"></asp:CompareValidator>
                        </td>
                    </tr>
			    </table>
                <br />
                <hr />
                <table>
                    <tr>
                        <td>
                            <asp:Button CssClass="botao_azul" ID="btnSalvarSenha" runat="server" Text="Salvar senha" OnClick="btnSalvarSenha_Click" />
                        </td>
                    </tr>
                </table>
		    </fieldset>
	    </div>
	</div>
</body>
</html>
</asp:Content>
