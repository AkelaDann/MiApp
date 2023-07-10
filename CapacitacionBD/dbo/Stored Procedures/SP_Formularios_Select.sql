CREATE PROCEDURE [dbo].[SP_Formularios_Select]
@frm_url as varchar(150),
@Codigo_Salida as int OUTPUT,
@Mensaje_Salida as varchar(800) OUTPUT
AS
BEGIN
	BEGIN TRY
		
		-- Logica T-SQL

		SELECT	[frm_codigo],
				[frm_nombre],
				[frm_url]   
		FROM 
			FORMULARIO F
		WHERE 
			F.frm_codigo = (
							SELECT TOP(1) F1.frm_codigo 
							FROM 
								FORMULARIO F1 
							WHERE
								UPPER(F1.frm_url) = UPPER(@frm_url)
							)
		OR F.mdo_codigo =
							(
							SELECT TOP (1) M.mdo_codigo 
							FROM 
								MODULO M
							WHERE
								UPPER(M.mdo_url_principal)=UPPER(@frm_url)
							);
		IF @@ROWCOUNT > 0
			BEGIN
				SET @Codigo_Salida =1
				SET @Mensaje_Salida ='Se recupera lista de formularios exitosamente'
			END
		ELSE
			BEGIN
				SET @Codigo_Salida =0
				SET @Mensaje_Salida ='No se encontraron formularios'
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