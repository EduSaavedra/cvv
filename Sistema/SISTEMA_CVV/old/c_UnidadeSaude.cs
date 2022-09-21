using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SISTEMA_CVV.modelos
{

    public class c_UnidadeSaude
    {
        public int IdUnidade { get; set; }
        public string NomeUnidade { get; set; }
        public string TipoUnidade { get; set; }
        public string Estado { get; set; }
        public string Cep { get; set; }
        public string Endereco { get; set; }
        public string Numero { get; set; }
        public string Bairro { get; set; }
        public string Cidade { get; set; }
        public bool ConsultaBanco;
        public string ResultadoBanco { get; set; }
        public bool Gravacao = false;

        public void consultarUnidade(string NomeUnidade)
        {
            ServicosDB s = new ServicosDB();
            string SQL = string.Format("select * from t_unidadesaude where nome_unidadesaude like '%{0}%';", NomeUnidade);
            SqlDataReader dr = s.Consultar(SQL);
            ConsultaBanco = (dr.HasRows);

            try
            {
                if (dr.Read())
                {
                    IdUnidade = Convert.ToInt32(dr["id_unidadesaude"]);
                    NomeUnidade = Convert.ToString(dr["nome_unidadesaude"]);
                    TipoUnidade = Convert.ToString(dr["tipo_unidade"]);
                    Estado = Convert.ToString(dr["cidade"]);
                    Cep = Convert.ToString(dr["cep"]);
                    Endereco = Convert.ToString(dr["endereco"]);
                    Numero = Convert.ToString(dr["numero"]);
                    Bairro = Convert.ToString(dr["bairro"]);
                }
                else
                {
                    ConsultaBanco = false;
                }
            }
            catch (SqlException errosql)
            {
                throw errosql;
            }
            finally
            {
                dr.Close();
            }
        }
    }
}