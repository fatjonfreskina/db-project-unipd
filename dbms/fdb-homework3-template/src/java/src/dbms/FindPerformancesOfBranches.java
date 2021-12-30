package dbms;

import java.sql.SQLException;

import static dbms.ExceptionalExecutor.execute;
import static dbms.SQLConfiguration.withConnection;
import static dbms.SQLStatement.executeQueryThen;
import static dbms.SQLStatement.withStatement;

public class FindPerformancesOfBranches {
    final static String SQL_QUERY = "SELECT branchid, SUM(total_sales) AS total_sales_branch FROM \n" +
        "    (SELECT employee, SUM(price) AS total_sales\n" +
        "    FROM Sale\n" +
        "    GROUP BY employee\n" +
        "    ORDER BY total_sales DESC) AS R INNER JOIN Employee AS P\n" +
        "    ON R.employee = P.tc\n" +
        "GROUP BY branchid \n" +
        "ORDER BY total_sales_branch DESC;";

    public static void main(String[] args) {
        execute(FindPerformancesOfBranches::executeStatement);
    }

    private static void executeStatement() throws Exception {
        withConnection(() ->
            withStatement(() ->
                executeQueryThen(SQL_QUERY, FindPerformancesOfBranches::print)));
    }

    private static void print() throws SQLException {
        printHeader();
        while (SQLStatement.next()) {
            String employee = SQLStatement.getString("branchid");
            String total_sales = SQLStatement.getString("total_sales_branch");
            printLine(employee, total_sales);
        }
    }

    private static void printHeader() {
        printLine("Branch Id", "    Total Sales of Branch");
    }

    private static void printLine(String branch_id, String total_sales_branch) {
        System.out.format("%12s%12s%n", branch_id, total_sales_branch);
    }
}
