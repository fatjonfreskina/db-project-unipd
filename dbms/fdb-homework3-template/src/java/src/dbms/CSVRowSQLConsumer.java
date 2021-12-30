package dbms;

/**
 * Represents a consumer of {@link CSVRow} which executes SQL-related code.
 */
public interface CSVRowSQLConsumer {
    void accept(CSVRow csvRow) throws Exception;
}
