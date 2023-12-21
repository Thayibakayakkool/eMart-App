import 'package:flutter/material.dart';

final appColors = Colors.teal[900];
const whiteColors = Colors.white;
const loggedIn = "Logged in successfully";
const loggedout = "Logged out successfully";

Image googleIcons = Image.network(
    'https://cdn3.iconfinder.com/data/icons/logos-brands-3/24/logo_brand_brands_logos_google-128.png');
Image facebookIcons = Image.network(
    'https://cdn3.iconfinder.com/data/icons/2018-social-media-logotypes/1000/2018_social_media_popular_app_logo_facebook-128.png');
Image twitterIcons = Image.network(
    'https://cdn3.iconfinder.com/data/icons/2018-social-media-logotypes/1000/2018_social_media_popular_app_logo_twitter-128.png');

const List brandsList = [
  'https://imgs.search.brave.com/36UMIdKzINEVbs8CFN4xKA0U9IsA6CwoN7_sQ_8DdGM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9zc2xp/bWFnZXMuc2hvcHBl/cnNzdG9wLmNvbS9z/eXMtbWFzdGVyL3Jv/b3QvaDlmL2hiNy8z/MDk0MTYwMTAwNTU5/OC9qdW5pcGVyLS0t/Y2Fyb3VzZWwtV2Vi/LS1vZmZlci1wYWdl/LS0yMDIzLTA5LTIw/LmpwZw',
  'https://imgs.search.brave.com/nBZcWff02skxJ2wfaPDc_UPuWSY3X_4vdHuRCkOAeXQ/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9zc2xp/bWFnZXMuc2hvcHBl/cnNzdG9wLmNvbS9z/eXMtbWFzdGVyL3Jv/b3QvaGJkL2g0Ni8z/MTQyOTM5NjMzMjU3/NC9GZWF0dXJlZC1C/cmFuZHMtc3RhdGlj/LXdlYl8xNzExMjMu/anBn',
  'https://imgs.search.brave.com/AvP16sFSHoc39kzmbQk4HYIh6c3XcCaNdwYpA7JIipI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9zc2xp/bWFnZXMuc2hvcHBl/cnNzdG9wLmNvbS9z/eXMtbWFzdGVyL3Jv/b3QvaDI5L2gwMy8y/OTA0ODE0OTkwMTM0/Mi9kcmVzcy1mZXN0/LXdlYi0tc3RvcmUt/dG8tZXhwbG9yZS0y/MDIzLTEtMTMtbmV3/LWhwLmpwZw',
  'https://imgs.search.brave.com/YjHrdaTx1rC3pIj0L6bpRf0gKqcufLQmrQupOnFO1jc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9zc2xp/bWFnZXMuc2hvcHBl/cnNzdG9wLmNvbS9z/eXMtbWFzdGVyL3Jv/b3QvaGIxL2g3Mi8z/MTIwNTE4MTMyNTM0/Mi9mcmF0aW5pLS0t/LWJhbmRleWEta2Fz/aGlzaC0tU2hvcHBl/cnMtU3RvcC1TZWxl/Y3RzLVdlYi0tYmFy/LXBhZ2UtMjAzLTEw/MjAuanBn',
];

