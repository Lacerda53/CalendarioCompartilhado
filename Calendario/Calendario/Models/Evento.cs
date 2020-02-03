using System;
using System.ComponentModel.DataAnnotations;

namespace Calendario.Models
{
    public class Evento
    {
        public Evento()
        {
            Id = Guid.NewGuid();
        }
        public Guid Id { get; set; }

        [Required]
        [Display(Name ="Nome do Evento")]
        public string Nome { get; set; }

        [Required]
        [Display(Name = "Descrição do Evento")]
        public string Descricao { get; set; }

        [Required]
        [Display(Name = "Data e Hora de início do Evento")]
        public DateTime Inicio { get; set; }

        [Required]
        [Display(Name = "Data e Hora de fim do Evento")]
        public DateTime Fim { get; set; }

        [Required]
        [Display(Name = "Cor do Evento")]
        public string Cor { get; set; }

        [Required]
        [Display(Name = "O Evento é o dia inteiro")]
        public bool DiaInteiro { get; set; }

        public int UsuarioId { get; set; }
    }
}
