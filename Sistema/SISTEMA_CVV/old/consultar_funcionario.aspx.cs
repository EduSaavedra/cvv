using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV.funcionario
{
    public partial class consultar_funcionario : System.Web.UI.Page
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
            }
        }

        public void limpaCampos()
        {
            txtMatricula.Text = "";
            txtNome.Text = "";
            txtCPF.Text = "";
            txtCoren.Text = "";
            txtDataNascimeto.Text = "";
            txtCategoria.Text = "";
            txtComplemento.Text = "";
            txtEmail.Text = "";
            txtEndereco.Text = "";
            ddEstadoAtuacao.SelectedValue = "";
            txtNumero.Text = "";
            ddStatusFuncionario.SelectedValue = "";
            ddTipoAcesso.SelectedValue = "";
            ddUnidadeAtuacao.SelectedValue = "";
        }

        public void btnBuscar_Click(object sender, EventArgs e)
        {
            oFuncionario.ConsultarFuncionario(txtCoren.Text);
            txtMatricula.Text = oFuncionario.Matricula;
            txtNome.Text = oFuncionario.NomeFuncionario;
            txtCPF.Text = oFuncionario.Cpf;
            txtDataNascimeto.Text = oFuncionario.DataNascimento;
            txtCategoria.Text = oFuncionario.CategoriaFuncionario;
            txtComplemento.Text = oFuncionario.Complemento;
            txtEmail.Text = oFuncionario.EmailFuncionario;
            txtEndereco.Text = oFuncionario.Endereco;
            ddEstadoAtuacao.SelectedValue = oFuncionario.EstadoAtuacao;
            txtNumero.Text = oFuncionario.Numero;
            ddStatusFuncionario.SelectedValue = oFuncionario.StatusFuncionario;
            ddTipoAcesso.SelectedValue = oFuncionario.TipoAcesso;
            //ddUnidadeAtuacao.SelectedValue = Convert.ToString(oFuncionario.IdUnidadeSaude);
        }

        public void btnAplicarAlteracoes_Click(object sender, EventArgs e)
        {            
            oFuncionario.NomeFuncionario = txtNome.Text;
            oFuncionario.CategoriaFuncionario = txtCategoria.Text;
            oFuncionario.Cpf = txtCPF.Text;
            oFuncionario.Complemento = txtComplemento.Text;
            oFuncionario.EmailFuncionario = txtEmail.Text;
            oFuncionario.Endereco = txtEndereco.Text;
            oFuncionario.EstadoAtuacao = ddEstadoAtuacao.SelectedValue;
            oFuncionario.Matricula = txtMatricula.Text;
            oFuncionario.Numero = txtNumero.Text;
            oFuncionario.StatusFuncionario = ddStatusFuncionario.SelectedValue;
            oFuncionario.TipoAcesso = ddTipoAcesso.SelectedValue;
            oFuncionario.UnidadeAtuacao = ddUnidadeAtuacao.SelectedValue;
            //oFuncionario.AlterarFuncionario(txtCoren.Text);

            if (oFuncionario.gravacao)
            {
                Response.Write("<script>alert('Dados alterado com sucesso.');</script>");
                limpaCampos();
            }
            else
            {
                Response.Write("<script>alert('Erro na tentiva de alterar os dados.');</script>");
                limpaCampos();
            }
        }
    }
}