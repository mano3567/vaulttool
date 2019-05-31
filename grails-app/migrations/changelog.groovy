databaseChangeLog = {

    changeSet(author: "jqvar (generated)", id: "1481027867461-1") {
        createTable(tableName: "meta_data") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "meta_dataPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "date_created", type: "datetime") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "CLOB")

            column(name: "file_name", type: "VARCHAR(255)")

            column(name: "last_updated", type: "datetime") {
                constraints(nullable: "false")
            }

            column(name: "secret_key", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "title", type: "VARCHAR(255)")
        }
    }

    changeSet(author: "jqvar (generated)", id: "1481027867461-2") {
        addUniqueConstraint(columnNames: "secret_key", constraintName: "UC_META_DATASECRET_KEY_COL", tableName: "meta_data")
    }

    changeSet(author: "jqvar (generated)", id: "1481104076212-1") {
        createTable(tableName: "user_data") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "user_dataPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "date_created", type: "datetime") {
                constraints(nullable: "false")
            }

            column(name: "eppn", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "last_updated", type: "datetime") {
                constraints(nullable: "false")
            }

            column(name: "secret_key", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "jqvar (generated)", id: "1481104076212-2") {
        addUniqueConstraint(columnNames: "eppn", constraintName: "UC_USER_DATAEPPN_COL", tableName: "user_data")
    }

    changeSet(author: "jqvar (generated)", id: "1481104076212-3") {
        addUniqueConstraint(columnNames: "secret_key", constraintName: "UC_USER_DATASECRET_KEY_COL", tableName: "user_data")
    }

    changeSet(author: "jqvar", id: "201904250915") {
        addColumn(tableName: "meta_data") {
            column(name: "updated_by", type: "varchar(255)") {
                constraints(nullable: true)
            }
        }
    }

    changeSet(author: "jqvar", id: "201905291231") {
        addColumn(tableName: "meta_data") {
            column(name: "last_access", type: "BIGINT") {
                constraints(nullable: true)
            }
        }
    }
}