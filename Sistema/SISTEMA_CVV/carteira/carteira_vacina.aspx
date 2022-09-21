<%@ Page Title="Carteira Paciente | Carteira de Vacinação Virtual" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="carteira_vacina.aspx.cs" Inherits="SISTEMA_CVV.carteira_vacina" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html5>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html, charset=utf-8" />
	    <title></title>
        <link rel="stylesheet" media="print" type="text/css" href="../css/imprime.css"/>
    </head>
    <body>
		<div>
			<div style="width: 100%; position: relative">
				<fieldset>
					<legend class="legenda" align="left"><b>Consultar Vacinas Aplicadas</b></legend>
					<table>
						<tr>
							<td>
                                <asp:Label ID="lblSus" runat="server" Text="Cartão SUS"></asp:Label>
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
                                <asp:TextBox CssClass="campo2" MaxLength="16" placeholder="Cartão SUS" ID="txtCartaoSus" runat="server"></asp:TextBox>
                                <asp:Button CssClass="botao_azul" ID="btnBuscarPaciente" runat="server" Text="Consultar" OnClick="btnBuscarPaciente_Click" />
                                <asp:Button CssClass="botao_azul" ID="btnImprimir" runat="server" Text="Imprimir" OnClientClick="javascript:window.print();"/>
							</td>
						</tr>
                    </table>
                    <div runat="server" id="tabVacinas" class="conteudo">
                        <div id="print" class="conteudo">
                            <table>
						        <tr>
							        <td>
                                        <asp:Label ID="lblNome" runat="server" Text="Nome completo"></asp:Label><br />
                                        <asp:TextBox Width="100%" CssClass="campo2" ID="txtNomePaciente" runat="server" style="background-color: #d3d3d3;" ReadOnly="true" MaxLength="45"></asp:TextBox>
							        </td>
							        <td>
                                        <asp:Label ID="lblNascimento" runat="server" Text="Data de Nascimento"></asp:Label><br />
                                        <asp:TextBox CssClass="campo2" ID="txtDataNasc" runat="server" style="background-color: #d3d3d3;" Width="140px" ReadOnly="true" MaxLength="10"></asp:TextBox> 	
							        </td>
						        </tr>
                                <tr>
							        <td>
                                        <asp:Label ID="lblNomeMae" runat="server" Text="Nome da Mãe"></asp:Label><br />
                                        <asp:TextBox CssClass="campo2" ID="txtNomeMae" runat="server" style="background-color: #d3d3d3;" ReadOnly="true" size="70" MaxLength="45"></asp:TextBox>
							        </td>
                                </tr>
						        <tr>
							        <td>	
								        <b><label style="font-size: 18px; color: #11133f">Vacinas Aplicadas:</label></b>
							        </td>
						        </tr>
						    </table>
						    <table width="100%"> 
							    <tr>
                                    <asp:GridView ID="gvVacinas" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="teste" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="nome_unidadesaude" HeaderText="Unidade de Saúde" SortExpression="nome_unidadesaude" />
                                            <asp:BoundField DataField="nome_funcionario" HeaderText="Funcionário" SortExpression="nome_funcionario" />
                                            <asp:BoundField DataField="coren" HeaderText="Coren" SortExpression="coren" />
                                            <asp:BoundField DataField="matricula" HeaderText="Matrícula Func." SortExpression="matricula" />
                                            <asp:BoundField DataField="nome_vacina" HeaderText="Vacina" SortExpression="nome_vacina" />
                                            <asp:BoundField DataField="lote_vacina" HeaderText="Lote" SortExpression="dose" />
                                            <asp:BoundField DataField="dose" HeaderText="Dose" SortExpression="dose" />
                                            <asp:BoundField DataField="data_aplicacao" HeaderText="Data da Aplicaçao" SortExpression="data_aplicacao" DataFormatString="{0:dd/MM/yyyy}"/>
                                            <asp:BoundField DataField="proxima_aplicacao" HeaderText="Próxima Aplicação" SortExpression="proxima_aplicacao" DataFormatString="{0:dd/MM/yyyy}"/>
                                        </Columns>
                                        <EditRowStyle BackColor="#7C6F57" />
                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                        <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#E3EAEB" HorizontalAlign="Left" />
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    </asp:GridView>
							        <asp:SqlDataSource ID="teste" runat="server" ConnectionString="<%$ ConnectionStrings:StringdeConexao %>" 
                                        SelectCommand="SELECT us.nome_unidadesaude, f.nome_funcionario, f.coren, f.matricula, p.nome_paciente, p.cartao_sus, v.nome_vacina, c.dose, c.proxima_aplicacao, c.data_aplicacao, c.lote_vacina FROM t_carteira AS c INNER JOIN t_vacina AS v ON c.fk_id_vacina = v.id_vacina INNER JOIN t_paciente AS p ON c.fk_cartao_sus = p.cartao_sus INNER JOIN t_funcionario AS f ON c.fk_coren = f.coren INNER JOIN t_unidadesaude AS us ON c.fk_id_unidadesaude = us.id_unidadesaude WHERE (p.cartao_sus = @CartaoSUS)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtCartaoSus" Name="CartaoSUS" PropertyName="Text" />
                                        </SelectParameters>
							        </asp:SqlDataSource>
							    </tr>
						    </table>
                        </div>
                    </div>
				</fieldset>
			</div>
		</div>
    </body>
</html>
</asp:Content>
