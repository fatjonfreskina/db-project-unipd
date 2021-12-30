package dbms;

import java.sql.SQLException;

import static dbms.ExceptionalExecutor.execute;
import static dbms.SQLConfiguration.withConnection;
import static dbms.SQLStatement.executeQueryThen;
import static dbms.SQLStatement.withStatement;

public class FindPerformancesOfSellers {
    final static String SQL_QUERY = "SELECT employee, SUM(price) as total_sales FROM Sale GROUP BY employee ORDER BY total_sales DESC;";

    public static void main(String[] args) {
        execute(FindPerformancesOfSellers::executeStatement);
    }

    private static void executeStatement() throws Exception {
        withConnection(() ->
            withStatement(() ->
                executeQueryThen(SQL_QUERY, FindPerformancesOfSellers::print)));
    }

    private static void print() throws SQLException {
        printHeader();
        while (SQLStatement.next()) {
            String employee = SQLStatement.getString("employee");
            String total_sales = SQLStatement.getString("total_sales");
            printLine(employee, total_sales);
        }
    }

    private static void printHeader() {
        printLine("Employee", "        Total Sales");
    }

    private static void printLine(String employee, String total_sales) {
        System.out.format("%12s%12s%n", employee, total_sales);
    }
}