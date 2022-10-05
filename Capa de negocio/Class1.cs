using System.Data;
using Capa_de_datos;
using Capa_de_entidad;


namespace Capa_de_negocio
{
    public class ClassNegocio
    {
        ClassDatos objd = new ClassDatos();

        public DataTable N_listar_clientes()
        {
            return objd.D_listar();
        }

        public DataTable N_buscar_clientes(ClassEntidad obje)
        {
            return objd.D_buscar(obje);
        }

        public String N_mantenimiento_cliente(ClassEntidad obje)
        {
            return objd.D_mantenimiento(obje);
        }
    }
}