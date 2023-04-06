from flask import render_template, request, redirect, session, jsonify
from saleapp import dao, app, login, admin, utils
from flask_login import login_user, logout_user, current_user, login_required
from saleapp.decorators import annonymous_user
import cloudinary.uploader


def index():
    cate_id = request.args.get('category_id')
    kw = request.args.get('keyword')
    products = dao.load_products(cate_id=cate_id, kw=kw)
    return render_template('index.html', products=products)


def details(product_id):
    p = dao.get_product_by_id(product_id)
    return render_template('details.html', product=p)


def admin_login():
    username = request.form['username']
    password = request.form['password']

    user = dao.auth_user(username=username, password=password)
    if user:
        login_user(user=user)

    return redirect('/admin')


def register():
    err_msg = ''
    if request.method.__eq__('POST'):
        password = request.form['password']
        confirm = request.form['confirm']
        if password.__eq__(confirm):
            avatar = ''
            if request.files:
                res = cloudinary.uploader.upload(request.files['avatar'])
                avatar = res['secure_url']

            try:
                dao.register(name=request.form['name'],
                             username=request.form['username'],
                             password=password, avatar=avatar)
                return redirect('/login')
            except:
                err_msg = 'Hệ thống đang có lỗi! Vui lòng quay lại sau!'
        else:
            err_msg = 'Mật khẩu KHÔNG khớp!'

    return render_template('register.html', err_msg=err_msg)


@annonymous_user
def login_my_user():
    if request.method.__eq__('POST'):
        username = request.form['username']
        password = request.form['password']
        user = dao.auth_user(username=username, password=password)
        if user:
            login_user(user=user)
            n = request.args.get('next')
            return redirect(n if n else '/')

    return render_template('login.html')


def logout_my_user():
    logout_user()

    return redirect('/login')


def cart():
    # session['cart'] = {
    #     "1": {
    #         "id": "1",
    #         "name": "iPhone 13",
    #         "price": 12000,
    #         "quantity": 2
    #     }, "2": {
    #         "id": "2",
    #         "name": "iPhone 14",
    #         "price": 15000,
    #         "quantity": 5
    #     }
    # }
    return render_template('cart.html')


def add_to_cart():
    data = request.json
    id = str(data['id'])

    key = app.config['CART_KEY'] # 'cart'
    cart = session[key] if key in session else {}
    if id in cart:
        cart[id]['quantity'] += 1
    else:
        name = data['name']
        price = data['price']

        cart[id] = {
            "id": id,
            "name": name,
            "price": price,
            "quantity": 1
        }

    session[key] = cart

    return jsonify(utils.cart_stats(cart=cart))


def update_cart(product_id):
    key = app.config['CART_KEY']  # 'cart'
    cart = session.get(key)

    if cart and product_id in cart:
        cart[product_id]['quantity'] = int(request.json['quantity'])

    session[key] = cart

    return jsonify(utils.cart_stats(cart=cart))


def delete_cart(product_id):
    key = app.config['CART_KEY']  # 'cart'
    cart = session.get(key)

    if cart and product_id in cart:
        del cart[product_id]

    session[key] = cart

    return jsonify(utils.cart_stats(cart=cart))


@login_required
def pay():
    key = app.config['CART_KEY']  # 'cart'
    cart = session.get(key)
    # import pdb
    # pdb.set_trace()
    try:
        dao.save_receipt(cart)
    except Exception as ex:
        print(str(ex))
        return jsonify({'status': 500})
    else:
        del session[key]

    return jsonify({'status': 200})


def comments(product_id):
    data = []
    for c in dao.load_comments(product_id=product_id):
        data.append({
            'id': c.id,
            'content': c.content,
            'created_date': str(c.created_date),
            'user': {
                'name': c.user.name,
                'avatar': c.user.avatar
            }
        })

    return jsonify(data)


def add_comment(product_id):
    try:
        c = dao.save_comment(product_id=product_id, content=request.json['content'])
    except:
        return jsonify({'status': 500})

    return jsonify({
        'status': 204,
        'comment': {
            'id': c.id,
            'content': c.content,
            'created_date': str(c.created_date),
            'user': {
                'name': c.user.name,
                'avatar': c.user.avatar
            }
        }
    })