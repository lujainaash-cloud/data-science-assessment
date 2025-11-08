SELECT
  it.investor_id,
  s.sector_name,
  ROUND(it.no_of_shares * 100.0 / t.total_shares, 2) AS share_percentage
FROM investor_transactions AS it
JOIN (
  SELECT investor_id, SUM(no_of_shares) AS total_shares
  FROM investor_transactions
  GROUP BY investor_id
) AS t
  ON it.investor_id = t.investor_id
JOIN sectors AS s
  ON s.sector_id = it.sector_id
ORDER BY it.investor_id, s.sector_name;-- ADD YOUR SQL QUERY HERE
