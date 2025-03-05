import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;





public class UBookingFinalController {

    @FXML
    private Button applyButton;

    @FXML
    private Button endRideButton;

    @FXML
    private TextField enterTimeTextfield;

    @FXML
    private TextField entervoucherTextfield;

    @FXML
    private Label faredisplay;

    @FXML
    private Button payButton;

    @FXML
    private Button returntobookingButton;

    @FXML
    private Label rideridInfo;

    @FXML
    private Label riderNameInfo;

    @FXML
    private Label riderLocationInfo;

    @FXML
    private Label riderPhoneInfo;

    @FXML
    private Label riderPlateInfo;

    @FXML
    private Label riderVehicleInfo;

    @FXML
    private ComboBox<String> selectPaymentCBox;

    @FXML
    private Button startRideButton;

    @FXML
    private Label estimatedTimeLabel;

    @FXML
    private Label pickupLocationLabel;

    @FXML
    private Label dropOffLocationLabel;

 

    private String paymentId;
    private String currentRiderId;
    
    private Stage stage;
    private Scene scene;
    private Parent root;

    private ObservableList<Rider> riderList = FXCollections.observableArrayList(); 
    private static final String url = "jdbc:mysql://localhost:3306/moveit"; // Replace with your actual database URL
    private static final String user = "root"; // Replace with your actual database username
    private static final String password = "password"; // Replace with your actual database password
    private boolean isPaid = false; // Flag to track if payment has been made
    private double fare = 0.0; // Store the fare to avoid recalculating

    // List to store rider data

    @FXML
    public void initialize() {
        // Set the options for payment type (this seems unrelated to the rider data)
        selectPaymentCBox.setItems(FXCollections.observableArrayList("Gcash", "Card", "Cash"));

        // Load random rider data
        loadRandomRiderData();

        // Add listener to enterTimeTextfield to calculate ETA when time is entered
        enterTimeTextfield.setOnAction(this::calculateETA);
    }

    private void loadRandomRiderData() {
        Rider rider = DatabaseHandler.getRandomRider();
    if (rider != null) {
        // Store the rider ID
        this.currentRiderId = rider.getRiderid();
        // Update labels with rider information
        rideridInfo.setText(rider.getRiderid());
        riderNameInfo.setText(rider.getRiderfullname());
        riderLocationInfo.setText(rider.getCity());
        riderPhoneInfo.setText(rider.getRidercontactnumber());
        riderPlateInfo.setText(rider.getPlatenumber());
        riderVehicleInfo.setText(rider.getVehicle());

        System.out.println("✅ Random Rider assigned: " + currentRiderId);
        System.out.println("✅ Rider details updated in labels");
    } else {
        showAlert(Alert.AlertType.ERROR, "Error", "No riders found in the database.");
    }
}

    @FXML
void handleBackButton(ActionEvent event) throws IOException {
    // Show confirmation alert
    Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
    alert.setTitle("Confirm Navigation");
    alert.setHeaderText("You are about to leave this page");
    alert.setContentText("If you go back, you will lose your current rider assignment. Do you want to continue?");

    // Wait for user response
    if (alert.showAndWait().get().getButtonData().isDefaultButton()) {
        // User clicked OK, proceed with navigation
        FXMLLoader loader = new FXMLLoader(getClass().getResource("locationPage.fxml"));
        Parent root = loader.load();

        stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        Scene scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }
    // If user clicked Cancel, nothing happens and they stay on current page
}

    public void setPickupLocation(String pickupLocation) {
        pickupLocationLabel.setText(pickupLocation);
    }

    public void setDropOffLocation(String dropOffLocation) {
        dropOffLocationLabel.setText(dropOffLocation);
    }

    public void setFare(double fare) {
        this.fare = fare;
        faredisplay.setText(String.format("₱%.2f", fare));
    }

    @FXML
    void calculateETA(ActionEvent event) {
    String origin = pickupLocationLabel.getText(); // Use actual origin
    String destination = dropOffLocationLabel.getText(); // Use actual destination

    String query = "SELECT distance_km FROM fare_matrix WHERE origin = ? AND destination = ?";

    try (Connection conn = DatabaseHandler.getDBConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {

        stmt.setString(1, origin);
        stmt.setString(2, destination);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            double distanceKm = rs.getDouble("distance_km");
            double etaMinutes = distanceKm * 1.5;

            // Parse the time input
            String timeInput = enterTimeTextfield.getText().trim();
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("h:mm a");
            try {
                LocalTime time = LocalTime.parse(timeInput, timeFormatter);
                LocalTime etaTime = time.plusMinutes((long) etaMinutes);
                String etaTimeFormatted = etaTime.format(timeFormatter);
                String etaMessage = String.format("ETA: %s (%.2f minutes)", etaTimeFormatted, etaMinutes);

                // Debugging: Print the calculated ETA
                System.out.println("✔ Calculated ETA: " + etaMessage);

                // Update the estimatedTimeLabel using Platform.runLater()
                Platform.runLater(() -> {
                    estimatedTimeLabel.setText(etaMessage);
                    System.out.println("✔ Estimated Time Label updated to: " + estimatedTimeLabel.getText());
                });

            } catch (DateTimeParseException e) {
                showAlert(Alert.AlertType.ERROR, "Error", "Invalid time format. Please use the format 'h:mm a' (e.g. 1:30 PM/AM).");
            }
        } else {
            estimatedTimeLabel.setText("No route found.");
        }

    } catch (SQLException e) {
        e.printStackTrace();
        showAlert(Alert.AlertType.ERROR, "Error", "An error occurred while calculating the ETA.");
    }
}

