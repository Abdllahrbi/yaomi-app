import 'package:flutter/material.dart';

/// شاشة سياسة الخصوصية
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سياسة الخصوصية'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildSection(
              context,
              title: '1. المعلومات التي نجمعها',
              content: '''
نقوم بجمع الأنواع التالية من المعلومات:

**معلومات الحساب:**
• الاسم والبريد الإلكتروني
• كلمة المرور (مُشفرة)
• رقم الهاتف (اختياري)
• تاريخ الميلاد (لحساب الاحتياجات الغذائية)

**معلومات الاستخدام:**
• المنتجات الممسوحة
• المخزون المنزلي
• الوصفات المحفوظة
• الأهداف الغذائية
• السعرات الحرارية المتناولة

**البيانات التقنية:**
• نوع الجهاز ونظام التشغيل
• عنوان IP
• ملفات تعريف الارتباط (Cookies)
• سجلات الاستخدام

**صور المنتجات:**
• الصور التي تلتقطها للمنتجات (للتعرف بالذكاء الاصطناعي)
• تُحذف الصور بعد المعالجة ولا نحتفظ بها
              ''',
            ),
            _buildSection(
              context,
              title: '2. كيف نستخدم معلوماتك',
              content: '''
نستخدم معلوماتك للأغراض التالية:

• **تقديم الخدمة:** إدارة حسابك وتوفير ميزات التطبيق
• **التحسين:** تحسين خدماتنا وتطوير ميزات جديدة
• **التخصيص:** تخصيص تجربتك وتقديم اقتراحات ملائمة
• **الأمان:** حماية حسابك ومنع الاحتيال
• **التواصل:** إرسال إشعارات مهمة وتحديثات
• **الدعم:** الرد على استفساراتك ومساعدتك
• **التحليل:** فهم كيفية استخدام التطبيق لتحسينه
              ''',
            ),
            _buildSection(
              context,
              title: '3. مشاركة المعلومات',
              content: '''
نحن نحترم خصوصيتك ولا نبيع معلوماتك الشخصية. قد نشارك معلوماتك في الحالات التالية:

**مزودو الخدمة:**
• Supabase: لتخزين البيانات (مُشفرة)
• Google Gemini AI: للتعرف على المنتجات (صور فقط، لا بيانات شخصية)
• PayTabs: لمعالجة الدفع (آمنة ومُشفرة)

**المتطلبات القانونية:**
• إذا تطلب القانون ذلك
• لحماية حقوقنا أو حقوق الآخرين
• في حالة التحقيقات القانونية

**نقل الملكية:**
• في حالة بيع أو دمج الشركة

**⚠️ لا نبيع أو نشارك معلوماتك لأغراض تسويقية أبداً**
              ''',
            ),
            _buildSection(
              context,
              title: '4. أمان المعلومات',
              content: '''
نتخذ إجراءات أمنية صارمة لحماية معلوماتك:

**التشفير:**
• جميع البيانات مُشفرة أثناء النقل (SSL/TLS)
• كلمات المرور مُشفرة بـ bcrypt
• قاعدة البيانات محمية بجدران نارية

**التحكم في الوصول:**
• الوصول محدود للموظفين المصرح لهم فقط
• مصادقة ثنائية للحسابات الحساسة
• سجلات مراجعة شاملة

**النسخ الاحتياطي:**
• نسخ احتياطية يومية للبيانات
• خطة استرداد في حالة الكوارث

**المراقبة:**
• مراقبة مستمرة للأنشطة المشبوهة
• تنبيهات فورية لأي انتهاكات محتملة
              ''',
            ),
            _buildSection(
              context,
              title: '5. حقوقك',
              content: '''
لديك الحقوق التالية فيما يتعلق ببياناتك:

**حق الوصول:**
• طلب نسخة من بياناتك الشخصية
• معرفة كيفية استخدام بياناتك

**حق التصحيح:**
• تعديل أو تحديث معلوماتك
• تصحيح أي بيانات غير دقيقة

**حق الحذف:**
• طلب حذف حسابك وجميع بياناتك
• سيتم الحذف خلال 30 يوماً

**حق الاعتراض:**
• الاعتراض على معالجة بياناتك
• إلغاء الاشتراك في الإشعارات

**حق نقل البيانات:**
• طلب نسخة من بياناتك بصيغة قابلة للقراءة
• نقل بياناتك إلى خدمة أخرى

**للمطالبة بحقوقك:** راسلنا على privacy@yaomi.app
              ''',
            ),
            _buildSection(
              context,
              title: '6. ملفات تعريف الارتباط (Cookies)',
              content: '''
نستخدم Cookies لتحسين تجربتك:

**أنواع Cookies:**
• **الضرورية:** للحفاظ على جلستك
• **التحليل:** لفهم كيفية استخدام التطبيق
• **التخصيص:** لحفظ تفضيلاتك

**التحكم في Cookies:**
• يمكنك تعطيل Cookies من إعدادات المتصفح
• قد يؤثر ذلك على بعض الميزات

**مدة الصلاحية:**
• Session cookies: تُحذف عند إغلاق التطبيق
• Persistent cookies: تبقى لمدة سنة واحدة
              ''',
            ),
            _buildSection(
              context,
              title: '7. خصوصية الأطفال',
              content: '''
• التطبيق غير مخصص للأطفال دون 18 عاماً
• لا نجمع معلومات من الأطفال عن قصد
• إذا علمنا بوجود بيانات طفل، سنحذفها فوراً
• يجب على الآباء مراقبة استخدام أطفالهم للتطبيق
              ''',
            ),
            _buildSection(
              context,
              title: '8. التحديثات والإشعارات',
              content: '''
**الإشعارات التي نرسلها:**
• تنبيهات انتهاء صلاحية المنتجات
• تحديثات الخدمة
• عروض Premium (يمكن إلغاؤها)
• تنبيهات أمنية مهمة

**التحكم في الإشعارات:**
• يمكنك إدارة الإشعارات من الإعدادات
• بعض الإشعارات الأمنية لا يمكن إلغاؤها
              ''',
            ),
            _buildSection(
              context,
              title: '9. الخدمات الخارجية',
              content: '''
نستخدم الخدمات التالية (كل منها له سياسة خصوصية خاصة):

**Supabase:**
• لتخزين البيانات وإدارة الحسابات
• سياسة الخصوصية: supabase.com/privacy

**Google Gemini AI:**
• للتعرف على المنتجات
• سياسة الخصوصية: google.com/privacy

**PayTabs:**
• لمعالجة المدفوعات
• سياسة الخصوصية: paytabs.com/privacy

**Firebase (للإشعارات):**
• لإرسال الإشعارات الفورية
• سياسة الخصوصية: firebase.google.com/support/privacy
              ''',
            ),
            _buildSection(
              context,
              title: '10. التغييرات على السياسة',
              content: '''
• نحتفظ بالحق في تعديل هذه السياسة في أي وقت
• سيتم إشعارك بأي تغييرات جوهرية عبر التطبيق
• آخر تحديث: ${DateTime.now().toString().split(' ')[0]}
• يُرجى مراجعة السياسة بشكل دوري
• استمرارك في الاستخدام يعني قبولك للتغييرات
              ''',
            ),
            _buildSection(
              context,
              title: '11. الاتصال بنا',
              content: '''
إذا كانت لديك أي أسئلة حول خصوصيتك:

**البريد الإلكتروني:** privacy@yaomi.app
**نموذج الاتصال:** داخل التطبيق
**العنوان:** المملكة العربية السعودية
**وقت الرد:** خلال 48 ساعة عمل

مسؤول حماية البيانات: dpo@yaomi.app
              ''',
            ),
            const SizedBox(height: 24),
            _buildFooter(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).primaryColor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.shield_outlined,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'سياسة الخصوصية',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'آخر تحديث: ${DateTime.now().toString().split(' ')[0]}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'نحن نحترم خصوصيتك ونلتزم بحماية معلوماتك الشخصية. توضح هذه السياسة كيفية جمعنا واستخدامنا وحماية بياناتك.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            content.trim(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Row(
        children: [
          const Icon(Icons.verified_user, color: Colors.green, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'نحن ملتزمون بحماية خصوصيتك وأمان معلوماتك الشخصية.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
