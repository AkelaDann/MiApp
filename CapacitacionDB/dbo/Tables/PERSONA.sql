CREATE TABLE [dbo].[PERSONA] (
    [per_rut]               INT           NOT NULL,
    [per_dv]                CHAR (1)      NOT NULL,
    [per_nombre]            VARCHAR (150) NOT NULL,
    [per_cliente_proveedor] BIT           NOT NULL,
    CONSTRAINT [PK_PERSONA] PRIMARY KEY CLUSTERED ([per_rut] ASC)
);

