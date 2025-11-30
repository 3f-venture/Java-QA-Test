package ui.pages;

import com.codeborne.selenide.SelenideElement;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.open;

/**
 * Пример Page Object для страницы логина.
 * Кандидат должен реализовать методы с TODO.
 */
public class LoginPage {

    // TODO: обновить селекторы под реально выбранный сайт
    private final SelenideElement usernameInput = $("#username");
    private final SelenideElement passwordInput = $("#password");
    private final SelenideElement loginButton   = $("#login-button");
    private final SelenideElement errorMessage  = $("#error-message");

    public LoginPage openPage() {
        open("/login"); // TODO: путь может быть другим, кандидат исправляет
        return this;
    }

    public LoginPage setUsername(String username) {
        // TODO: реализовать ввод логина
        usernameInput.setValue(username);
        return this;
    }

    public LoginPage setPassword(String password) {
        // TODO: реализовать ввод пароля
        passwordInput.setValue(password);
        return this;
    }

    public void submit() {
        // TODO: реализовать клик по кнопке логина
        loginButton.click();
    }

    public String getErrorMessageText() {
        // TODO: реализовать получение текста ошибки
        return errorMessage.getText();
    }

    // Можно добавить метод isLoggedIn() / isErrorVisible() по желанию.
}
