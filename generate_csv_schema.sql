COPY (
  SELECT 'postgresql' AS dbms,
          t.table_catalog,
          t.table_schema,
          t.table_name,
          c.column_name,
          c.ordinal_position,
          CASE WHEN c.data_type = 'ARRAY'        THEN 'array[' || e.data_type || ']'
               WHEN c.data_type = 'USER-DEFINED' THEN c.udt_name
               ELSE c.data_type
               END,
          c.character_maximum_length,
          n.constraint_type,
          k2.table_schema,
          k2.table_name,
          k2.column_name
    FROM information_schema.tables t
    NATURAL LEFT JOIN information_schema.columns c
    LEFT JOIN(
      information_schema.key_column_usage k
      NATURAL JOIN information_schema.table_constraints n
      NATURAL LEFT JOIN information_schema.referential_constraints r
    )
    ON c.table_catalog=k.table_catalog
    AND c.table_schema=k.table_schema
    AND c.table_name=k.table_name
    AND c.column_name=k.column_name
    LEFT JOIN information_schema.key_column_usage k2
    ON k.position_in_unique_constraint=k2.ordinal_position
    AND r.unique_constraint_catalog=k2.constraint_catalog
    AND r.unique_constraint_schema=k2.constraint_schema
    AND r.unique_constraint_name=k2.constraint_name
    LEFT JOIN information_schema.element_types e
    ON ((c.table_catalog, c.table_schema, c.table_name, 'TABLE', c.dtd_identifier)
    = (e.object_catalog, e.object_schema, e.object_name, e.object_type, e.collection_type_identifier))
    WHERE t.TABLE_TYPE='BASE TABLE'
    AND t.table_schema
    NOT IN('information_schema','pg_catalog')
) TO '/tmp/result.csv' WITH CSV;
