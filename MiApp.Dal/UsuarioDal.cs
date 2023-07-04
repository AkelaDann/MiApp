﻿using Dapper;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiApp.Dal
{
    public class UsuarioDal
    {
        public static List<UsuarioMod> ListarUsuarios(out SalidaMod salida) 
        {
            List<UsuarioMod> usuarios = new List<UsuarioMod>();

            try
            {

                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros();
                    usuarios = db.Query<UsuarioMod, PerfilMod, UsuarioMod>(
                        sql: @"SP_Usuario_Select",
                        param: parametros,
                        map: (UsuarioMod, PerfilMod) => { UsuarioMod.Perfil = PerfilMod; return UsuarioMod; },
                        splitOn:"CodigoPerfil",
                        commandType: CommandType.StoredProcedure).AsList();
                    salida = ConexionFll.ObtenerSalida(parametros);
                }

                return usuarios;
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                string error = e.Message;
                return usuarios;
            }
        }

        public static void InsertarActualizar(UsuarioMod usuario, out SalidaMod salida)
        {
            try
            {
                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros(new
                    {
                        codigo = usuario.Codigo,
                        nombre = usuario.Nombre,
                        codigoPerfil = usuario.Perfil.CodigoPerfil
                    });
                    db.Execute(
                        sql: "SP_Usuario_Insert_Update",
                        param: parametros,                        
                        commandType: CommandType.StoredProcedure
                        );
                    salida = ConexionFll.ObtenerSalida(parametros);
                }
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                string error = e.Message;
                throw;
            }
        }

        public static void EliminarUsuario(int codigo, out SalidaMod salida)
        {
            //SP_Usuario_Delete
            try
            {
                using (IDbConnection db = ConexionFll.ConectarPrueba())
                {
                    DynamicParameters parametros = ConexionFll.ObtenerParametros(new 
                    {
                        Codigo = codigo
                    });
                    db.Execute(
                        sql: "SP_Usuario_Delete",
                        param: parametros ,
                        commandType: CommandType.StoredProcedure
                        );
                    salida = ConexionFll.ObtenerSalida(parametros);
                }

            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                string error = e.Message;
                throw;
            }   
        }
    }
}
