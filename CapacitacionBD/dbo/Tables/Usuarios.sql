CREATE TABLE [dbo].[Usuarios] (
    [Codigo]       INT          IDENTITY (1, 1) NOT NULL,
    [Nombre]       VARCHAR (50) NOT NULL,
    [CodigoPerfil] INT          NOT NULL,
    CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED ([Codigo] ASC),
    CONSTRAINT [FK_Usuarios_Perfil] FOREIGN KEY ([CodigoPerfil]) REFERENCES [dbo].[Perfil] ([CodigoPerfil])
);

