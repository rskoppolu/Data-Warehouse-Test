
/*
Please execute the script all together.
Temp tables will be created on the go and output would display int the result grid.

NOTE: I have used Pivot table, this can also be done using dynamic query, but for simplicity I have used PIVOT table.
*/
IF OBJECT_ID('tempdb..#session_events') IS NOT NULL DROP TABLE #session_events;
GO

---Creating Temp tables.
CREATE TABLE #session_events(
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[user_id] [varchar](200) NULL,
	[session_id] [varchar](2000) NULL,
	[event_name] [varchar](2000) NULL,
	[event_duration] [int] NULL,
	[at] [datetime] NULL,
)

IF OBJECT_ID('tempdb..#screen_flows') IS NOT NULL DROP TABLE #screen_flows;
GO
CREATE TABLE #screen_flows(
	[session_id] [varchar](2000) NULL,
	[at] [datetime] NULL,
	[name_1] [varchar](2000) NULL,
	[duration_1] [int] NULL,
	[event_count_1] [int] NULL,
	[name_2] [varchar](2000) NULL,
	[duration_2] [int] NULL,
	[event_count_2] [int] NULL,
	[name_3] [varchar](2000) NULL,
	[duration_3] [int] NULL,
	[event_count_3] [int] NULL
) ON [PRIMARY]

--Inserting data into temp tables.
INSERT #session_events ( [user_id], [session_id], [event_name], [event_duration], [at]) VALUES ( N'user-1652', N'4585b8', N'article_read', 5, CAST(N'2018-02-28T12:00:00.027' AS DateTime))
GO
INSERT #session_events ( [user_id], [session_id], [event_name], [event_duration], [at]) VALUES ( N'user-1653', N'6585b8', N'article_share', 10, CAST(N'2018-02-28T20:28:15.027' AS DateTime))
GO
INSERT #session_events ( [user_id], [session_id], [event_name], [event_duration], [at]) VALUES ( N'user-1652', N'4585b8', N'article_share', 2, CAST(N'2018-02-28T12:00:00.027' AS DateTime))
GO
INSERT #session_events ( [user_id], [session_id], [event_name], [event_duration], [at]) VALUES ( N'user-1652', N'4585b8', N'article_liked', 3, CAST(N'2018-02-28T12:00:00.027' AS DateTime))
GO
INSERT #session_events ( [user_id], [session_id], [event_name], [event_duration], [at]) VALUES ( N'user-1653', N'6585b8', N'article_liked', 2, CAST(N'2018-02-28T20:28:15.027' AS DateTime))
GO
INSERT #session_events ( [user_id], [session_id], [event_name], [event_duration], [at]) VALUES ( N'user-1653', N'6585b8', N'article_read', 23, CAST(N'2018-02-28T20:28:15.027' AS DateTime))
GO



---Common table expression to hold the initial query result
with cte AS
(
	SELECT 
		session_id,
		at,
		event_name, 
		event_duration, 
		eventcount = count(event_name)  OVER ( PARTITION BY session_id, event_name ),
		rwn= DENSE_RANK() OVER ( PARTITION BY session_id  ORDER BY event_name ) 
	FROM #session_events
)

----Inserting data to session_flows table.
INSERT INTO #screen_flows(
	[session_id],
	[at],
	[name_1],
	[duration_1],
	[event_count_1],
	[name_2],
	[duration_2],
	[event_count_2],
	[name_3],
	[duration_3],
	[event_count_3] )
	SELECT 
		session_id,
		at,
		MAX(article_read) AS Article_read,
		sum(qarticle_read) AS Article_read_Duration,
		sum(particle_read) AS Article_read_count,
		MAX(article_liked) AS Article_liked,
		sum(qarticle_liked) AS Article_liked_duration,
		sum(particle_liked) AS Article_liked_count,
		MAX(article_share) AS Article_share, 
		sum(qarticle_share) AS Article_Share_duration, 
		sum(particle_share) AS Article_share_count
		FROM
		 (
			SELECT 
				session_id,
			    at, 
				event_name, 
				event_duration, 
				eventcount,
				'p'+ event_name AS event_name1,
				'q'+event_name AS event_name2
			 FROM cte
		  ) AS tbl
		pivot (
		MAX(event_name) FOR event_name in ([article_liked],[article_read],[article_share]))
		AS pvt
		PIVOT 
		(
		MAX(eventcount) FOR event_name1 in (particle_liked,particle_read,particle_share)
		) AS pvt2
		PIVOT 
		(
		SUM(event_duration) FOR event_name2 in (qarticle_liked,qarticle_read,qarticle_share)
		) AS pvt3
		GROUP BY 
		session_id, 
		at

SELECT 'SESSION EVENTS'
SELECT * FROM #session_events 
	ORDER BY session_id;
SELECT 'Aggregated event summary'
SELECT 
	event_name, 
	Count(event_name) AS EventCount, 
	SUM(event_duration) AS EventDuration 
	FROM #session_events 
	GROUP BY event_name;
SELECT 'Event Journey flow'
SELECT * FROM #screen_flows 
	ORDER BY session_id;

IF OBJECT_ID('tempdb..#session_events') IS NOT NULL DROP TABLE #session_events;
GO
IF OBJECT_ID('tempdb..#screen_flows') IS NOT NULL DROP TABLE #screen_flows;
GO