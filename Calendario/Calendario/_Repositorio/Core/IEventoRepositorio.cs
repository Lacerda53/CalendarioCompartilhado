using Calendario.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Calendario._Repositorio.Core
{
    public interface IEventoRepositorio
    {
        void Adicionar(Evento item);
        void Editar(Evento item);
        void Desabilitar(Evento item);
        Evento BuscarPorId(Guid Id);
        IEnumerable<Evento> ListarTodosEventos();
        IEnumerable<Evento> ListarMeusEventos(int UserId);
    }
}
