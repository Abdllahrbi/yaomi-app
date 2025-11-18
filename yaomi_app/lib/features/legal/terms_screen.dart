import 'package:flutter/material.dart';

/// شاشة الشروط والأحكام
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الشروط والأحكام'),
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
              title: '1. قبول الشروط',
              content: '''
باستخدامك لتطبيق Yaomi، فإنك توافق على الالتزام بهذه الشروط والأحكام. إذا كنت لا توافق على أي من هذه الشروط، يرجى عدم استخدام التطبيق.

التطبيق مملوك ومُدار من قبل فريق Yaomi، ونحن نحتفظ بالحق في تعديل هذه الشروط في أي وقت.
              ''',
            ),
            _buildSection(
              context,
              title: '2. استخدام التطبيق',
              content: '''
• يحق لك استخدام التطبيق للأغراض الشخصية والمنزلية فقط
• يُمنع استخدام التطبيق لأغراض تجارية دون إذن مسبق
• يجب أن تكون المعلومات المقدمة صحيحة ودقيقة
• أنت مسؤول عن الحفاظ على سرية حسابك وكلمة المرور
• يُمنع مشاركة حسابك مع أشخاص آخرين
              ''',
            ),
            _buildSection(
              context,
              title: '3. الحساب والتسجيل',
              content: '''
• يجب أن يكون عمرك 18 عاماً أو أكثر للتسجيل
• يجب تقديم معلومات صحيحة عند التسجيل
• أنت مسؤول عن جميع الأنشطة التي تتم في حسابك
• يحق لنا تعليق أو إنهاء حسابك في حالة انتهاك الشروط
• لا يُسمح بإنشاء أكثر من حساب واحد لكل مستخدم
              ''',
            ),
            _buildSection(
              context,
              title: '4. الاشتراك Premium',
              content: '''
• الاشتراك Premium يتيح ميزات إضافية مدفوعة
• سعر الاشتراك: 4.99 دولار شهرياً أو 49.99 دولار سنوياً
• يتم الدفع عبر بوابة الدفع الآمنة PayTabs
• التجديد التلقائي: يتم تجديد الاشتراك تلقائياً ما لم يتم إلغاؤه
• الإلغاء: يمكنك إلغاء الاشتراك في أي وقت من إعدادات الحساب
• لا يوجد استرداد للمبالغ المدفوعة إلا في حالات خاصة
              ''',
            ),
            _buildSection(
              context,
              title: '5. الملكية الفكرية',
              content: '''
• جميع حقوق الملكية الفكرية للتطبيق محفوظة لـ Yaomi
• يُمنع نسخ أو توزيع أو تعديل أي جزء من التطبيق
• الشعار والتصميم والمحتوى مملوك بالكامل لـ Yaomi
• لا يجوز استخدام أي محتوى من التطبيق دون إذن كتابي
              ''',
            ),
            _buildSection(
              context,
              title: '6. المسؤولية',
              content: '''
• التطبيق يُقدم "كما هو" دون أي ضمانات
• نحن غير مسؤولين عن أي أضرار مباشرة أو غير مباشرة
• المعلومات الغذائية المقدمة للإرشاد فقط وليست بديلاً عن الاستشارة الطبية
• نحن لسنا مسؤولين عن دقة المعلومات الغذائية المقدمة
• يُرجى استشارة طبيب أو أخصائي تغذية للنصائح الصحية
              ''',
            ),
            _buildSection(
              context,
              title: '7. الخصوصية',
              content: '''
• نحن نحترم خصوصيتك ونلتزم بحماية بياناتك
• يرجى مراجعة سياسة الخصوصية لمعرفة كيفية استخدام بياناتك
• لا نبيع أو نشارك معلوماتك الشخصية مع أطراف ثالثة
• نستخدم بياناتك لتحسين خدماتنا فقط
              ''',
            ),
            _buildSection(
              context,
              title: '8. إنهاء الخدمة',
              content: '''
• يحق لنا إنهاء أو تعليق حسابك في أي وقت دون إشعار مسبق
• أسباب الإنهاء: انتهاك الشروط، نشاط مشبوه، عدم الدفع
• يمكنك حذف حسابك في أي وقت من إعدادات التطبيق
• عند حذف الحساب، يتم حذف جميع بياناتك نهائياً
              ''',
            ),
            _buildSection(
              context,
              title: '9. التعديلات',
              content: '''
• نحتفظ بالحق في تعديل هذه الشروط في أي وقت
• سيتم إشعارك بأي تعديلات عبر التطبيق
• استمرارك في استخدام التطبيق يعني قبولك للشروط المعدلة
• يُرجى مراجعة الشروط بشكل دوري
              ''',
            ),
            _buildSection(
              context,
              title: '10. القانون الواجب التطبيق',
              content: '''
• تخضع هذه الشروط لقوانين المملكة العربية السعودية
• أي نزاع يتم حله عبر المحاكم السعودية المختصة
• إذا كان أي بند غير قانوني، تبقى البنود الأخرى سارية
              ''',
            ),
            _buildSection(
              context,
              title: '11. الاتصال بنا',
              content: '''
إذا كانت لديك أي أسئلة حول هذه الشروط، يرجى التواصل معنا عبر:
• البريد الإلكتروني: legal@yaomi.app
• نموذج الاتصال داخل التطبيق
• سنرد على استفساراتك خلال 48 ساعة عمل
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
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'شروط وأحكام استخدام Yaomi',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'آخر تحديث: ${DateTime.now().toString().split(' ')[0]}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'يرجى قراءة هذه الشروط والأحكام بعناية قبل استخدام تطبيق Yaomi.',
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
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber, width: 2),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.amber, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'بقبولك لهذه الشروط، فإنك تقر بأنك قرأتها وفهمتها وتوافق على الالتزام بها.',
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