const List brandsList2 = [
  'https://imgs.search.brave.com/JlRVYEpZragmMr_UgfhDS99GNcZXKMmxbwCc0veJ3xQ/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtc3RhdGljLm55/a2FhLmNvbS91cGxv/YWRzLzUwMGUwNTJl/LTBkNWEtNDcwZS1h/Yzk1LWU2ZDA1MzY2/NWE4OC5qcGc_dHI9/dy02MDAsY20tcGFk/X3Jlc2l6ZQ',
  'https://imgs.search.brave.com/4zzl_5ou8d8AIaDPdASY5ZqkovKqL0-2qTmpaClAbzo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZnJlZWthYW1h/YWwuY29tL3Bvc3Rf/aW1hZ2VzLzE2OTEw/NjU1ODgud2VicA',
  'https://imgs.search.brave.com/-CaSX956lb0iN480X7SxRInQX3MLaRVBtMkfdR4dCo8/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wbHVz/LnVuc3BsYXNoLmNv/bS9wcmVtaXVtX3Bo/b3RvLTE2Nzc1MjY0/OTY1OTctYWEwZjQ5/MDUzY2UyP2F1dG89/Zm9ybWF0JmZpdD1j/cm9wJnE9ODAmdz0x/MDAwJml4bGliPXJi/LTQuMC4zJml4aWQ9/TTN3eE1qQTNmREI4/TUh4elpXRnlZMmg4/Tlh4OGJXRnJaWFZ3/SlRJd2NISnZaSFZq/ZEhOOFpXNThNSHg4/TUh4OGZEQT0',
  'https://imgs.search.brave.com/32SHH8iOUTnf2ywIinZLzuZjgOjmoC3xPVdbQMkBHrI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wbHVz/LnVuc3BsYXNoLmNv/bS9wcmVtaXVtX3Bo/b3RvLTE2NzY4MTg0/MzA5MDAtYzA0MjJh/MDFkYmE5P2F1dG89/Zm9ybWF0JmZpdD1j/cm9wJnE9ODAmdz0x/MDAwJml4bGliPXJi/LTQuMC4zJml4aWQ9/TTN3eE1qQTNmREI4/TUh4elpXRnlZMmg4/T1h4OGJXRnJaWFZ3/SlRJd2NISnZaSFZq/ZEhOOFpXNThNSHg4/TUh4OGZEQT0',
];
const List brandsList3 = [
  'https://imgs.search.brave.com/Sa-Z44i1Fx02JIyT07IxNDuOKCjn_aw2Rd3VSAb4Wrc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4u/Y3JlYXRlLnZpc3Rh/LmNvbS9kb3dubG9h/ZHMvZTNkMWJiNGEt/NzhmYi00MzVhLWIy/N2MtNTg4ZmU2Y2Q2/Y2MwXzQ1MC5qcGVn',
  'https://imgs.search.brave.com/FcJf9L-gZoW3wyKkdAVVl-cS9AYgUft1aCtied5CNT0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4u/Y3JlYXRlLnZpc3Rh/LmNvbS9kb3dubG9h/ZHMvYzljMDA5ODYt/YmY3Yi00NDE2LWE3/MzEtNWY3ZjJjZDI0/OGZhXzQ1MC5qcGVn',
  'https://imgs.search.brave.com/LipHLixTdiPqqikMMyiU3hvSnz6JuCitXAjrjpcdSDc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4u/Y3JlYXRlLnZpc3Rh/LmNvbS9kb3dubG9h/ZHMvNGE3YjhiM2Ut/NDYzMS00MzUyLTgy/MmItMzlhMDlhZjAy/OWFjXzQ1MC5qcGVn',
  'https://imgs.search.brave.com/LoPUqOsPaMGdwpBeOyx95lRPYxdfLft6VYLdfTNQGDY/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4u/Y3JlYXRlLnZpc3Rh/LmNvbS9kb3dubG9h/ZHMvYWRjMWQ4NTMt/OWY1Mi00MDFlLWEz/N2YtNWQ0OTZjN2Vh/NDBlXzQ1MC5qcGVn',
];

const categoriesProduct = [
  'https://streetstylestalk.com/cdn/shop/products/1_27.jpg?v=1651738513',
  'https://i.pinimg.com/originals/45/b5/8f/45b58f78b432deb1f3638ae63dc25f32.jpg',
  'https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1697018156/Croma%20Assets/Computers%20Peripherals/Laptop/Images/275785_0_obmmqp.png?tr=w-1000',
  'https://post.healthline.com/wp-content/uploads/2020/04/makeup_composition_overhead-1296x728-header.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH8QXWRuzj8OSWvz13ZiKpj4i8dxKBI3TP3A&usqp=CAU',
  'https://hgtvhome.sndimg.com/content/dam/images/hgtv/products/2019/12/13/4/rx_target_mini-waffle-maker.jpeg.rend.hgtvcom.616.616.suffix/1576256434236.jpeg',
  'https://i.pinimg.com/736x/df/2b/d6/df2bd6463ba48f2a50bcee2e6116b8be.jpg',
  'https://www.sahivalue.com/product-images/14+pro+max.jpg/293890000021697778/400x400',
  'https://image.made-in-china.com/2f0j00bfqoKAkIMPcn/Custom-Simple-Hotel-Home-Bedroom-Furniture-Storage-Makeup-Mirror-Dressing-Table.webp',
];

const categoriesProductName = [
  "Women Dresses",
  "Men Clothing",
  "Computers",
  "Makeup",
  "Kids & Toys",
  "Appliances",
  "Jewellery",
  "Cellphone",
  "Furniture",
];

