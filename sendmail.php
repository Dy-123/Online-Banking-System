<?php
	use PHPMailer\PHPMailer\PHPMailer;
	use PHPMailer\PHPMailer\SMTP;
	use PHPMailer\PHPMailer\Exception;
function sendmail($tomail,  $subject, $message , $totmailname)
{
	// Import PHPMailer classes into the global namespace
	// These must be at the top of your script, not inside a function

	// Load Composer's autoloader
	require 'PHPMailer/src/Exception.php';
	require 'PHPMailer/src/PHPMailer.php';
	require 'PHPMailer/src/SMTP.php';

	// Instantiation and passing `true` enables exceptions
	$mail = new PHPMailer(true);

	try {
		//Server settings
		$mail->SMTPDebug = false; //SMTP::DEBUG_SERVER;                      // Enable verbose debug output
		$mail->isSMTP();                                            // Send using SMTP
		$mail->Host       = 'mail.firegasdetection.tk';                    // Set the SMTP server to send through
		$mail->SMTPAuth   = true;                                   // Enable SMTP authentication
		$mail->Username   = 'testingebankingmailid@firegasdetection.tk';                     // SMTP username
		$mail->Password   = '8pw5[CG@A9=V';                               // SMTP password
		$mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
		$mail->Port       = 26;                                    // TCP port to connect to

		//Recipients
		$mail->setFrom('testingebankingmailid@firegasdetection.tk', 'e-Bank');
		$mail->addAddress($tomail, $totmailname);     // Add a recipient
		$mail->addAddress($tomail);               // Name is optional
		$mail->addReplyTo($tomail, $totmailname);
		//$mail->addCC('cc@example.com');
		//$mail->addBCC('bcc@example.com');

		// Attachments
	  //  $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
	  //  $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

		// Content
		$mail->isHTML(true);                                  // Set email format to HTML
		$mail->Subject = $subject;
		$mail->Body    = $message;
		$mail->AltBody = 'Mail Receieved';

		$mail->send();
			//echo 'Message has been sent';
	} 
	catch (Exception $e) 
	{
		echo "Message could not be sent. Mailer Error: {
			$mail->ErrorInfo}";
	}
}
//sendmail("mvaravinda@gmail.com", "aravinda" , "Hello", "sending message");
?>