# Flutter Uzaktan Mouse Kontrol Uygulaması

Bu GitHub deposu, Windows ve Android cihazlar arasında uzaktan mouse kontrolü sağlayan bir Flutter uygulamasının kaynak kodunu içerir. Uygulama, kullanıcıların Android cihazlarını bir uzaktan kontrol cihazına dönüştürmelerine olanak tanır ve bu cihazı bir Windows bilgisayarın fare işlevselliğini etkilemek için kullanabilirler.

## Özellikler

- Uzaktan fare tıklama işlemleri
- Uzaktan fare sağ tıklama işlemleri
- Uzaktan fare sürükleme işlemleri
- Uzaktan pencere açma işlemleri
- Basit ve kullanıcı dostu arayüz

## Kullanım

1. **Sunucu Uygulaması:**
    - Depodaki `server.py` dosyasını Windows bilgisayarınıza indirin.
    - Python 3'ün en son sürümünü yükleyin.
    - Gerekli bağımlılıkları yüklemek için terminalde `pip install pyautogui` komutunu çalıştırın.
    - Terminalde `python server.py` komutunu çalıştırarak sunucu uygulamasını başlatın.

2. **Flutter Uygulaması:**
    - Flutter yüklü olduğundan emin olun.
    - Depoyu klonlayın: `git clone https://github.com/MURABIT-PASHA/Flutter-Remote-Mouse-Controller`
    - Gerekli bağımlılıkları yüklemek için terminalde `flutter pub get` komutunu çalıştırın.
    - Uygulamayı çalıştırmak için terminalde `flutter run` komutunu çalıştırın.

## Teknolojiler

- Flutter: Kullanıcı arayüzü oluşturmak için kullanılmıştır.
- Java: Flutter arayüzü ile Windows cihaz arasında veri iletimi için kullanılmıştır.
- Python: Sunucu tarafı işlemleri için kullanılmıştır.

## Katkıda Bulunma

Eğer bu projeye katkıda bulunmak isterseniz, çekme istekleriyle katkıda bulunabilirsiniz. Geliştirme sürecine katkı sağlamak için lütfen yeni bir dal (branch) oluşturun ve çekme isteği (pull request) gönderin.

## Lisans

Bu proje [MIT Lisansı](LICENSE) altında lisanslanmıştır. Detaylar için lütfen [Lisans Dosyası](LICENSE)na göz atın.