const profileButtonName = ["My Whislist", "My Orders"];
const profileButtonImage = [
  "https://cdn1.iconfinder.com/data/icons/media-communication-line/32/33-Whislist-128.png",
  'https://cdn4.iconfinder.com/data/icons/zeir-time-events-vol-1/25/history_recent_orders-128.png',
];

loadingIndicator() {
  return CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(appColors),
  );
}

const paymentMethodsImg = [
  'https://lh3.googleusercontent.com/sLOqRZU_8S8C9xMIyc7kD74pyIuJWUi5zBsopj95PZ6C78PFRxwaLN0mMfDbQhKM0F9VEsM-L_0wt-q-HAJwDr3phCjzNjASyjSL',
  'https://1000logos.net/wp-content/uploads/2021/03/Paytm_Logo.jpg',
  'https://static.vecteezy.com/system/resources/previews/010/595/642/original/cod-cash-on-delivery-truck-car-graphic-free-vector.jpg'
];

const paymentMethods = ["GPay", "Paytm", "Cash on Delivery"];

final colors = [
  Colors.purple,
  Colors.pink,
  Colors.green,
  Colors.orange,
  Colors.red,
  Colors.blue,
  Colors.teal,
  Colors.amber,
  Colors.black
];

const todayCategory = [
  'https://i.pinimg.com/474x/00/6b/be/006bbe7ac2704c299d13deeffcfd6c9a.jpg',
  'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/97/391949/1.jpg?8877',
  'https://i5.walmartimages.com/seo/CoCopeaunt-Vintage-Shoulder-Bag-Short-Handle-Small-Purse-Embroidered-Thread-Luxury-Designer-Handbag-Crossbody-Bags-for-Women-Womens-Tote_057f62ba-7301-4d51-8e05-5ce5643cbe83.5677b9c7233081722b32168ceea6f969.jpeg',
  'https://imgs.search.brave.com/lhI_jAQUk0LVtcJSGXcWr8MsXfrpKi8W2u6RW963UQU/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by9tZW4tZmFzaGlv/bi1sZWF0aGVyLWJy/b3duLXNob2VzLWlz/b2xhdGVkLXdoaXRl/XzEwNzYxMi00MDQu/anBnP3NpemU9NjI2/JmV4dD1qcGc',
  'https://rukminim1.flixcart.com/image/850/1000/xif0q/ring/d/h/w/adjustable-1-mkr188-ring-myki-original-imagphkncyefvfyk.jpeg?q=90',
  'https://5.imimg.com/data5/ANDROID/Default/2023/3/296620034/NG/WL/SQ/182970949/product-jpeg.jpg',
  'https://imgs.search.brave.com/ENXWP6VWZSscFR3cI6FPkHjdcwDhuAOqhK-q-D8B9to/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NjFRZU5XU1NIYUwu/anBn',
  'https://images.meesho.com/images/products/206038785/pcdc6_256.webp',
  'https://images-cdn.ubuy.co.in/65704c4e087c3a2cea792b45-taohfe-wooden-play-kitchen-kids-kitchen.jpg',
  'https://assets.ajio.com/medias/sys_master/root/20230803/11b7/64cb55faeebac147fca3ab0f/-473Wx593H-466413500-green-MODEL.jpg'
];

const todayCategoryName = [
  'Beautiful Frock',
  'Heels',
  'Handbag',
  'Men Shoes',
  'Ring',
  'Women Watch',
  'Men Watch',
  'Baby Dress',
  'Kitchen set',
  'Bangles'
];

const todayCategoryRate = [
  '2000',
  '1500',
  '600',
  '2500',
  '300',
  '1000',
  '1300',
  '900',
  '1800',
  '800'
];

const flashCategory = [
  'https://i.ebayimg.com/images/g/4UUAAOSwB7Zhi-3a/s-l1200.jpg',
  'https://i.pinimg.com/736x/40/14/a7/4014a794baa273cd3f6dd0eedd84000e.jpg',
  'https://i.etsystatic.com/19382416/r/il/4f3dd5/4288375401/il_1080xN.4288375401_pb9c.jpg',
  'https://img.tatacliq.com/images/i8/1316Wx1468H/MP000000015336041_1316Wx1468H_202211200251322.jpeg',
  'https://blingvine.com/cdn/shop/products/katherine-pearl-necklace-set-necklace-sets-blingvine-852602_750x.jpg?v=1642122450',
  'https://www.tiesta.in/cdn/shop/products/WhatsAppImage2021-09-20at5.16.49PM_6_-Copy.jpg?v=1648721128',
  'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/71ccqB-VKZL._SL1100_.jpg',
  'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/318BrVXRmUL._AC_UF1000,1000_QL80_.jpg',
  'https://static5.lenskart.com/media/catalog/product/pro/1/thumbnail/628x301/9df78eab33525d08d6e5fb8d27136e95//v/i/vincent-chase-vc-s13137-c4-c4-sunglasses_g_8693.jpg',
  'https://www.evok.in/media/catalog/product/f/o/fooclcfbmtbu12684m_1.jpg?quality=80&bg-color=255,255,255&fit=bounds&height=340&width=336&canvas=336:340',
];

