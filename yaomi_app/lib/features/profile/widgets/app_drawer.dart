import 'package:flutter/material.dart';

/// قائمة جانبية (Drawer) للتطبيق
/// تحتوي على جميع خيارات الإعدادات والملف الشخصي
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header مع معلومات المستخدم
          _buildDrawerHeader(context),

          const Divider(),

          // الخيارات
          _buildMenuItem(
            context,
            icon: Icons.person,
            title: 'الملف الشخصي',
            subtitle: 'عرض وتعديل معلوماتك',
            onTap: () => _navigateTo(context, '/profile'),
          ),

          _buildMenuItem(
            context,
            icon: Icons.workspace_premium,
            title: 'الاشتراكات',
            subtitle: 'إدارة اشتراك Premium',
            onTap: () => _navigateTo(context, '/subscription'),
            trailing: const Icon(Icons.star, color: Colors.amber, size: 20),
          ),

          const Divider(),

          _buildMenuItem(
            context,
            icon: Icons.language,
            title: 'اللغة',
            subtitle: 'العربية',
            onTap: () => _showLanguageDialog(context),
          ),

          _buildMenuItem(
            context,
            icon: Icons.info_outline,
            title: 'عن التطبيق',
            subtitle: 'الإصدار 1.0.0',
            onTap: () => _navigateTo(context, '/about'),
          ),

          _buildMenuItem(
            context,
            icon: Icons.contact_support,
            title: 'اتصل بنا',
            subtitle: 'الدعم والمساعدة',
            onTap: () => _navigateTo(context, '/contact'),
          ),

          const Divider(),

          _buildMenuItem(
            context,
            icon: Icons.privacy_tip_outlined,
            title: 'سياسة الخصوصية',
            onTap: () => _navigateTo(context, '/privacy'),
          ),

          _buildMenuItem(
            context,
            icon: Icons.description_outlined,
            title: 'الشروط والأحكام',
            onTap: () => _navigateTo(context, '/terms'),
          ),

          const Divider(),

          _buildMenuItem(
            context,
            icon: Icons.logout,
            title: 'تسجيل الخروج',
            textColor: Colors.red,
            onTap: () => _showLogoutDialog(context),
          ),

          const SizedBox(height: 20),

          // Footer
          _buildFooter(),
        ],
      ),
    );
  }

  /// Header الـ Drawer مع صورة المستخدم
  Widget _buildDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: ClipOval(
          child: Image.asset(
            'assets/images/yaomi_logo.png',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // Fallback إذا اللوجو ما اشتغل
              return Text(
                'Y',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              );
            },
          ),
        ),
      ),
      accountName: const Text(
        'مستخدم Yaomi',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      accountEmail: const Text(
        'user@yaomi.app',
        style: TextStyle(fontSize: 14),
      ),
      otherAccountsPictures: [
        // Badge Premium (إذا كان المستخدم Premium)
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.star,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }

  /// بناء عنصر في القائمة
  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    Widget? trailing,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: textColor ?? Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            )
          : null,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  /// Footer في نهاية الـ Drawer
  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // اللوجو الصغير
          Image.asset(
            'assets/images/yaomi_logo.png',
            height: 40,
            width: 40,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Text('🍳', style: TextStyle(fontSize: 32));
            },
          ),
          const SizedBox(height: 8),
          Text(
            'Yaomi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'مطبخك الذكي في جيبك',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'الإصدار 1.0.0',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  /// التنقل إلى صفحة
  void _navigateTo(BuildContext context, String route) {
    Navigator.pop(context); // أغلق الـ Drawer
    
    // التنقل حسب المسار
    switch (route) {
      case '/profile':
        Navigator.pushNamed(context, '/profile');
        break;
      case '/subscription':
        Navigator.pushNamed(context, '/subscription');
        break;
      case '/about':
        _showAboutDialog(context);
        break;
      case '/contact':
        _showContactDialog(context);
        break;
      case '/privacy':
        _showPrivacyDialog(context);
        break;
      case '/terms':
        _showTermsDialog(context);
        break;
    }
  }

  /// Dialog اختيار اللغة
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('اختر اللغة'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Text('🇸🇦', style: TextStyle(fontSize: 30)),
              title: const Text('العربية'),
              trailing: const Icon(Icons.check, color: Colors.green),
              onTap: () {
                // TODO: تغيير اللغة للعربية
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم اختيار العربية')),
                );
              },
            ),
            ListTile(
              leading: const Text('🇬🇧', style: TextStyle(fontSize: 30)),
              title: const Text('English'),
              onTap: () {
                // TODO: تغيير اللغة للإنجليزية
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Language changed to English')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Dialog عن التطبيق
  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Yaomi',
      applicationVersion: '1.0.0',
      applicationIcon: const Text('🍳', style: TextStyle(fontSize: 40)),
      applicationLegalese: '© 2024 Yaomi. جميع الحقوق محفوظة.',
      children: [
        const SizedBox(height: 20),
        const Text(
          'Yaomi - مطبخك الذكي في جيبك',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'تطبيق ذكي لإدارة مخزون المطبخ، حساب السعرات، '
          'واقتراح الوصفات باستخدام الذكاء الاصطناعي.',
        ),
      ],
    );
  }

  /// Dialog اتصل بنا
  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('اتصل بنا'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContactItem(Icons.email, 'البريد الإلكتروني', 'support@yaomi.app'),
            const SizedBox(height: 12),
            _buildContactItem(Icons.phone, 'الهاتف', '+966 XX XXX XXXX'),
            const SizedBox(height: 12),
            _buildContactItem(Icons.language, 'الموقع', 'www.yaomi.app'),
            const SizedBox(height: 12),
            _buildContactItem(Icons.chat, 'واتساب', '+966 XX XXX XXXX'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blue),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Dialog سياسة الخصوصية
  void _showPrivacyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('سياسة الخصوصية'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'سياسة الخصوصية',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'نحن في Yaomi نحترم خصوصيتك ونلتزم بحماية بياناتك الشخصية.\n\n'
                '1. جمع البيانات:\n'
                '- نجمع المعلومات الضرورية فقط لتشغيل التطبيق\n'
                '- صور المنتجات تُستخدم للتعرف عليها فقط\n'
                '- لا نشارك بياناتك مع أطراف ثالثة\n\n'
                '2. استخدام البيانات:\n'
                '- لتحسين تجربة المستخدم\n'
                '- لتقديم اقتراحات ذكية\n'
                '- لإرسال التنبيهات المهمة\n\n'
                '3. حماية البيانات:\n'
                '- تشفير end-to-end\n'
                '- خوادم آمنة\n'
                '- لا نبيع بياناتك أبداً\n\n'
                'للمزيد: www.yaomi.app/privacy',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }

  /// Dialog الشروط والأحكام
  void _showTermsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('الشروط والأحكام'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'شروط الاستخدام',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'باستخدامك لتطبيق Yaomi، فإنك توافق على:\n\n'
                '1. الاستخدام المسؤول:\n'
                '- استخدام التطبيق للأغراض القانونية فقط\n'
                '- عدم محاولة اختراق النظام\n'
                '- احترام حقوق المستخدمين الآخرين\n\n'
                '2. الاشتراك Premium:\n'
                '- رسوم شهرية/سنوية\n'
                '- إلغاء في أي وقت\n'
                '- استرداد جزئي حسب السياسة\n\n'
                '3. المحتوى:\n'
                '- المعلومات الغذائية للإرشاد فقط\n'
                '- لا تعوّض استشارة طبية\n'
                '- نسعى للدقة لكن قد تحدث أخطاء\n\n'
                '4. المسؤولية:\n'
                '- التطبيق "كما هو"\n'
                '- لسنا مسؤولين عن قرارات التغذية\n'
                '- استشر أخصائي عند الحاجة\n\n'
                'للمزيد: www.yaomi.app/terms',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }

  /// Dialog تأكيد تسجيل الخروج
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تسجيل الخروج'),
        content: const Text('هل أنت متأكد من تسجيل الخروج؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              // TODO: تنفيذ تسجيل الخروج
              Navigator.pop(context); // أغلق الـ Dialog
              Navigator.pop(context); // أغلق الـ Drawer
              
              // TODO: مسح البيانات المحلية
              // TODO: الانتقال لصفحة تسجيل الدخول
              
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم تسجيل الخروج بنجاح'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('تسجيل الخروج'),
          ),
        ],
      ),
    );
  }
}
