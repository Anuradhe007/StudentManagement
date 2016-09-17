package com.student.payment;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="payment")
public class Payment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="REGNO")
	private String regNo;
	
	@Column(name="CLASSID")
	private String classId;
	
	@Column(name="FEE")
	private Double fee;
	
	@Column(name="PAYINGMONTH")
	private String paymentMonth;
	
	@Column(name="PAYINGYEAR")
	private String paymentYear;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPaymentYear() {
		return paymentYear;
	}

	public void setPaymentYear(String paymentYear) {
		this.paymentYear = paymentYear;
	}

	@Column(name="PAIDDATE")
	private Date paidDate;

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public Double getFee() {
		return fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
	}

	public String getPaymentMonth() {
		return paymentMonth;
	}

	public void setPaymentMonth(String paymentMonth) {
		this.paymentMonth = paymentMonth;
	}

	public Date getPaidDate() {
		return paidDate;
	}

	public void setPaidDate(Date paidDate) {
		this.paidDate = paidDate;
	}

	@Override
    public int hashCode() {
        return (this.regNo.hashCode() + this.regNo.hashCode());
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Payment) {
            Payment temp = (Payment) obj;
            if(this.regNo.equals(temp.regNo)) {
                return true;
            }
        }
        return false;
    }
	

}
