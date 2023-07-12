CREATE TABLE [dbo].[ETAPA] (
    [eta_codigo] INT          IDENTITY (1, 1) NOT NULL,
    [eta_glosa]  VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ETAPA] PRIMARY KEY CLUSTERED ([eta_codigo] ASC)
);

