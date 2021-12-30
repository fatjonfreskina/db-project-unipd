package dbms;

/**
 * Represents an action that may throw an exception.
 */
public interface ExceptionalRunnable {
    void run() throws Exception;
}
