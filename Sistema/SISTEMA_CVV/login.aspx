<%@ Page Title="Login | Carteira de Vacinação Virtual" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SISTEMA_CVV.login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset style="margin: auto; width: 450px; text-align: center; background-color: #fafafa;">
	    <legend class="legenda">Login</legend>
        <div style="background-color: #fafafa;">
            <br /><br />
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:Image runat="server" ImageUrl="img/user.png" width="120px"/>
                    </td>
                </tr>
		        <tr>
			        <td>
                        <asp:RequiredFieldValidator ID="reqLogin" ForeColor="Red" ControlToValidate="txtUsuario" runat="server" ErrorMessage="* Campo obrigatório"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator
                            ID="revLogin" runat="server" 
                            ErrorMessage="   * Favor inserir apenas números e/ou letras." 
                            SetFocusOnError="True" ControlToValidate="txtUsuario" 
                            Display="Dynamic" ForeColor="Red"
                            ValidationExpression="^[0-9A-Za-z]*$"
                        ></asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox CssClass="campo2" MaxLength="12" placeholder="COREN" Width="400px" ID="txtUsuario" runat="server"></asp:TextBox>
                    </td>
		        </tr>
                <tr>
                    <td>
                        
			        </td>
                </tr>
		        <tr>
			        <td>
                        <asp:RequiredFieldValidator ID="reqSenha" ForeColor="Red" ControlToValidate="txtSenha" runat="server" ErrorMessage="* Campo obrigatório"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator
                            ID="revCartaoSUS" runat="server" 
                            ErrorMessage="   * Favor inserir apenas números e/ou letras." 
                            SetFocusOnError="True" ControlToValidate="txtSenha" 
                            Display="Dynamic" ForeColor="Red"
                            ValidationExpression="^[0-9A-Za-z]*$"
                        ></asp:RegularExpressionValidator>
                        <asp:TextBox CssClass="campo2" MaxLength="45" placeholder="Senha" ID="txtSenha" runat="server" Width="400px" TextMode="Password"></asp:TextBox>
                    </td>
		        </tr>
                <tr>
                    <td>
                        <br />
                        <asp:Label ID="lblErro" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="cbPersistent" runat="server" Font-Bold="true" Text=" Mantenha-me conectado" />
                        <asp:Label Text="    |    " runat="server" />
                        <asp:HyperLink Font-Bold="true" ID="hpRenovarSenha" runat="server" NavigateUrl="~/redefinir_senha.aspx">Esqueci minha senha</asp:HyperLink>
                        <br /><br /> 
                    </td>
                </tr>
		        <tr> 
			        <td>
                        <br />
                        <asp:Button CssClass="botao_azul" ID="btnLogin" runat="server" Text="Efetuar Login" OnClick="btnLogin_Click" />
			        </td>
		        </tr>
	        </table>
            <br /><br />
        </div>
    </fieldset>
</asp:Content>

