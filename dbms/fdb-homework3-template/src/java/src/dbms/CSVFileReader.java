package dbms;

import java.io.BufferedReader;
import java.io.FileReader;

import static dbms.ExceptionalExecutor.withContext;

/**
 * Provides abstractions for reading CSV files.
 */
public class CSVFileReader {
    /**
     * Feeds {@code rowConsumer} an instance of {@link CSVRow} for each eligible row in the file
     * whose name is given by the {@code fileName} parameter.
     */
    public static void forEachRowInCSVFile(String fileName, CSVRowSQLConsumer rowConsumer) throws Exception {
        withContext("while opening CSV file " + fileName, () -> {
            try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
                withContext("while reading " + fileName, () -> {
                    String line;
                    while ((line = br.readLine()) != null)
                        CSVRow.parseThen(line, rowConsumer);
                });
            }
        });
    }
}
