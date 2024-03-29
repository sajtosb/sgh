# Smart Greenhouse (2022-2023)

Ez a projekt egy Raspberry Pi és Python alapú "okos" üvegház megvalósítását írja le, amelyet egyetemi szakdolgozatként készítettem.

![Az elkészült modell.](https://github.com/sajtosb/sgh/blob/main/IMG_20230418_150241.jpg)

## **Jelen leírás kizárólag tájékoztató jellegű és nem szolgál teljes körű szakmai útmutatásként. Semmilyen felelősséget nem vállalok az esetleges személyi sérülésekért vagy vagyoni károkért, amelyek a leírás alapján elvégzett munkákból adódhatnak. A felhasználók kizárólag saját felelősségükre követhetik a leírásban foglaltakat.**

![https://github.com/sajtosb/sgh/blob/main/warning.png](https://github.com/sajtosb/sgh/blob/main/warning.png)

## **A villanyszerelési munkálatokat kizárólag szakképzett villanyszerelő végezheti, mivel ezek megfelelő tapasztalat hiányában baleset- és életveszélyes feladatok, valamint a használt berendezések károsodásához vezethetnek. Minden szerelési munkálat megkezdése előtt gondoskodjunk a feszültségmentesítésről, használjunk megfelelő védőfelszerelést és eszközöket, továbbá tartsuk be a hatályos érintésvédelmi és biztonsági szabályokat, előírásokat!**

**Főbb részek:**
  1. Hardverek összekötése
  2. Operációs rendszer telepítése és beállítása (Raspberry Pi OS)
  3. Szenzorok és eszközök működtetése
  4. Adatgyűjtés és elemzés

**Felhasznáált eszközök:**
* Raspberry Pi Zero 2 W [https://malnapc.hu/raspberry-pi-zero-2-w](https://malnapc.hu/raspberry-pi-zero-2-w)
* Tápegység Mean Well RD-125A [https://tapegysegaruhaz.hu/spd/0856/Tapegyseg-MEAN-WELL-RD-125A](https://tapegysegaruhaz.hu/spd/0856/Tapegyseg-MEAN-WELL-RD-125A)
* LCD2004 [https://www.aliexpress.com/item/32704155771.html](https://www.aliexpress.com/item/32704155771.html)
* 8 csatornás relé [https://www.aliexpress.com/item/32923690159.html](https://www.aliexpress.com/item/32923690159.html)
* Vízpumpa [https://www.aliexpress.com/item/4000912947357.html](https://www.aliexpress.com/item/4000912947357.html)

**Érzékelők:**
* Adafruit BME280 [https://malnapc.hu/a2652-bme280-i2c-or-spi-temperature-humidity-pressure-sensor](https://malnapc.hu/a2652-bme280-i2c-or-spi-temperature-humidity-pressure-sensor)
* Adafruit BME680 [https://malnapc.hu/a3660-bme680-temp-humidity-pressure-and-gas-sensor](https://malnapc.hu/a3660-bme680-temp-humidity-pressure-and-gas-sensor)
* Adafruit CCS811 _(kifutott termék)_ [https://www.adafruit.com/product/3566](https://www.adafruit.com/product/3566)
* Adafruit TSL2591 [https://malnapc.hu/a1980-tsl2591-high-dynamic-range-digital-light-sensor](https://malnapc.hu/a1980-tsl2591-high-dynamic-range-digital-light-sensor)
* Adafruit STEMMA Soil sensor (x2)  [https://malnapc.hu/a4026-stemma-fold-paratartalom-mero-szenzor-i2c-kapacitiv-1835](https://malnapc.hu/a4026-stemma-fold-paratartalom-mero-szenzor-i2c-kapacitiv-1835)

Igyekeztem a már rendelkezésemre álló eszközök, anyagok és szerszámok segítségével kialakítani a rendszert, ezzel minimalizálva a felmerülő költségeket.

**Csatolmányok jegyzéke:**

| Sorszám | Tartalom |
| --- | --- |
| 01 | A tervezés és kivitelezés során felhasznált szoftverek jegyzéke (ZIP) |
| 02 | Saját készítésű CAD és 3D modellek (ZIP) |
| 03 | Mások által készített 3D modellek (ZIP) |
| 04 | SGH Grafana dashboard (ZIP) |
| 05 | SGH Python forráskód, konfigurációs állomány, naplófájl minta (ZIP) |
| 06 | SGH Telepítés utáni beállítások shell script segítségével (ZIP) |
| 07 | Fritzing: áramköri ábra forrása és képként exportálva (ZIP) |
| 08 | diagrams.net: High Level Design forrása és képként exportálva (ZIP) |
