package com.dev.utility;

import jakarta.mail.MessagingException;

public class MailMessage {
	public static void registrationSuccess(String emailId, String name) {
		String recipient = emailId;
		String subject = "Registration Successful";
		String htmlTextMessage = "" + "<html>" + "<body>"
				+ "<h2 style='color:violet;'>Welcome to E-Shop!</h2>" + "Hi " + name + ","
				+ "<br><br>Thank you for registering with E-Shop."
				+ "<br>We’re excited to have you on board. Explore our latest collection of electronic appliances and gadgets."
				+ "<br>Enjoy discounts of up to 60% on a wide range of electronics. Visit our website and discover amazing deals."
				+ "<br><br>As a warm welcome, we’re offering you an additional 10% OFF (up to ₹500) on your first purchase."
				+ "<br>Use the promo code below during checkout to avail this offer."
				+ "<br><br><b>PROMO CODE:</b> Nashikercoder500"
				+ "<br><br>Thank you for choosing E-Shop. We look forward to serving you!"
				+ "<br><br>Best regards,<br>E-Shop Team."
				+ "</body>" + "</html>";
		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static void transactionSuccess(String recipientEmail, String name, String transId, double transAmount) {
		String recipient = recipientEmail;
		String subject = "Your Order Has Been Placed – E-Shop";
		String htmlTextMessage = "<html>" + "<body>" + "<p>"
				+ "Hi " + name + ",<br/><br/>"
				+ "Thank you for shopping with E-Shop!"
				+ "<br/><br/>Your order has been placed successfully and is being processed for shipment."
				+ "<br/><br/><em>Note: This is a demo project email. No actual transaction has occurred.</em>"
				+ "<br/><br/>Here are your order details:"
				+ "<br/><b>Order ID:</b> <span style=\"color:violet; font-weight:bold;\">" + transId + "</span>"
				+ "<br/><b>Amount Paid:</b> <span style=\"color:violet; font-weight:bold;\">" + transAmount + "</span>"
				+ "<br/><br/>Thank you for choosing E-Shop. We hope to see you again soon!"
				+ "<br/><br/>Best regards,<br/><b>E-Shop Team</b>"
				+ "</p></body></html>";
		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static void orderShipped(String recipientEmail, String name, String transId, double transAmount) {
		String recipient = recipientEmail;
		String subject = "Good News! Your E-Shop Order Has Been Shipped";
		String htmlTextMessage = "<html>" + "<body>" + "<p>"
				+ "Hi " + name + ",<br/><br/>"
				+ "We’re excited to inform you that your order has been shipped and is on its way to you."
				+ "<br/><br/><em>Note: This is a demo project email. No actual transaction or shipment has occurred.</em>"
				+ "<br/><br/>Order Details:"
				+ "<br/><b>Order ID:</b> <span style=\"color:violet; font-weight:bold;\">" + transId + "</span>"
				+ "<br/><b>Amount Paid:</b> <span style=\"color:violet; font-weight:bold;\">" + transAmount + "</span>"
				+ "<br/><br/>Thank you for shopping with E-Shop. We look forward to serving you again!"
				+ "<br/><br/>Best regards,<br/><b>E-Shop Team</b>"
				+ "</p></body></html>";
		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static void productAvailableNow(String recipientEmail, String name, String prodName, String prodId) {
		String recipient = recipientEmail;
		String subject = "Good News! " + prodName + " Is Now Back in Stock at E-Shop";
		String htmlTextMessage = "<html>" + "<body>" + "<p>"
				+ "Hi " + name + ",<br/><br/>"
				+ "We noticed that you were interested in <b>" + prodName + "</b> which was previously out of stock."
				+ "<br/><br/>We’re happy to inform you that the product is now available for purchase!"
				+ "<br/><br/><em>Note: This is a demo project email. No actual transaction has occurred.</em>"
				+ "<br/><br/>Product Details:"
				+ "<br/><b>Product ID:</b> <span style=\"color:violet; font-weight:bold;\">" + prodId + "</span>"
				+ "<br/><b>Product Name:</b> <span style=\"color:violet; font-weight:bold;\">" + prodName + "</span>"
				+ "<br/><br/>Hurry up and place your order before it runs out again!"
				+ "<br/><br/>Thank you for your interest in E-Shop. We look forward to serving you!"
				+ "<br/><br/>Best regards,<br/><b>E-Shop Team</b>"
				+ "</p></body></html>";
		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static String sendMessage(String toEmailId, String subject, String htmlTextMessage) {
		try {
			JavaMailUtil.sendMail(toEmailId, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
			return "FAILURE";
		}
		return "SUCCESS";
	}
}
