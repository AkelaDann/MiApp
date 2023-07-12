CREATE TABLE [dbo].[Log] (
    [Codigo_Log]    INT           IDENTITY (1, 1) NOT NULL,
    [CodigoSalida]  INT           NOT NULL,
    [MensajeSalida] VARCHAR (800) NOT NULL,
    [FechaRegistro] DATE          NOT NULL
);

