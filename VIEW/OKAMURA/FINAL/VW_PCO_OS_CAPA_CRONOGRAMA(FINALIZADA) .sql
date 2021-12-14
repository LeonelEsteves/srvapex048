SELECT 
    ZZ7_FILIAL AS "FILIAL DO SISTEMA",
    ZZ7_NUMERO AS "NUMERO OS",
    ZZ7_OSAPEX AS "NUMERO OS APEX",
    ZZ7_DESCOS AS "DESCRICAO OS",
    (ZZ7_FORNEC || ZZ7_LOJA) AS COD_FORNECEDOR,
    A2_NOME AS "NOME FORNECEDOR",
    A2_CGC AS CNPJ_CPF_FORNECEDOR,
    ZZ7_CONTRA AS "CONTRATO",
    ZZ7_MOEDA  AS "MOEDA",
    -- ZZ7_XDMOED AS "DESCRI��O MOEDA",  -- ??
    F_DATA(ZZ7_DTPREV) AS "PREV. FIM OS",
    ZZ7_PROJET AS "INICIATIVA",
    -- ZZ7_DESCPR AS "DESC INICIAT", - CAMPO VIRTUAL
    (CASE
        WHEN ZZ7_RESERV = ' ' THEN ZZ7_RESERX
        ELSE ZZ7_RESERV
     END
    ) AS "RESERVA (F7)",
    ZZ7_DOSSIE AS "DOSSIE",
    ZZ7_EMPENH AS "EMPENHO",
    F_COMBO('ZZ7_STATUS', ZZ7_STATUS) AS STATUS,
    ZZ7_TOTAL  AS "TOTAL",
    ZZ7_SALDO  AS "SALDO",
    ZZ7_RESERX AS "RESERVA",
    ZZ7_ACAO   AS "PRJ FENIX",
    DBMS_LOB.SUBSTR(BLOB_TO_CLOB(ZZ7_OBS),4000,1) AS OBSERVACAO,
    ZZ7_VALANP AS "VALOR ANOS POSTERIORES",
    --
    ZZL_ITEM   AS "Item",
    ZZL_ANO    AS "Ano",
    ZZL_MES    AS "M�s",
      CASE ZZL_MES
           WHEN '01' THEN 'Janeiro'
           WHEN '02' THEN 'Fevereiro'
           WHEN '03' THEN 'Mar�o'
           WHEN '04' THEN 'Abril'
           WHEN '05' THEN 'Maio'
           WHEN '06' THEN 'Junho'
           WHEN '07' THEN 'Julho'
           WHEN '08' THEN 'Agosto'
           WHEN '09' THEN 'Setembro'
           WHEN '10' THEN 'Outubro'
           WHEN '11' THEN 'Novembro'
           WHEN '12' THEN 'Dezembro'
      END AS "M�s Extenso",
    ZZL_VALOR  AS "Valor",
    ZZL_USADO  AS "Parc. Usada",
    cn9_xtpmdl as "Tp. Md Lici",--@leonel.diniz Chamado:129507
    (SELECT  ZZM_DESCRI FROM ZZM010 WHERE CN9.CN9_XTPMDL = ZZM_CODIGO AND ZZM010.D_E_L_E_T_ = ' ' AND CN9.D_E_L_E_T_ = ' ') AS "Modal. Lict"--@leonel.diniz Chamado:129507 
      
FROM 
    ZZ7010 ZZ7
 
    INNER JOIN ZZL010 ZZL
        ON ZZL_NUMERO = ZZ7_NUMERO
        AND ZZL.D_E_L_E_T_ = ' '

    INNER JOIN SA2010 SA2
        ON A2_COD = ZZ7_FORNEC
        AND A2_LOJA = ZZ7_LOJA
        AND SA2.D_E_L_E_T_ = ' '
                

    INNER JOIN CN9010 CN9--@leonel.diniz Chamado:129507
       ON CN9.CN9_NUMERO = SUBSTR(ZZ7.ZZ7_CONTRA, 0,15)--@leonel.diniz Chamado:129507
       AND SUBSTR(ZZ7_CONTRA, 16,3) = cn9_revisa--@leonel.diniz Chamado:129507-->N�O REMOVER ESTA LINHA   
       OR cn9_revisa is null--@leonel.diniz Chamado:129507-->N�O REMOVER ESTA LINHA NULL � DIFERENTE DE '   ' NA REVISAO
       AND  CN9.D_E_L_E_T_ = ' '--@leonel.diniz Chamado:129507   

WHERE
    ZZ7.D_E_L_E_T_ = ' '
    AND CN9.D_E_L_E_T_ = ' '
   
   
    