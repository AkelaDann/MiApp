﻿
-- =============================================
-- Author:		Daniel Gallardo
-- Create date: 05/07/2023
-- Description:	RECUPERA LISTADO DE DOCUMENTOS 
-- =============================================
CREATE PROCEDURE [dbo].[SP_Documento_Select]

	@Codigo_Salida as int OUTPUT,
	@Mensaje_Salida as varchar(800) OUTPUT
AS
BEGIN
	BEGIN TRY
		
		SELECT * FROM [dbo].[DOCUMENTO] D
		--LEFT JOIN [dbo].[PERSONA] P
		--	ON D.per_rut = P.per_rut
		--LEFT JOIN [dbo].[TIPO_DOCUMENTO] TD
		--	ON D.tpd_codigo =  TD.tpd_codigo

		SET @Codigo_Salida =1
		SET @Mensaje_Salida ='Se recupera lista de documentos exitosamente'

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
    ON OBJECT::[dbo].[SP_Documento_Select] TO [cap]
    AS [dbo];

