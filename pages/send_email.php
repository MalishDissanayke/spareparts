<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;

require '../vendor/PHPMailer/src/PHPMailer.php'; // Adjust path as needed
require '../vendor/PHPMailer/src/SMTP.php'; // Adjust path as needed
require '../vendor/PHPMailer/src/Exception.php'; // Adjust path as needed

// Initialize PHPMailer
$mail = new PHPMailer(true); // Passing true enables exceptions

// Enable SMTP debug mode (optional)
$mail->SMTPDebug = SMTP::DEBUG_OFF; // Set to SMTP::DEBUG_SERVER for debugging

// SMTP configuration
$mail->isSMTP();
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true;
$mail->Username = 'your_email';
$mail->Password = 'your_password'; // Use app-specific password if 2FA is enabled
$mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Enable TLS encryption
$mail->Port = 587; // TCP port to connect to

// Sender's email address
$sender_email = 'your_email';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['emails'], $_POST['message'], $_POST['subject'])) {
    // Sanitize inputs
    $emails = $_POST['emails'];
    $message = $_POST['message'];
    $subject = $_POST['subject'];

    // File attachments handling
    if (isset($_FILES['attachments'])) {
        $file_count = count($_FILES['attachments']['name']);
        for ($i = 0; $i < $file_count; $i++) {
            $tmpFilePath = $_FILES['attachments']['tmp_name'][$i];
            if ($tmpFilePath != "") {
                $fileName = $_FILES['attachments']['name'][$i];
                $filePath = $_FILES['attachments']['tmp_name'][$i];
                $mail->addAttachment($filePath, $fileName);
            }
        }
    }

    try {
        // Loop through selected emails and send the message
        foreach ($emails as $email) {
            $mail->setFrom($sender_email);
            $mail->addAddress($email); // Recipient

            // Content
            $mail->isHTML(true);
            $mail->Subject = $subject; // Subject from form input
            $mail->Body = "<html><body><h3>Your Message:</h3><p>$message</p></body></html>";

            // Send email
            $mail->send();
            echo "Email sent successfully to $email<br>";
            // Clear recipients and attachments
            $mail->clearAddresses();
            $mail->clearAttachments();
        }
        
        // Redirect back to customer.php after sending emails
        header("Location: customer.php");
        exit();
        
    } catch (Exception $e) {
        echo "Failed to send email. Error: {$mail->ErrorInfo}";
    }
} else {
    echo "Invalid request";
}
?>
