package vue;

import javafx.application.Application;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.control.Label;

public class PremiereApplication extends Application {

    public void start(Stage stage) {
        VBox root = new VBox(10);
        Label labelHello = new Label("Hello");
        root.getChildren().add(labelHello);
        Label labelHelloBis = new Label("Hello JavaFX");
        root.getChildren().add(labelHelloBis);
        Scene scene = new Scene(root, 300, 80);
        stage.setScene(scene);
        stage.setTitle("Hello JavaFX");
        stage.show();
    }

    public static void main(String[] args) {
        Application.launch();
    }

}