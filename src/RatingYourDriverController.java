import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.stage.Stage;

public class RatingYourDriverController {
    @FXML
    private ComboBox<Integer> ratingComboBox;
    
    @FXML
    private Button rateButton;

    @FXML
    private Button xButton;
    
    private String riderId;

    public void setRiderId(String riderId) {
        this.riderId = riderId;
        System.out.println("✅ Rider ID set for rating: " + riderId);
    }

    @FXML
    void initialize() {
        // Initialize rating ComboBox with values 1-5
        ratingComboBox.setItems(FXCollections.observableArrayList(1, 2, 3, 4, 5));
        ratingComboBox.setValue(5); // Default value
    }

    private void navigateToHomepage(ActionEvent event) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("IRMhomepage.fxml"));
            Parent root = loader.load();
            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.show();
            stage.centerOnScreen();
        } catch (Exception e) {
            System.out.println("❌ Error loading IRMhomepage.fxml: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @FXML
    void handleSubmitRating(ActionEvent event) {
        if (riderId != null && !riderId.isEmpty()) {
            Integer rating = ratingComboBox.getValue();
            if (rating != null) {
                // Submit the rating
                DatabaseHandler.updateRiderRating(riderId, rating);
                
                // Show confirmation
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Rating Submitted");
                alert.setContentText("Thank you for rating your driver!");
                alert.showAndWait();
                
                // Navigate back to homepage
                navigateToHomepage(event);
            } else {
                System.out.println("❌ Please select a rating");
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error");
                alert.setContentText("Please select a rating before submitting.");
                alert.showAndWait();
            }
        } else {
            System.out.println("❌ No Rider ID available for rating update");
        }
    }

    @FXML
    private void handleXButton(ActionEvent event) {
        // Simply navigate back to homepage without submitting rating
        navigateToHomepage(event);
    }
}