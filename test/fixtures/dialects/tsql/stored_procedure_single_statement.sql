CREATE OR ALTER PROCEDURE DBO.SP_ECDC_CASES_INTER (@Apple [int], @Orange varchar(100))
AS
    INSERT INTO INTER.ECDC_CASES
    (
        [COUNTRY],
        [COUNTRY_CODE],
        [CONTINENT],
        [POPULATION],
        [INDICATOR],
        [WEEKLY_COUNT],
        [YEAR_WEEK],
        [WEEK_START],
        [WEEK_END],
        [RATE_14_DAY],
        [CUMULATIVE_COUNT],
        [SOURCE]
    )
    SELECT
        [COUNTRY],
        [COUNTRY_CODE],
        [CONTINENT],
        CAST([POPULATION] AS BIGINT) AS [POPULATION],
        [INDICATOR],
        CAST([WEEKLY_COUNT] AS BIGINT) AS [WEEKLY_COUNT],
        [YEAR_WEEK],
        CAST([dbo].[CONVERT_ISO_WEEK_TO_DATETIME](LEFT(YEAR_WEEK,4),RIGHT(YEAR_WEEK,2)) AS DATE) AS [WEEK_START],
        CAST([dbo].[WEEK_END]([dbo].[CONVERT_ISO_WEEK_TO_DATETIME](LEFT(YEAR_WEEK,4),RIGHT(YEAR_WEEK,2))) AS DATE ) AS [WEEK_END],
        CAST([RATE_14_DAY] AS FLOAT) AS [RATE_14_DAY],
        CAST([CUMULATIVE_COUNT] AS BIGINT) AS [CUMULATIVE_COUNT],
        [SOURCE]

    FROM 
       STAGE.ECDC_CASES
