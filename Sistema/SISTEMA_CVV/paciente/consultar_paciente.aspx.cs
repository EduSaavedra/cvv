using SISTEMA_CVV.modelos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SISTEMA_CVV
{
    public partial class consultar_paciente1 : System.Web.UI.Page
    {
        public c_Paciente oPaciente
        {
            get
            {
                return Session["pac"] as c_Paciente;
            }
            set
            {
                Session["pac"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                oPaciente = new c_Paciente();
                tableDados.Visible = false;
                txtCartaoSus.Focus();
                btnLimpaCampos.Visible = false;
            }
        }

        public void limpaCampos()
        {
            txtCartaoSus.Focus();
            txtCartaoSus.Text = "";
            txtNomePaciente.Text = "";
            txtMaePaciente.Text = "";
            txtCpfPaciente.Text = "";
            txtSexo.Text = "";
            txtRaca.Text = "";
            txtRgPaciente.Text = "";
            txtDataNasc.Text = "";
            txtNomePaciente.Text = "";
            txtEndereco.Text = "";
            txtNumeroEndereco.Text = "";
            txtComplemento.Text = "";
            txtBairro.Text = "";
            txtCidade.Text = "";
            txtUnidadeFederativa.Text = "";
            txtCep.Text = "";
            txtPais.Text = "";
            txtEmail.Text = "";
            txtTelefone.Text = "";
            txtCelular.Text = "";
            ddZona.SelectedIndex = 0;
            ddStatus.SelectedIndex = 0;
            btnAlterar.Visible = false;
            txtCartaoSus.ReadOnly = false;
            tableDados.Visible = false;
            btnLimpaCampos.Visible = false;
            cbAlteracoes.Checked = false;
            cbSemNumero.Checked = false;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            bool ValidadorEspacos = String.IsNullOrWhiteSpace(txtCartaoSus.Text);
            //bool ValidadorEspacos = txtCartaoSus.Text.Any(Char.IsWhiteSpace);
            if ((txtCartaoSus.Text.Length > 0) && (!ValidadorEspacos))
            {
                lblsus.Text = txtCartaoSus.Text;
                lblsus.Visible = false;
                oPaciente.ConsultarPaciente(txtCartaoSus.Text);
                if (oPaciente.ConsultaBanco)
                {
                    if (oPaciente.Numero == "S/N")
                    {
                        txtNumeroEndereco.Visible = false;
                        lblNumero.Visible = false;
                        cbSemNumero.Checked = true;
                    }
                    else
                    {
                        txtNumeroEndereco.Visible = true;
                        lblNumero.Visible = true;
                        txtNumeroEndereco.Text = "";
                        cbSemNumero.Checked = false;
                    }
                    txtNomePaciente.Text = oPaciente.NomePaciente;
                    txtMaePaciente.Text = oPaciente.NomeMae;
                    txtCpfPaciente.Text = oPaciente.Cpf;
                    txtSexo.Text = oPaciente.SexoPaciente;
                    txtRaca.Text = oPaciente.Raca;
                    txtRgPaciente.Text = oPaciente.Rg;
                    txtDataNasc.Text = (Convert.ToDateTime(oPaciente.DataNasc).ToShortDateString()).ToString();
                    txtEndereco.Text = oPaciente.Endereco;
                    txtNumeroEndereco.Text = Convert.ToString(oPaciente.Numero);
                    txtComplemento.Text = Convert.ToString(oPaciente.Complemento);
                    txtBairro.Text = oPaciente.Bairro;
                    txtCidade.Text = oPaciente.Municipio;
                    txtUnidadeFederativa.Text = oPaciente.Uf;
                    txtCep.Text = oPaciente.Cep;
                    txtPais.Text = oPaciente.Pais;
                    txtEmail.Text = oPaciente.Email;
                    txtTelefone.Text = oPaciente.Telefone;
                    txtCelular.Text = oPaciente.Celular;
                    ddZona.SelectedValue = oPaciente.TipoZona.Trim();
                    ddStatus.SelectedValue = oPaciente.StatusPaciente;
                    tableDados.Visible = true;
                    btnLimpaCampos.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('Paciente não encontrado')</script>");
                    tableDados.Visible = false;
                    btnLimpaCampos.Visible = false;
                    limpaCampos();
                }
            }
            else
            {
                limpaCampos();
                Response.Write("<script>alert('Verifique o campo do Cartão SUS.')</script>");
            }
            
        }



        protected void btnAlterar_Click(object sender, EventArgs e)
        {
            txtCartaoSus.Text = lblsus.Text;
            oPaciente.NomePaciente = txtNomePaciente.Text.Trim();
            oPaciente.NomeMae = txtMaePaciente.Text;
            oPaciente.Cpf = txtCpfPaciente.Text;
            oPaciente.SexoPaciente = txtSexo.Text;
            oPaciente.Raca = txtRaca.Text;
            oPaciente.Rg = txtRgPaciente.Text;
            oPaciente.DataNasc = txtDataNasc.Text;
            oPaciente.Endereco = txtEndereco.Text;
            oPaciente.Numero = txtNumeroEndereco.Text;
            oPaciente.Complemento = txtComplemento.Text;
            oPaciente.Bairro = txtBairro.Text;
            oPaciente.Municipio = txtCidade.Text;
            oPaciente.Uf = txtUnidadeFederativa.Text;
            oPaciente.Cep = txtCep.Text;
            oPaciente.Email = txtEmail.Text;
            oPaciente.Telefone = txtTelefone.Text;
            oPaciente.Celular = txtCelular.Text;
            oPaciente.TipoZona = ddZona.SelectedValue;
            oPaciente.StatusPaciente = ddStatus.Text;
            oPaciente.AlterarPaciente(txtCartaoSus.Text);
            Response.Write("<script>alert('Paciente alterado com sucesso.')</script>");
            txtCartaoSus.ReadOnly = false;
            btnLimpaCampos.Visible = false;
            tableDados.Visible = false;
            limpaCampos();
        }

        protected void cbAlteracoes_CheckedChanged(object sender, EventArgs e)
        {
            if (cbAlteracoes.Checked)
            {
                btnAlterar.Visible = true;
                txtCartaoSus.Text = lblsus.Text;
                txtCartaoSus.ReadOnly = true;
            }
            else
            {
                btnAlterar.Visible = false;
                txtCartaoSus.Text = lblsus.Text;
                txtCartaoSus.ReadOnly = false;
            }
        }

        protected void txtCep_TextChanged(object sender, EventArgs e)
        {
            var valor = txtCep.Text;
            try
            {
                var ws = new WSCorreios.AtendeClienteClient();
                var resposta = ws.consultaCEP(valor);
                txtEndereco.Text = resposta.end;
                txtBairro.Text = resposta.bairro;
                txtCidade.Text = resposta.cidade;
                txtUnidadeFederativa.Text = resposta.uf;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Por favor, verifique o CEP informado: "+ ex.Message + " ');</script>");
            }
        }

        protected void btnLimpaCampos_Click(object sender, EventArgs e)
        {
            limpaCampos();
        }

        protected void cbSemNumero_CheckedChanged(object sender, EventArgs e)
        {
            if (cbSemNumero.Checked)
            {
                txtNumeroEndereco.Visible = false;
                lblNumero.Visible = false;
                txtNumeroEndereco.Text = "S/N";
            }
            else
            {
                txtNumeroEndereco.Visible = true;
                lblNumero.Visible = true;
                txtNumeroEndereco.Text = "";
            }
        }
    }
}