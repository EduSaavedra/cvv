using SISTEMA_CVV.modelos;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SISTEMA_CVV.unidades_saude
{
    public partial class consultar_unidade : System.Web.UI.Page
    {
        
        private string QueryBuscaUnidades = "SELECT nome_unidadesaude, cidade, cep, endereco, numero, bairro, estado, tipo_unidade, telefone FROM t_unidadesaude";

        public c_UnidadeSaude oUnidade
        {
            get
            {
                return Session["unidade"] as c_UnidadeSaude;
            }
            set
            {
                Session["unidade"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                oUnidade = new c_UnidadeSaude();
                CarregarDropDownListEstado();
                carregaListaUnidades();
                gvUnidades.DataBind();
                ddTipoUnidade.Visible = false;
                lblTipoUnidade.Visible = false;
                lblCidade.Visible = false;
                ddCidade.Visible = false;
            }
        }

        private void CarregarDropDownListEstado()
        {
            string strInstrucao = "select id_estado, sigla from t_estados";
            using (SqlConnection objConexao = new SqlConnection(ConfigurationManager.ConnectionStrings["StringdeConexao"].ConnectionString))
            {
                using (SqlCommand objCommand = new SqlCommand(strInstrucao, objConexao))
                {
                    if (objConexao.Close())
                    {
                        objConexao.Open();
                    }

                    try
                    {
                        SqlDataReader objDataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                        ddEstado.DataSource = objDataReader;
                        ddEstado.DataTextField = "sigla";
                        ddEstado.DataValueField = "id_estado";
                        ddEstado.DataBind();
                        objDataReader.Close();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    objConexao.Close();
                }
            }
        }

        private void CarregarDropDownListCidade(int IdEstado)
        {
            string strInstrucao = "select id_cidade, cidade from t_cidades where id_cidade = '0' or id_estado = @IdEstado";
            using (SqlConnection objConexao = new SqlConnection(ConfigurationManager.ConnectionStrings["StringdeConexao"].ConnectionString))
            {
                using (SqlCommand objCommand = new SqlCommand(strInstrucao, objConexao))
                {
                    if (IdEstado > 0)
                    {
                        objCommand.Parameters.AddWithValue("@IdEstado", IdEstado);
                        objConexao.Open();
                        try

                        {
                            SqlDataReader objDataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                            ddCidade.DataSource = objDataReader;
                            ddCidade.DataTextField = "cidade";
                            ddCidade.DataValueField = "id_cidade";
                            ddCidade.DataBind();
                            objDataReader.Close();
                        }
                        catch (Exception ex)
                        {
                            throw new Exception(ex.Message);
                        }
                        objConexao.Close();
                    }
                }
            }
        }
        
        private void carregaListaUnidades()
        {
            //busca os tipos de unidade de saude------------------------------------

            string strInstrucao = "select iniciais, descricao from t_tipounidadesaude";

            using (SqlConnection objConexao = new SqlConnection(ConfigurationManager.ConnectionStrings["StringdeConexao"].ConnectionString))
            {
                using (SqlCommand objCommand = new SqlCommand(strInstrucao, objConexao))
                {
                    objConexao.Open();
                    try
                    {
                        SqlDataReader objDataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                        ddTipoUnidade.DataSource = objDataReader;
                        ddTipoUnidade.DataTextField = "descricao";
                        ddTipoUnidade.DataValueField = "iniciais";
                        ddTipoUnidade.DataBind();
                        objDataReader.Close();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    objConexao.Close();
                }
            }
        }

        protected void ddEstado_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if ((ddEstado.SelectedValue != "0"))
            {
                SqlDataSource1.SelectCommand = "SELECT nome_unidadesaude, cidade, cep, endereco, numero, bairro, estado, tipo_unidade, telefone FROM t_unidadesaude WHERE (estado = '" + ddEstado.SelectedItem + "') order by nome_unidadesaude;";
                gvUnidades.DataBind();
                ddCidade.Items.Clear();
                ddCidade.Items.Add("Todos...");
                CarregarDropDownListCidade(int.Parse(ddEstado.SelectedValue));
                lblCidade.Visible = true;
                ddCidade.Visible = true;
                verificaSelecao();
            }
            else if ((ddEstado.SelectedValue == "0"))
            {
                SqlDataSource1.SelectCommand = QueryBuscaUnidades;
                gvUnidades.DataBind();
                ddCidade.Items.Clear();
                ddCidade.Items.Add("Todos...");
                CarregarDropDownListCidade(int.Parse(ddEstado.SelectedValue));
                ddTipoUnidade.Visible = false;
                lblTipoUnidade.Visible = false;
                lblCidade.Visible = false;
                ddCidade.Visible = false;
                ddTipoUnidade.SelectedValue = "0";
            }
        }

        protected void ddCidade_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((Convert.ToInt32(ddCidade.SelectedIndex) != 0))
            {
                SqlDataSource1.SelectCommand = "SELECT nome_unidadesaude, cidade, cep, endereco, numero, bairro, estado, tipo_unidade, telefone FROM t_unidadesaude WHERE (estado = '" + ddEstado.SelectedItem + "') AND (cidade = '" + ddCidade.SelectedItem + "') order by bairro;";
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT nome_unidadesaude, cidade, cep, endereco, numero, bairro, estado, tipo_unidade, telefone FROM t_unidadesaude WHERE (estado = '" + ddEstado.SelectedItem + "') order by cidade;";
            }
            gvUnidades.DataBind();
            verificaSelecao();
        }

        public void verificaSelecao()
        {
            if ((Convert.ToInt32(ddEstado.SelectedIndex) > 0) & (Convert.ToInt32(ddCidade.SelectedIndex) > 0))
            {
                ddTipoUnidade.Visible = true;
                lblTipoUnidade.Visible = true;
            }
            else
            {
                ddTipoUnidade.ClearSelection();
                ddTipoUnidade.Visible = false;
                lblTipoUnidade.Visible = false;
            }
        }

        protected void ddTipoUnidade_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((Convert.ToInt32(ddTipoUnidade.SelectedIndex) != 0))
            {
                SqlDataSource1.SelectCommand = "SELECT nome_unidadesaude, cidade, cep, endereco, numero, bairro, estado, tipo_unidade, telefone FROM t_unidadesaude WHERE (estado = '" + ddEstado.SelectedItem + "') AND (cidade = '" + ddCidade.SelectedItem + "') AND (tipo_unidade = '" + ddTipoUnidade.SelectedValue + "') order by bairro;";
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT nome_unidadesaude, cidade, cep, endereco, numero, bairro, estado, tipo_unidade, telefone FROM t_unidadesaude WHERE (estado = '" + ddEstado.SelectedItem + "') AND (cidade = '" + ddCidade.SelectedItem + "')  order by bairro;";
            }
            
        }
    }
}