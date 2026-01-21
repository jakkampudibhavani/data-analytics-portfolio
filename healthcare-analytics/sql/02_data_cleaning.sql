USE HealthcareAnalytics;
GO

-- Create cleaned HRRP table
SELECT
    Facility_Name,
    Facility_ID,
    State,
    Measure_Name,

    CASE
        WHEN Number_of_Discharges IN ('N/A', 'Too Few to Report') THEN NULL
        ELSE TRY_CAST(Number_of_Discharges AS INT)
    END AS Number_of_Discharges,

    CASE
        WHEN Number_of_Readmissions IN ('N/A', 'Too Few to Report') THEN NULL
        ELSE TRY_CAST(Number_of_Readmissions AS INT)
    END AS Number_of_Readmissions,

    CASE
        WHEN Excess_Readmission_Ratio IN ('N/A') THEN NULL
        ELSE TRY_CAST(Excess_Readmission_Ratio AS DECIMAL(5,3))
    END AS Excess_Readmission_Ratio,

    CASE
        WHEN Predicted_Readmission_Rate IN ('N/A') THEN NULL
        ELSE TRY_CAST(Predicted_Readmission_Rate AS DECIMAL(6,3))
    END AS Predicted_Readmission_Rate,

    CASE
        WHEN Expected_Readmission_Rate IN ('N/A') THEN NULL
        ELSE TRY_CAST(Expected_Readmission_Rate AS DECIMAL(6,3))
    END AS Expected_Readmission_Rate,

    Start_Date,
    End_Date
INTO dbo.HRRP_clean
FROM dbo.HRRP_raw;
