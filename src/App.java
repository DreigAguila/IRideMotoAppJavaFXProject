import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class App extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{

        //as a main page
        Parent root = FXMLLoader.load(getClass().getResource("iridemotologinpage.fxml"));

        //title of main page
        primaryStage.setTitle("IRideMoto App");

        //window size
        primaryStage.setScene(new Scene(root, 450, 700));

        primaryStage.setResizable(false);

        //display 
        primaryStage.show();
    }


    public static void main(String[] args) {
        launch(args);
    }
}