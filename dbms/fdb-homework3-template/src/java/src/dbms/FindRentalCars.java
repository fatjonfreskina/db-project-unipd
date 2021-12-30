package dbms;

import java.sql.SQLException;

import static dbms.ExceptionalExecutor.execute;
import static dbms.SQLConfiguration.withConnection;
import static dbms.SQLStatement.executeQueryThen;
import static dbms.SQLStatement.withStatement;

public class FindRentalCars {
    final static String SQL_QUERY = "SELECT * FROM Rental ORDER BY end_date ASC;";

    public static void main(String[] args) {
        execute(FindRentalCars::executeStatement);
    }

    private static void executeStatement() throws Exception {
        withConnection(() ->
            withStatement(() ->
                executeQueryThen(SQL_QUERY, FindRentalCars::print)));
    }


    private static void print() throws SQLException {
        printHeader();
        while (SQLStatement.next()) {
            int id = SQLStatement.getInt("id");
            String licensePlate = SQLStatement.getString("lp");
            String start_date = SQLStatement.getDate("start_date").toString();
            String end_date = SQLStatement.getDate("end_date").toString();
            String deal_date = SQLStatement.getDate("deal_date").toString();
            double price = SQLStatement.getDouble("price");
            String employee = SQLStatement.getString("employee");
            String customer = SQLStatement.getString("customer");
            printLine(Integer.toString(id), licensePlate, start_date, end_date, deal_date, formatPrice(price), employee, customer);
        }
    }

    private static String formatPrice(double price) {
        char euro = '\u20AC';
        return String.format("%.2f%c", price, euro);
    }

    private static void printHeader() {
        printLine("id", "L. P.", "Start Date", "End Date", "Deal Date", "Price", "Employee", "Customer");
    }

    private static void printLine(String id, String licensePlate, String start_date, String end_date, String deal_date, String price, String employee, String customer) {
        System.out.format("%10s %9s   %10s   %9s   %12s%13s  %12s   %16s%n", id, licensePlate, start_date, end_date, deal_date, price, employee, customer);
    }
}
