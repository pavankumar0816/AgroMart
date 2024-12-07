package com.klef.jfsd.springboot.model;

public enum OrderStatus {
    IN_PROGRESS(1, "In Progress"),
    ORDER_RECEIVED(2, "Order Received"),
    PRODUCT_PACKED(3, "Product Packed"),
    OUT_FOR_DELIVERY(4, "Out for Delivery"),
    DELIVERED(5, "Delivered"),
    CANCELLED(6, "Cancelled");

    private final Integer id;
    private final String name;
 
    public Integer getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	private OrderStatus(int id, String name) {
        this.id = id;
        this.name = name;
    }
	
   public static OrderStatus fromId(int id) {
        for (OrderStatus status : OrderStatus.values()) {
            if (status.getId() == id) {
                return status;
            }
        }
        throw new IllegalArgumentException("Invalid OrderStatus ID: " + id);
    }
}
