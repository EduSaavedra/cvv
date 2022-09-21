<%@ Page Title="Vacinação | Carteira de Vacinação Virtual" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="vacinacao.aspx.cs" Inherits="SISTEMA_CVV.carteira.vacinacao" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
	<div style="width: 100%; position: relative">
		<fieldset>
			<legend class="legenda" align="left"><b>Aplicar Vacina</b></legend>
			<table>
				<tr>
					<td style="width: 602px">
                        <asp:Label Text="Cartão SUS" ID="lblCartaoSUS" runat="server" />
                        <asp:RegularExpressionValidator
                            ID="revCartaoSUS" runat="server" 
                            ErrorMessage="* Favor inserir apenas números." 
                            SetFocusOnError="True" ControlToValidate="txtCartaoSus" 
                            Display="Dynamic" ForeColor="Red"
                            ValidationExpression="^[0-9]+"
                        ></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator 
                            ID="rfvCartaoSus"
                            runat="server" 
                            ErrorMessage="* Campo obrigatório"
                            ControlToValidate="txtCartaoSus"
                            ForeColor="Red"
                        ></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox CssClass="campo2" placeholder="Cartão SUS" ID="txtCartaoSus" MaxLength="16" runat="server" Width="180px"></asp:TextBox>
						<asp:Button CssClass="botao_azul" ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click"/>
                        <asp:Button CssClass="botao_azul" ID="btnLimparCampos" runat="server" Text="Limpar Campos" OnClick="btnLimparCampos_Click" />
					</td>
				</tr>
            </table>
            <div id="tabelaDados" visible="false" runat="server">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblCoren" runat="server" Text="Coren"></asp:Label><br />
                            <asp:TextBox CssClass="campo2" ID="txtCoren" runat="server" BackColor="#e6e6e6" ReadOnly="True" MaxLength="12"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblResponsavel" runat="server" Text="Responsável"></asp:Label><br />
                            <asp:TextBox CssClass="campo2" ID="txtResponsavel" runat="server" ReadOnly="True" BackColor="#e6e6e6" Width="420px" MaxLength="45"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table>
				    <tr>
					    <td>
                            <asp:Label ID="lblNomePaciente" runat="server" Text="Nome do Paciente"></asp:Label><br />
                            <asp:TextBox CssClass="campo2" ID="txtNomePaciente" runat="server" BackColor="#e6e6e6" ReadOnly="True" Width="560px" MaxLength="45"></asp:TextBox>
					    </td>
                        <td>
                            <asp:Label ID="lblDataNascimento" runat="server" Text="Data de Nascimento"></asp:Label><br />
                            <asp:TextBox CssClass="campo2" ID="txtDataNasc" runat="server" BackColor="#e6e6e6" ReadOnly="True" Width="120px" MaxLength="10"></asp:TextBox>
                        </td>
				    </tr>
			    </table>
			    <table>
                    <tr>
					    <td>
                            <asp:Label ID="lblVacina" runat="server" Text="Vacina"></asp:Label>
                            <asp:RequiredFieldValidator 
                                ID="rfvVacina" 
                                runat="server" 
                                ErrorMessage=" * "
                                ControlToValidate="ddVacinas"
                                ForeColor="Red"
                                InitialValue="0"
                            ></asp:RequiredFieldValidator>
                            <br />
                            <asp:DropDownList ID="ddVacinas" AppendDataBoundItems="True" runat="server">
                                <asp:ListItem Value="0">Selecione...</asp:ListItem>
                            </asp:DropDownList>
					    </td>
					    <td>
                            <asp:Label ID="lblLote" runat="server" Text="Lote"></asp:Label>
                            <asp:RequiredFieldValidator 
                                ID="rfvLote"
                                runat="server" 
                                ErrorMessage=" * "
                                ControlToValidate="txtLote"
                                ForeColor="Red"
                            ></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtLote" CssClass="campo2" runat="server"></asp:TextBox>
					    </td>
					    <td>
                            <asp:Label ID="lblDose" runat="server" Text="Dose"></asp:Label>
                            <asp:RequiredFieldValidator 
                                ID="rfvDose" 
                                runat="server" 
                                ErrorMessage=" * "
                                ControlToValidate="ddDose"
                                ForeColor="Red"
                                InitialValue="Selecione"
                            ></asp:RequiredFieldValidator>
                            <br />
                            <asp:DropDownList ID="ddDose" OnSelectedIndexChanged="ddDose_SelectedIndexChanged" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="Selecione"> Selecione... </asp:ListItem>
                                <asp:ListIteM Value="Única"> Unica </asp:ListIteM>
                                <asp:ListItem Value="Primeira"> Primeira Dose </asp:ListItem>
                                <asp:ListItem Value="Segunda"> Segunda Dose </asp:ListItem>
                                <asp:ListItem Value="Terceira"> Terceira Dose </asp:ListItem>
                            </asp:DropDownList>
					    </td>
                        <td>
                            <asp:Label ID="lblIntervalo" runat="server" Text="Intervalo"></asp:Label>
                            <asp:RequiredFieldValidator 
                                ID="rfvIntervalo" 
                                runat="server" 
                                ErrorMessage=" * "
                                ControlToValidate="ddIntervalo"
                                ForeColor="Red"
                                InitialValue="0"
                            ></asp:RequiredFieldValidator>
                            <br />
                            <asp:DropDownList ID="ddIntervalo" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddIntervalo_SelectedIndexChanged">
                                <asp:ListItem Value="0"> Selecione... </asp:ListItem>
                                <asp:ListItem Value="1"> Anos </asp:ListItem>
                                <asp:ListItem Value="2"> Meses </asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="lblProximaAplicacao" Visible="false" runat="server" Text="Proxima Aplicacao"></asp:Label>
                            <asp:RequiredFieldValidator 
                                ID="rfvProximaAplicacaoMes" 
                                runat="server" 
                                ErrorMessage=" * "
                                ControlToValidate="ddProximaAplicacaoMes"
                                ForeColor="Red"
                                InitialValue="0"
                            ></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator 
                                ID="rfvProximaAplicacaoAno" 
                                runat="server" 
                                ErrorMessage=" * "
                                ControlToValidate="ddProximaAplicacaoAno"
                                ForeColor="Red"
                                InitialValue="0"
                            ></asp:RequiredFieldValidator>
                            <br />
                            <asp:DropDownList ID="ddProximaAplicacaoMes" Visible="false" AutoPostBack="true" runat="server">
                                <asp:ListItem Value="0"> Selecione... </asp:ListItem>
                                <asp:ListItem Value="1"> 1 Mês </asp:ListItem>
                                <asp:ListItem Value="2"> 2 Mêses </asp:ListItem>
                                <asp:ListItem Value="3"> 3 Mêses </asp:ListItem>
                                <asp:ListItem Value="4"> 4 Mêses </asp:ListItem>
                                <asp:ListItem Value="5"> 5 Mêses </asp:ListItem>
                                <asp:ListItem Value="6"> 6 Mêses </asp:ListItem>
                                <asp:ListItem Value="7"> 7 Mêses </asp:ListItem>
                                <asp:ListItem Value="8"> 8 Mêses </asp:ListItem>
                                <asp:ListItem Value="9"> 9 Mêses </asp:ListItem>
                                <asp:ListItem Value="10"> 10 Mêses </asp:ListItem>
                                <asp:ListItem Value="11"> 11 Mêses </asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddProximaAplicacaoAno" Visible="false" AutoPostBack="true" runat="server">
                                <asp:ListItem Value="0"> Selecione... </asp:ListItem>
                                <asp:ListItem Value="1"> 1 Ano </asp:ListItem>
                                <asp:ListItem Value="2"> 2 Anos </asp:ListItem>
                                <asp:ListItem Value="3"> 3 Anos</asp:ListItem>
                                <asp:ListItem Value="4"> 4 Anos </asp:ListItem>
                                <asp:ListItem Value="5"> 5 Anos </asp:ListItem>
                                <asp:ListItem Value="6"> 6 Anos </asp:ListItem>
                                <asp:ListItem Value="7"> 7 Anos </asp:ListItem>
                                <asp:ListItem Value="8"> 8 Anos </asp:ListItem>
                                <asp:ListItem Value="9"> 9 Anos </asp:ListItem>
                                <asp:ListItem Value="10"> 10 Anos </asp:ListItem>
                            </asp:DropDownList>
                        </td>
				    </tr>
			    </table>
			    <hr/>
			    <table>
				    <tr>
					    <td>
                            <asp:Button CssClass="botao_azul" ID="btnAplicarVacina" runat="server" Text="Aplicar Vacina" OnClick="btnAplicarVacina_Click"/>
					    </td>
				    </tr>
			    </table>
            </div>
		</fieldset>
	</div>
</body>
</html>
</asp:Content>
