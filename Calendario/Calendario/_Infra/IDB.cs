using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace Calendario._Infra
{
    public interface IDB : IDisposable
    {
        DbConnection GetConnection();
    }
}
