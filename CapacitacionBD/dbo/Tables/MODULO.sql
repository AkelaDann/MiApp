CREATE TABLE [dbo].[MODULO] (
    [mdo_codigo]        INT           IDENTITY (1, 1) NOT NULL,
    [mdo_nombre]        VARCHAR (100) NOT NULL,
    [mdo_descripcion]   VARCHAR (200) NOT NULL,
    [mdo_icono]         VARCHAR (150) NOT NULL,
    [mdo_url_principal] VARCHAR (150) NOT NULL,
    CONSTRAINT [PK_MODULO_mdo_codigo] PRIMARY KEY CLUSTERED ([mdo_codigo] ASC)
);

