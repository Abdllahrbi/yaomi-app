import 'package:flutter/material.dart';

/// شاشة الأسئلة الشائعة (FAQ)
class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأسئلة الشائعة'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          
          // عام
          _buildCategoryHeader(context, '📱 عام'),
          _buildFAQItem(
            context,
            question: 'ما هو تطبيق Yaomi؟',
            answer: 'Yaomi هو تطبيق ذكي لإدارة مخزون المطبخ المنزلي باستخدام الذكاء الاصطناعي. يساعدك على تتبع المنتجات، معرفة تواريخ الصلاحية، حساب السعرات الحرارية، واقتراح وصفات بناءً على مكوناتك المتاحة.',
          ),
          _buildFAQItem(
            context,
            question: 'كيف أبدأ استخدام التطبيق؟',
            answer: '''1. حمّل التطبيق من Google Play أو App Store
2. أنشئ حساب جديد باستخدام بريدك الإلكتروني
3. امنح التطبيق صلاحية الكاميرا
4. ابدأ بمسح منتجاتك الأولى!''',
          ),
          _buildFAQItem(
            context,
            question: 'هل التطبيق متاح باللغة العربية؟',
            answer: 'نعم! التطبيق متاح بالكامل باللغة العربية ويدعم اللغة الإنجليزية أيضاً. يمكنك تغيير اللغة من الإعدادات.',
          ),
          
          const SizedBox(height: 16),
          // المسح الضوئي
          _buildCategoryHeader(context, '📸 المسح والتعرف'),
          _buildFAQItem(
            context,
            question: 'كيف يعمل المسح الضوئي؟',
            answer: 'فقط وجّه الكاميرا على المنتج أو الباركود، وسيتعرف عليه الذكاء الاصطناعي تلقائياً ويضيفه لمخزونك مع جميع المعلومات الغذائية.',
          ),
          _buildFAQItem(
            context,
            question: 'ماذا لو لم يتعرف على المنتج؟',
            answer: 'يمكنك إضافة المنتج يدوياً من خلال النقر على "إضافة يدوياً". أدخل اسم المنتج والمعلومات الأساسية، وسنضيفه إلى قاعدة بياناتنا.',
          ),
          _buildFAQItem(
            context,
            question: 'كم عدد المسحات المسموحة؟',
            answer: 'النسخة المجانية: 10 مسحات شهرياً\nNسخة Premium: مسح غير محدود!\n\nتُعاد المسحات المجانية كل شهر تلقائياً.',
          ),
          _buildFAQItem(
            context,
            question: 'هل يعمل المسح بدون إنترنت؟',
            answer: 'المسح الضوئي يتطلب اتصال بالإنترنت للتعرف على المنتجات. لكن يمكنك تصفح مخزونك الحالي بدون إنترنت.',
          ),
          
          const SizedBox(height: 16),
          // المخزون
          _buildCategoryHeader(context, '📦 إدارة المخزون'),
          _buildFAQItem(
            context,
            question: 'كيف أضيف منتج لمخزوني؟',
            answer: '''1. اضغط على زر الكاميرا في الشاشة الرئيسية
2. امسح المنتج بالكاميرا
3. تأكد من المعلومات
4. حدد الكمية وتاريخ الصلاحية
5. احفظ!''',
          ),
          _buildFAQItem(
            context,
            question: 'كيف أحذف منتج من المخزون؟',
            answer: 'اذهب إلى "المخزون"، اسحب المنتج لليسار، واضغط على أيقونة الحذف. أو افتح تفاصيل المنتج واضغط "حذف".',
          ),
          _buildFAQItem(
            context,
            question: 'هل يمكنني تعديل معلومات المنتج؟',
            answer: 'نعم! اضغط على المنتج في المخزون، ثم اضغط "تعديل". يمكنك تغيير الكمية، تاريخ الصلاحية، أو أي معلومات أخرى.',
          ),
          
          const SizedBox(height: 16),
          // التنبيهات
          _buildCategoryHeader(context, '🔔 التنبيهات'),
          _buildFAQItem(
            context,
            question: 'متى أستلم تنبيهات انتهاء الصلاحية؟',
            answer: '''• 7 أيام قبل انتهاء الصلاحية
• 3 أيام قبل انتهاء الصلاحية
• يوم انتهاء الصلاحية
• بعد انتهاء الصلاحية (لحذف المنتج)''',
          ),
          _buildFAQItem(
            context,
            question: 'كيف أوقف التنبيهات؟',
            answer: 'يمكنك تعطيل التنبيهات من الإعدادات > الإشعارات. لكن ننصح بإبقائها مفعلة لتجنب هدر الطعام!',
          ),
          
          const SizedBox(height: 16),
          // الوصفات
          _buildCategoryHeader(context, '🍽️ الوصفات'),
          _buildFAQItem(
            context,
            question: 'كيف أحصل على اقتراحات الوصفات؟',
            answer: 'اذهب إلى قسم "الوصفات"، وسيقترح لك التطبيق وصفات بناءً على المكونات المتاحة في مخزونك. (ميزة Premium)',
          ),
          _buildFAQItem(
            context,
            question: 'هل يمكنني حفظ وصفاتي الخاصة؟',
            answer: 'نعم! يمكنك إضافة وصفاتك الخاصة وحفظها في المفضلة. (قريباً)',
          ),
          
          const SizedBox(height: 16),
          // السعرات
          _buildCategoryHeader(context, '📊 السعرات الحرارية'),
          _buildFAQItem(
            context,
            question: 'كيف يحسب التطبيق السعرات؟',
            answer: 'نستخدم قاعدة بيانات شاملة للقيم الغذائية. عند مسح المنتج، نحصل على معلوماته الغذائية تلقائياً ونحسب السعرات بناءً على الكمية.',
          ),
          _buildFAQItem(
            context,
            question: 'هل يمكنني تتبع أهدافي الغذائية؟',
            answer: 'نعم! في النسخة Premium يمكنك تحديد أهدافك اليومية (سعرات، بروتين، كارب، دهون) وتتبع تقدمك.',
          ),
          
          const SizedBox(height: 16),
          // الاشتراك
          _buildCategoryHeader(context, '💎 الاشتراك Premium'),
          _buildFAQItem(
            context,
            question: 'ما الفرق بين المجاني و Premium؟',
            answer: '''المجاني:
• 10 مسحات شهرياً
• إدارة المخزون الأساسية
• تنبيهات انتهاء الصلاحية

Premium (4.99\$ شهرياً):
• مسح غير محدود ✨
• اقتراحات وصفات ذكية
• تحليل تفصيلي للسعرات
• تتبع الأهداف الغذائية
• إحصائيات متقدمة
• دعم أولوية''',
          ),
          _buildFAQItem(
            context,
            question: 'كيف أشترك في Premium؟',
            answer: 'اذهب إلى "الاشتراكات" من القائمة الجانبية، واختر الخطة المناسبة (شهرية أو سنوية)، وأكمل الدفع عبر PayTabs.',
          ),
          _buildFAQItem(
            context,
            question: 'هل يمكنني إلغاء الاشتراك؟',
            answer: 'نعم، يمكنك إلغاء الاشتراك في أي وقت من الإعدادات > الاشتراكات > إلغاء الاشتراك. ستبقى الميزات متاحة حتى نهاية الفترة المدفوعة.',
          ),
          _buildFAQItem(
            context,
            question: 'هل يوجد فترة تجريبية مجانية؟',
            answer: 'حالياً لا توجد فترة تجريبية، لكن يمكنك استخدام النسخة المجانية لتجربة التطبيق قبل الاشتراك في Premium.',
          ),
          
          const SizedBox(height: 16),
          // الأمان
          _buildCategoryHeader(context, '🔒 الأمان والخصوصية'),
          _buildFAQItem(
            context,
            question: 'هل بياناتي آمنة؟',
            answer: 'نعم! نستخدم تشفير عالي المستوى (SSL/TLS) لحماية بياناتك. جميع المعلومات محفوظة في خوادم آمنة ومُشفرة.',
          ),
          _buildFAQItem(
            context,
            question: 'هل تبيعون معلوماتي الشخصية؟',
            answer: 'لا، أبداً! نحن لا نبيع أو نشارك معلوماتك الشخصية مع أي طرف ثالث لأغراض تسويقية. راجع سياسة الخصوصية للمزيد.',
          ),
          _buildFAQItem(
            context,
            question: 'ماذا يحدث للصور التي ألتقطها؟',
            answer: 'الصور تُستخدم فقط للتعرف على المنتجات ثم تُحذف فوراً. لا نحتفظ بأي صور في خوادمنا.',
          ),
          
          const SizedBox(height: 16),
          // الدعم
          _buildCategoryHeader(context, '💬 الدعم والمساعدة'),
          _buildFAQItem(
            context,
            question: 'كيف أتواصل مع الدعم؟',
            answer: 'يمكنك التواصل معنا عبر:\n• نموذج "اتصل بنا" في التطبيق\n• البريد الإلكتروني: support@yaomi.app\n\nنرد عادة خلال 24-48 ساعة عمل.',
          ),
          _buildFAQItem(
            context,
            question: 'كيف أبلغ عن مشكلة؟',
            answer: 'اذهب إلى القائمة الجانبية > "اتصل بنا" > اختر "مشكلة تقنية"، وصف المشكلة بالتفصيل، وسنعمل على حلها في أسرع وقت.',
          ),
          _buildFAQItem(
            context,
            question: 'كيف أقترح ميزة جديدة؟',
            answer: 'نحب سماع اقتراحاتك! أرسل لنا رسالة عبر "اتصل بنا" > "اقتراح"، وسننظر فيها للإصدارات القادمة.',
          ),
          
          const SizedBox(height: 16),
          // مشاكل شائعة
          _buildCategoryHeader(context, '🔧 حل المشاكل'),
          _buildFAQItem(
            context,
            question: 'الكاميرا لا تعمل',
            answer: '''1. تأكد من منح التطبيق صلاحية الكاميرا
2. أعد تشغيل التطبيق
3. تحقق من إعدادات الهاتف
4. حدّث التطبيق لآخر إصدار
5. إذا استمرت المشكلة، راسلنا على support@yaomi.app''',
          ),
          _buildFAQItem(
            context,
            question: 'المسح بطيء أو لا يعمل',
            answer: '''1. تأكد من اتصالك بالإنترنت
2. نظّف عدسة الكاميرا
3. أضِئ المنتج بشكل جيد
4. حاول التقاط صورة أوضح
5. أعد المحاولة بعد قليل''',
          ),
          _buildFAQItem(
            context,
            question: 'نسيت كلمة المرور',
            answer: 'اضغط على "نسيت كلمة المرور؟" في صفحة تسجيل الدخول، وأدخل بريدك الإلكتروني. سنرسل لك رابط إعادة تعيين كلمة المرور.',
          ),
          
          const SizedBox(height: 24),
          _buildFooter(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Colors.blue.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.help_outline,
            size: 48,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 12),
          Text(
            'كيف يمكننا مساعدتك؟',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'ابحث عن إجابات للأسئلة الشائعة',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }

  Widget _buildFAQItem(
    BuildContext context, {
    required String question,
    required String answer,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          leading: Icon(
            Icons.help_outline,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            question,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          children: [
            const Divider(),
            const SizedBox(height: 8),
            Text(
              answer,
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            Icons.support_agent,
            size: 40,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 12),
          Text(
            'لم تجد إجابة؟',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'تواصل معنا عبر "اتصل بنا" في القائمة الجانبية',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
            icon: const Icon(Icons.mail_outline),
            label: const Text('اتصل بنا'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
