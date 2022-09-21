using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV.unidades_saude
{
    public partial class incluir_unidade : System.Web.UI.Page
    {
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
                //CarregarDropDownListEstado();
                carregaListaUnidades();
            }
        }

        public void limpaCampos()
        {
            txtEndereco.Text = "";
            txtNomeUnidade.Text = "";
            txtNumero.Text = "";
            txtNomeUnidade.Text = "";
            txtCidade.Text = "";
            txtEstado.Text = "";
            txtBairro.Text = "";
            txtCep.Text = "";
            txtEndereco.Text = "";
            txtNumero.Text = "";
        }

        protected void btnIncluir_Click(object sender, EventArgs e)
        {
            oUnidade.NomeUnidade = txtNomeUnidade.Text;
            oUnidade.TipoUnidade = ddTipoUnidade.SelectedValue;
            oUnidade.Estado = txtEstado.Text;
            oUnidade.Cep = txtCep.Text;
            oUnidade.Endereco = txtEndereco.Text;
            oUnidade.Numero = txtNumero.Text;
            oUnidade.Bairro = (txtBairro.Text);
            oUnidade.Cidade = txtCidade.Text;

            if (Int32.Parse(txtNumero.Text) >= 0)
            {
                //oUnidade.incluirUnidade(txtNomeUnidade.Text);
                if (oUnidade.Gravacao)
                {
                    Response.Write("<script>alert('Unidade de Saúde inserida com sucesso.');</script>");
                    limpaCampos();
                }
                else
                {
                    Response.Write("<script>alert('Unidade de Saúde já existe. Favor informar outra.');</script>");
                    txtNomeUnidade.Focus();
                }
            }
            else
            {
                Response.Write("<script>alert('Número de endereço inválido.');</script>");
                txtNumero.Focus();
            }

        }

        protected void validaCEP(object sender, EventArgs e)
        {
            var valor = txtCep.Text;
            try
            {
                var ws = new WSCorreios.AtendeClienteClient();
                var resposta = ws.consultaCEP(valor);
                txtEstado.Text = resposta.uf;
                txtCidade.Text = resposta.cidade;
                txtEndereco.Text = resposta.end;
                txtBairro.Text = resposta.bairro;
                txtNumero.Focus();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Erro ao tentar efetuar a busca: " + ex.Message + "');</script");
                txtCep.Focus();
            }

        }

        private void carregaListaUnidades()
        {
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

        protected void cbSemNumero_CheckedChanged(object sender, EventArgs e)
        {
            if (cbSemNumero.Checked)
            {
                lblNumero.Visible = false;
                txtNumero.Visible = false;
                txtNumero.Text = "0";
            }
            else
            {
                lblNumero.Visible = true;
                txtNumero.Visible = true;
                txtNumero.Text = "";
            }
        }

        /*
private void CarregarDropDownListEstado()
{
string strInstrucao = "select id_estado, sigla from t_estados";
using (SqlConnection objConexao = new SqlConnection(ConfigurationManager.ConnectionStrings["StringdeConexao"].ConnectionString))
{
using (SqlCommand objCommand = new SqlCommand(strInstrucao, objConexao))
{
  objConexao.Open();
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
string strInstrucao = "select id_cidade, cidade from t_cidades where id_estado = @IdEstado";
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

protected void ddEstado_SelectedIndexChanged(object sender, EventArgs e)
{
if (!String.IsNullOrEmpty(ddEstado.SelectedValue))
{
CarregarDropDownListCidade(int.Parse(ddEstado.SelectedValue));
}
}*/
    }
}