    @FXML
    void handleStartRideButton(ActionEvent event) {
        // Set the current time as the start time
        LocalTime currentTime = LocalTime.now();
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("h:mm a");
        enterTimeTextfield.setText(currentTime.format(timeFormatter));

        calculateETA(event);
    }

    @FXML
    void handleEndRideButton(ActionEvent event) throws IOException {
    System.out.println("isPaid value: " + isPaid);
    if (!isPaid) {
        showAlert(Alert.AlertType.ERROR, "Payment Required", "Please complete the payment before ending the ride.");
        return;
    }

    String currentCustomerId = UserSession.getInstance().getCustomerId();
    System.out.println("Customer ID: " + currentCustomerId);
    if (currentCustomerId == null || currentCustomerId.isEmpty()) {
        showAlert(Alert.AlertType.ERROR, "Error", "No logged-in customer found.");
        return;
    }

    String pickupTimeInput = enterTimeTextfield.getText().trim();
    System.out.println("Pickup Time Input: " + pickupTimeInput);
    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("h:mm a");

    try {
        LocalTime pickupTime = LocalTime.parse(pickupTimeInput, timeFormatter);
        LocalTime endTime = LocalTime.now();
        LocalDateTime endDateTime = LocalDateTime.of(LocalDate.now(), endTime);

        System.out.println("Fare display: " + faredisplay.getText());
        double amountPaid = Double.parseDouble(faredisplay.getText().replace("₱", "").trim());

        // In handleEndRideButton method, replace the storeBooking section:
        System.out.println("Storing booking...");
        String assignedRiderId = DatabaseHandler.storeBooking(currentCustomerId, pickupTime, endDateTime, amountPaid, paymentId);

        if (assignedRiderId != null) {
            showAlert(Alert.AlertType.INFORMATION, "Ride Ended", "The ride has ended. Thank you for using our service!");

            // Open rating window
            FXMLLoader loader = new FXMLLoader(getClass().getResource("ratingyourDriver.fxml"));
            Parent ratingRoot = loader.load();

            // Pass the correct rider ID to the rating controller
            RatingYourDriverController ratingController = loader.getController();
            ratingController.setRiderId(currentRiderId); // Use the stored rider ID
            System.out.println("✅ Passing Rider ID for rating: " + currentRiderId);

            Stage ratingStage = new Stage();
            ratingStage.setScene(new Scene(ratingRoot));
            ratingStage.setTitle("Rate Your Driver");
            ratingStage.show();
        } else {
            showAlert(Alert.AlertType.ERROR, "Error", "Failed to complete the booking.");
        }

    } catch (DateTimeParseException e) {
        showAlert(Alert.AlertType.ERROR, "Error", "Invalid time format. Please use 'h:mm a' (e.g., 1:30 PM/AM).");
    } catch (NumberFormatException e) {
        showAlert(Alert.AlertType.ERROR, "Error", "Invalid fare amount. Please enter a valid price.");
    }
}

