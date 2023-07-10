CREATE TYPE [dbo].[tipo_etapa_documento] AS TABLE (
    [eta_codigo] INT          NULL,
    [eta_glosa]  VARCHAR (50) NULL);


GO
GRANT CONTROL
    ON TYPE::[dbo].[tipo_etapa_documento] TO [cap];


GO
GRANT REFERENCES
    ON TYPE::[dbo].[tipo_etapa_documento] TO [cap];


GO
GRANT VIEW DEFINITION
    ON TYPE::[dbo].[tipo_etapa_documento] TO [cap];

