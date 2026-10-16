# معسكر Frontend - DEVMMND

ملفات الدروس الجاهزة لمعسكر Frontend من DEVMMND. كل درس له مجلد خاص، وبداخله ملفات جاهزة تبدأ العمل عليها مباشرة.

## 1) الحصول على الملفات (مرة واحدة)

1. ثبّت **Git** من https://git-scm.com ثم ثبّت **VS Code**.
2. افتح مجلداً تريد العمل فيه، واضغط بزر الفأرة الأيمن ← **Open Git Bash here** (أو افتح الـ Terminal) ونفّذ:

```
git clone <رابط الريبو الذي يعطيك إياه المدرّب>
```

   في أول مرة ستظهر نافذة تسجيل دخول إلى GitHub، سجّل بحسابك الذي أرسلته للمدرّب.
3. ادخل إلى المجلد الذي نزل ثم **انقر مرتين على `setup.bat`** مرة واحدة فقط. هذا يضع أيقونة مميزة على كل مجلد درس وتمرين.

## 2) تحديث الدروس الجديدة

داخل مجلد المعسكر نفّذ:

```
git pull
```

ستصلك مجلدات الدروس الجديدة، وتُطبَّق الأيقونات تلقائياً.

## 3) طريقة العمل

- افتح مجلد المعسكر في VS Code، وشغّل صفحاتك عبر إضافة **Live Server**.
- اعمل داخل مجلد الدرس الحالي فقط، ولا تغيّر أسماء المجلدات.
- في دروس JavaScript: لكل تمرين مجلد فيه `index.html` جاهز، وملف `script.js` تكتب فيه كودك. المطلوب مكتوب أعلى الملف.
- تنبيه: إذا عدّلتَ ملفاً ثم أراد المدرّب تحديثه ستظهر رسالة تعارض عند `git pull`. في هذه الحالة انسخ عملك إلى مكان آخر أو اسأل المدرّب.
- الأيقونات تعمل على Windows فقط.

## خريطة الدروس

| الجلسة | الموضوع | المجلد |
|---|---|---|
| 01 | بنية الصفحة وتنسيقات الخط | `HTML/01-page-structure-text-formatting` |
| 02 | الروابط التشعبية | `HTML/02-hyperlinks` |
| 03 | القوائم والجداول | `HTML/03-lists-and-tables` |
| 04 | الوسائط المتعددة | `HTML/04-multimedia` |
| 05 | النماذج وتفاصيلها | `HTML/05-forms` |
| 06 | أقسام الصفحة والوسوم الإضافية | `HTML/06-page-sections-and-extra-tags` |
| 07 | مدخل إلى CSS وتفاصيلها | `CSS/07-css-intro` |
| 08 | الهوامش والحشوة وبعض الخصائص | `CSS/08-margin-padding-and-properties` |
| 09 | المحددات الزائفة مع الجدول | `CSS/09-pseudo-selectors-with-tables` |
| 10 | الصندوق المرن في Tailwind | `CSS/10-tailwind-flexbox` |
| 11 | Tailwind في Position | `CSS/11-tailwind-position` |
| 12 | Tailwind في Animation | `CSS/12-tailwind-animation` |
| 13 | Tailwind في Media Query | `CSS/13-tailwind-media-query` |
| 14-16 | مشروع من Figma (عدة صفحات) | `CSS/14-16-figma-multipage-project` |
| 17 | مدخل إلى JS | `JS/17-js-intro` |
| 18 | الحلقات والقوائم في JS | `JS/18-js-loops-and-arrays` |
| 19 | DOM | `JS/19-js-dom` |
| 20 | RegEx | `JS/20-js-regex` |
| 21 | Timers | `JS/21-js-timers` |
| 22 | GetAll (تحديد عدة عناصر) | `JS/22-js-get-all-elements` |
| 23 | مدخل إلى API | `JS/23-js-api-intro` |
| 24 | طلب البيانات | `JS/24-js-fetch-data` |
| 25 | إرسال البيانات | `JS/25-js-send-data` |
