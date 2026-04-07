/* @bruin

name: game_sales.sales_by_year
type: bq.sql
description: |-
  Imported view: game_sales.Sales_by_year
  Extracted at: 2026-04-07T07:06:37Z
  Created at: 2026-03-29T05:08:25Z
  Last modified: 2026-03-29T05:08:25Z

materialization:
  type: view

columns:
  - name: release_year
    type: INTEGER
  - name: year_sales
    type: FLOAT

@bruin */

SELECT release_year, ROUND(SUM(total_sales), 2) AS year_sales
FROM `video-490706.game_sales.Videogame_sales`
GROUP BY release_year ORDER BY release_year
