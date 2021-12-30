package dbms;

import java.sql.SQLException;

import static dbms.ExceptionalExecutor.execute;
import static dbms.SQLConfiguration.withConnection;
import static dbms.SQLStatement.executeQueryThen;
import static dbms.SQLStatement.withStatement;
import static java.lang.Integer.parseInt;
import static java.lang.String.format;

public class FindAvailableCarsUnderKm {
    final static String SQL_QUERY = "SELECT * FROM car WHERE km < %d AND status = 'Available';";
    static int itsKmThreshold;

    public static void main(String[] args) {
        readArguments(args);
        execute(FindAvailableCarsUnderKm::executeStatement);
    }

    private static void readArguments(String[] args) {
        if (args.length < 1) {
            System.err.println("Expecting the number of kilometers, quitting..");
            System.exit(-1);
        }
        itsKmThreshold = parseInt(args[0]);
    }

    private static void executeStatement() throws Exception {
        withConnection(() ->
            withStatement(() ->
                executeQueryThen(getQuery(), FindAvailableCarsUnderKm::print)));
    }

    private static String getQuery() {
        return format(SQL_QUERY, itsKmThreshold);
    }

    private static void print() throws SQLException {
        printHeader();
        while (SQLStatement.next()) {
            String licensePlate = SQLStatement.getString("lp");
            String type = SQLStatement.getString("type");
            String category = SQLStatement.getString("category");
            double price = SQLStatement.getDouble("price");
            int km = SQLStatement.getInt("km");
            int year = SQLStatement.getInt("year");
            String name = SQLStatement.getString("name");
            String brand = SQLStatement.getString("brand");
            printLine(licensePlate, type, category, formatPrice(price), Integer.toString(km), Integer.toString(year), name, brand);
        }
    }

    private static String formatPrice(double price) {
        char euro = '\u20AC';
        return String.format("%.2f%c", price, euro);
    }

    private static void printHeader() {
        printLine("L. P.", "Type", "Category", "Price", "Km", "Year", "Name", "Brand");
    }

    private static void printLine(String licensePlate, String type, String category, String price, String km, String year, String name, String brand) {
        System.out.format("%10s%14s%16s%8s%10s%14s%6s%16s%n", licensePlate, brand, name, year, km, price, type, category);
    }
}
