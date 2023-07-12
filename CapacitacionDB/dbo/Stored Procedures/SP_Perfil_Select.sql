﻿-- =============================================
-- Author:		Daniel Gallardo
-- Create date: 03/07/2023
-- Description:	Recupera Lista de perfiles
-- =============================================
CREATE PROCEDURE [dbo].[SP_Perfil_Select]
@Codigo_Salida as int OUTPUT,
@Mensaje_Salida as varchar(800) OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT * FROM [dbo].[Perfil]

		SET @Codigo_Salida =1
		SET @Mensaje_Salida ='Se recupera lista de perfiles exitosamente'

	END TRY
	BEGIN CATCH
		
		SET @Codigo_Salida =-1
		SET @Mensaje_Salida ='Código: [' + CAST(ERROR_NUMBER() AS VARCHAR(20)) + '], 
								Mensaje: [' + CAST(ERROR_MESSAGE() AS VARCHAR(764)) + '], 
								Procedimiento: [' + (COALESCE(ERROR_PROCEDURE(), 'N/A')) + '], 
								Línea: [' + CAST(ERROR_LINE() AS VARCHAR(10)) + '], 
								Nivel de severidad: [' + CAST(ERROR_SEVERITY() AS VARCHAR(3)) + '], 
								Estado: [' + CAST(ERROR_STATE() AS VARCHAR(3)) + '].';

	END CATCH
END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SP_Perfil_Select] TO [cap]
    AS [dbo];

