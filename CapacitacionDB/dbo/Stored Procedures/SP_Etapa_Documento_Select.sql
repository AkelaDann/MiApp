
-- =============================================
-- Author:		Daniel Gallardo
-- Create date: 05/07/2023
-- Description:	RECUPERA LISTADO DE ETAPAS segun documento
-- =============================================
CREATE PROCEDURE [dbo].[SP_Etapa_Documento_Select]
	@doc_codigo as int,
	@Codigo_Salida as int OUTPUT,
	@Mensaje_Salida as varchar(800) OUTPUT
AS
BEGIN	
	BEGIN TRY
		
		SELECT E.* FROM [dbo].[ETAPA] E
		LEFT JOIN [dbo].[ETAPA_DOCUMENTO] ED
			ON E.eta_codigo = ED.eta_codigo
			AND ED.doc_codigo = @doc_codigo

		where ED.doc_codigo = @doc_codigo

		SET @Codigo_Salida =1
		SET @Mensaje_Salida ='Se recupera lista de etapas exitosamente'

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
    ON OBJECT::[dbo].[SP_Etapa_Documento_Select] TO [cap]
    AS [dbo];

