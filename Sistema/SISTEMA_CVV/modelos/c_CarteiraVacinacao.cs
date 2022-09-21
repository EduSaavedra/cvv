using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SISTEMA_CVV.modelos
{
    public class c_CarteiraVacinacao
    {
        public string UnidadeSaude { get; set; }
        public string NomeFuncionario { get; set; }
        public string Coren { get; set; }
        public int MatriculaFuncionario { get; set; }
        public string NomePaciente { get; set; }
        public string NomeMaePaciente { get; set; }
        public string DataNascimento { get; set; }
        public string CartaoSus { get; set; }
        public string FabLote { get; set; }
        public string Lote { get; set; }
        public string NomeVacina { get; set; }
        public string Dose { get; set; }
        public string Intervalo { get; set; }
        public string ProximaAplicacao { get; set; }
        public string DataAplicacao { get; set; }
        public int IdVacina { get; set; }
        public bool ConsultaBanco = false;
        public bool verificadorStatusPaciente = false;
        public bool Gravacao = false;

        public void AplicarVacina()
        {
            ServicosDB s = new ServicosDB();
            string SQL = string.Format("select status_paciente from t_paciente where cartao_sus = '{0}'", CartaoSus);
            SqlDataReader dr = s.Consultar(SQL);

            if (dr.Read())
            {
                string statusPaciente = "";
                statusPaciente = Convert.ToString(dr["status_paciente"]);
                if (statusPaciente == "A")
                {
                    ConsultaBanco = true;
                    try
                    {
                        s = new ServicosDB();
                        SQL = string.Format("insert into t_carteira values " +
                            "(GETDATE(), dateadd(" + Intervalo + ", {0}, getdate()), '{1}', '{2}', '{3}', '{4}', '{5}', '{6}')",
                             ProximaAplicacao, Dose, Lote, CartaoSus, Coren, IdVacina, UnidadeSaude
                        );
                        s.Atualizar(SQL);
                        Gravacao = true;
                        verificadorStatusPaciente = true;
                    }
                    catch (SqlException err)
                    {
                        throw err;
                    }
                }
                else
                {
                }
            }
            else
            {
                ConsultaBanco = false;
                Gravacao = false;
            }
        }

        public void ConsultarCarteira(string CartaoSus)
        {
            ServicosDB s = new ServicosDB();
            string SQL = string.Format("select us.nome_unidadesaude, " +
                    "f.nome_funcionario, f.coren, f.matricula, " +
                    "p.nome_paciente, p.cartao_sus, " +
                    "l.data_fabricacao, " +
                    "v.nome_vacina, " +
                    "c.dose, c.proxima_aplicacao " +
                    "from t_unidadesaude as us, t_funcionario as f, " +
                    "t_paciente as p, " +
                    "t_vacina as v, " +
                    "t_carteira as c, " +
                    "t_lotevacina as l " +
                    "where p.cartao_sus = '{0}' " +
                    "and id_vacina = c.fk_id_vacina " +
                    "and p.cartao_sus = c.fk_cartao_sus " +
                    "and f.coren = c.fk_coren and us.id_unidadesaude = c.fk_id_unidadesaude;", 
                    CartaoSus            
                );
            SqlDataReader dr = s.Consultar(SQL);
        }

        public void ConsultarPaciente(string CartaoSus)
        {
            ServicosDB s = new ServicosDB();
            string SQL = string.Format("select * from t_paciente where cartao_sus = '{0}'", CartaoSus);
            SqlDataReader dr = s.Consultar(SQL);

            if (dr.Read())
            {
                ConsultaBanco = true;
                string statusPaciente = "";
                statusPaciente = Convert.ToString(dr["status_paciente"]);
                if (statusPaciente == "A")
                {
                    verificadorStatusPaciente = true;
                    NomePaciente = Convert.ToString(dr["nome_paciente"]);
                    NomeMaePaciente = Convert.ToString(dr["nome_mae"]);
                    DataNascimento = Convert.ToString(dr["dt_nasc"]);
                }
                else
                {
                    verificadorStatusPaciente = false;
                }
            }
            else
            {
                ConsultaBanco = false;
            }
        }
    }
}