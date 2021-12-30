package dbms;

import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.Deque;
import java.util.LinkedList;

import static java.lang.String.valueOf;

/**
 * Handles exceptions gracefully, providing a context-aware way to report exceptional behavior.
 *
 * Use {@link #execute(ExceptionalRunnable)} as an entry-point, then {@link #withContext(String, ExceptionalRunnable)}
 * will add user-driven context that may include also value of variables, which are usually absent from
 * the stack trace.
 */
public class ExceptionalExecutor {
    private static final Deque<String> itsContextStack = new LinkedList<>();

    /**
     * Executes the given runnable, handling any exception it may throw.
     */
    public static void execute(ExceptionalRunnable exceptionalRunnable) {
        try {
            exceptionalRunnable.run();
        } catch (SQLException sqlException) {
            onSQLException(sqlException);
        } catch (FileNotFoundException fileNotFoundException) {
            onFileNotFoundException(fileNotFoundException);
        } catch (IllegalArgumentException illegalArgumentException) {
            onIllegalArgumentException(illegalArgumentException);
        } catch (Exception exception) {
            // If execution reaches this point, we may not want to catch this exception,
            // so we decorate it as an Error and let it go.
            throw new Error(exception);
        } finally {
            itsContextStack.clear();
        }
    }

    /**
     * Wraps the given runnable in a new context.
     */
    public static void withContext(String context, ExceptionalRunnable exceptionalRunnable) throws Exception {
        itsContextStack.push(context);
        exceptionalRunnable.run();
        itsContextStack.pop();
    }

    private static void onSQLException(SQLException sqlException) {
        printHeader(sqlException);
        printEntry("SQL status code", sqlException.getSQLState());
        printEntry("SQL error code", valueOf(sqlException.getErrorCode()));
    }

    private static void onFileNotFoundException(FileNotFoundException fileNotFoundException) {
        printHeader(fileNotFoundException);
    }

    private static void onIllegalArgumentException(IllegalArgumentException illegalArgumentException) {
        printHeader(illegalArgumentException);
    }

    private static void printHeader(Exception e) {
        System.err.println("Unrecoverable error" + getContext() + ":");
        printEntry("Message", e.getMessage());
    }

    private static void printEntry(String key, String value) {
        System.err.format("- %s: %s%n", key, value);
    }

    private static String getContext() {
        String s = itsContextStack.peek();
        if (s == null || "".equals(s))
            return "";
        else
            return " " + s;
    }
}
