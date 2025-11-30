package api;

import io.restassured.http.ContentType;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.*;

/**
 * Кандидат реализует тесты на реальное API (например, reqres.in).
 */
public class UserApiTests extends BaseApiTest {

    @Test
    @DisplayName("Получение списка пользователей")
    void getUsersListTest() {
        // TODO: дописать проверки статуса и структуры ответа
        given()
                .when()
                .get("/api/users?page=2")
                .then()
                .statusCode(200)
                .body("data", notNullValue());
    }

    @Test
    @DisplayName("Создание пользователя")
    void createUserTest() {
        // TODO: реализовать создание пользователя и проверки
        String requestBody = """
                {
                  "name": "morpheus",
                  "job": "leader"
                }
                """;

        given()
                .contentType(ContentType.JSON)
                .body(requestBody)
                .when()
                .post("/api/users")
                .then()
                .statusCode(201)
                .body("name", equalTo("morpheus"))
                .body("id", notNullValue());
    }

    @Test
    @DisplayName("Получение несуществующего пользователя (негативный тест)")
    void getNonExistingUserTest() {
        // TODO: реализовать негативный сценарий
        given()
                .when()
                .get("/api/users/23") // в reqres.in это обычно 404 или пустой
                .then()
                .statusCode(anyOf(is(404), is(200))); // кандидат должен уточнить и поправить
    }
}
