package dbms;

import java.sql.*;

import static dbms.ExceptionalExecutor.withContext;

/**
 * Abstracts SQL statements.
 */
public class SQLStatement {
    private static Statement itsStatement;
    private static ResultSet itsResultSet;
    private static PreparedStatement itsPreparedStatement;
    private static int itsExecutionCount;

    /**
     * Executes the given {@code action} after a {@link PreparedStatement} has been successfully built
     * by the SQL code in {@code sql}.
     */
    public static void withPreparedStatement(String sql, ExceptionalRunnable action) throws Exception {
        try {
            itsPreparedStatement = SQLConfiguration.prepareStatement(sql);
            action.run();
        } finally {
            // If resource has been successfully instantiated...
            if (itsPreparedStatement != null) {
                // Once execution exists this scope, it will be eligible for garbage collection
                PreparedStatement ps = itsPreparedStatement;
                // Ensure its reference is null before closing it
                itsPreparedStatement = null;
                // Close the resource
                withContext("while closing prepared statement", ps::close);
            }
        }
    }

    /**
     * Executes the given {@code action} after a {@link Statement} has been successfully created.
     */
    public static void withStatement(ExceptionalRunnable action) throws Exception {
        try {
            itsStatement = SQLConfiguration.createStatement();
            action.run();
        } finally {
            // If resource has been successfully instantiated...
            if (itsStatement != null) {
                // Once execution exists this scope, it will be eligible for garbage collection
                Statement s = itsStatement;
                // Ensure its reference is null before closing it
                itsStatement = null;
                // Close the resource
                withContext("while closing statement", s::close);
            }
        }
    }

    /**
     * Executes the given {@code action} after a {@link ResultSet} has been successfully returned after
     * the given {@code query} has been executed.
     */
    public static void executeQueryThen(String query, ExceptionalRunnable action) throws Exception {
        try {
            withContext(
                "while executing query \"" + query + "\"",
                () -> itsResultSet = itsStatement.executeQuery(query));
            action.run();
        } finally {
            // If resource has been successfully instantiated...
            if (itsResultSet != null) {
                // Once execution exists this scope, it will be eligible for garbage collection
                ResultSet rs = itsResultSet;
                // Ensure its reference is null before closing it
                itsResultSet = null;
                // Close the resource
                withContext("while closing result set", rs::close);
            }
        }
    }

    public static boolean next() throws SQLException {
        return itsResultSet.next();
    }

    public static String getString(String columnLabel) throws SQLException {
        return itsResultSet.getString(columnLabel);
    }

    public static double getDouble(String columnLabel) throws SQLException {
        return itsResultSet.getDouble(columnLabel);
    }

    public static int getInt(String columnLabel) throws SQLException {
        return itsResultSet.getInt(columnLabel);
    }

    public static Date getDate(String columnLabel) throws SQLException {
        return itsResultSet.getDate(columnLabel);
    }

    public static void setString(int parameterIndex, String value) throws SQLException {
        itsPreparedStatement.setString(parameterIndex, value);
    }

    public static void setInt(int parameterIndex, int value) throws SQLException {
        itsPreparedStatement.setInt(parameterIndex, value);
    }

    public static void execute() throws SQLException {
        itsPreparedStatement.execute();
        itsExecutionCount++;
    }

    public static int getExecutionCount() {
        return itsExecutionCount;
    }
}
