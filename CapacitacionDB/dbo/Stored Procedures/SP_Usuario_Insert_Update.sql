-- =============================================
-- Author:		Daniel Gallardo
-- Create date: 03/07/2023
-- Description:	revisa si el registro existe si= lo actualiza no = lo inserta.
-- =============================================
CREATE PROCEDURE [dbo].[SP_Usuario_Insert_Update]
@Codigo as int,
@Nombre as varchar(50),
@PerfilCodigo as int,
@Codigo_Salida as int OUTPUT,
@Mensaje_Salida as varchar(800) OUTPUT
AS
BEGIN
	BEGIN TRY
		IF(SELECT COUNT(Codigo) FROM Usuarios WHERE Codigo = @Codigo)>0
		BEGIN 
			DECLARE @NOMBREORIGINAL VARCHAR(50)
			DECLARE @PERFILORIGINAL INT
			SET @NOMBREORIGINAL = (SELECT Nombre FROM Usuarios WHERE Codigo=@Codigo)
			SET @PERFILORIGINAL = (SELECT PerfilCodigo FROM Usuarios WHERE Codigo=@Codigo)

			UPDATE Usuarios
			SET	 Nombre = @Nombre,
			PerfilCodigo = @PerfilCodigo
			where Codigo = @Codigo

			SET @Codigo_Salida = 2
			SET @Mensaje_Salida = 'Se Actualiza correctamente el registro:'--+@Codigo
			--						+' nombre original:'+@NOMBREORIGINAL
			--						+' perfil original:'+@PERFILORIGINAL 
		
		END 
		ELSE
		BEGIN 
			Insert into Usuarios (Nombre, PerfilCodigo)
			Values (@Nombre,@PerfilCodigo)

			SET @Codigo_Salida = 1
			SET @Mensaje_Salida ='se Ingresa correctamente el registro:'+CAST(SCOPE_IDENTITY() AS VARCHAR(10));
		END 
	
	END TRY
	BEGIN CATCH
		
		SET @Codigo_Salida =-1
		SET @Mensaje_Salida ='Código: [' + CAST(ERROR_NUMBER() AS VARCHAR(20)) + '],'+ 
								'Mensaje: [' + CAST(ERROR_MESSAGE() AS VARCHAR(764)) + '],'+ 
								'Procedimiento: [' + (COALESCE(ERROR_PROCEDURE(), 'N/A')) + '],'+ 
								'Línea: [' + CAST(ERROR_LINE() AS VARCHAR(10)) + '], '+
								'Nivel de severidad: [' + CAST(ERROR_SEVERITY() AS VARCHAR(3)) + '], '+
								'Estado: [' + CAST(ERROR_STATE() AS VARCHAR(3)) + '].';

	END CATCH
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SP_Usuario_Insert_Update] TO [cap]
    AS [dbo];

