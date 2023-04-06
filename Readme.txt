*	Các chức năng có sử dụng database MySQLWorkbench
- chức năng đăng ký: register.html, dao.py, controllers.py, index.py
- chức năng đăng nhập: login.html, dao.py, controllers.py, index.py
- chức năng đăng xuất: controllers.py, index.py
- chức năng xem chi tiết sản phẩm: details.html, controllers.py, index.py, details.js
- chức năng nút đặt hàng và giỏ hàng: cart.html, index.html, controllers.py, index.py, dao.py, utils.py, cart.js
- chức năng bình luận: controllers.py, index.py, dao.py, details.js
- chức năng tạo đơn hàng: dao.py, models.py
*	Trang quản trị admin( http://127.0.0.1:5000/admin/)
- chức năng vẽ chart: chart.js, stats.html, admin/index.html
- chức năng tạo danh mục: admin.py, stats.html, admin/index.html
- chức năng tạo sản phẩm: admin.py, stats.html, admin/index.html
- chức năng thống kê và báo cáo: chart.js, admin.py, stats.html, admin/index.html
*	Hướng dẫn cài đặt PyCharm để chạy chương trình:
- Bạn truy cập trang web chính thức của pycharm tại www.jetbrains.com/pycharm/download/#section=windows để cài đặt nó.
- Tải xuống phiên bản Cộng đồng.
- Tệp tải xuống sẽ nằm trong mục download, nhấp vào tệp để cài đặt Pycharm.
- Khi cửa sổ sau xuất hiện, nhấp vào Tiếp theo và quá trình cài đặt sẽ bắt đầu.
- Sau khi nhấn vào Next , đầu tiên sẽ xuất hiện cửa sổ thiết lập vị trí cài đặt.
- Trong bước tiếp theo, bạn có thể đặt Installation Options theo yêu cầu, sau đó nhấp vào nút Next để tiếp tục.
- Bây giờ, bạn phải chọn thư mục Start Menu, hoặc bạn có thể để nó làm mặc định.
- Sau các bước này, bạn bấm vào nút Install như trên để bắt đầu quá trình cài đặt.
- Khi bạn nhấp vào nút Kết thúc, quá trình cài đặt PyCharm của bạn hoàn tất.
*  	Hướng dẫn cài đặt MySQL Workbench để kết nối database:
- Cài đặt MySQL Community Server.
- Chọn Setup Type và bấm vào Next .
- Khi bạn nhấp vào nút Next , nó sẽ xuất hiện màn hình sau.
- Khi bạn bấm vào Next, màn hình như sau sẽ xuất hiện.
- Ở đây, chọn Execute để tải về và cài đặt the MySQL Server và Workbench.
- Ở màn hình tiếp theo, bạn cần tiếp tục cấu hình the MySQL Server và bấm vào Next .
- Ngay sau khi bạn nhấp vào nút Next, bạn có thể nhìn thấy màn hình bên dưới.
- Trong màn hình tiếp theo, hệ thống sẽ yêu cầu bạn chọn Config Type và các tùy chọn kết nối khác.
- Bây giờ, chọn Authentication Method và nhấn vào Next.
- Màn hình tiếp theo sẽ yêu cầu bạn chọn tài khoản, tên đăng nhập, và mật khẩu.
- Màn hình tiếp theo sẽ yêu cầu bạn cấu hình Windows Service.
- Trong màn hình tiếp theo, hệ thống sẽ yêu cầu bạn áp dụng Server Configuration.
- Sau khi cấu hình xong, bạn sẽ nhận được màn hình bên dưới.
- Trong màn hình tiếp theo, bạn có thể thấy rằng Product Configuration đã hoàn tất.
- Sau khi bạn nhấp vào nút Finish, MySQL Workbench sẽ được mở trên hệ thống của bạn như hiển thị trong màn hình bên dưới.
- Trong màn hình trên, bạn cần thực hiện kết nối.
- Nếu chưa có kết nối, bạn có thể tạo kết nối mới.
- Sau khi nhập đầy đủ thông tin chi tiết, hãy nhấp vào Test Connection để kiểm tra khả năng kết nối cơ sở dữ liệu.
- Khi bạn đã hoàn tất các thiết lập, nó sẽ mở ra màn hình MySQL Workbench.
Để khởi động chương trình bạn phải chạy file index.py, khi chạy sẽ xuất hiện một địa chỉ: http://127.0.0.1:5000
*Lưu ý: trước khi chạy chương trình , bạn cần đăng nhập vào MySQL Workbench để kết nối dữ liệu
*	Hướng dẫn mở project 
- Mở pycharm nếu nó hiện lên tab Welcome to Pycharm thì chọn open tìm vị trí thư mục đã tải về sau đó sổ các thư mục ra và chọn vào thư mục "saleappv1" và chọn ok 
*Cách thêm database vào MySQL 
	sau khi đăng nhập vào MySQL, nhấp vào adminstration nằm ở giữa màn hình bên trái 
	chọn Data Import/Restore
	Ở phần Import Option chọn option 2 (Import from Self-contained file) và chọn file sql được nhận
	Tiếp theo xuống bên dưới, ngay phần Defalt Schema to be Imported To chọn New và tạo db mới có tên it01saledbv1 
	sau đó quay lại lên trên chọn tab 2 (Import Progress) và chọn start Import đợi vài giây nếu không báo lỗi thì đã thành công 
*cách chạy file requiments.txt 
	- Mở Pycharm và vào file chọn setting vào mục project: name(name = saleappv1) 
	- Chọn python Interpreter và chọn add Interpreter chọn add local Interpreter
	- chọn mục virtualenv environment để mặc định và chọn OK
	- mở tab Terminal ở dưới cùng màn hình 
	- sau đó gõ lệnh : pip install -r requirements.txt và đợi cài các thư viện sau đó chạy file index.py bình thường
Chi tiết các chức năng:
	Chức năng trang chủ : hiển thị tất cả các món ăn
	Chức năng thực đơn : chỉ hiển thị các món ăn chính
	Chức năng món ăn kèm : chỉ hiển thị các món ăn kèm
	Chức ăn thức uống : chỉ hiển thị các loại thức uống
	Chức năng xem chi tiết : hiển thị rõ thông tin chi tiết của từng món
	Chức năng đặt hàng : khi click vào nút đặt hàng, sản phẩm sẽ tự động được thêm vào giỏ hàng của bạn
	Chức năng đăng nhập : hiển thị trang đăng nhập và yêu cầu nhập tài khoản mà bạn đã tạo
	Chức năng đăng ký : hiển thị trang đăng ký và yêu cầu bạn điền đầy đủ thông tin để đăng ký tài khoản
	Chức năng giỏ hàng : hiển thị các sản phẩm mà bạn đã lựa chọn , có thể xoá hoặc tiếp tục chọn sản phẩm
	Chức năng tìm kiếm : có thể tìm kiếm nhanh
	Chức năng bình luận: bình luận về 1 sản phẩm 
Đăng nhập vào trang quản trị admin:
	Chức năng trang chủ : yêu cầu đăng nhập vào tài khoản admin
	Chức năng danh mục : bao gồm các chức năng : Tạo thêm sản phẩm và cũng có thể xoá sản phẩm
	Chức năng sản phẩm : hiển thị chi tiết và bao quát tất cả sản phẩm
	Chức năng thống kê : hiển thị thông tin thống kê mà các sản phẩm được bán ra 

*giới thiệu rõ các chức năng chi tiết và mối liên hệ của các chức năng nếu có
	chức năng giỏ hàng và chức năng bình luận phải đăng nhập vào mới được thanh toán hoặc bình luận
 


