# herdr-config

[Herdr](https://herdr.dev) için kişisel layout ve mod'lar. Herdr'ın kaynak kodu değiştirilmedi.
Buradaki dosyalar Herdr'ın kullanıcı ayar klasörüne (`~/.config/herdr-app`) kopyalanır.

## İçerik

| Dosya | Ne yapar |
|---|---|
| `layouts/my-main.json` | Herdr'ın `main` layout'unun kopyası. Spaces bloğu `my-spaces` mod'unu kullanır. |
| `mods/my-spaces/` | Herdr'ın `spaces` mod'unun kopyası, aşağıdaki eklemelerle. |

`my-spaces` eklemeleri:

- **Space renkleri:** space'in harf kutucuğuna tıklayınca 9 renklik palet açılır. Seçilen renk
  kutucukta, satırın sol şeridinde ve arka plan tonunda görünür.
- **Sekme/terminal ağacı:** her space'in altında sekmeleri ve terminalleri listelenir (program
  ikonu, başlık, agent durumu). Tıklayınca o terminale gider. Space adının solundaki ok ağacı katlar.

## Yeni bir bilgisayara kurulum

1. Herdr'ı kurup bir kez açın (ayar klasörü ve hazır mod'lar oluşsun).
2. Repoyu indirip kurulum betiğini çalıştırın:
   ```powershell
   git clone <repo-adresi> herdr-config
   cd herdr-config
   .\install.ps1 -Switch
   ```
   Var olan dosyalar `.bak-<zaman>` uzantısıyla yedeklenir.
3. Herdr'da `ctrl-shift-l` ile `my-main` layout'una geçin (`-Switch` bunu kendisi yapar).

Space renkleri her bilgisayarda ayrı seçilir: space ID'lerine bağlı oldukları için
(`shared.json` içinde) repoda tutulmazlar.

## Değişiklikleri repoya almak

Herdr klasöründe düzenleme yaptıktan sonra:

```powershell
.\sync.ps1
git diff
git commit -am "açıklama"
git push
```

## Geri dönmek

`ctrl-shift-l` ile Herdr'ın kendi `main` layout'una geçin, ya da
`~/.config/herdr-app/layouts/my-main.json` ve `mods/my-spaces/` silin.

## Not

`my-spaces`, Herdr **0.1.14** sürümündeki `spaces` mod'undan kopyalandı ve ikonları Herdr'ın
`mods/workspace-chrome/` klasöründen kullanır. Herdr'ın sonraki sürümleri `spaces` mod'una yenilik
eklerse bu kopyaya kendiliğinden gelmez. Mod API'si değişirse güncellemek gerekebilir. Kontrol için:

```powershell
herdr-app check "$env:USERPROFILE\.config\herdr-app\mods\my-spaces"
```
