<%@ Page Title="Consultar Paciente | Carteira de Vacinação Virtual" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="consultar_paciente.aspx.cs" Inherits="SISTEMA_CVV.consultar_paciente1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
    <link href="css/admin.css" rel="stylesheet" type="text/css" />
    <script src="../scripts/validadores.js"></script>
</head>
<body>
	<div>
		<div style="width: 100%; position: relative">
			<fieldset>
				<legend class="legenda"><b>Consultar/Alterar um Paciente</b></legend>
                <table>
					<tr>
						<td>
                            <asp:Label ID="lblCartaoSus" runat="server" Text="Cartão SUS"></asp:Label>
                            <asp:RegularExpressionValidator
                                ID="revCartaoSUS" runat="server" 
                                ErrorMessage="* Favor inserir apenas números." 
                                SetFocusOnError="True" ControlToValidate="txtCartaoSus" 
                                Display="Dynamic" ForeColor="Red"
                                ValidationExpression="^[0-9]+"
                            ></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="* Campo Obrigatório" ControlToValidate="txtCartaoSus" runat="server" /><br />
							<asp:TextBox CssClass="campo2" placeholder="Cartão SUS" MaxLength="16" ID="txtCartaoSus" runat="server"></asp:TextBox>
                            <asp:Button CssClass="botao_azul" ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click"/>
                            <asp:Button CssClass="botao_azul" CausesValidation="false" ID="btnLimpaCampos" runat="server" Text="Limpar campos" OnClick="btnLimpaCampos_Click" />
                            <asp:Label ID="lblsus" runat="server" Text=""></asp:Label>
                        </td>
					</tr>
                </table>
                <div runat="server" id="tableDados">
					<table>
						<tr>
							<td>
                                <asp:Label ID="lblNomePaciente" runat="server" Text="Nome do Paciente"></asp:Label>
                                <asp:RequiredFieldValidator 
                                    ID="rfvNomePaciente" runat="server" 
                                    ErrorMessage=" • Nome do Paciente "
                                    Text=" * "
                                    ForeColor="red"
                                    Display="Dynamic"
                                    ControlToValidate="txtNomePaciente"
                                ></asp:RequiredFieldValidator><br />
                                <asp:TextBox CssClass="campo2" MaxLength="45" ID="txtNomePaciente" runat="server" Width="450px"></asp:TextBox>
							</td>
							<td>
                                <asp:Label ID="lblCPF" runat="server" Text="CPF"></asp:Label><br />
								<asp:TextBox CssClass="campo2" BackColor="#e6e6e6" ReadOnly="true" id="txtCpfPaciente" maxlength="14" runat="server" Width="130px"></asp:TextBox>
							</td>
                            <td>
                                <asp:Label ID="lblSexo" runat="server" Text="Sexo"></asp:Label><br />
								<asp:TextBox CssClass="campo2" BackColor="#e6e6e6" ReadOnly="true" id="txtSexo" maxlength="1" runat="server" Width="55px"></asp:TextBox>
							</td>
                            <td>
                                <asp:Label ID="lblRaca" runat="server" Text="Raça"></asp:Label><br />
								<asp:TextBox CssClass="campo2" BackColor="#e6e6e6" ReadOnly="true" id="txtRaca" maxlength="14" runat="server" Width="128px"></asp:TextBox>
							</td>
							<td>
                                <asp:Label ID="lblRG" runat="server" Text="RG"></asp:Label><br />
								<asp:TextBox CssClass="campo2" BackColor="#e6e6e6" ReadOnly="true" id="txtRgPaciente" maxlength="14" runat="server" Width="120px" ></asp:TextBox>
							</td>
							<td>	
                                <asp:Label ID="lblDataNasc" runat="server" Text="Data de Nascimento"></asp:Label><br />
								<asp:TextBox CssClass="campo2" BackColor="#e6e6e6" ReadOnly="true" id="txtDataNasc" maxlength="10" runat="server" Width="105px" ></asp:TextBox>
							</td>
						</tr>
                    </table> <!--fim tabela ate data de nascimento-->
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblNomeMae" runat="server" Text="Nome da Mãe"></asp:Label><br />
                                <asp:TextBox CssClass="campo2" BackColor="#e6e6e6" ReadOnly="true" ID="txtMaePaciente" maxlength="70" Width="419px" runat="server"></asp:TextBox>
                            </td>
							<td>
                                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label><br />
								<asp:TextBox CssClass="campo2" id="txtEmail" size="45" maxlength="70" runat="server" Width="283px" TextMode="Email"></asp:TextBox>
							</td> 
							<td>
                                <asp:Label ID="lblTelefone" runat="server" Text="Telefone"></asp:Label><br />
								<asp:TextBox CssClass="campo2" id="txtTelefone" size="14" maxlength="14" runat="server"
                                    onKeyPress="MascaraTelefone(this)">
								</asp:TextBox>
							</td>
                            <td>
                                <asp:Label ID="lblCelular" runat="server" Text="Celular"></asp:Label><br />
								<asp:TextBox CssClass="campo2" id="txtCelular" size="15" maxlength="15" runat="server"
                                    onKeyPress="MascaraCelular(this)">
								</asp:TextBox>
							</td>
                            <td>
                                <asp:Label ID="lblZona" runat="server" Text="Zona"></asp:Label><br />
                                <asp:DropDownList ID="ddZona" runat="server">
                                    <asp:ListItem Selected="True">Rural</asp:ListItem>
                                    <asp:ListItem>Urbana</asp:ListItem>
                                </asp:DropDownList>
							</td>
                            <td>
                                <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label><br />
                                <asp:DropDownList ID="ddStatus" runat="server">
                                    <asp:ListItem Value="A">Ativo</asp:ListItem>
                                    <asp:ListItem Value="I">Inativo</asp:ListItem>
                                </asp:DropDownList>
							</td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblCep" runat="server" Text="CEP"></asp:Label>
                                <asp:RequiredFieldValidator 
                                    ID="rfvCEP" runat="server" 
                                    ErrorMessage=" • CEP "
                                    Text=" * "
                                    ForeColor="red"
                                    Display="Dynamic"
                                    ControlToValidate="txtCep"
                                ></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator 
                                    ID="revCPF" runat="server" 
                                    ErrorMessage="Favor digitar o CEP no padrão: XXXXX-XXX"
                                    ValidationExpression="[0-9]{5}\-?[0-9]{3}"
                                    ControlToValidate="txtCep"
                                    ForeColor="Red"
                                ></asp:RegularExpressionValidator>
                                <br />
								<asp:TextBox CssClass="campo2" ID="txtCep" size="9" maxlength="9"
                                    runat="server" AutoPostBack="True" OnTextChanged="txtCep_TextChanged" 
                                    onKeyPress="MascaraCep(this)">
								</asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEndereco" runat="server" Text="Endereço"></asp:Label><br />
								<asp:TextBox CssClass="campo2" id="txtEndereco" ReadOnly="true" maxlength="45" runat="server" Width="404px" BackColor="#E6E6E6"></asp:TextBox>
							</td>
							<td>
                                <asp:Label ID="lblNumero" runat="server" Text="Número"></asp:Label>
                                <asp:RequiredFieldValidator 
                                    ID="rfvNumeroEndereco" runat="server" 
                                    ErrorMessage=" • Número do endereço "
                                    Text=" * "
                                    ForeColor="red"
                                    Display="Dynamic"
                                    ControlToValidate="txtNumeroEndereco"
                                ></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator 
                                    ID="revNumeroEndereco" runat="server" ErrorMessage=" • Número inválido."
                                    Text=" * "
                                    ForeColor="red"
                                    Display="Dynamic"
                                    ControlToValidate="txtNumeroEndereco" ValidationExpression="^[0-9]+$"
                                ></asp:RegularExpressionValidator><br />
								<asp:TextBox CssClass="campo2" id="txtNumeroEndereco" maxlength="6" runat="server" Width="100px"></asp:TextBox>
							</td>
                            <td>
                                <asp:CheckBox ID="cbSemNumero" runat="server" Text="Sem Número" OnCheckedChanged="cbSemNumero_CheckedChanged" AutoPostBack="True" />
                            </td>
							<td>
                                <asp:Label ID="lblComplemento" runat="server" Text="Complemento"></asp:Label><br />
								<asp:TextBox CssClass="campo2" id="txtComplemento" maxlength="15" runat="server"></asp:TextBox>
							</td>
							<td>
                                <asp:Label ID="lblBairro" runat="server" Text="Bairro"></asp:Label><br />
								<asp:TextBox CssClass="campo2" id="txtBairro" ReadOnly="true" maxlength="30" runat="server" BackColor="#E6E6E6"></asp:TextBox>
							</td>
                        </tr>
                    </table>
                    <table>
						<tr>
                                <td>
                                <asp:Label ID="lblCidade" runat="server" Text="Cidade"></asp:Label><br />
								<asp:TextBox CssClass="campo2" id="txtCidade" ReadOnly="true" maxlength="50" runat="server" Width="212px" BackColor="#E6E6E6"></asp:TextBox>
							</td>
                            <td>
                                <asp:Label ID="lblUf" runat="server" Text="UF"></asp:Label><br />
								<asp:TextBox CssClass="campo2" id="txtUnidadeFederativa" maxlength="2" ReadOnly="true" runat="server" Width="70px" BackColor="#E6E6E6"></asp:TextBox>
							</td>
                            <td>
                                <asp:Label ID="lblPais" runat="server" Text="Pais"></asp:Label><br />
								<asp:TextBox CssClass="campo2" id="txtPais" maxlength="50" ReadOnly="true" runat="server" Width="280px" BackColor="#E6E6E6"></asp:TextBox>
							</td>
                        </tr>
                    </table>  						
					<table>
						<tr>
                            <td>
                                <asp:CheckBox ID="cbAlteracoes" runat="server" Text="Habilitar Alterações" AutoPostBack="True" OnCheckedChanged="cbAlteracoes_CheckedChanged" /><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:ValidationSummary 
                                    ID="vsumValidador" runat="server"
                                    DisplayMode="list"
                                    EnableClientScript="true"
                                    ForeColor="DarkBlue"
                                    HeaderText="Verifique o(s) campos(s) abaixo: "
                                />
                            </td>
                        </tr>
					</table>
					<hr />
					<table>
						<tr>
							<td>
                                <asp:Button CssClass="botao_azul" ID="btnAlterar" runat="server" Text="Aplicar Alterações" Width="148px" OnClick="btnAlterar_Click" Visible="False" />
							</td>
						</tr>
						<br>
					</table>
                </div>
			</fieldset>
		</div>
	</div>
</body>
</html>
</asp:Content>