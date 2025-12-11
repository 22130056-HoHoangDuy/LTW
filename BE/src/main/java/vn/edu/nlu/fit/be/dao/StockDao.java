package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.model.Stock;

import java.util.ArrayList;
import java.util.List;

public class StockDao {
    public List<Stock> getStocks() {
        List<Stock> stocks = new ArrayList<>();

        Stock stock1 = new Stock(1, "Kho Bình Thạnh", "Kho A");
        Stock stock2 = new Stock(2, "Kho Quận 7", "Kho B");

        stocks.add(stock1);
        stocks.add(stock2);
        return stocks;
    }
}
