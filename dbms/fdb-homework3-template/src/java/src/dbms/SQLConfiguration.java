package dbms;

import java.io.FileReader;
import java.sql.*;
import java.util.Properties;
import java.util.regex.Pattern;

import static dbms.ExceptionalExecutor.withContext;
import static java.lang.Integer.parseInt;
import static java.lang.String.format;

/**
 * Abstracts SQL connection configuration.
 */
public class SQLConfiguration {
    private static final String PROPERTIES_FILE_NAME = "dbms.properties";
    private static String itsHost;
    private static String itsDatabase;
    private static int itsPort;
    private static String itsUsername;
    private static String itsPassword;
    private static Connection itsConnection;

    /**
     * Executes the given {@code action} after a connection has been successfully established.
     */
    public static void withConnection(ExceptionalRunnable action) throws Exception {
        try {
            withContext(
                "while establishing a connection to " + getDatabaseUrl(),
                () -> itsConnection = makeConnection());
            action.run();
        } finally {
            // If resource has been successfully instantiated...
            if (itsConnection != null) {
                // Once execution exists this scope, it will be eligible for garbage collection
                Connection c = itsConnection;
                // Ensure its reference is null before closing it
                itsConnection = null;
                // Close the resource
                withContext("while closing current connection", c::close);
            }
        }
    }

    private static Connection makeConnection() throws Exception {
        return DriverManager.getConnection(getDatabaseUrl(), itsUsername, itsPassword);
    }

    private static String getDatabaseUrl() throws Exception {
        loadConfiguration();
        final String URL = "jdbc:postgresql://%s:%d/%s";
        return format(URL, itsHost, itsPort, itsDatabase);
    }

    private static void loadConfiguration() throws Exception {
        Properties properties = new Properties();
        loadPropertiesFile(properties);
        readConfiguration(properties);
    }

    private static void readConfiguration(Properties properties) throws Exception {
        readHost(properties);
        readPort(properties);
        readDatabase(properties);
        readUsername(properties);
        readPassword(properties);
    }

    private static void loadPropertiesFile(Properties properties) throws Exception {
        withContext(
            "while opening configuration file \"" + PROPERTIES_FILE_NAME + "\"",
            () -> properties.load(new FileReader(PROPERTIES_FILE_NAME)));
    }

    private static void readHost(Properties properties) throws Exception {
        withContext("while reading \"host\" parameter from the configuration file", () -> {
            itsHost = properties.getProperty("host");
            if (!isHostName() && !isHostIpAddress())
                throw new IllegalArgumentException("The host must be an IP address or a hostname.");
        });
    }

    private static boolean isHostIpAddress() {
        final String HOST_IP_REGEX = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$";
        return Pattern.compile(HOST_IP_REGEX).matcher(itsHost).matches();
    }

    private static boolean isHostName() {
        final String HOST_NAME_REGEX = "^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\\-]*[a-zA-Z0-9])\\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\\-]*[A-Za-z0-9])$";
        return Pattern.compile(HOST_NAME_REGEX).matcher(itsHost).matches();
    }

    private static void readPort(Properties properties) throws Exception {
        withContext("while reading \"port\" parameter from the configuration file", () ->
            itsPort = parseInt(properties.getProperty("port"))
        );
    }

    private static void readDatabase(Properties properties) throws Exception {
        withContext("while reading \"database\" parameter from configuration file", () -> {
            itsDatabase = properties.getProperty("database");
            if (!isDatabaseValid())
                throw new IllegalArgumentException("The database name is not valid.");
        });
    }

    private static boolean isDatabaseValid() {
        final String DATABASE_NAME_REGEX = "^[0-9a-zA-Z$_]+$";
        return Pattern.compile(DATABASE_NAME_REGEX).matcher(itsDatabase).matches();
    }

    private static void readUsername(Properties properties) throws Exception {
        withContext("while reading \"user\" parameter from configuration file", () ->
            itsUsername = properties.getProperty("user")
        );
    }

    private static void readPassword(Properties properties) throws Exception {
        withContext("while reading \"pass\" parameter from configuration file", () ->
            itsPassword = properties.getProperty("pass")
        );
    }

    public static Statement createStatement() throws SQLException {
        return itsConnection.createStatement();
    }

    public static PreparedStatement prepareStatement(String sql) throws SQLException {
        return itsConnection.prepareStatement(sql);
    }
}
