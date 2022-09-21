using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV.funcionario
{
    public partial class consulta : System.Web.UI.Page
    {
        public c_Funcionario oFuncionario
        {
            get
            {
                return Session["func"] as c_Funcionario;
            }
            set
            {
                Session["func"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) /*primeira vez q a pagina abre dai ele instancia o objeto abaixo*/
            {
                oFuncionario = new c_Funcionario();
                divDados.Visible = false;
                btnLimparCampos.Visible = false;
                txtCoren.Focus();
            }
        }

        public void limpaCampos()
        {
            txtMatricula.Text = "";
            txtNome.Text = "";
            txtCPF.Text = "";
            txtDataNascimeto.Text = "";
            txtCategoria.Text = "";
            txtComplemento.Text = "";
            txtEmail.Text = "";
            txtEndereco.Text = "";
            txtEstado.Text = "";
            txtNumero.Text = "";
            txtStatus.Text = "";
            txtTipoAcesso.Text = "";
            txtUnidadeAtuacao.Text = "";
            divDados.Visible = false;
            btnLimparCampos.Visible = false;
            txtCoren.Focus();
        }

        public void btnBuscar_Click(object sender, EventArgs e)
        {
            oFuncionario.ConsultarFuncionario(txtCoren.Text);
            if (txtCoren.Text != "")
            {
                if (oFuncionario.retorno)
                {
                    txtMatricula.Text = oFuncionario.Matricula;
                    txtNome.Text = oFuncionario.NomeFuncionario;
                    txtCPF.Text = oFuncionario.Cpf;
                    txtDataNascimeto.Text = (Convert.ToDateTime(oFuncionario.DataNascimento).ToShortDateString()).ToString();
                    txtCategoria.Text = oFuncionario.CategoriaFuncionario;
                    txtComplemento.Text = oFuncionario.Complemento;
                    txtEmail.Text = oFuncionario.EmailFuncionario;
                    txtEndereco.Text = oFuncionario.Endereco;
                    txtEstado.Text = oFuncionario.EstadoAtuacao;
                    txtNumero.Text = oFuncionario.Numero;
                    txtStatus.Text = oFuncionario.StatusFuncionario;
                    txtTipoAcesso.Text = oFuncionario.TipoAcesso;
                    txtUnidadeAtuacao.Text = oFuncionario.NomeUnidadeSaude;
                    btnLimparCampos.Visible = true;
                    divDados.Visible = true;
                }
                else
                {
                    limpaCampos();
                    Response.Write("<script>alert('Funcionário não encontrado.');</script>");
                    divDados.Visible = false;
                    btnLimparCampos.Visible = false;
                }
            }
            else
            {
                Response.Write("<script>alert('Favor preencher o campo COREN.');</script>");
                divDados.Visible = false;
                btnLimparCampos.Visible = false;
                txtCoren.Focus();
            }
        }

        protected void btnLimparCampos_Click(object sender, EventArgs e)
        {
            limpaCampos();
        }
    }
}