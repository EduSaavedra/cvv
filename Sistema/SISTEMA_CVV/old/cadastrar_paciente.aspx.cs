using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV
{
    public partial class cadastrar_paciente : System.Web.UI.Page
    {
        public c_Paciente oPaciente
        {
            get
            {
                return Session["paci"] as c_Paciente;
            }
            set
            {
                Session["paci"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                oPaciente = new c_Paciente();
            }
        }

        public void limpaCampos()
        {
            txtBairro.Text = "";
            txtCartaoSus.Text = "";
            txtCelular.Text = "";
            txtCep.Text = "";
            txtCidade.Text = "";
            txtComplemento.Text = "";
            txtCpfPaciente.Text = "";
            txtDataNasc.Text = "";
            txtEmail.Text = "";
            txtEndereco.Text = "";
            txtMaePaciente.Text = "";
            txtNacionalidade.Text = "";
            txtNomePaciente.Text = "";
            txtNumeroEndereco.Text = "";
            txtRgPaciente.Text = "";
            txtTelefone.Text = "";
            txtUnidadeFederativa.Text = "";
            ddRaca.SelectedValue = "0";
            ddSexo.SelectedValue = "0";
            ddTipoZona.SelectedValue = "0";
        }

        public void verificaCampoNumero()
        {
            if  (Convert.ToInt32(txtNumeroEndereco.Text) < 0)
            {
                Response.Write("<script>alert('Número da residência inválido.')</script>;");
            }
        }
        /*
        protected void btnIncluir_Click(object sender, EventArgs e)
        {
            verificaCampoNumero();
            if (!(ddRaca.SelectedValue != "0") || !(ddSexo.SelectedValue != "0") || !(ddTipoZona.SelectedValue != "0"))
            {
                oPaciente.NomePaciente = txtNomePaciente.Text.Trim();
                oPaciente.NomeMae = txtMaePaciente.Text.Trim();
                oPaciente.Cpf = txtCpfPaciente.Text.Trim();
                oPaciente.SexoPaciente = ddSexo.SelectedValue.ToString();
                oPaciente.Raca = ddRaca.SelectedValue.ToString();
                oPaciente.Rg = txtRgPaciente.Text;
                oPaciente.DataNasc = txtDataNasc.Text;
                oPaciente.Endereco = txtEndereco.Text;
                oPaciente.Numero = txtNumeroEndereco.Text;
                oPaciente.Complemento = txtComplemento.Text;
                oPaciente.Bairro = txtBairro.Text;
                oPaciente.Municipio = txtCidade.Text.Trim();
                oPaciente.Uf = txtUnidadeFederativa.Text.Trim();
                oPaciente.Cep = txtCep.Text.Trim();
                oPaciente.Email = txtEmail.Text.Trim();
                oPaciente.Telefone = txtTelefone.Text.Trim();
                oPaciente.Celular = txtCelular.Text.Trim();
                oPaciente.TipoZona = ddTipoZona.SelectedValue.ToString();
                oPaciente.Nacionalidade = txtNacionalidade.Text.Trim();
                oPaciente.IncluirPaciente(txtCartaoSus.Text);

                if (oPaciente.Gravacao)
                {
                    Response.Write("<script>alert('Cadastrado com sucesso.')</script>");
                    limpaCampos();
                }
                else
                {
                    Response.Write("<script>alert('Erro ao cadastrar.')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Favor verificar os campos Sexo, raça ou tipo de zona.')</script>"); 
            }            
        }
        */
        protected void cbSemNumero_CheckedChanged(object sender, EventArgs e)
        {
            if (cbSemNumero.Checked)
            {
                txtNumeroEndereco.Visible = false;
                txtNumeroEndereco.Text = "0";
            }
            else
            {
                txtNumeroEndereco.Visible = true;
                txtNumeroEndereco.Text = "";
            }
        }
    }
}