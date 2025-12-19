package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.dao.OrdersDao;
import vn.edu.nlu.fit.be.model.*;

import java.util.List;

public class OrdersService {

    private OrdersDao dao = new OrdersDao();

    public List<Orders> getAll() {
        return dao.getAllOrders();
    }

    public boolean updateStatus(int orderId, OrderStatus status) {
        return dao.updateStatus(orderId, status);
    }
}
