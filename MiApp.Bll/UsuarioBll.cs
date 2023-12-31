﻿using MiApp.Dal;
using MiApp.Fll;
using MiApp.Mod;
using System;
using System.Collections.Generic;

namespace MiApp.Bll
{
    public class UsuarioBll
    {
        public static List<UsuarioMod> ListarUsuarios(out SalidaMod salida)
        {
            try
            {
                return UsuarioDal.Listar(out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                return new List<UsuarioMod>();
            }
            
        }

        public static void InsertarActualizarUsuario(int Codigo, string Nombre, int PerfilCodigo, out SalidaMod salida)
        {
            try
            {
                UsuarioMod usuario = new UsuarioMod(Codigo, Nombre, new PerfilMod(PerfilCodigo));
                UsuarioDal.InsertarActualizar(usuario, out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                throw;
            }
        }

        public static void EliminarUsuario(int Codigo, out SalidaMod salida)
        {
            try
            {
                UsuarioDal.Eliminar(Codigo, out salida);
            }
            catch (Exception e)
            {
                salida = LogFll.RegistrarExcepcion(e);
                throw;
            }
        }
    }
}
