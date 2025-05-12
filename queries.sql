Create Database my_Universities


SELECT 
	Rank,
    Name,
    Country,
    ROUND(Overall_Score , 2) AS [Overall Score],
    ROUND([Student_Population], 2) AS [Student Population],
    ROUND([Students_to_Staff_Ratio], 2) AS [Students to Staff Ratio],
    ROUND(Teaching, 2) AS Teaching,
    ROUND([Research_Environment], 2) AS [Research Environment],
    ROUND([Research_Quality], 2) AS [Research Quality],
    ROUND([Industry_Impact], 2) AS [Industry Impact],
    ROUND([International_Outlook], 2) AS [International Outlook],
    ROUND([International_Students], 2) AS [International Students],
    ROUND([Female_Ratio], 2) AS [Female Ratio],
    ROUND([Male_Ratio], 2) AS [Male Ratio],
	Year,
	iso_alpha
FROM Universities
Order by Year,Rank ASC;



UPDATE Universities
SET 
    Overall_Score = ROUND(Overall_Score, 2),
    Student_Population = ROUND(Student_Population, 2),
    Students_to_Staff_Ratio = ROUND(Students_to_Staff_Ratio, 2),
    Teaching = ROUND(Teaching, 2),
    Research_Environment = ROUND(Research_Environment, 2),
    Research_Quality = ROUND(Research_Quality, 2),
    Industry_Impact = ROUND(Industry_Impact, 2),
    International_Outlook = ROUND(International_Outlook, 2),
    Female_Ratio = ROUND(Female_Ratio, 2),
    Male_Ratio = ROUND(Male_Ratio, 2);


	select * from Universities
	Where Country = 'Egypt' and Year > 2020
	Order by Year,Rank ASC



SELECT 
Name,
AVG(Overall_Score) AS Avg_Overall_Score
FROM 
    Universities
WHERE 
    Country = 'Egypt'
GROUP BY 
    Name
Order by Avg_Overall_Score desc;


select Rank,Name,Overall_Score,Teaching,Year
from Universities
where Teaching > 90
order by year desc , Teaching desc



SELECT TOP 5
    Name,
    Country,
    Rank,
	Overall_Score,
    Year
FROM 
    Universities
WHERE 
    Year = 2025
ORDER BY 
    Rank ASC;



WITH CountryAverages AS (
    SELECT 
        Country,
        AVG(Research_Quality) AS Avg_Research
    FROM 
        Universities
    GROUP BY 
        Country
)
SELECT 
    u.Name,
    u.Country,
    u.Research_Quality,
    ca.Avg_Research
FROM 
    Universities u
JOIN 
    CountryAverages ca ON u.Country = ca.Country
WHERE 
    u.Research_Quality > ca.Avg_Research
ORDER BY 
     u.Research_Quality DESC , u.Country;

