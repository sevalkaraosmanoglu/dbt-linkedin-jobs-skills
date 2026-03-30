# LinkedIn Jobs and Skills Analysis

Bu proje LinkedIn veri seti üzerinden iş ilanları ve yetenekleri analiz etmeyi, DBT ile veri modelleri oluşturmayı ve Power BI ile görselleştirmeyi amaçlamaktadır.

## Proje Adımları

1. **Genel Analiz**
   - LinkedIn veri setinin keşfi, dağılımları ve temel istatistikler.
2. **Data ve Yazılım Rolleri Analizi**
   - İş rolleri ve yeteneklerin dağılımı incelendi.
3. **Data Science: Skill Tahmin Modeli**
   - Lineer regresyon kullanılarak yetenek tahmin modeli oluşturuldu.
4. **Power BI Görselleştirmeleri**
   - Analiz sonuçları dashboard ve grafiklerle görselleştirildi.

## Teknolojiler ve Araçlar
- Big Query
- Python, Pandas, scikit-learn
- DBT
- Power BI

## DBT Model Yapısı

- **staging**  
  - Ham LinkedIn verilerinin temizlenmesi
- **intermediate**  
  - Rol–skill ilişkilerinin oluşturulması
- **marts**  
  - Power BI ve analizler için feature tabloları
  - Lineer regresyon modeli için feature table

## Power BI Ekran Görüntüleri
![Power BI 1](https://github.com/sevalkaraosmanoglu/dbt-linkedin-jobs-skills/blob/main/power_bi/1.png)
![Power BI 1](https://github.com/sevalkaraosmanoglu/dbt-linkedin-jobs-skills/blob/main/power_bi/2.png)
![Power BI 1](https://github.com/sevalkaraosmanoglu/dbt-linkedin-jobs-skills/blob/main/power_bi/3.png)
![Power BI 1](https://github.com/sevalkaraosmanoglu/dbt-linkedin-jobs-skills/blob/main/power_bi/4.png)
![Power BI 1](https://github.com/sevalkaraosmanoglu/dbt-linkedin-jobs-skills/blob/main/power_bi/5.1.png)
![Power BI 1](https://github.com/sevalkaraosmanoglu/dbt-linkedin-jobs-skills/blob/main/power_bi/5.2.png)
![Power BI 1](https://github.com/sevalkaraosmanoglu/dbt-linkedin-jobs-skills/blob/main/power_bi/6.1.png)
![Power BI 1](https://github.com/sevalkaraosmanoglu/dbt-linkedin-jobs-skills/blob/main/power_bi/6.2.png)

### Skill Tahmin Modeli
![Power BI 1](https://github.com/sevalkaraosmanoglu/dbt-linkedin-jobs-skills/blob/main/power_bi/7.png)

## Proje Çıktıları

- DBT ile katmanlı veri modelleme
- Power BI ile iş odaklı dashboard tasarımı
- Lineer regresyon ile skill tahmin modeli
- Gerçek iş ilanı verisi ile uçtan uca analiz
