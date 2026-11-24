# urban-adventure
1. Ne yaptım
Hazır gelen kafe.sql dosyasıyla PostgreSQL'de kafe veritabanını kurdum ve kafe yöneticisinin sorularına altı sorguyla cevap verdim. Sorguları ve her birinin ne işe yaradığını sorgular.sql dosyasına yazdım, çıktısını sorgular_cikti.txt dosyasına aldım. null_deneyi.md dosyasında iki NULL deneyini tahmin, sonuç ve yorumla anlattım. dml.sql dosyasında fiyat güncellemesini ve hatalı bir INSERT'i BEGIN–ROLLBACK içinde denedim, çıktısını dml_cikti.txt dosyasına aldım.
2. En önemli iki karar ve gerekçesi
Karar 1: Q5'te INNER JOIN yerine LEFT JOIN kullandım ve COUNT(*) yerine COUNT(o.order_id) saydım. Soru "her müşteri" diyor; INNER JOIN olsaydı hiç sipariş vermeyen Emre Şahin listeden düşerdi. Bu hâliyle Emre 0 siparişle görünüyor; yönetici için asıl ilginç olan da o.
Karar 2: dml.sql içinde hatalı INSERT'i en sona koydum ve fiyatları gösteren aynı SELECT'i üç kez ORDER BY product_id ile çalıştırdım. PostgreSQL hatadan sonra ROLLBACK'e kadar başka sorgu çalıştırmıyor; sıralama sabit olunca da önce 20/35/60, sonra 25/40/65, ROLLBACK'ten sonra yine 20/35/60 olduğu satır satır karşılaştırılabiliyor.
3. Beklemediğim şey / yaptığım hata
NULL deneyinin ikincisinde SUM(age) / COUNT() için 125 / 8 = 15,625 bekliyordum ama sonuç 15 çıktı. age sütunu integer olduğu için PostgreSQL tam sayı bölmesi yapıp küsuratı atmış. SUM(age)::numeric / COUNT() yazınca 15,625 geldi. Yani bu deneyde sonucu hem NULL'lar hem de veri tipi değiştiriyordu.
4. Yapay zeka kullanımı
Bu ödevde SQL sorgularını, NULL deneyi dosyasını ve rapor taslağını büyük ölçüde kendim hazırladım. Hazırladığım sorguları PostgreSQL 16'da çalıştırarak sonuçlarını kontrol ettim ve çıktı dosyalarını sonuç tablosuyla karşılaştırdım. Takıldığım bazı noktalarda Claude'dan fikir ve kontrol desteği aldım. Son düzenlemeleri ve kontrolleri kendim yaptım.
5. Öz kontrol
[x] sorgular.sql ve sorgular_cikti.txt: altı sorgu, altı sonuç görünüyor
[x] null_deneyi.md: iki deney için tahmin, sonuç ve yorum var
[x] dml.sql ve dml_cikti.txt: 23503 hata kodu görünüyor, fiyatlar geri dönüyor
[ ] Ödev 1 ve Ödev 2 tek repoda birleşti: bu raporu yazarken henüz yapılmadı
[ ] odev-3 branch'i push edildi ve Pull Request açıldı: henüz yapılmadı
[ ] Rapor PDF'i reports/odev-3-rapor.pdf yolunda: henüz yüklenme
