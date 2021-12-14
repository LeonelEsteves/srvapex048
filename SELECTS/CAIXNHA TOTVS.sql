SELECT * FROM PROTHEUS_APEX.seu010
WHERE EU_NUM = '0000000946'


SELECT * FROM PROTHEUS_APEX.SE5010
WHERE E5_DATA BETWEEN '20210501' AND '20210531'
AND E5_ORIGEM = 'FINA550'

SELECT * FROM PROTHEUS_APEX.CT2010
WHERE CT2_LOTE = '008850'
AND CT2_DATA BETWEEN '20210610' AND '20210624'
AND CT2_LP = 572
and CT2_HIST LIKE '%0000000946%'
OR  CT2_HIST LIKE '%0000000949%'
OR CT2_HIST LIKE '%0000000967%'
--OR CT2_HIST LIKE '%0000000904%'
--AND CT2_ROTINA = 'FINA370'
--AND CT2_VALOR = 120
--AND CT2_AT01CR = 'SEU735'
AND D_E_L_E_T_ = ' '

delete from ct2010
WHERE CT2_LOTE = '008850'
AND CT2_DATA BETWEEN '20210610' AND '20210624'
AND CT2_LP = 572
and CT2_HIST LIKE '%0000000946%'
OR  CT2_HIST LIKE '%0000000949%'
OR CT2_HIST LIKE '%0000000967%'
--OR CT2_HIST LIKE '%0000000904%'
--AND CT2_ROTINA = 'FINA370'
--AND CT2_VALOR = 120
--AND CT2_AT01CR = 'SEU735'
AND D_E_L_E_T_ = ' '



SELECT * FROM CT5010
WHERE CT5_LANPAD = '572'

SELECT * FROM PROTHEUS_APEX.seu010
WHERE EU_NUM IN ('0000000946','0000000949','0000000967')

update seu010
set eu_baixa = eu_emissao
WHERE EU_NUM IN ('0000000946','0000000949','0000000967')

update seu010
set eu_baixa = '20210624'
WHERE EU_NUM IN ('0000000967')


update seu010
set  eu_emissao = '20210524'
WHERE EU_NUM IN ('0000000967')


commit


select * from CTJ010

