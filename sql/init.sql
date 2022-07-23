DELETE FROM tenant WHERE id > 100;
DELETE FROM visit_history WHERE created_at >= '1654041600';
UPDATE id_generator SET id=2678400000 WHERE stub='a';
ALTER TABLE id_generator AUTO_INCREMENT=2678400000;

drop index tenant_id_idx on visit_history;
alter table visit_history add index tenant_competition_created_at_idx (tenant_id,competition_id,created_at);