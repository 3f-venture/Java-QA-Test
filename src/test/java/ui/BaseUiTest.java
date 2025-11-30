package ui;

import com.codeborne.selenide.Configuration;
import config.TestConfig;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;

import static com.codeborne.selenide.WebDriverRunner.closeWebDriver;

/**
 * Базовый класс для UI-тестов.
 * Кандидат может при необходимости расширить конфигурацию.
 */
public abstract class BaseUiTest {

    @BeforeAll
    public static void setUp() {
        Configuration.baseUrl = TestConfig.getOrDefault("base.url",
                "https://the-internet.herokuapp.com");
        Configuration.browser = "chrome";
        Configuration.startMaximized = true;
        // TODO: кандидат может добавить timeout, headless, запись видео и т.д.
    }

    @AfterAll
    public static void tearDown() {
        closeWebDriver();
    }
}
