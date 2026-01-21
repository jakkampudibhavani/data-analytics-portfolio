USE HealthcareAnalytics;
GO

-- Analysis 1: Condition-level excess readmission ratio
SELECT
    Measure_Name,
    ROUND(AVG(Excess_Readmission_Ratio), 3) AS Avg_Excess_Readmission_Ratio,
    COUNT(*) AS Records_Count
FROM dbo.HRRP_clean
WHERE Excess_Readmission_Ratio IS NOT NULL
GROUP BY Measure_Name
ORDER BY Avg_Excess_Readmission_Ratio DESC;


-- Analysis 2: State-level performance above CMS benchmark
SELECT
    State,
    ROUND(AVG(Excess_Readmission_Ratio), 3) AS Avg_Excess_Readmission_Ratio,
    COUNT(*) AS Records_Count
FROM dbo.HRRP_clean
WHERE Excess_Readmission_Ratio IS NOT NULL
GROUP BY State
HAVING AVG(Excess_Readmission_Ratio) > 1
ORDER BY Avg_Excess_Readmission_Ratio DESC;
