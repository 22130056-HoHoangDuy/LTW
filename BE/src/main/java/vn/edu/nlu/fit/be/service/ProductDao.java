package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.model.Category;
import vn.edu.nlu.fit.be.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    List<Product> list = new ArrayList<>();
    //Category
    Category catNoiThat = new Category(1, "Đồ nội thất", "Bao gồm bàn học thông minh, ghế chống gù...");
    Category catTrangTri = new Category(2, "Đồ trang trí", "Bao gồm rèm trẻ em và tranh treo tường.");
    Category catDoChoi = new Category(3, "Đồ chơi", "Bao gồm đồ chơi lắp ghép và nhà chơi trẻ em.");

    public List<Product> getListProduct() {
        list.add(new Product(
                1, catNoiThat, 1, true, "Gỗ tự nhiên", 0, "Bàn fullsize 1m2",
                "Mô tả sản phẩm...", "LUXURY TopKids",
                "https://topkids.com.vn/img/upload/images/Temp_thumb/600x600/d11pro-xam-web_g9k2yX3RuAxH1R5zKWYmP3NbhYmgWLUPKYJEoTfjDZzM3hU1a72511686780169.webp",
                12220000, "Bàn Ghế Thông Minh Chống Gù Chống Cận D11 Pro"
        ));

        // 2. Bàn Học Thông Minh A12 Fancy (Nội thất)
        list.add(new Product(
                2, catNoiThat, 1, true, "Gỗ tự nhiên", 0, "Bàn fullsize 1m2",
                "Mô tả sản phẩm...", "Fancy TopKids",
                "https://topkids.com.vn//img/upload/images/Temp_thumb/600x600/fancy-a12-xanh-web_AmvqdvIOE99w7QZ2QS2xFeaZIQIjidK8HhV5e9wrvtDiiRAzU92519937312795.webp",
                9650000, "Bàn Học Thông Minh Chống Gù Chống Cận A12 Fancy"
        ));

        // 3. Đèn Bàn Chống Cận T9 (Nội thất - Đèn)
        list.add(new Product(
                3, catNoiThat, 1, true, "Nhựa", 0, "Khác",
                "Đèn chống cận cao cấp", "Thương hiệu TopKids",
                "https://topkids.com.vn//img/upload/images/Temp_thumb/600x600/t9-19qssTV81wYv2vkP35u2Wn3WKQmcZipPZsA39foDxmrlSgMIQI72552322239725.webp",
                5590000, "Đèn Bàn Chống Cận Cao Cấp T9"
        ));

        // 4. Ghế Chống Gù G7 Ultra Luxury (Nội thất - Ghế)
        list.add(new Product(
                4, catNoiThat, 1, true, "Thép", 0, "Khác",
                "Ghế chống gù cao cấp", "Thương hiệu TopKids",
                "https://topkids.com.vn//img/upload/images/Temp_thumb/600x600/g7-xanh-web_qrVrMy9y3gSFg6IOHE8qGBDJ7LdBuNdtEPIBi9izfr5QRIgsCk241139410471.webp",
                4590000, "Ghế Chống Gù G7 Ultra Luxury"
        ));

        // 5. Tranh trang trí tường phòng bé TG081 (Trang trí)
        list.add(new Product(
                5, catTrangTri, 2, true, "In UV trực tiếp lên Mica tráng gương", 0, "40x60cm (bộ 3 tấm)",
                "Tranh treo tường đẹp", null, // Brand null trong SQL
                "https://tuongxinh.com.vn/wp-content/uploads/2021/04/tranh-treo-tuong-trang-guong-187-800x800.jpg",
                950000, "Tranh trang trí tường phòng bé TG081"
        ));

        // 6. Tranh tráng gương phi hành gia vũ trụ TG172 (Trang trí)
        list.add(new Product(
                6, catTrangTri, 2, true, "In UV trực tiếp lên Mica tráng gương", 0, "35x70cm (2 tấm) + 70x70cm (1 tấm)",
                "Tranh phi hành gia", null,
                "https://tuongxinh.com.vn/wp-content/uploads/2021/04/tranh-treo-tuong-trang-guong-54-1-800x800.jpg",
                1150000, "Tranh tráng gương phi hành gia vũ trụ TG172"
        ));

        // 7. Bộ lắp ghép xếp hình cỡ lớn PL3001 (Đồ chơi)
        list.add(new Product(
                7, catDoChoi, 3, true, "Nhựa Cao Cấp", 0, "Vừa",
                "Đồ chơi lắp ghép 78 chi tiết", "ODM",
                "https://dochoiphulong.com/wp-content/uploads/2020/10/bo-do-choi-lep-ghep-78-chi-tiet-pl3001.jpg",
                3065000, "Bộ lắp ghép xếp hình cỡ lớn 78 chi tiết PL3001"
        ));

        // 8. Ngôi nhà nhựa cho bé mầm non PL1603 (Đồ chơi)
        list.add(new Product(
                8, catDoChoi, 3, true, "Nhựa Cao Cấp", 0, "239 × 210 × 230 cm",
                "Nhà chơi trẻ em", "ODM",
                "https://dochoiphulong.com/wp-content/uploads/2022/09/nha-nhua-cho-tre-mau-giao-pl1603.jpg",
                9390000, "Ngôi nhà nhựa cho bé mầm non PL1603"
        ));

        // 9. Bộ xếp hình xây dựng cho trẻ mầm non (Đồ chơi)
        list.add(new Product(
                9, catDoChoi, 3, true, "Gỗ Tự Nhiên, Nhựa Cao Cấp", 0, "Lớn",
                "Xếp hình xây dựng", "ODM",
                "https://dochoiphulong.com/wp-content/uploads/2023/12/xep-hinh-xay-dung-mam-non-51ct-3.jpg",
                210000, "Bộ xếp hình xây dựng cho trẻ mầm non"
        ));

        // 10. Bàn Học Thông Minh FANCY H120 (Nội thất - Giá rẻ hơn)
        list.add(new Product(
                10, catNoiThat, 1, true, "Gỗ tự nhiên", 0, "Bàn fullsize 1m2",
                "Mô tả sản phẩm...", "Fancy TopKids",
                "https://topkids.com.vn//img/upload/images/Temp_thumb/600x600/fancy-h120-hong-web_SLh53OuegheTK8kUm1x5vzz3Vd9WxoIYEqtZvZbaqukzOZclNX2511481748035.webp",
                5310000, "Bàn Thông Minh Chống Gù Chống Cận FANCY H120"
        ));
        return list;
    }
}
