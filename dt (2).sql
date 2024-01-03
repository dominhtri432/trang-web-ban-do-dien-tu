-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 19, 2023 lúc 12:13 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dt`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `id` int(11) NOT NULL,
  `ma_hoa_don` int(11) DEFAULT NULL,
  `ma_san_pham` int(11) DEFAULT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `don_gia` float DEFAULT NULL,
  `tong` float DEFAULT NULL,
  `giam` float NOT NULL,
  `thanhTien` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `ma_hoa_don` int(10) NOT NULL,
  `ngay_lap` date DEFAULT NULL,
  `khach_hang` varchar(225) DEFAULT NULL,
  `tong_tien` float DEFAULT NULL,
  `ma_uudai` varchar(255) DEFAULT NULL,
  `toTal` float DEFAULT NULL,
  `giao_hang` int(2) DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mathang`
--

CREATE TABLE `mathang` (
  `m_ma` int(5) NOT NULL,
  `m_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `mathang`
--

INSERT INTO `mathang` (`m_ma`, `m_name`) VALUES
(1, 'Công tắc thông minh'),
(2, 'Đèn thông minh'),
(3, 'Phụ kiện thông minh'),
(4, 'Hệ thống an ninh\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `ng_id` int(11) NOT NULL,
  `ng_hoTen` text NOT NULL,
  `ng_email` varchar(50) NOT NULL,
  `ng_matKhau` text NOT NULL,
  `ng_Phone` text NOT NULL,
  `ng_diaChi` text NOT NULL,
  `ng_ngay_DK` date DEFAULT NULL,
  `role` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`ng_id`, `ng_hoTen`, `ng_email`, `ng_matKhau`, `ng_Phone`, `ng_diaChi`, `ng_ngay_DK`, `role`) VALUES
(1, 'Nguyen A', 'Nguyen_A@gmail.com', '112233', '0912345678', '170 An Dương Vương, Quy Nhơn', NULL, 0),
(3, 'Nguyen B', 'nguyenb@gmail.com', '$2b$10$B.78G6jtbvW0aFHPDOCakO3o0k68LaSFdhBsDcGTY3RsYeP6zfFQy', '1234', '170 an duong vuong', '2023-12-11', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanhieu`
--

CREATE TABLE `nhanhieu` (
  `nh_ma` int(5) NOT NULL,
  `nh_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanhieu`
--

INSERT INTO `nhanhieu` (`nh_ma`, `nh_name`) VALUES
(11, 'Công tắc điều khiển từ xa'),
(12, 'Công tắc điều khiển qua wifi'),
(13, 'Công tắc hẹn giờ'),
(14, 'Công tắc cảm ứng'),
(15, 'Đèn,đui đèn điều khiển từ xa'),
(16, 'Đèn,đui đèn cảm biến chuyển động'),
(17, 'Đèn ngủ,tủ quần áo'),
(18, 'Phụ kiện'),
(19, 'Báo động trung tâm'),
(20, 'Báo động độc lập'),
(21, 'Cảm biến');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `n_ma` int(5) NOT NULL,
  `n_hoTen` varchar(50) DEFAULT NULL,
  `n_gioiTinh` varchar(10) DEFAULT NULL,
  `n_ngaySinh` date DEFAULT NULL,
  `n_diachi` varchar(200) DEFAULT NULL,
  `n_sdt` text DEFAULT NULL,
  `n_username` varchar(50) NOT NULL,
  `n_password` varchar(50) NOT NULL,
  `n_chucvu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`n_ma`, `n_hoTen`, `n_gioiTinh`, `n_ngaySinh`, `n_diachi`, `n_sdt`, `n_username`, `n_password`, `n_chucvu`) VALUES
(1, 'nghia', 'nam', '2002-01-13', 'quy nhon', '2222222', 'nghia', '1234', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `s_ma` int(5) NOT NULL,
  `s_ten` varchar(100) DEFAULT NULL,
  `s_hinh` varchar(500) NOT NULL,
  `s_mathang` int(5) DEFAULT NULL,
  `s_nhanhieu` int(5) NOT NULL,
  `s_giamua` float NOT NULL,
  `s_gia` int(10) DEFAULT NULL,
  `s_uudai` float NOT NULL,
  `s_soluong` int(5) DEFAULT NULL,
  `s_mota` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`s_ma`, `s_ten`, `s_hinh`, `s_mathang`, `s_nhanhieu`, `s_giamua`, `s_gia`, `s_uudai`, `s_soluong`, `s_mota`) VALUES
(29, 'Công tắc điều khiển từ xa RF', 'Công tắc điều khiển từ xa RF1702982323908.jpg', 1, 11, 300000, 350000, 0, 10, 'Công tắc điều khiển từ xa RFS03 được sử dụng để điều khiển các thiết bị điện với dòng chịu tải lên đến 10A. Để điều khiển công tắc này các bạn cần sử dụng remote điều khiển từ xa RF tần số 433MHz.\r\n\r\n⚠️ Giá trên chỉ là giá của công tắc chưa bao gồm remote điều khiển. Bạn vui lòng mua thêm remote điều khiển nếu chưa có remote điều khiển RF tần số 433MHz tại đây.\r\n\r\n✅ Điều khiển từ xa qua remote RF tiện lợi.\r\n\r\n✅ Thiết kế nhỏ gọn, dễ dàng lắp đặt\r\n\r\n✅ Đấu nối dây điện bằng domino chắc chắn, an toà'),
(30, 'Công tắc điều khiển từ xa Honest', 'Công tắc điều khiển từ xa Honest1702982404548.jpg', 1, 11, 250000, 300000, 0, 10, 'Công tắc điều khiển từ xa công suất lớn Honest HT-2110KG được sử dụng để điều khiển các thiết bị điện với dòng chịu tải lên đến 100A. Giờ đây khi sử dụng bơm công suất lớn, bạn đã không cần phải bận tâm việc đấu nối công tắc điều khiển với khởi động từ như thế nào. Chỉ cần đấu nối trực tiếp vào công tắc HT-2110KG là bạn đã có thể điều khiển một cách tiện lợi.\r\n\r\n✅ Điều khiển từ xa qua remote RF tiện lợi.\r\n\r\n✅ Có thể học lệnh lên đến 10 remote.\r\n\r\n✅ Công suất chịu tải lớn, có thể sử dụng an toàn '),
(31, 'Công tắc điều khiển qua wifi Lazio', 'Công tắc điều khiển qua wifi Lazio1702982489450.jpg', 1, 12, 250000, 315500, 0, 10, 'Công tắc điều khiển từ xa qua wifi Lazico EW01x có thể sử dụng được trên cả 3 nền tảng : ANDROID; IOS; WEB (phù hợp với các doanh nghiệp). Trên thị trường công tắc wifi khác chỉ có Android và iOS. Công tắc Lazico EW01x có thể ĐẤU NỐI CỰC KỲ DỄ DÀNG với nhiều phiên bản chọn lựa dùng cho sinh hoạt, đấu tủ điện, hay ổ cắm…'),
(32, 'Công tắc điều khiển qua wifi Broadlink', 'Công tắc điều khiển qua wifi Broadlink1702982561879.jpg', 1, 12, 250000, 300000, 0, 10, 'BroadLink BestCon MCB1 là công tắc thông minh, cho phép người dùng điều khiển các thiết bị từ xa, lên lịch bật/tắt và hẹn giờ ngay trên điện thoại di động. Đem đến nhiều tiện ích và giúp kiểm soát hệ thống điện dễ dàng hơn.'),
(33, 'Đui đèn điều khiển từ xa HT', 'Đui đèn điều khiển từ xa HT1702982658727.jpg', 2, 15, 250000, 260000, 10, 10, 'Đui đèn điều khiển từ xa HT-LHR02\r\nĐui đèn điều khiển từ xa HT-LHR02 bao gồm 1 đui đèn nối tiếp với đui đèn cũ và 1 remote dán tường. Khi sử dụng đui đèn này bạn có biến bóng đèn thường thành đèn điều khiển từ xa.\r\n\r\nCách sử dụng của đui đèn này thực sự siêu đơn giản. Bạn chỉ việc tháo bóng đèn cũ của bạn ra, lắp vào đui đèn thông minh này rồi sau đó lắp đui trở lại đui đèn chính của bạn.\r\n\r\nĐui đèn HT-LHR02 thuộc dạng đui chuyển E27 thông dụng nên lắp vừa mọi đui đèn của bạn, trang bị cho bạn t'),
(34, 'Đui đèn điều khiển từ xa sóng RF ', 'Đui đèn điều khiển từ xa sóng RF 1702982785128.jpg', 2, 11, 150000, 160000, 0, 10, 'Đui đèn điều khiển từ xa HT-LHR01 biến bóng đèn bình thường thành bóng đèn điều khiển từ xa\r\nCách sử dụng đui đèn điều khiển từ xa HT-LHR01 thực sự siêu đơn giản. Bạn chỉ việc tháo bóng đèn cũ của bạn ra, lắp vào đui đèn thông minh này rồi sau đó lắp đui trở lại đui đèn chính của bạn.\r\n\r\nĐui đèn HT-LHR01 thuộc dạng đui chuyển E27 thông dụng nên lắp vừa mọi đui đèn của bạn, trang bị cho bạn thêm tính năng điều khiển từ xa bóng đèn bằng remote đi kèm mà không phải thay bóng đèn hoặc đui đèn hiện c'),
(35, 'Đui đèn cảm ứng hồng ngoại', 'Đui đèn cảm ứng hồng ngoại1702982934635.jpg', 2, 16, 250000, 260000, 0, 10, 'Đui đèn cảm ứng chuyển động hồng ngoại SLH03\r\nĐui đèn cảm ứng SLH03 chiếc đui đèn chuyên dụng sử dụng để điều khiển cho việc bật tắt đèn tự động khi phát hiện chuyển động của cơ thể con người, sẽ tự động bật sáng bóng đèn & tắt đèn khi không có chuyển động trong vùng cảm biến nữa sau 1 khoảng thời gian trễ rất tiện lợi khi sử dụng giúp bạn tiết kiệm điện tối đa điện năng.\r\n\r\n✅ Thiết bị sử dụng loại bóng đèn tiêu chuẩn đui xoáy E27 giúp bạn tha hồ lựa chọn thiết bị nối ghép sao cho phù hợp. Với đ'),
(36, 'Đèn led dây cảm ứng chuyển động pin sạc', 'Đèn led dây cảm ứng chuyển động pin sạc1702983158636.jpg', 2, 16, 250000, 260000, 0, 10, 'Đèn led dây cảm ứng chuyển động pin sạc SLS01\r\nTủ quần áo là nơi bạn thường xuyên “ghé thăm” mỗi ngày, thật là tuyệt vời khi nó có đủ độ sáng để bạn có thể lựa chọn những bộ đồ mà mình thích nhất. Tủ quần áo của bạn đã được đặt ở nơi đủ sáng chưa? Nếu chưa thì hãy lắp đèn led dây cảm ứng chuyển động SLS01 để giúp bạn mỗi lần lấy quần áo thêm dễ dàng.\r\n\r\nĐèn sẽ tự động bật khi có người mở tủ và tự động tắt khi không có người. Dây đèn LED dài tới 3m, giúp bạn thoải mái đặt mọi vị trí tủ, góc nhà, '),
(37, 'Đèn ngủ cảm biến ánh sáng', 'Đèn ngủ cảm biến ánh sáng1702983240020.jpg', 2, 17, 152000, 160000, 0, 10, 'Đèn Ngủ Cảm Biến Ánh Sáng CH-005\r\nĐèn CH-005 ánh sáng vàng êm dịu không ảnh hưởng hay làm phiền giấc ngủ của bạn.\r\n\r\nĐèn Ngủ Cảm Biến Ánh Sáng CH-005 thiết kế phong cách Châu Âu hiện đại, sang trọng với nguyên liệu nhựa ABS cao cấp.\r\n\r\nMột sự thay thế tuyệt vời cho chiếc đèn ngủ nhà bạn, giờ đây bạn sẽ không cần phải bật đèn nữa vì chiếc đèn ngủ đã tự động bật lên khi trời tối dựa vào cảm biến ánh sáng.\r\n\r\nỨng dụng: kiểm soát ánh sáng, trang trí phù hợp trong phòng học, phòng ngủ, hành lang, ban'),
(38, 'Đèn LED bản lề tủ quần áo, tủ bếp', 'Đèn LED bản lề tủ quần áo, tủ bếp1702983281009.jpg', 2, 17, 250000, 260000, 0, 10, 'Đèn Led Bản Lề Tự Động Cho Tủ Quần Áo, Tủ Bếp DL018\r\nBuối đêm bạn muốn tìm đồ trong tủ mà không muốn bật đèn phòng vì sợ ảnh hưởng tới những người đang ngủ khác? Đèn led bản lề DL018 chính là phụ kiện mà bạn cần đến. Cơ chế bật tắt thông minh: Tự động sáng khi mở cửa và tắt khi đóng cánh cửa giúp tiết kiệm năng lượng, hiệu suất chiếu sáng cao.\r\n\r\nChỉ với chi phí bỏ ra vô cùng nhỏ là bạn đã có trong tay sản phẩm thông minh, tiện lợi này. '),
(39, 'Công tắc hẹn giờ điện tử ', 'Công tắc hẹn giờ điện tử 1702983368595.jpg', 1, 13, 250000, 260000, 0, 10, 'Công Tắc Hẹn Giờ Điện Tử 25A KG316T-II\r\n\r\nCông tắc hẹn giờ điện tử KG316T-II thiết bị hẹn giờ kỹ thuật số tự động bật/tắt thiết bị điện theo thời gian đã cài đặt. Với chu kỳ tối đa 16 lần bật/tắt được lặp lại hàng tuần hay từng ngày theo nhu cầu người dùng thiết kế nhỏ gọn, nhựa ABS chịu nhiệt cao, rơle công suất lớn có thể dùng cho nhiều loại điều hòa, máy bơm và bình nóng lạnh… trên thị trường. \r\n\r\nKG316T-II là timer cao cấp với các ưu điểm chống nhiễu tốt trong môi trường công nghiệp có thể g'),
(40, 'Công tắc hẹn giờ tuần hoàn ', 'Công tắc hẹn giờ tuần hoàn 1702983408785.jpg', 1, 13, 250000, 260000, 0, 10, 'Công tắc hẹn giờ tuần hoàn bật tắt luân phiên 99h THNKG-5\r\nTHNKG-5 là công tắc hẹn giờ timer giúp bạn hẹn giờ bật tắt thiết bị trong 1 khoảng thời gian đã được thiết lập sẵn. Công tắc hẹn giờ THNKG-5 có ưu điểm dễ sử dụng, kích thước siêu nhỏ nên bạn có thể ứng dụng lắp đặt phù hợp thẩm mỹ.\r\n\r\nMột số ứng dụng có thể kể đến như: tắt mở van từ tưới cây tự động, máy bơm oxy bể/hồ cá, máy ấp trứng, các động cơ công suất thấp, đèn hành lang, sân vườn, đèn sân thượng, ban công…\r\n\r\nKhoảng thời gian cài'),
(41, 'Công tắc cảm ứng đèn gương', 'Công tắc cảm ứng đèn gương1702983507879.jpg', 1, 14, 125000, 150000, 0, 10, 'Công tắc WS08CA có thể sử dụng để bật tắt đèn gắn cho gương, kính bằng cảm ứng điện dung chạm tay lên bề mặt gương hoặc kính.\r\n\r\nCảm biến siêu nhạy có thể xuyên được kính dày dưới 1cm.'),
(42, 'Công tắc cảm ứng chạm', 'Công tắc cảm ứng chạm1702983550402.jpg', 1, 14, 150000, 160000, 0, 10, 'Công tắc cảm ứng chạm CM-V7\r\nCông tắc cảm ứng chạm CM-V7 là loại công tắc cảm biến 1 chạm có độ nhạy tốt, được thiết kế với mẫu mã đẹp mắt với vòng tròn LED màu xanh dương và biểu tượng nút nguồn ở vùng cảm biến giúp xác định vị trí công tắc trong bóng tối.\r\n\r\nCông tắc cảm ứng chạm CM-V7 có thiết kế hình tròn giúp lắp đặt dễ dàng bằng cách khoan lỗ ở vách gỗ. Đầu vào và đầu ra trực tiếp với dòng tối đa 5A đủ để thắp sáng thanh LED 2m.\r\n\r\nCông tắc cảm ứng đèn led CM-V7 hỗ trợ chức năng dimmer, và'),
(43, 'Đồng hồ ampe kìm điện tử', 'Đồng hồ ampe kìm điện tử1702983650040.jpg', 3, 18, 150000, 180000, 0, 10, 'Đồng Hồ Ampe Kìm Kẹp Dòng Điện Tử PEAKMETER PM2008\r\nAmpe Kìm PEAKMETER PM2008 được làm bằng chất liệu nhựa cứng cáp, có vỏ cao su chịu được va chạm chống mài mòn giúp sản bền lâu. Với thiết kế nhỏ gọn dễ dàng mang theo bên người, thích hợp với điều kiện khí hậu Việt Nam. Kết quả được hiển thị trên màn hình LCD với độ chính xác cao giúp người sử dụng dễ dàng đọc kết quả và kiểm tra nhanh chóng hơn.\r\n\r\nĐồng hồ PEAKMETER PM2008 là kìm kẹp dòng kỹ thuật số có độ phân giải cao với tối đa là 6000 số đ'),
(44, 'Cáp chia nguồn DC', 'Cáp chia nguồn DC1702983715390.jpg', 3, 18, 150000, 160000, 0, 10, 'Cáp chia nguồn DC chân 5.5×2.1mm DCSPL1\r\nCáp chia nguồn DC DCSPL1 dùng để chia chân nguồn 5.5×2.1mm ra 2, 3, 4, 5, 6 hoặc 8 cổng. Giúp chúng ta dễ dàng cấp nguồn cho nhiều thiết bị hoặc đèn LED cùng lúc.\r\n\r\nKhi sử dụng cáp chia DCSPL1 bạn không cần phải đấu dây phức tạp mà chỉ cần cắm nguồn vào thiết bị là xong.'),
(45, 'Loa báo động không dây ', 'Loa báo động không dây 1702983868794.jpg', 4, 19, 152000, 155000, 0, 10, 'Loa báo động không dây Kerui KR-J010 xua tan nỗi lo an ninh khi mất điện\r\n\r\nThông thường với những thiết bị loa báo động khác phải cắm vào ổ điện mới hoạt động, thì khi mất điện thì các chức năng báo động của chúng sẽ không hoạt động và như thế sẽ tạo ra 1 lỗ hổng an ninh trong nhà bạn. Loa báo động không dây Kerui KR-J010 vừa mới ra mắt trên thị trường Việt Nam khắc phục được nhược điểm đó, khi thiét bị vừa có thể dùng nguồn điện cắm vào ổ, vừa có thể sử dụng pin sạc trong lúc mất điện.\r\n\r\nĐặc '),
(46, 'Loa chớp đèn báo động', 'Loa chớp đèn báo động1702983913093.jpg', 4, 20, 150000, 160000, 0, 10, 'Loa Chớp Đèn Báo Động 12V HT-SOS5\r\nLoa chớp đèn HT-SOS5 được thiết kế hoàn hảo để hoạt động với các hệ thống an ninh cảnh báo báo động bằng đèn chớp và loa hú cường độ cao.\r\n\r\nNó cung cấp sự bảo vệ chống lại những kẻ xâm nhập, trước khi họ có cơ hội để vào nhà. Với âm lượng 110dB mạnh mẽ của nó, Loa Chớp Đèn Báo Động 12V HT-SOS5 sẽ phát ra đèn nhấp nháy đi kèm cũng cung cấp cảnh báo trực quan và ngăn chặn đột nhập khi kích hoạt.\r\n\r\nTính năng, đặc điểm:Thiết kế đặc biệt cho những người dùng cần á'),
(47, 'Cảm biến báo khói không dây', 'Cảm biến báo khói không dây1702984005121.jpg', 4, 21, 150000, 200000, 0, 10, 'Cảm Biến Báo Khói Không Dây Phát Sóng RF 433Mhz C50\r\nĐầu báo khói C50 với tên tiếng Anh là Smoke Detector là thiết bị giám sát trực tiếp, phát hiện ra dấu hiệu khói trước khi có cháy lơn để chuyển các tín hiệu thông báo về trung tâm xử lý. Đầu báo khói được thiết kế đặc biệt có bộ cảm biến quang điện, độ nhạy cao, ổn định, độ bền cao được thiết kế để sử dụng trong nhà như: nhà ở, villa và căn hộ, kho tàng… những nơi có nguy cơ dễ cháy.\r\n\r\nCảm biến có thể phát hiện ra khói từ các đám cháy và kêu ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_content`
--

CREATE TABLE `tb_content` (
  `id` int(10) NOT NULL,
  `content_name` varchar(255) NOT NULL,
  `s_ma` int(5) NOT NULL,
  `content_img` varchar(255) NOT NULL,
  `content_desc` varchar(255) NOT NULL,
  `content_date` date NOT NULL,
  `content_status` int(2) NOT NULL,
  `content_stt` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_content`
--

INSERT INTO `tb_content` (`id`, `content_name`, `s_ma`, `content_img`, `content_desc`, `content_date`, `content_status`, `content_stt`) VALUES
(13, 'IP15NEW2023', 0, 'IP15NEW20231701165290646.jpg', ' ưu đãi iphone 15', '2023-11-28', 1, 2),
(14, 'NEWHPVICTUS15', 0, 'NEWHPVICTUS151701166706575.jpg', ' NEWHPVICTUS15', '2023-11-28', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_thanhtoan`
--

CREATE TABLE `tb_thanhtoan` (
  `id` int(10) NOT NULL,
  `id_hoadon` int(10) NOT NULL,
  `vnp_Amount` double NOT NULL,
  `vnp_BankCode` varchar(255) NOT NULL,
  `vnp_BankTranNo` varchar(255) NOT NULL,
  `vnp_CardType` varchar(255) NOT NULL,
  `vnp_OrderInfo` varchar(225) NOT NULL,
  `vnp_PayDate` date NOT NULL,
  `vnp_ResponseCode` varchar(225) NOT NULL,
  `vnp_TmnCode` varchar(225) NOT NULL,
  `vnp_TransactionNo` varchar(225) NOT NULL,
  `vnp_TransactionStatus` varchar(225) NOT NULL,
  `vnp_TxnRef` varchar(225) NOT NULL,
  `vnp_SecureHash` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_thanhtoan`
--

INSERT INTO `tb_thanhtoan` (`id`, `id_hoadon`, `vnp_Amount`, `vnp_BankCode`, `vnp_BankTranNo`, `vnp_CardType`, `vnp_OrderInfo`, `vnp_PayDate`, `vnp_ResponseCode`, `vnp_TmnCode`, `vnp_TransactionNo`, `vnp_TransactionStatus`, `vnp_TxnRef`, `vnp_SecureHash`) VALUES
(1, 6, 11600000000, 'NCB', 'VNP14228190', 'ATM', 'Thanh toan cho ma GD:08115833', '2023-12-08', '00', '8UX48MRS', '14228190', '00', '08115833', '17304592a08fce0f1bd5658477d9885e39d1e1d56238581a744e565e4567c5d89c10cc6dca563e0479c619627f59724d6edfa766465159001eed2a73815cb524'),
(2, 7, 11600000000, 'NCB', 'VNP14228190', 'ATM', 'Thanh toan cho ma GD:08115833', '2023-12-08', '00', '8UX48MRS', '14228190', '00', '08115833', '17304592a08fce0f1bd5658477d9885e39d1e1d56238581a744e565e4567c5d89c10cc6dca563e0479c619627f59724d6edfa766465159001eed2a73815cb524'),
(3, 8, 11600000000, 'NCB', 'VNP14228190', 'ATM', 'Thanh toan cho ma GD:08115833', '2023-12-08', '00', '8UX48MRS', '14228190', '00', '08115833', '17304592a08fce0f1bd5658477d9885e39d1e1d56238581a744e565e4567c5d89c10cc6dca563e0479c619627f59724d6edfa766465159001eed2a73815cb524'),
(4, 9, 11600000000, 'NCB', 'VNP14228190', 'ATM', 'Thanh toan cho ma GD:08115833', '2023-12-08', '00', '8UX48MRS', '14228190', '00', '08115833', '17304592a08fce0f1bd5658477d9885e39d1e1d56238581a744e565e4567c5d89c10cc6dca563e0479c619627f59724d6edfa766465159001eed2a73815cb524'),
(5, 10, 11600000000, 'NCB', 'VNP14228190', 'ATM', 'Thanh toan cho ma GD:08115833', '2023-12-08', '00', '8UX48MRS', '14228190', '00', '08115833', '17304592a08fce0f1bd5658477d9885e39d1e1d56238581a744e565e4567c5d89c10cc6dca563e0479c619627f59724d6edfa766465159001eed2a73815cb524'),
(6, 11, 14300000000, 'NCB', 'VNP14228416', 'ATM', 'Thanh toan cho ma GD:08141658', '2023-12-08', '00', '8UX48MRS', '14228416', '00', '08141658', '5c19ed998f0aebec3c7865d0c1b54e4400db92224c761eb9877999dbe95da8af93b0f669b2169dff1719d61a74865db794aa4c50eef0dc54cbd9e97861b3d843'),
(7, 12, 14300000000, 'NCB', 'VNP14228416', 'ATM', 'Thanh toan cho ma GD:08141658', '2023-12-08', '00', '8UX48MRS', '14228416', '00', '08141658', '5c19ed998f0aebec3c7865d0c1b54e4400db92224c761eb9877999dbe95da8af93b0f669b2169dff1719d61a74865db794aa4c50eef0dc54cbd9e97861b3d843'),
(8, 13, 14300000000, 'NCB', 'VNP14228416', 'ATM', 'Thanh toan cho ma GD:08141658', '2023-12-08', '00', '8UX48MRS', '14228416', '00', '08141658', '5c19ed998f0aebec3c7865d0c1b54e4400db92224c761eb9877999dbe95da8af93b0f669b2169dff1719d61a74865db794aa4c50eef0dc54cbd9e97861b3d843'),
(9, 14, 19400000000, 'NCB', 'VNP14228433', 'ATM', 'Thanh toan cho ma GD:08142134', '2023-12-08', '00', '8UX48MRS', '14228433', '00', '08142134', '47759b553f6fa3779bc5c8cee6ba863212566232f31becb712c1111ce5aa6d5c755d69e17671fece6456f63148c658e1acce8d8051b1bd29c34384a6703f6997'),
(10, 15, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(11, 16, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(12, 17, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(13, 18, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(14, 19, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(15, 20, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(16, 21, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(17, 22, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(18, 23, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(19, 24, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(20, 25, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(21, 26, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(22, 27, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(23, 28, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(24, 29, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(25, 30, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(26, 31, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(27, 32, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(28, 33, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(29, 34, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(30, 35, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(31, 36, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(32, 37, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(33, 38, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(34, 39, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(35, 40, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(36, 41, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(37, 42, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(38, 43, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(39, 44, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(40, 45, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(41, 46, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(42, 47, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(43, 48, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(44, 49, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(45, 50, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(46, 51, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(47, 52, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(48, 53, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(49, 54, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(50, 55, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(51, 56, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(52, 57, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(53, 58, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(54, 59, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(55, 60, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(56, 61, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(57, 62, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(58, 63, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(59, 64, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(60, 65, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(61, 66, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(62, 67, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(63, 68, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(64, 69, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(65, 70, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(66, 71, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(67, 72, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(68, 73, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(69, 74, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(70, 75, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(71, 76, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(72, 77, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(73, 78, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(74, 79, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(75, 80, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(76, 81, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(77, 82, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(78, 83, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(79, 84, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa'),
(80, 85, 19400000000, 'NCB', 'VNP14228527', 'ATM', 'Thanh toan cho ma GD:08145015', '2023-12-08', '00', '8UX48MRS', '14228527', '00', '08145015', 'aac99ece9938706169a4910b621978713ea73ba64c70497b12ef214c6282edfb50d0a68fec1422427da6461c257e1c72fdaca22fa1e4233c71e3d05c2bc443fa');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ma_hoa_don` (`ma_hoa_don`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`ma_hoa_don`);

--
-- Chỉ mục cho bảng `mathang`
--
ALTER TABLE `mathang`
  ADD PRIMARY KEY (`m_ma`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`ng_id`);

--
-- Chỉ mục cho bảng `nhanhieu`
--
ALTER TABLE `nhanhieu`
  ADD PRIMARY KEY (`nh_ma`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`n_ma`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`s_ma`);

--
-- Chỉ mục cho bảng `tb_content`
--
ALTER TABLE `tb_content`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tb_thanhtoan`
--
ALTER TABLE `tb_thanhtoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `ma_hoa_don` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `mathang`
--
ALTER TABLE `mathang`
  MODIFY `m_ma` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `ng_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nhanhieu`
--
ALTER TABLE `nhanhieu`
  MODIFY `nh_ma` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `n_ma` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `s_ma` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `tb_content`
--
ALTER TABLE `tb_content`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `tb_thanhtoan`
--
ALTER TABLE `tb_thanhtoan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`ma_hoa_don`) REFERENCES `hoadon` (`ma_hoa_don`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;