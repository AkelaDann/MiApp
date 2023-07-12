CREATE TABLE [dbo].[ITEM] (
    [itm_correlativo] INT           NOT NULL,
    [itm_glosa]       VARCHAR (150) NOT NULL,
    [itm_valor]       FLOAT (53)    NOT NULL,
    [doc_codigo]      INT           NOT NULL,
    CONSTRAINT [PK_ITEM] PRIMARY KEY CLUSTERED ([itm_correlativo] ASC, [doc_codigo] ASC),
    CONSTRAINT [fk_BorradoItemDocumento] FOREIGN KEY ([doc_codigo]) REFERENCES [dbo].[DOCUMENTO] ([doc_codigo]) ON DELETE CASCADE,
    CONSTRAINT [FK_ITEM_DOCUMENTO1] FOREIGN KEY ([doc_codigo]) REFERENCES [dbo].[DOCUMENTO] ([doc_codigo])
);

