

-- =============================================
-- Author:		Daniel Gallardo
-- Create date: 05/07/2023
-- Description:	inserta un nuevo documento 
-- =============================================
CREATE PROCEDURE [dbo].[SP_Item_Insert]
	
	@tipo_item				tipo_item READONLY,
	@Codigo_Salida as int OUTPUT,
	@Mensaje_Salida as varchar(800) OUTPUT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN

		DECLARE @INDICE INT

		SET @INDICE = (SELECT MAX(itm_correlativo) 
							from [dbo].[ITEM] 
							where doc_codigo = (Select top(1) doc_codigo from @tipo_item ))

			INSERT INTO [dbo].[ITEM]
			   (
				[itm_correlativo]			   
			   ,[itm_glosa]
			   ,[itm_valor]
			   ,[doc_codigo]
			   )
			SELECT			   
				itm_correlativo+@INDICE,				
				itm_glosa, 
				itm_valor,
				doc_codigo			
			FROM 
				@tipo_item

			



			SET @Codigo_Salida =1
			SET @Mensaje_Salida ='Se registra los items exitosamente'
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
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
    ON OBJECT::[dbo].[SP_Item_Insert] TO [cap]
    AS [dbo];

