CREATE TABLE [dbo].[TIPO_DOCUMENTO] (
    [tpd_codigo]      INT          IDENTITY (1, 1) NOT NULL,
    [tpd_glosa]       VARCHAR (50) NOT NULL,
    [tpd_cargo_abono] BIT          NULL,
    CONSTRAINT [PK_TIPO_DOCUMENTO] PRIMARY KEY CLUSTERED ([tpd_codigo] ASC)
);

