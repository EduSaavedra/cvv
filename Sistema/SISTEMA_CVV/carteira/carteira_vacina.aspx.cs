using SISTEMA_CVV;
using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV
{
    public partial class carteira_vacina : System.Web.UI.Page
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
                oCarteira = new c_CarteiraVacinacao();
                LimpaCampos();
            }
        }

        protected void btnBuscarPaciente_Click(object sender, EventArgs e)
        {
            oCarteira.ConsultarPaciente(txtCartaoSus.Text);
            if (oCarteira.ConsultaBanco)
            {
                txtNomePaciente.Text = oCarteira.NomePaciente;
                txtDataNasc.Text = (Convert.ToDateTime(oCarteira.DataNascimento).ToShortDateString()).ToString();
                txtNomeMae.Text = oCarteira.NomeMaePaciente;
                oCarteira.CartaoSus = txtCartaoSus.Text;
                gvVacinas.DataBind();
                tabVacinas.Visible = true;
                btnImprimir.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Paciente não econtrado.');</script>");
                LimpaCampos();
            }
        }

        public void LimpaCampos()
        {
            txtCartaoSus.Focus();
            txtCartaoSus.Text = "";
            txtDataNasc.Text = "";
            txtNomeMae.Text = "";
            txtNomePaciente.Text = "";
            tabVacinas.Visible = false;
            btnImprimir.Visible = false;
        }

        protected void txtNomeMae_TextChanged(object sender, EventArgs e)
        {

        }
    }
}