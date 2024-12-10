package com.klef.jfsd.springboot.model;

public class OrderResponse {
    private String razorpayOrderId;
    private String amount;

    // Constructor
    public OrderResponse(String razorpayOrderId, String amount) {
        this.razorpayOrderId = razorpayOrderId;
        this.amount = amount;
    }

    // Getters and Setters
    public String getRazorpayOrderId() {
        return razorpayOrderId;
    }

    public void setRazorpayOrderId(String razorpayOrderId) {
        this.razorpayOrderId = razorpayOrderId;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }
}
