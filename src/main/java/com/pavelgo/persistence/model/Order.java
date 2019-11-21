package com.pavelgo.persistence.model;

import javax.persistence.*;

@Entity(name = "order")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "profileId")
    private PurchaserProfileInfo purchaserProfileInfo;

    @Column(name = "date", nullable = false)
    private String date;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public PurchaserProfileInfo getPurchaserProfileInfo() {
        return purchaserProfileInfo;
    }

    public void setPurchaserProfileInfo(PurchaserProfileInfo purchaserProfileInfo) {
        this.purchaserProfileInfo = purchaserProfileInfo;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", purchaserProfileInfo=" + purchaserProfileInfo +
                ", date='" + date + '\'' +
                '}';
    }
}