    @FXML
void handlePayButton(ActionEvent event) {
    String paymentMethod = selectPaymentCBox.getValue();
    if (paymentMethod == null || paymentMethod.isEmpty()) {
        showAlert(Alert.AlertType.ERROR, "Error", "Please select a payment method first.");
        return;
    }

    String fareText = faredisplay.getText().replace("₱", "").trim();
    if (fareText.isEmpty()) {
        showAlert(Alert.AlertType.ERROR, "Error", "Fare amount is missing.");
        return;
    }

    try {
        double fareAmount = Double.parseDouble(fareText);
        if (fareAmount <= 0) {
            showAlert(Alert.AlertType.ERROR, "Error", "Invalid fare amount.");
            return;
        }

        String usedPromo = entervoucherTextfield.getText().trim();
        String paymentId = DatabaseHandler.generatePaymentId(); // Generate PaymentID first

        // Insert into paymentmethod table
        String insertPaymentQuery = "INSERT INTO paymentmethod (PaymentID, PaymentMethod, Promo) VALUES (?, ?, ?)";
        
        try (Connection conn = DatabaseHandler.getDBConnection();
             PreparedStatement stmt = conn.prepareStatement(insertPaymentQuery)) {
            
            stmt.setString(1, paymentId);
            stmt.setString(2, paymentMethod);
            stmt.setString(3, usedPromo.isEmpty() ? null : usedPromo);
            
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Store the payment ID and set isPaid flag
                this.paymentId = paymentId;
                this.isPaid = true;

                showAlert(Alert.AlertType.INFORMATION, "Payment Successful",
                    "Payment ID: " + paymentId + "\nAmount: ₱" + String.format("%.2f", fareAmount));

                System.out.println("✅ Payment Successful!");
                System.out.println("✅ Payment ID: " + paymentId);
                System.out.println("✅ Amount: ₱" + fareAmount);
                System.out.println("✅ Method: " + paymentMethod);
                System.out.println("✅ isPaid set to: " + isPaid);
                
                if (!usedPromo.isEmpty()) {
                    System.out.println("✅ Promo Used: " + usedPromo);
                }

                // Enable the End Ride button after successful payment
                endRideButton.setDisable(false);
            } else {
                showAlert(Alert.AlertType.ERROR, "Error", "Failed to save payment information.");
            }
        }
    } catch (SQLException e) {
        System.out.println("❌ SQL Error: " + e.getMessage());
        e.printStackTrace();
        showAlert(Alert.AlertType.ERROR, "Error", "Failed to process payment.");
    } catch (NumberFormatException e) {
        showAlert(Alert.AlertType.ERROR, "Error", "Invalid fare amount format.");
    }
}

    @FXML
    void handleApplyVoucher(ActionEvent event) {
    String promoCode = entervoucherTextfield.getText().trim();
    if (promoCode.isEmpty()) {
        showAlert(Alert.AlertType.ERROR, "Error", "Please enter a promo code.");
        return;
    }

    // Get current customer ID from UserSession
    String currentCustomerId = UserSession.getInstance().getCustomerId();
    if (currentCustomerId == null || currentCustomerId.isEmpty()) {
        showAlert(Alert.AlertType.ERROR, "Error", "No logged-in customer found.");
        return;
    }

    String url = "jdbc:mysql://localhost:3306/moveit";
    String user = "root";
    String password = "password";

    String fetchDiscountQuery = "SELECT Percentage FROM promotable WHERE Promo = ?";
    String checkUsedVoucherQuery = "SELECT * FROM UsedVouchers WHERE Customer_id = ? AND PromoCode = ?";
    String insertUsedVoucherQuery = "INSERT INTO UsedVouchers (Customer_id, PromoCode) VALUES (?, ?)";

    try (Connection conn = DriverManager.getConnection(url, user, password);
         PreparedStatement fetchStmt = conn.prepareStatement(fetchDiscountQuery);
         PreparedStatement checkStmt = conn.prepareStatement(checkUsedVoucherQuery);
         PreparedStatement insertStmt = conn.prepareStatement(insertUsedVoucherQuery)) {

        // Check if the voucher has already been used by the customer
        checkStmt.setString(1, currentCustomerId);
        checkStmt.setString(2, promoCode);
        ResultSet checkRs = checkStmt.executeQuery();

        if (checkRs.next()) {
            showAlert(Alert.AlertType.ERROR, "Error", "This promo code has already been used.");
            return;
        }

        // Fetch the discount percentage for the promo code
        fetchStmt.setString(1, promoCode);
        ResultSet rs = fetchStmt.executeQuery();

        if (rs.next()) {
            int discountPercent = rs.getInt("Percentage");
            System.out.println("✔ Promo Code Found: " + promoCode);
            System.out.println("✔ Discount Percentage: " + discountPercent + "%");

            String fareText = faredisplay.getText().replace("₱", "").trim();
            System.out.println("✔ Fare Before Discount: " + fareText);

            if (fareText.isEmpty()) {
                showAlert(Alert.AlertType.ERROR, "Error", "Fare is missing. Please check your booking details.");
                return;
            }

            double originalFare = Double.parseDouble(fareText);
            double discountAmount = originalFare * (discountPercent / 100.0);
            double finalFare = originalFare - discountAmount;

            System.out.println("✔ Discount Amount: ₱" + discountAmount);
            System.out.println("✔ Final Fare After Discount: ₱" + finalFare);

            // Update UI using Platform.runLater()
            Platform.runLater(() -> {
                faredisplay.setText(String.format("₱%.2f", finalFare));
                System.out.println("✔ Fare display updated to: " + faredisplay.getText());
            });

            showAlert(Alert.AlertType.INFORMATION, "Voucher Applied",
                    "Promo Code: " + promoCode + "\nDiscount: " + discountPercent + "%\nNew Fare: ₱" + finalFare);

            // Mark the voucher as used by inserting a record into the UsedVouchers table
            insertStmt.setString(1, currentCustomerId);
            insertStmt.setString(2, promoCode);
            insertStmt.executeUpdate();

        } else {
            System.out.println("❌ Invalid Promo Code Entered: " + promoCode);
            showAlert(Alert.AlertType.ERROR, "Error", "Invalid promo code.");
        }

    } catch (SQLException e) {
        e.printStackTrace();
        showAlert(Alert.AlertType.ERROR, "Error", "An error occurred while applying the voucher.");
    } catch (NumberFormatException e) {
        System.out.println("❌ Error: Failed to parse fare from faredisplay.");
        showAlert(Alert.AlertType.ERROR, "Error", "Invalid fare format.");
    }
}

    private void showAlert(Alert.AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setContentText(message);
        alert.showAndWait();
    }
}