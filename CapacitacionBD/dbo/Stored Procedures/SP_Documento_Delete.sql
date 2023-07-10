-- =============================================
-- Author:		Daniel Gallardo
-- Create date: 03/07/2023
-- Description:	Elimina Documento y en cascada los items y etapas referenciadas
-- =============================================
CREATE PROCEDURE [dbo].[SP_Documento_Delete]
@doc_codigo as int,
@Codigo_Salida as int OUTPUT,
@Mensaje_Salida as varchar(800) OUTPUT
AS
BEGIN
	BEGIN TRY
		DELETE FROM  [dbo].[DOCUMENTO] 
		WHERE doc_codigo = @doc_codigo

		SET @Codigo_Salida =1
		SET @Mensaje_Salida ='Se elimina el documento'+CAST(@doc_codigo AS VARCHAR(10))+',sus etapas e items exitosamente'

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
    ON OBJECT::[dbo].[SP_Documento_Delete] TO [cap]
    AS [dbo];

