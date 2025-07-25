package com.dev.utility;

import jakarta.mail.MessagingException;

public class MailMessage {
	public static void registrationSuccess(String emailId, String name) {
		String recipient = emailId;
		String subject = "Registration Successful";
		String htmlTextMessage = "" + "<html>" + "<body>"
				+ "<h2 style='color:violet;'>Welcome to E-Shop!</h2>" + "Dear " + name + ","
				+ "<br><br>Thank you for registering with E-Shop."
				+ "<br>We are delighted to have you join our community. Explore our latest collection of electronic appliances and gadgets."
				+ "<br>Enjoy discounts of up to 60% on a wide range of electronics. Visit our website today and discover exciting deals."
				+ "<br><br>As a token of our appreciation, we are pleased to offer you an additional 10% OFF (up to ₹500) on your first purchase."
				+ "<br>Simply use the promo code below during checkout to enjoy this special offer."
				+ "<br><br><b>PROMO CODE:</b> Nashikercoder500"
				+ "<br><br>Thank you once again for choosing E-Shop. We look forward to serving you."
				+ "<br><br>Best regards,<br>E-Shop Team"
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
				+ "Dear " + name + ",<br/><br/>"
				+ "Thank you for shopping with E-Shop."
				+ "<br/><br/>We are pleased to inform you that your order has been placed successfully and is now being processed for shipment."
				+ "<br/><br/><em>Note: This is a demo project email. No actual transaction has taken place.</em>"
				+ "<br/><br/><b>Order Details:</b>"
				+ "<br/><b>Order ID:</b> <span style=\"color:violet; font-weight:bold;\">" + transId + "</span>"
				+ "<br/><b>Amount Paid:</b> <span style=\"color:violet; font-weight:bold;\">" + transAmount + "</span>"
				+ "<br/><br/>Thank you for choosing E-Shop. We look forward to serving you again."
				+ "<br/><br>Best regards,<br/><b>E-Shop Team</b>"
				+ "</p></body></html>";
		try {
			JavaMailUtil.sendMail(recipient, subject, htmlTextMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static void orderShipped(String recipientEmail, String name, String transId, double transAmount) {
		String recipient = recipientEmail;
		String subject = "Exciting News! Your E-Shop Order Has Been Shipped";
		String htmlTextMessage = "<html>" + "<body>" + "<p>"
				+ "Dear " + name + ",<br/><br/>"
				+ "We are pleased to inform you that your order has been shipped and is on its way to your doorstep."
				+ "<br/><br/><em>Note: This is a demo project email. No actual shipment or transaction has occurred.</em>"
				+ "<br/><br/><b>Order Details:</b>"
				+ "<br/><b>Order ID:</b> <span style=\"color:violet; font-weight:bold;\">" + transId + "</span>"
				+ "<br/><b>Amount Paid:</b> <span style=\"color:violet; font-weight:bold;\">" + transAmount + "</span>"
				+ "<br/><br/>Thank you for choosing E-Shop. We appreciate your trust and look forward to serving you again."
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
		String subject = "Great News! " + prodName + " is Now Back in Stock at E-Shop";
		String htmlTextMessage = "<html>" + "<body>" + "<p>"
				+ "Dear " + name + ",<br/><br/>"
				+ "We noticed your interest in <b>" + prodName + "</b>, which was previously out of stock."
				+ "<br/><br/>We are happy to inform you that this product is now back in stock and ready for purchase."
				+ "<br/><br/><em>Note: This is a demo project email. No actual order or transaction has taken place.</em>"
				+ "<br/><br/><b>Product Details:</b>"
				+ "<br/><b>Product ID:</b> <span style=\"color:violet; font-weight:bold;\">" + prodId + "</span>"
				+ "<br/><b>Product Name:</b> <span style=\"color:violet; font-weight:bold;\">" + prodName + "</span>"
				+ "<br/><br/>Hurry! Place your order soon before it sells out again."
				+ "<br/><br/>Thank you for shopping with E-Shop. We look forward to serving you."
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
