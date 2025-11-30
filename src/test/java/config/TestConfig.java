package config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Простой конфиг для чтения значений из test-config.properties.
 * Кандидат может дописать свои параметры.
 */
public class TestConfig {

    private static final Properties properties = new Properties();

    static {
        try (InputStream is = TestConfig.class
                .getClassLoader()
                .getResourceAsStream("test-config.properties")) {

            if (is != null) {
                properties.load(is);
            } else {
                System.err.println("test-config.properties not found in resources");
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to load test-config.properties", e);
        }
    }

    public static String get(String key) {
        return properties.getProperty(key);
    }

    public static String getOrDefault(String key, String defaultValue) {
        return properties.getProperty(key, defaultValue);
    }
}
