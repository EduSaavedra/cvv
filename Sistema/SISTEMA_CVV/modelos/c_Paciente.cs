using System;
using System.Data.SqlClient;

namespace SISTEMA_CVV.modelos
{
    public class c_Paciente
    {
        public string SusAtual { get; set; }
		public string Sus { get; set; }
        public string NomePaciente { get; set; }
        public string NomeMae { get; set; }
        public string Cpf { get; set; }
        public string SexoPaciente { get; set; }
        public string Raca { get; set; }
        public string Rg { get; set; }
        public string DataNasc { get; set; }
        public string Endereco { get; set; }
        public string Numero { get; set; }
        public string Complemento { get; set; }
        public string Bairro { get; set; }
        public string Municipio { get; set; }
        public string Uf { get; set; }
        public string Cep { get; set; }
        public string Pais { get; set; }
        public string Email { get; set; }
        public string Telefone { get; set; }
        public string Celular { get; set; }
        public string TipoZona { get; set; }
        public string Nacionalidade { get; set; }
        public string StatusPaciente { get; set; }
        public bool Gravacao = false;
        public bool ConsultaBanco = false;
        public bool AtualizacaoBanco = false;
        
        public void ConsultarPaciente(string Sus)
        {
            ServicosDB s = new ServicosDB();
            string SQL = string.Format("select * from t_paciente where cartao_sus = '{0}'", Sus);
            SqlDataReader dr = s.Consultar(SQL);

            try
            {
                if (dr.Read())
                {
                    SusAtual = Convert.ToString(dr["cartao_sus"]);
                    NomePaciente = Convert.ToString(dr["nome_paciente"]);
                    NomeMae = Convert.ToString(dr["nome_mae"]);
                    Cpf = Convert.ToString(dr["cpf"]);
                    SexoPaciente = Convert.ToString(dr["sexo"]);
                    Raca = Convert.ToString(dr["raca"]);
                    Rg = Convert.ToString(dr["rg"]);
                    DataNasc = Convert.ToString(dr["dt_nasc"]);
                    Endereco = Convert.ToString(dr["endereco"]);
                    Numero = (Convert.ToString(dr["numero"]));
                    Complemento = Convert.ToString(dr["complemento"]);
                    Bairro = Convert.ToString(dr["bairro"]);
                    Municipio = Convert.ToString(dr["municipio"]);
                    Uf = Convert.ToString(dr["uf"]);
                    Cep = Convert.ToString(dr["cep"]);
                    Pais = Convert.ToString(dr["pais"]);
                    Email = Convert.ToString(dr["email"]);
                    Telefone = Convert.ToString(dr["telefone"]);
                    Celular = Convert.ToString(dr["celular"]);
                    TipoZona = Convert.ToString(dr["ctg_zona"]);
                    Nacionalidade = Convert.ToString(dr["nacionalidade"]);
                    StatusPaciente = Convert.ToString(dr["status_paciente"]);
                    ConsultaBanco = true;
                }
                else
                {
                    ConsultaBanco = false;
                }
                dr.Close();
            }
            catch (SqlException err)
            {
                throw err;
            }    
        }
		
		/*public void IncluirPaciente(string Sus)
        {
            try
            {
                ServicosDB s = new ServicosDB();
                string SQL = string.Format(
                    "insert into t_paciente values ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', 'BRASIL'," +
                        " '{9}', '{10}', '{11}', '{12}', '{13}', '{14}', '{15}', '{16}', '{17}', '{18}', '{19}'," +
                        " '{20}', 'A');",
                        Sus,
                        NomePaciente.ToUpper(),
                        NomeMae.ToUpper(),
                        Cpf,
                        SexoPaciente.ToUpper(),
                        Raca.ToUpper(),
                        Rg,
                        DataNasc,
                        Pais,
                        Cep,
                        Uf.ToUpper(),
                        Municipio.ToUpper(),
                        Bairro.ToUpper(),
                        Endereco.ToUpper(),
                        Numero,
                        Complemento.ToUpper(),
                        Email.ToLower(),
                        Telefone,
                        Celular,
                        TipoZona,
                        Nacionalidade.ToUpper(),
                        StatusPaciente
                );
                s.Atualizar(SQL);
                Gravacao = true;
            }
            catch (SqlException errosql)
            {
                Gravacao = false;
                throw errosql;
            }			
		}*/
		
		public void AlterarPaciente(string Sus)
        {
			
			ServicosDB s = new ServicosDB();
            string SQL = string.Format(
                "update t_paciente set nome_paciente = '{0}', nome_mae = '{1}', cpf = '{2}', sexo = '{3}',"+
                    " raca = '{4}', rg = '{5}', dt_nasc = '{6}', endereco = '{7}', numero = '{8}',"+
                    " complemento = '{9}', bairro = '{10}', municipio = '{11}', uf = '{12}', cep = '{13}',"+
                    " pais = '{14}', email = '{15}', telefone = '{16}', celular = '{17}', ctg_zona = '{18}',"+
                    " nacionalidade = '{19}', status_paciente = '{20}' where cartao_sus = '{21}';",
					NomePaciente,
					NomeMae,
					Cpf,
					SexoPaciente,
					Raca,
					Rg,
					DataNasc,
					Endereco,
					Numero,
					Complemento,
                    Bairro,
					Municipio,
                    Uf,
                    Cep,
                    Pais,
                    Email,
                    Telefone,
                    Celular,
                    TipoZona,
                    Nacionalidade,
                    StatusPaciente,
					Sus
            );
            AtualizacaoBanco = true;
            s.Atualizar(SQL);
		}
    }
}