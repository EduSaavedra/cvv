<%@ Page Title="Sobre | Carteira de Vacinação Virtual" Language="C#" MasterPageFile="~/mpageMenu.Master" AutoEventWireup="true" CodeBehind="sobre.aspx.cs" Inherits="SISTEMA_CVV.sobre1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="left">
	    <br />
	    <form>
		    <div style="width: 100%; position: relative">
			    <fieldset>
				    <legend class="legenda" align="left"><b> Sobre a Carteira de Vacinação Virtual </b></legend>
                    <div align="center">
                        <asp:Image runat="server" Width="140px" ImageUrl="img/logo2.gif" ImageAlign="Middle" />
                    </div>
				    <label>
				        <br />
                            <span>
                                Trabalho de conclusão de curso apresentado ao curso de Sistemas de 
				                Informação da Universidade de Mogi das Cruzes Campus Villa Lobos 
				                como parte dos requisitos para obtenção do grau de Bacharel em 
				                Sistemas de Informação. 
                            </span>
				        <br />
                        <br />
                    </label>
				    <table>
					    <tr>
						    <td align="center">
							    <font size="4px">Downloads</font>
						    </td>
					    </tr>
				    </table>
				    <br />
				    <table width="100%">
					    <tr>
						    <td>
                                <a href="../TCC_FInal_2017.pdf" target="_blank">
                                    <asp:Image ImageUrl="img/pdf-icon.png" ImageAlign="AbsMiddle" Width="50px" runat="server" />
                                    <asp:Label Text=" Documentação do TCC | Versão 2017 (Final) " ForeColor="black" Font-Bold="true" Font-Underline="false" runat="server" />
                                </a>
						    </td>
						    <td>
							    <a href="../manual_procedimentos_vacinacao.pdf" target="_blank">
                                    <asp:Image ImageUrl="img/pdf-icon.png" ImageAlign="AbsMiddle" Width="50px" runat="server" />
                                    <asp:Label Text=" Procedimentos de Vacinação " ForeColor="black" Font-Bold="true" Font-Underline="false" runat="server" />
							    </a>
						    </td>
						    <td align="center">
							    <a href="../salavac_treinando_textos11_20.pdf" target="_blank">
                                    <asp:Image ImageUrl="img/pdf-icon.png" ImageAlign="AbsMiddle" Width="50px" runat="server" />
                                    <asp:Label Text=" Administração dos Imunobiológicos " ForeColor="black" Font-Bold="true" Font-Underline="false" runat="server" />
							    </a>
						    </td>
					    </tr>
				    </table>
                    <br />
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:GridView ID="gvModificacoes" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="id_modificacao" HeaderText="ID Modificação" HeaderStyle-HorizontalAlign="Left" /> 
                                        <asp:BoundField DataField="num_versao" HeaderText="Número da Versão" HeaderStyle-HorizontalAlign="Left" /> 
                                        <asp:BoundField DataField="modificacoes" HeaderText="Descrição" HeaderStyle-HorizontalAlign="Left" /> 
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <hr />
                    <div style="background-color: whitesmoke;" align="center">
                        <br />
				        <table style="align-content: center; align-items: center">
					        <tr>
						        <td>
                                    <asp:Label ID="lblMarcelo" ForeColor="Darkred" runat="server" Text="MARCELO LEITE DE OLIVEIRA " Font-Bold="True" Font-Names="Arial" Font-Size="12pt"></asp:Label> 
						        </td>
						        <td>
                                    <asp:Label ID="lblPipe1" runat="server" ForeColor="Darkred" Text="|" Font-Bold="True" Font-Names="Arial" Font-Size="12pt"></asp:Label> 
						        </td>
						        <td>
                                    <asp:Label ID="lblRAMarcelo" runat="server" ForeColor="Darkred" Text="12132100786" Font-Bold="True" Font-Names="Arial" Font-Size="12pt"></asp:Label> 
						        </td>
                            </tr>
					        <tr>
						        <td>
                                    <asp:Label ID="lblMarcos" runat="server" ForeColor="Darkred" Text="MARCOS EDUARDO SAAVEDRA COSMO " Font-Bold="True" Font-Names="Arial" Font-Size="12pt"></asp:Label> 
						        </td>
						        <td>
                                    <asp:Label ID="lblPipe2" runat="server" ForeColor="Darkred" Text="|" Font-Bold="True" Font-Names="Arial" Font-Size="12pt"></asp:Label> 
						        </td>
						        <td>
                                    <asp:Label ID="lblRAMarcos" runat="server" ForeColor="Darkred" Text="12151502133" Font-Bold="True" Font-Names="Arial" Font-Size="12pt"></asp:Label> 
						        </td>
                            </tr>
				        </table>
                        <br />
                    </div>
				    <hr/>
				    <div align="center">
                        <br />
                        <span>
                            Universidade de Mogi das Cruzes<br />
					        Campus Villa Lobos - Lapa<br />
					        São Paulo | 2016<br />				
                        </span>	
				    </div>
			    </fieldset>
		    </div>
		</form>
    </div>
</asp:Content>
