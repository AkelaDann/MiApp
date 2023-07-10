
-- =============================================
-- Author:		Daniel Gallardo
-- Create date: 05/07/2023
-- Description:	RECUPERA LISTADO DE PERSONAS 
-- =============================================
CREATE PROCEDURE [dbo].[SP_Persona_Select]
	@tpd_codigo as int,
	@Codigo_Salida as int OUTPUT,
	@Mensaje_Salida as varchar(800) OUTPUT
AS
BEGIN
	BEGIN TRY
		
		SELECT * FROM [dbo].[PERSONA]
		where [per_cliente_proveedor] = (case 
											when  @tpd_codigo >0 then 0
											else 1 end)

		SET @Codigo_Salida =1
		SET @Mensaje_Salida ='Se recupera lista de personas exitosamente'

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
    ON OBJECT::[dbo].[SP_Persona_Select] TO [cap]
    AS [dbo];

