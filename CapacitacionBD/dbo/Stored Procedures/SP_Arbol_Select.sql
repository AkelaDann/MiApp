﻿CREATE PROCEDURE [dbo].[SP_Arbol_Select]
@Codigo_Salida as int OUTPUT,
@Mensaje_Salida as varchar(800) OUTPUT
AS
BEGIN
	BEGIN TRY
		
		-- Logica T-SQL
		SELECT DISTINCT 
			CAST(M.MDO_CODIGO AS VARCHAR(10)) [Codigo],
			M.mdo_nombre [Nombre],
			'' [Url],
			CAST(M.MDO_CODIGO AS VARCHAR(10)) [Padre]
		FROM 
			MODULO M
		UNION
		SELECT 
			CAST(M.MDO_CODIGO AS VARCHAR(4))+'.'+CAST(F.frm_codigo AS VARCHAR(4)) [Codigo],
			F.frm_nombre [Nombre],
			F.frm_url [Url],
			CAST(F.mdo_codigo AS VARCHAR(10)) [Padre]
		FROM 
			MODULO M
		INNER JOIN 
			FORMULARIO F
				ON M.mdo_codigo = F.mdo_codigo

		IF(@@ROWCOUNT>0)
			BEGIN
				SET @Codigo_Salida =1
				SET @Mensaje_Salida ='Se recupera arbol exitosamente'
			END
		ELSE
			BEGIN
				SET @Codigo_Salida =0
				SET @Mensaje_Salida ='No se encontro ningun arbol'
			END

		

	END TRY
	BEGIN CATCH
		
		-- >= 1  	caso exitoso
		-- 0 		no se completo el Procedimiento
		-- <= -1 	error en el procedimiento
 		
		SET @Codigo_Salida =-1 
		SET @Mensaje_Salida ='Código: [' + CAST(ERROR_NUMBER() AS VARCHAR(20)) + '], 
								Mensaje: [' + CAST(ERROR_MESSAGE() AS VARCHAR(764)) + '], 
								Procedimiento: [' + (COALESCE(ERROR_PROCEDURE(), 'N/A')) + '], 
								Línea: [' + CAST(ERROR_LINE() AS VARCHAR(10)) + '], 
								Nivel de severidad: [' + CAST(ERROR_SEVERITY() AS VARCHAR(3)) + '], 
								Estado: [' + CAST(ERROR_STATE() AS VARCHAR(3)) + '].';

	END CATCH
END