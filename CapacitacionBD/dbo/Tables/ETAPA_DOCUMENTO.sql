CREATE TABLE [dbo].[ETAPA_DOCUMENTO] (
    [eta_codigo] INT NOT NULL,
    [doc_codigo] INT NOT NULL,
    CONSTRAINT [PK_ETAPA_DOCUMENTO] PRIMARY KEY CLUSTERED ([eta_codigo] ASC, [doc_codigo] ASC),
    CONSTRAINT [fk_BorradoEtapaDocumento] FOREIGN KEY ([doc_codigo]) REFERENCES [dbo].[DOCUMENTO] ([doc_codigo]) ON DELETE CASCADE,
    CONSTRAINT [FK_ETAPA_DOCUMENTO_DOCUMENTO] FOREIGN KEY ([doc_codigo]) REFERENCES [dbo].[DOCUMENTO] ([doc_codigo]),
    CONSTRAINT [FK_ETAPA_DOCUMENTO_ETAPA] FOREIGN KEY ([eta_codigo]) REFERENCES [dbo].[ETAPA] ([eta_codigo])
);

