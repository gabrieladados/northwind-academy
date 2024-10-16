WITH 
    funcionarios AS (
        SELECT *
        FROM {{ref("stg_erp__funcionarios")}}
    )

    , joined AS (

        SELECT 
              funcionarios.PK_FUNCIONARIO
            , funcionarios.FK_GERENTE
            , funcionarios.NOME_FUNCIONARIO
            , gerentes.NOME_FUNCIONARIO AS nome_gerente
            , funcionarios.CARGO_FUNCIONARIO
            , funcionarios.DT_NASCIMENTO_FUNCIONARIO
            , funcionarios.DT_CONTRATACAO
            , funcionarios.CIDADE_FUNCIONARIO
            , funcionarios.REGIAO_FUNCIONARIO
            , funcionarios.PAIS_FUNCIONARIO
        FROM funcionarios
        LEFT JOIN funcionarios as gerentes
        ON funcionarios.FK_GERENTE = gerentes.PK_FUNCIONARIO

    )

    SELECT *
    FROM joined