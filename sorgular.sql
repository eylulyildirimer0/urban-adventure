-- Ödev 3: Kampüs Kafe sorguları
-- Çalıştırma: psql -d kafe -a -f sorgular.sql > sorgular_cikti.txt 2>&1

-- Q1: Fiyatı 50 TL'den yüksek ürünleri pahalıdan ucuza sırala.
-- Ne işe yarar: Yönetici kafenin pahalı ürünlerini tek listede görür; fiyat ya da kampanya kararında bu listeye bakar.
SELECT name, category, price
FROM product
WHERE price > 50
ORDER BY price DESC;

-- Q2: 'YBS' bölümündeki müşterilerin adlarını alfabetik sırala.
-- Ne işe yarar: YBS öğrencilerine özel bir duyuru ya da indirim yapılacaksa hazır bir isim listesi verir.
SELECT full_name
FROM customer
WHERE department = 'YBS'
ORDER BY full_name;

-- Q3: Her siparişin numarasını, tarihini ve müşterinin adını listele.
-- Ne işe yarar: Hangi siparişi kimin, hangi gün verdiğini gösterir; bir siparişle ilgili şikâyet ya da soru gelince kişiyi bulmayı sağlar.
SELECT o.order_id, o.order_date, c.full_name
FROM orders o
INNER JOIN customer c ON c.customer_id = o.customer_id
ORDER BY o.order_id;

-- Q4: Her sipariş kaleminin ürün adını ve adedini listele.
-- Ne işe yarar: Her siparişte hangi üründen kaç tane satıldığını gösterir; stok ve hazırlık planı bu bilgiye dayanır.
SELECT oi.order_id, p.name, oi.quantity
FROM order_item oi
INNER JOIN product p ON p.product_id = oi.product_id
ORDER BY oi.order_id, p.name;

-- Q5: Her müşterinin kaç sipariş verdiğini müşteri adıyla listele.
-- Ne işe yarar: Sadık müşterileri ve hiç sipariş vermeyenleri (0) ortaya çıkarır; sadakat kartı gibi kararlarda kullanılır.
-- Not: LEFT JOIN kullandım; INNER JOIN olsaydı hiç sipariş vermeyen Emre Şahin listede görünmezdi.
SELECT c.full_name, COUNT(o.order_id) AS siparis_sayisi
FROM customer c
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY siparis_sayisi DESC, c.full_name;

-- Q6: Her ürün kategorisinin ortalama fiyatını bul.
-- Ne işe yarar: Kategorilerin fiyat seviyesini karşılaştırır; yeni bir ürüne fiyat verirken kategorinin ortalaması referans olur.
SELECT category, ROUND(AVG(price), 2) AS ortalama_fiyat
FROM product
GROUP BY category
ORDER BY ortalama_fiyat DESC;
