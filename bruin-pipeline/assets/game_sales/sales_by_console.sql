/* @bruin

name: game_sales.sales_by_console
type: bq.sql
description: |-
  Imported view: game_sales.Sales_by_console
  Extracted at: 2026-04-07T07:06:37Z
  Created at: 2026-03-29T05:08:25Z
  Last modified: 2026-03-29T05:08:25Z

materialization:
  type: view

columns:
  - name: console
    type: STRING
  - name: pct_sales
    type: FLOAT
  - name: year_sales
    type: FLOAT

@bruin */

SELECT console, ROUND(SUM(total_sales), 2) AS year_sales, 
    ROUND(SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) OVER (), 2) AS pct_sales
FROM `video-490706.game_sales.Videogame_sales`
GROUP BY console
ORDER BY year_sales DESC
