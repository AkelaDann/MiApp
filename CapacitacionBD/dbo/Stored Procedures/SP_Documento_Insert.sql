
-- =============================================
-- Author:		Daniel Gallardo
-- Create date: 05/07/2023
-- Description:	inserta un nuevo documento 
-- =============================================
CREATE PROCEDURE [dbo].[SP_Documento_Insert]
	@doc_codigo				int,
    @doc_glosa				varchar(150), 
    @doc_fecha				datetime,
    @doc_fecha_minima		datetime ,
    @doc_fecha_maxima		datetime,
    @doc_referencia			int,
    @doc_descuento			smallint,
    @doc_clasificacion		char,
    @doc_marcado			bit,
    @doc_total				float,
    @per_rut				int,
    @tpd_codigo				int,
	@Codigo_Salida			int OUTPUT,
	@Mensaje_Salida			varchar(800) OUTPUT,
	@tipo_item				tipo_item READONLY,
	@tipo_etapa_documento	tipo_etapa_documento READONLY
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [dbo].[DOCUMENTO]
			(
				[doc_glosa],
				[doc_fecha],
				[doc_fecha_minima],
				[doc_fecha_maxima],
				[doc_referencia],
				[doc_descuento],
				[doc_clasificacion],
				[doc_marcado],
				[doc_total],
				[per_rut],
				[tpd_codigo]
			)
			 VALUES
			 (
				@doc_glosa ,
				@doc_fecha ,
				@doc_fecha_minima ,
				@doc_fecha_maxima ,
				@doc_referencia ,
				@doc_descuento ,
				@doc_clasificacion ,
				@doc_marcado ,
				@doc_total ,
				@per_rut ,
				@tpd_codigo 
			 )		

			SET @doc_codigo=@@IDENTITY

			INSERT INTO [dbo].[ITEM]
			   (
				[itm_correlativo]
			   ,[doc_codigo]
			   ,[itm_glosa]
			   ,[itm_valor]
			   )
			SELECT			   
				itm_correlativo,
				@doc_codigo,
				itm_glosa, 
				itm_valor				
			FROM 
				@tipo_item

			INSERT INTO [dbo].[ETAPA_DOCUMENTO]
			(
				[eta_codigo],
				[doc_codigo]
			)
			SELECT 
				eta_codigo,
				@doc_codigo
			FROM
				@tipo_etapa_documento



			SET @Codigo_Salida =1
			SET @Mensaje_Salida ='Se registra documento exitosamente'
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
    ON OBJECT::[dbo].[SP_Documento_Insert] TO [cap]
    AS [dbo];

