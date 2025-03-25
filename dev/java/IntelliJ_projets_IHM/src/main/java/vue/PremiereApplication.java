package vue;

import java.io.File;

import javafx.application.Application;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.control.Label;

public class PremiereApplication extends Application {

    public void start(Stage stage) {

        File css = new File("css" + File.separator + "premierStyles.css");

        VBox root = new VBox(10);
        root.getStyleClass().add("root-container");

        Label labelHello = new Label("Hello");
        labelHello.getStyleClass().add("label-primary");
        root.getChildren().add(labelHello);

        Label labelHelloBis = new Label("Hello JavaFX");
        labelHelloBis.getStyleClass().add("label-secondary");
        root.getChildren().add(labelHelloBis);

        Scene scene = new Scene(root, 300, 80);

        scene.getStylesheets().add(css.toURI().toString());

        stage.setScene(scene);
        stage.setTitle("Hello JavaFX");
        stage.show();
    }

    public static void main(String[] args) {
        Application.launch();
    }

}