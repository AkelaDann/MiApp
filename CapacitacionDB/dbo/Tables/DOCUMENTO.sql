CREATE TABLE [dbo].[DOCUMENTO] (
    [doc_codigo]        INT           IDENTITY (1, 1) NOT NULL,
    [doc_glosa]         VARCHAR (150) NOT NULL,
    [doc_fecha]         DATETIME      NOT NULL,
    [doc_fecha_minima]  DATETIME      NOT NULL,
    [doc_fecha_maxima]  DATETIME      NOT NULL,
    [doc_referencia]    INT           NOT NULL,
    [doc_descuento]     SMALLINT      NOT NULL,
    [doc_clasificacion] CHAR (1)      NOT NULL,
    [doc_marcado]       BIT           NOT NULL,
    [doc_total]         FLOAT (53)    NOT NULL,
    [per_rut]           INT           NOT NULL,
    [tpd_codigo]        INT           NOT NULL,
    CONSTRAINT [PK_DOCUMENTO] PRIMARY KEY CLUSTERED ([doc_codigo] ASC),
    CONSTRAINT [FK_DOCUMENTO_PERSONA] FOREIGN KEY ([per_rut]) REFERENCES [dbo].[PERSONA] ([per_rut]),
    CONSTRAINT [FK_DOCUMENTO_TIPO_DOCUMENTO] FOREIGN KEY ([tpd_codigo]) REFERENCES [dbo].[TIPO_DOCUMENTO] ([tpd_codigo])
);

