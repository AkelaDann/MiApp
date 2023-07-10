CREATE TABLE [dbo].[FORMULARIO] (
    [frm_codigo] INT           NOT NULL,
    [frm_nombre] VARCHAR (150) NOT NULL,
    [frm_url]    VARCHAR (150) NOT NULL,
    [mdo_codigo] INT           NOT NULL,
    CONSTRAINT [PK_FORMULARIO] PRIMARY KEY CLUSTERED ([frm_codigo] ASC, [mdo_codigo] ASC),
    CONSTRAINT [FK_FORMULARIO_MODULO_mdo_codigo] FOREIGN KEY ([mdo_codigo]) REFERENCES [dbo].[MODULO] ([mdo_codigo])
);

