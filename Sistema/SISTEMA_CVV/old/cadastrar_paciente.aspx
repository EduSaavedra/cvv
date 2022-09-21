<%@ Page Title="" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="cadastrar_paciente.aspx.cs" Inherits="SISTEMA_CVV.cadastrar_paciente" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Cadastrar Paciente | Carteira de Vacinação Virtual</title>
    <script src="../js/validadores.js" type="text/javascript"></script> 
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            width: 48px;
        }
        .auto-style3 {
            width: 76px;
        }
        .auto-style5 {
            width: 79px;
        }
        .auto-style6 {
            width: 242px;
        }
        .auto-style7 {
            width: 217px;
        }
        .auto-style9 {
            width: 173px;
        }
        .auto-style10 {
            width: 263px;
        }
        </style>
</head>
<body>
    <div>
	    <div style="width: 100%; position: relative">
		    <fieldset>
			    <legend class="legenda"><b>Incluir Paciente</b></legend>
			    <table>
				    <tr>
					    <td class="auto-style3">
                            <asp:Label ID="lblCartaoSus" runat="server" Text="Cartão SUS"></asp:Label>
                            <asp:RequiredFieldValidator
                                ID="reqCartaoSus" runat="server" 
                                ControlToValidate="txtCartaoSus"
                                ErrorMessage=" • Cartão SUS "
                                Display="Dynamic"
                                ForeColor="red"
                                Text=" * "
                            ></asp:RequiredFieldValidator>
                            <br />
						    <asp:TextBox CssClass="campo2" ID="txtCartaoSus" runat="server" MaxLength="15"></asp:TextBox>
                        </td>
				    </tr>
				    <tr>
					    <td class="auto-style1">
                            <asp:Label ID="lblNomePaciente" runat="server" Text="Nome do Paciente"></asp:Label>
                            <asp:RequiredFieldValidator
                                ID="reqNomePaciente" runat="server" 
                                ControlToValidate="txtNomePaciente"
                                ErrorMessage=" • Nome do Paciente "
                                Display="Dynamic"
                                ForeColor="red"
                                Text=" * "
                            ></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox CssClass="campo2" ID="txtNomePaciente" runat="server" Width="421px"></asp:TextBox>
					    </td>
					    <td class="auto-style1">
                            <asp:Label ID="lblCpf" runat="server" Text="CPF"></asp:Label>
                            <asp:RequiredFieldValidator
                                ID="reqCpf" runat="server" 
                                ControlToValidate="txtCpfPaciente"
                                ErrorMessage=" • CPF do Paciente "
                                Display="Dynamic"
                                ForeColor="red"
                                Text=" * "
                            ></asp:RequiredFieldValidator>
                            <br />
						    <asp:TextBox CssClass="campo2" onBlur="ValidarCPF(this)" Width="130px"
                                onKeyPress="MascaraCPF(this)" id="txtCpfPaciente" runat="server">
						    </asp:TextBox>
					    </td>
                        <td class="auto-style1">
                            <asp:Label ID="lblSexo" runat="server" Text="Sexo"></asp:Label><br />
                            <asp:DropDownList ID="ddSexo" runat="server">
                                <asp:ListItem Value="0">Selecione...</asp:ListItem>
                                <asp:ListItem Value="M">Masculino</asp:ListItem>
                                <asp:ListItem Value="F">Feminino</asp:ListItem>
                            </asp:DropDownList>
					    </td>
                        <td class="auto-style1">
                            <asp:Label ID="lblRaca" runat="server" Text="Raça"></asp:Label><br />
						    <asp:DropDownList ID="ddRaca" runat="server">
                                <asp:ListItem Value="0"> Selecione... </asp:ListItem>
                                <asp:ListItem Value="1"> Branco </asp:ListItem>
                                <asp:ListItem Value="2"> Negro </asp:ListItem>
                            </asp:DropDownList>
					    </td>
					    <td class="auto-style1">
                            <asp:Label ID="lblRg" runat="server" Text="RG"></asp:Label>
                            <asp:RequiredFieldValidator
                                ID="reqRg" runat="server" 
                                ControlToValidate="txtRgPaciente"
                                ErrorMessage=" • RG do Paciente "
                                Display="Dynamic"
                                ForeColor="red"
                                Text=" * "
                            ></asp:RequiredFieldValidator>
                            <br />
						    <asp:TextBox CssClass="campo2" id="txtRgPaciente" maxlength="14" runat="server" ></asp:TextBox>
					    </td>
					    <td class="auto-style9">	
                            <asp:Label ID="lblData" runat="server" Text="Data de Nascimento" Width="154px"></asp:Label>
                            <asp:RequiredFieldValidator
                                ID="reqDataNasc" runat="server" 
                                ControlToValidate="txtDataNasc"
                                ErrorMessage=" • Data de Nascimento "
                                Display="Dynamic"
                                ForeColor="red"
                                Text=" * "
                            ></asp:RequiredFieldValidator>
                            <br />
						    <asp:TextBox CssClass="campo2"
                                id="txtDataNasc" runat="server" TextMode="Date"
                            ></asp:TextBox>
					    </td>
				    </tr>
                </table> <!--fim tabela ate data de nascimento-->
                <table>
                    <tr>
                        <td class="auto-style7">
                            <asp:Label ID="lblNomeMae" runat="server" Text="Nome da Mãe"></asp:Label>
                            <asp:RequiredFieldValidator
                                ID="reqNomeMae" runat="server" 
                                ControlToValidate="txtMaePaciente"
                                ErrorMessage=" • Nome da mãe do Paciente "
                                Display="Dynamic"
                                ForeColor="red"
                                Text=" * "
                            ></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox CssClass="campo2" ID="txtMaePaciente" maxlength="70" Width="419px" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style2">
                            <asp:Label ID="lblEndereco" runat="server" Text="Endereço"></asp:Label>
                            <asp:RequiredFieldValidator
                                ID="reqEnderecoPaciente" runat="server" 
                                ControlToValidate="txtEndereco"
                                ErrorMessage=" • Endereço "
                                Display="Dynamic"
                                ForeColor="red"
                                Text=" * "
                            ></asp:RequiredFieldValidator>
                            <br />
						    <asp:TextBox CssClass="campo2" id="txtEndereco" maxlength="70" runat="server" Width="405px"></asp:TextBox>
					    </td>
					    <td class="auto-style10">
                            <asp:Label ID="Label1" runat="server" Text="Número"></asp:Label>
                            <br />
						    <asp:TextBox CssClass="campo2" id="txtNumeroEndereco" maxlength="6" runat="server" Width="120px" TextMode="Number"></asp:TextBox>
                            <asp:CheckBox ID="cbSemNumero" runat="server" text="Sem Número" AutoPostBack="True" OnCheckedChanged="cbSemNumero_CheckedChanged"/>
					    </td>
					    <td>
                            <asp:Label ID="lblComplemento" runat="server" Text="Complemento"></asp:Label><br />
						    <asp:TextBox CssClass="campo2" id="txtComplemento" maxlength="20" runat="server" Width="102px"></asp:TextBox>
					    </td>
                    </tr>
                </table>
                <table>
				    <tr>
					    <td>
                            <asp:Label ID="Label9" runat="server" Text="Bairro"></asp:Label><br />
						    <asp:TextBox CssClass="campo2" id="txtBairro" maxlength="25" runat="server"></asp:TextBox>
					    </td>
                            <td class="auto-style5">
                            <asp:Label ID="lblCidade" runat="server" Text="Cidade"></asp:Label>
                            <asp:RequiredFieldValidator
                                ID="reqCidade" runat="server" 
                                ControlToValidate="txtCidade"
                                ErrorMessage=" • Cidade "
                                Display="Dynamic"
                                ForeColor="red"
                                Text=" * "
                            ></asp:RequiredFieldValidator>    
                            <br />
						    <asp:TextBox CssClass="campo2" id="txtCidade" maxlength="70" runat="server" Width="212px"></asp:TextBox>
					    </td>
                        <td class="auto-style5">
                            <asp:Label ID="lblUnidadeFederativa" runat="server" Text="UF"></asp:Label>
                            <asp:RequiredFieldValidator
                                ID="reqUnidadeFederativa" runat="server" 
                                ControlToValidate="txtUnidadeFederativa"
                                ErrorMessage=" • Unidade Federativa (UF) "
                                Display="Dynamic"
                                ForeColor="red"
                                Text=" * "
                            ></asp:RequiredFieldValidator>
                            <br />
						    <asp:TextBox CssClass="campo2" id="txtUnidadeFederativa" maxlength="70" runat="server" Width="76px"></asp:TextBox>
					    </td>
					    <td>
                            <asp:Label ID="lblCep" runat="server" Text="CEP"></asp:Label><br />
						    <asp:TextBox CssClass="campo2"
                                name="cep" onBlur="ValidaCep(cep);" 
                                onKeyPress="MascaraCep(cep);" id="txtCep" 
                                maxlength="9" runat="server">
						    </asp:TextBox>
					    </td>
                        <td class="auto-style6">
                            <asp:Label ID="lblNacionalidade" runat="server" Text="Nacionalidade"></asp:Label>
                            <asp:RequiredFieldValidator
                                ID="reqNacionalidade" runat="server" 
                                ControlToValidate="txtNacionalidade"
                                ErrorMessage=" • Nacionalidade "
                                Display="Dynamic"
                                ForeColor="red"
                                Text=" * "
                            ></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox CssClass="campo2" ID="txtNacionalidade" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>  						
			    <table>
                    <tr>
					    <td class="auto-style5">
                            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label><br />
						    <asp:TextBox CssClass="campo2" id="txtEmail" maxlength="45" runat="server" Width="283px" TextMode="Email"></asp:TextBox>
					    </td> 
					    <td>
                            <asp:Label ID="lblTelefone" runat="server" Text="Telefone"></asp:Label><br />
						    <asp:TextBox CssClass="campo2" id="txtTelefone" maxlength="10" runat="server" TextMode="Phone"></asp:TextBox>
					    </td>
                        <td>
                            <asp:Label ID="lblCelular" runat="server" Text="Celular"></asp:Label><br />
						    <strong>
						    <asp:TextBox CssClass="campo2" id="txtCelular" maxlength="11" runat="server"></asp:TextBox>
					        </strong>
					    </td>
                        <td>
                            <asp:Label ID="lblTipoZona" runat="server" Text="Tipo de Zona"></asp:Label><br />
						    <asp:DropDownList ID="ddTipoZona" runat="server">
                                <asp:ListItem Value="0"> Selecione... </asp:ListItem>
                                <asp:ListItem Value="Rural"> Rural </asp:ListItem>
                                <asp:ListItem Value="Urbana"> Urbana </asp:ListItem>
                            </asp:DropDownList>
					    </td>
				    </tr>
			    </table>
			    <hr/>
			    <table>
				    <tr>
					    <td>
                            <asp:Button CssClass="botao_azul" ID="btnIncluir" runat="server" Text="Incluir" Width="148px" OnClick="btnIncluir_Click"/>
					    </td>
				    </tr>
			    </table>
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:ValidationSummary
                                ID="validaCadPaciente"
                                DisplayMode="List" 
                                EnableClientScript="true"
                                ForeColor="DarkBlue"
                                HeaderText="Campo(s) obrigatório(s): "
                                runat="server"
                            />
                        </td>
                    </tr>
                </table>
		    </fieldset>
	    </div>
    </div>
</body>
</html>
</asp:Content>
