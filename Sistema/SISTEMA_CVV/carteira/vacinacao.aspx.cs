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

namespace SISTEMA_CVV.carteira
{
    public partial class vacinacao : System.Web.UI.Page
    {
        public c_CarteiraVacinacao oCarteira
        {
            get
            {
                return Session["carteira"] as c_CarteiraVacinacao;
            }
            set
            {
                Session["carteira"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnLimparCampos.Visible = false;
                txtCartaoSus.Focus();
                EscondeCampos();
                EscondeMesAno();
                oCarteira = new c_CarteiraVacinacao();
            }
        }

        public void EscondeCampos()
        {
            tabelaDados.Visible = false;
        }

        public void MostraCampos()
        {
            txtCartaoSus.Focus();
            tabelaDados.Visible = true;
        }

        public void EscondeMesAno()
        {
            lblIntervalo.Visible = false;
            ddIntervalo.Visible = false;
            ddProximaAplicacaoAno.Visible = false;
            ddProximaAplicacaoMes.Visible = false;
            lblProximaAplicacao.Visible = false;
        }

        public void LimpaCampos()
        {
            EscondeCampos();
            txtCartaoSus.Focus();
            txtCartaoSus.Text = "";
            txtCoren.Text = "";
            txtResponsavel.Text = "";
            txtNomePaciente.Text = "";
            txtDataNasc.Text = "";
            ddDose.SelectedIndex = 0;
            txtLote.Text = "";
            ddProximaAplicacaoAno.SelectedValue = "0";
            ddProximaAplicacaoMes.SelectedValue = "0";
            btnLimparCampos.Visible = false;
        }

        protected void ddDose_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((ddDose.SelectedValue == "Selecione") || (ddDose.SelectedValue == "Única"))
            {
                EscondeMesAno();
                ddIntervalo.SelectedIndex = 0;
                ddProximaAplicacaoAno.SelectedIndex = 0;
                ddProximaAplicacaoMes.SelectedIndex = 0;
            }
            else
            {
                lblIntervalo.Visible = true;
                ddIntervalo.Visible = true;
            }
        }

        protected void btnAplicarVacina_Click(object sender, EventArgs e)
        {
            if (ddProximaAplicacaoAno.SelectedIndex > 0)
            {
                oCarteira.Intervalo = "YEAR";
                oCarteira.ProximaAplicacao = ddProximaAplicacaoAno.SelectedValue;
            }
            else if (ddProximaAplicacaoMes.SelectedIndex > 0)
            {
                oCarteira.Intervalo = "MONTH";
                oCarteira.ProximaAplicacao = ddProximaAplicacaoMes.SelectedValue;
            }
            else if (ddDose.SelectedValue == "Única")
            {
                oCarteira.Intervalo = "YEAR";
                oCarteira.ProximaAplicacao = "0";
            }
            oCarteira.Dose = ddDose.Text;
            oCarteira.Lote = txtLote.Text;
            oCarteira.CartaoSus = txtCartaoSus.Text;
            oCarteira.Coren = Convert.ToString(((c_Login)Session["login"]).Coren);
            oCarteira.IdVacina = Convert.ToInt32(ddVacinas.Text);
            oCarteira.UnidadeSaude = Convert.ToString(((c_Login)Session["login"]).UnidadeSaude);
            oCarteira.AplicarVacina();

            if (oCarteira.Gravacao && oCarteira.verificadorStatusPaciente)
            {
                Response.Write("<script>alert('Vacina aplicada com sucesso.');</script>");
                LimpaCampos();
            }
            else
            {
                Response.Write("<script>alert('Não foi possível aplicar a vacina. Entre em contato com o suporte através do e-mail vacinacaovirtual@outlook.com');</script>");
                btnLimparCampos.Visible = false;
                txtCartaoSus.Focus();
                LimpaCampos();
                EscondeCampos();
                EscondeMesAno();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            oCarteira.ConsultarPaciente(txtCartaoSus.Text);
            CarregaDropDownListVacinas();

            if (oCarteira.ConsultaBanco && oCarteira.verificadorStatusPaciente)
            {
                txtNomePaciente.Text = oCarteira.NomePaciente;
                txtDataNasc.Text = (Convert.ToDateTime(oCarteira.DataNascimento).ToShortDateString()).ToString();
                txtCoren.Text = Convert.ToString(((c_Login)Session["login"]).Coren);
                txtResponsavel.Text = Convert.ToString(((c_Login)Session["login"]).NomeFuncionario);
                MostraCampos();
            }
            else if (!oCarteira.ConsultaBanco)
            {
                Response.Write("<script>alert('Paciente não encontrado.');</script>");
                LimpaCampos();
                EscondeCampos();
            }
            else if (!oCarteira.verificadorStatusPaciente)
            {
                Response.Write("<script>alert('Paciente inativo. Não é permitido o registro de vacinação em pacientes inativos.');</script>");
                LimpaCampos();
                EscondeCampos();
            }
        }

        protected void ddIntervalo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddIntervalo.SelectedIndex == 0)
            {
                lblProximaAplicacao.Visible = false;
                ddProximaAplicacaoMes.Visible = false;
                ddProximaAplicacaoMes.SelectedValue = "0";
                ddProximaAplicacaoAno.Visible = false;
                ddProximaAplicacaoAno.SelectedValue = "0";
            }
            else if (ddIntervalo.SelectedIndex == 1)
            {
                ddProximaAplicacaoMes.SelectedValue = "0";
                ddProximaAplicacaoAno.SelectedValue = "0";
                lblProximaAplicacao.Visible = true;
                ddProximaAplicacaoMes.Visible = false;
                ddProximaAplicacaoAno.Visible = true;
            }
            else if (ddIntervalo.SelectedIndex == 2)
            {
                ddProximaAplicacaoMes.SelectedValue = "0";
                ddProximaAplicacaoAno.SelectedValue = "0";
                lblProximaAplicacao.Visible = true;
                ddProximaAplicacaoAno.Visible = false;
                ddProximaAplicacaoMes.Visible = true;
            }
        }

        private void CarregaDropDownListVacinas()
        {
            string strInstrucao = "select id_vacina, nome_vacina from t_vacina";
            using (SqlConnection objConexao = new SqlConnection(ConfigurationManager.ConnectionStrings["StringdeConexao"].ConnectionString))
            {
                using (SqlCommand objCommand = new SqlCommand(strInstrucao, objConexao))
                {
                    objConexao.Open();
                    try
                    {
                        SqlDataReader objDataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                        ddVacinas.DataSource = objDataReader;
                        ddVacinas.DataTextField = "nome_vacina";
                        ddVacinas.DataValueField = "id_vacina";
                        ddVacinas.DataBind();
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

        protected void btnLimparCampos_Click(object sender, EventArgs e)
        {
            btnLimparCampos.Visible = false;
            txtCartaoSus.Focus();
            LimpaCampos();
            EscondeCampos();
            EscondeMesAno();
        }
    }
}