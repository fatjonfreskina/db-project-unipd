package dbms;

/**
 * Represents a row in a CSV file.
 */
public class CSVRow {
    private final String[] itsFields;

    public CSVRow(String line) {
        itsFields = line.split(",");
    }

    public static void parseThen(String line, CSVRowSQLConsumer rowConsumer) throws Exception {
        if (isNotComment(line))
            rowConsumer.accept(new CSVRow(line));
    }

    private static boolean isNotComment(String line) {
        return !line.startsWith("#");
    }

    public int readIntAt(int fieldIndex) {
        return Integer.parseInt(itsFields[fieldIndex]);
    }

    public String readStringAt(int fieldIndex) {
        return itsFields[fieldIndex];
    }
}
