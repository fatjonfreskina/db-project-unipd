package dbms;

import static dbms.CSVFileReader.forEachRowInCSVFile;
import static dbms.ExceptionalExecutor.withContext;
import static dbms.ExceptionalExecutor.execute;
import static dbms.SQLConfiguration.withConnection;
import static dbms.SQLStatement.withPreparedStatement;

public class InsertCustomerCars {
    private final static int LP_INDEX = 1;
    private final static int YEAR_INDEX = 2;
    private final static int NAME_INDEX = 3;
    private final static int BRAND_INDEX = 4;
    private final static int CUSTOMER_INDEX = 5;
    private final static String SQL_QUERY = "INSERT INTO CustomerCar (lp, year, name, brand, customer) VALUES (?, ?, ?, ?, ?);";
    private static String itsFilePath;

    public static void main(String[] args) {
        readArguments(args);
        execute(InsertCustomerCars::insertValues);
    }

    private static void readArguments(String[] args) {
        if (args.length < 1) {
            System.err.println("Expecting file path of the input file, quitting..");
            System.exit(-1);
        }
        itsFilePath = args[0];
    }

    private static void insertValues() throws Exception {
        withConnection(() -> withPreparedStatement(SQL_QUERY, InsertCustomerCars::insert));
    }

    private static void insert() throws Exception {
        long tic = System.nanoTime();
        forEachRowInCSVFile(itsFilePath, InsertCustomerCars::insertRow);
        long toc = System.nanoTime();
        double millis = (toc - tic) * 1E-6;
        printSuccessfulMessage(millis);
    }

    private static void insertRow(CSVRow csvRow) throws Exception {
        String licensePlate = csvRow.readStringAt(LP_INDEX - 1);
        SQLStatement.setString(LP_INDEX, licensePlate);
        SQLStatement.setInt(YEAR_INDEX, csvRow.readIntAt(YEAR_INDEX - 1));
        SQLStatement.setString(NAME_INDEX, csvRow.readStringAt(NAME_INDEX - 1));
        SQLStatement.setString(BRAND_INDEX, csvRow.readStringAt(BRAND_INDEX - 1));
        String customer = csvRow.readStringAt(CUSTOMER_INDEX - 1);
        SQLStatement.setString(CUSTOMER_INDEX, customer);
        withContext(
            "while inserting license plate " + licensePlate + " for customer " + customer,
            SQLStatement::execute);
    }

    private static void printSuccessfulMessage(double millis) {
        System.out.format("%d rows successfully inserted in %.2f ms\n", SQLStatement.getExecutionCount(), millis);
    }
}
