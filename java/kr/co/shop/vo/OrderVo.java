package kr.co.shop.vo;

public class OrderVo {
	

	//넘어온 상품코드, 수량, 옵션 스플릿 하기 전 데이터
	private String total_code, total_size, total_amount;
	
	//넘어온 합계배송비, 합계 할인금액 
	private String total_delivery,total_price;
	
	//넘어온 수량합계
	private int total_amount2;
	
	//출력될 상품코드, 수량, 옵션 배열 
	private String orderCode, orderAmount, orderSize;
	
	//상품정보 출력
	private String pImg1, pName;
	private int pDelivery, pDc, pPrice, pMile;
	
	
	//테이블에 저장될 정보
	private int id, orderAddressId, orderPayType, orderPaySelection, orderMileage,
	orderTotalPrice, orderTotalAmount, orderTotalDelivery, orderTotalCoupon, orderTotalPoint, orderTotalPayment;
	
	private String orderNumber,orderUserid,orderDeliver,orderDc,orderPrice, orderMessage, orderDate, orderPayInstallment;
	
	
	public String getOrderPayInstallment() {
		return orderPayInstallment;
	}

	public void setOrderPayInstallment(String orderPayInstallment) {
		this.orderPayInstallment = orderPayInstallment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderAddressId() {
		return orderAddressId;
	}

	public void setOrderAddressId(int orderAddressId) {
		this.orderAddressId = orderAddressId;
	}

	public int getOrderPayType() {
		return orderPayType;
	}

	public void setOrderPayType(int orderPayType) {
		this.orderPayType = orderPayType;
	}

	public int getOrderPaySelection() {
		return orderPaySelection;
	}

	public void setOrderPaySelection(int orderPaySelection) {
		this.orderPaySelection = orderPaySelection;
	}

	public int getOrderMileage() {
		return orderMileage;
	}

	public void setOrderMileage(int orderMileage) {
		this.orderMileage = orderMileage;
	}

	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public int getOrderTotalAmount() {
		return orderTotalAmount;
	}

	public void setOrderTotalAmount(int orderTotalAmount) {
		this.orderTotalAmount = orderTotalAmount;
	}

	public int getOrderTotalDelivery() {
		return orderTotalDelivery;
	}

	public void setOrderTotalDelivery(int orderTotalDelivery) {
		this.orderTotalDelivery = orderTotalDelivery;
	}

	public int getOrderTotalCoupon() {
		return orderTotalCoupon;
	}

	public void setOrderTotalCoupon(int orderTotalCoupon) {
		this.orderTotalCoupon = orderTotalCoupon;
	}

	public int getOrderTotalPoint() {
		return orderTotalPoint;
	}

	public void setOrderTotalPoint(int orderTotalPoint) {
		this.orderTotalPoint = orderTotalPoint;
	}

	public int getOrderTotalPayment() {
		return orderTotalPayment;
	}

	public void setOrderTotalPayment(int orderTotalPayment) {
		this.orderTotalPayment = orderTotalPayment;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getOrderUserid() {
		return orderUserid;
	}

	public void setOrderUserid(String orderUserid) {
		this.orderUserid = orderUserid;
	}

	public String getOrderDeliver() {
		return orderDeliver;
	}

	public void setOrderDeliver(String orderDeliver) {
		this.orderDeliver = orderDeliver;
	}

	public String getOrderDc() {
		return orderDc;
	}

	public void setOrderDc(String orderDc) {
		this.orderDc = orderDc;
	}

	public String getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderMessage() {
		return orderMessage;
	}

	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getpMile() {
		return pMile;
	}

	public void setpMile(int pMile) {
		this.pMile = pMile;
	}

	public int getTotal_amount2() {
		return total_amount2;
	}

	public void setTotal_amount2(int total_amount2) {
		this.total_amount2 = total_amount2;
	}

	public String getTotal_delivery() {
		return total_delivery;
	}

	public void setTotal_delivery(String total_delivery) {
		this.total_delivery = total_delivery;
	}

	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	

	public int getpDelivery() {
		return pDelivery;
	}

	public void setpDelivery(int pDelivery) {
		this.pDelivery = pDelivery;
	}

	public int getpDc() {
		return pDc;
	}

	public void setpDc(int pDc) {
		this.pDc = pDc;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getpImg1() {
		return pImg1;
	}

	public void setpImg1(String pImg1) {
		this.pImg1 = pImg1;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	

	public String getTotal_code() {
		return total_code;
	}

	public void setTotal_code(String total_code) {
		this.total_code = total_code;
	}

	public String getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(String total_amount) {
		this.total_amount = total_amount;
	}

	public String getTotal_size() {
		return total_size;
	}

	public void setTotal_size(String total_size) {
		this.total_size = total_size;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderSize() {
		return orderSize;
	}

	public void setOrderSize(String orderSize) {
		this.orderSize = orderSize;
	}

	
	}
