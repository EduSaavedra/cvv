using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV.funcionario
{
    public partial class cadastrar_funcionario : System.Web.UI.Page
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

        public void LimpaCampos()
        {
            txtCategoria.Text = "";
            txtComplemento.Text = "";
            txtCoren.Text = "";
            txtCPF.Text = "";
            txtEmail.Text = "";
            txtEndereco.Text = "";
            ddEstadoAtuacao.SelectedValue = "";
            txtMatricula.Text = "";
            txtNome.Text = "";
            txtNumero.Text = "";
            ddTipoAcesso.Text = "";
            txtUnidade.Text = "";
            txtCEP.Text = "";
            txtDataNasc.Text = "";
            ddUnidadeAtuacao.SelectedValue = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                oFuncionario = new c_Funcionario();
            };
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            oFuncionario.NomeFuncionario = txtNome.Text;
            oFuncionario.CategoriaFuncionario = txtCategoria.Text;
            oFuncionario.Cpf = txtCPF.Text;
            oFuncionario.Complemento = txtComplemento.Text;
            oFuncionario.EmailFuncionario = txtEmail.Text;
            oFuncionario.Endereco = txtEndereco.Text;
            oFuncionario.EstadoAtuacao = ddEstadoAtuacao.SelectedValue ;
            oFuncionario.Matricula = txtMatricula.Text;
            oFuncionario.Numero = txtNumero.Text;
            oFuncionario.TipoAcesso = ddTipoAcesso.SelectedValue;
            //oFuncionario.IdUnidadeSaude = Convert.ToInt32(ddUnidadeAtuacao.SelectedValue);
            //oFuncionario.IncluirFuncionario(txtCoren.Text);

            if (oFuncionario.gravacao)
            {
                Response.Write("<script>alert('Funcionário cadastrado com sucesso.');</script>");
                LimpaCampos();
            }
            else
            {
                Response.Write("<script>alert('Erro ao tentar cadastrar o funcionário.');</script>");
                txtCoren.Focus();
            }
        }
    }
}