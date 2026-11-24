# NULL Deneyi

`customer` tablosunda 8 müşteri var. Telefonu boş (NULL) olanlar: Mehmet Kaya, Can Arslan, Selin Öztürk (3 kişi). Yaşı boş olanlar: Elif Yıldız, Can Arslan (2 kişi).

## Deney 1

```sql
SELECT COUNT(*), COUNT(phone) FROM customer;
```

**Tahminim:** `COUNT(*)` 8 verir, çünkü tablodaki bütün satırları sayar. `COUNT(phone)` ise 3 kişinin telefonu boş olduğu için 5 verir.

**Sonuç:**

| count | count |
|------:|------:|
| 8     | 5     |

**Yorum:** Tahminim tuttu. `COUNT(*)` satırları sayıyor, `COUNT(phone)` ise yalnızca telefonu dolu olanları sayıyor; yani NULL "boş yazı" gibi sayılmıyor, hiç yokmuş gibi atlanıyor.

## Deney 2

```sql
SELECT AVG(age), SUM(age) / COUNT(*) FROM customer;
```

**Tahminim:** İki sonuç farklı çıkar. `AVG(age)` yaşı boş olan 2 kişiyi hesaba katmaz: 125 / 6 ≈ 20,83. `SUM(age) / COUNT(*)` ise toplamı 8 kişiye böler: 125 / 8 = 15,625.

**Sonuç:**

| avg                 | ?column? |
|--------------------:|---------:|
| 20.8333333333333333 | 15       |

**Yorum:** Tahminimin büyük kısmı tuttu: `AVG` NULL yaşları atlayıp 6 kişiye bölüyor, ikinci ifade ise 8 kişiye bölüyor ve ortalamayı düşürüyor. Tutmayan kısım 15,625 yerine 15 çıkması oldu; `age` sütunu integer olduğu için PostgreSQL tam sayı bölmesi yapıp küsuratı attı. Yani NULL'u 0 gibi saymak ortalamayı yanlış gösterir.
