CREATE TYPE [dbo].[tipo_item] AS TABLE (
    [itm_correlativo] INT           NOT NULL,
    [itm_glosa]       VARCHAR (150) NOT NULL,
    [itm_valor]       FLOAT (53)    NOT NULL,
    [doc_codigo]      INT           NOT NULL);


GO
GRANT CONTROL
    ON TYPE::[dbo].[tipo_item] TO [cap];


GO
GRANT REFERENCES
    ON TYPE::[dbo].[tipo_item] TO [cap];


GO
GRANT VIEW DEFINITION
    ON TYPE::[dbo].[tipo_item] TO [cap];