const flashCategoryName = [
  'Women Dresses',
  'Men Dresses',
  'Earrings',
  'Perfumes',
  'Necklace Set',
  'Heels',
  'Jackets',
  'Compact Powder',
  'Sunglasses',
  'Chair',
];
const flashCategoryRate = [
  '7000',
  '3500',
  '400',
  '1000',
  '1700',
  '2500',
  '2000',
  '900',
  '700',
  '20000'
];

const brandsName = [
  'https://static.vecteezy.com/system/resources/previews/010/994/412/original/nike-logo-black-with-name-clothes-design-icon-abstract-football-illustration-with-white-background-free-vector.jpg',
  'https://media.designrush.com/inspirations/129360/conversions/_1513770087_98_chanel1-preview.jpg',
  'https://1000logos.net/wp-content/uploads/2019/12/U.S.-Polo-Assn-Logo.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBh2h41UWT49mbVAp2x8rVP-0DLD-4nzpUtG6rFbMTKbIzmU4kNodLV9SHpJLe6eUxgsA&usqp=CAU',
  'https://bcassetcdn.com/public/blog/wp-content/uploads/2021/11/10190900/Gucci.png',
  'https://bcassetcdn.com/public/blog/wp-content/uploads/2021/11/10190851/Louis-Vuitton-1.png',
  'https://fullstop360.com/blog/wp-content/uploads/2020/11/Burberry-London.jpg',
  'https://1000logos.net/wp-content/uploads/2019/06/Adidas-Logo-1991.jpg',
  'https://1000logos.net/wp-content/uploads/2017/02/Hennes-Logo-19682.jpg',
  'https://assets.turbologo.ru/blog/ru/2021/11/12082117/ZARA-logo.png',
];

const topSellerCategory = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEnMQJoYUf7wnO_qZ-VvOHPcjYG2PWKsEK0nVUzgseaxBqYeKlPK7Lbq56C6kmMeofgVI&usqp=CAU',
  'https://sureena.b-cdn.net/wp-content/uploads/2022/10/Lamha-Cover-Outfit-8-1.jpg',
  'https://darlingretail.com/cdn/shop/products/r1595_Midnight_PDP_Image_Position-1A_Avail__en-IN_1024x.jpg?v=1663051619',
  'https://haroldelectricals.com/cdn/shop/products/BlackMamba-Round-1_1080x.png?v=1649736832',
  'https://assets.ajio.com/medias/sys_master/root/20230615/6XQV/648b119bd55b7d0c636cf6df/-473Wx593H-466277402-beige-MODEL.jpg',
  'https://www.marryshe.com/cdn/shop/products/O1CN01aB7i8O1F24EGeOYht__2208423960428-0-cib_250x.jpg',
  'https://staranddaisy.in/wp-content/uploads/2023/03/lfc_hs901_p_red_1_new.jpg',
  'https://i.pinimg.com/474x/53/54/2c/53542c3894e81d85b9cc840aed10b248.jpg',
  'https://5.imimg.com/data5/YU/PD/WS/SELLER-61259432/men-s-winter-fashion-jacket-500x500.jpg',
  'https://down-ph.img.susercontent.com/file/abc9aca982ac13d36d2b752cbe50e9fa',
];

const topSellerCategoryName = [
  'Women Boots',
  'Kurta Sets',
  'IPhone 14',
  'Light',
  'Girls Shoe',
  'Girls Frock',
  'Toy Car',
  'Necklace',
  'Men Winter Jacket',
  'Women Shoe',
];

const topSellerCategoryRate = [
  '5000',
  '3000',
  '100000',
  '11000',
  '600',
  '2000',
  '1000',
  '800',
  '2500',
  '1500',
];
