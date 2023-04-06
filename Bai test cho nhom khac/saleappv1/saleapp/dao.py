from saleapp.models import Category, Product, User, Receipt, ReceiptDetails, Comment
from flask_login import current_user
from sqlalchemy import func
from saleapp import db
import hashlib


def load_categories():
    return Category.query.all()


def load_products(cate_id=None, kw=None):
    query = Product.query

    if cate_id:
        query = query.filter(Product.category_id.__eq__(cate_id))

    if kw:
        query = query.filter(Product.name.contains(kw))

    return query.all()


def get_product_by_id(product_id):
    return Product.query.get(product_id)


def auth_user(username, password):
    password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())

    return User.query.filter(User.username.__eq__(username.strip()),
                             User.password.__eq__(password)).first()


def register(name, username, password, avatar):
    password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
    u = User(name=name, username=username.strip(), password=password, avatar=avatar)
    db.session.add(u)
    db.session.commit()


def get_user_by_id(user_id):
    return User.query.get(user_id)


def save_receipt(cart):
    if cart:
        r = Receipt(user=current_user)
        db.session.add(r)

        for c in cart.values():
            d = ReceiptDetails(quantity=c['quantity'], price=c['price'],
                               receipt=r, product_id=c['id'])
            db.session.add(d)

        db.session.commit()


def count_product_by_cate():
    return db.session.query(Category.id, Category.name, func.count(Product.id))\
             .join(Product, Product.category_id.__eq__(Category.id), isouter=True)\
             .group_by(Category.id).all()


def stats_revenue(kw=None, from_date=None, to_date=None):
    query = db.session.query(Product.id, Product.name, func.sum(ReceiptDetails.quantity*ReceiptDetails.price))\
                      .join(ReceiptDetails, ReceiptDetails.product_id.__eq__(Product.id))\
                      .join(Receipt, ReceiptDetails.receipt_id.__eq__(Receipt.id))

    if kw:
        query = query.filter(Product.name.contains(kw))

    if from_date:
        query = query.filter(Receipt.created_date.__ge__(from_date))

    if to_date:
        query = query.filter(Receipt.created_date.__le__(to_date))

    return query.group_by(Product.id).order_by(-Product.id).all()


def load_comments(product_id):
    return Comment.query.filter(Comment.product_id.__eq__(product_id)).order_by(-Comment.id).all()


def save_comment(content, product_id):
    c = Comment(content=content, product_id=product_id, user=current_user)
    db.session.add(c)
    db.session.commit()

    return c


if __name__ == '__main__':
    from saleapp import app
    with app.app_context():
        print(count_product_by_cate())