import 'package:flutter/material.dart';

void main() => runApp(const NcdfApp());

const navy = Color(0xFF102B3F);
const ink = Color(0xFF183A4F);
const teal = Color(0xFF0F8B8D);
const mint = Color(0xFFE8F4F1);

class NcdfApp extends StatelessWidget {
  const NcdfApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'NCDF Connect',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: teal),
      scaffoldBackgroundColor: const Color(0xFFF8FAF9),
      fontFamily: 'Arial',
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDCE7E3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDCE7E3)),
        ),
      ),
    ),
    home: const SignInScreen(),
  );
}

class Persona {
  const Persona(this.name, this.description, this.icon, this.color);
  final String name;
  final String description;
  final IconData icon;
  final Color color;
}

const personas = [
  Persona(
    'Founder',
    'Grow your venture with NCDF',
    Icons.rocket_launch_outlined,
    Color(0xFFEAF4ED),
  ),
  Persona(
    'Investor',
    'Discover the next opportunity',
    Icons.trending_up,
    Color(0xFFFFF1DB),
  ),
  Persona(
    'Mentor',
    'Guide ambitious founders',
    Icons.diversity_3_outlined,
    Color(0xFFEDEBFA),
  ),
  Persona(
    'Partner',
    'Build stronger ecosystems',
    Icons.handshake_outlined,
    Color(0xFFE3F2F4),
  ),
  Persona(
    'Administrator',
    'Monitor the NCDF network',
    Icons.admin_panel_settings_outlined,
    Color(0xFFFBE9E4),
  ),
];

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final email = TextEditingController(text: 'alex@ncdf.io');
  final password = TextEditingController(text: 'prototype');
  bool obscure = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 850;
        return Row(
          children: [
            if (wide)
              Expanded(
                child: Container(
                  color: navy,
                  padding: const EdgeInsets.all(64),
                  child: const WelcomePanel(),
                ),
              ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(32),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!wide) const BrandMark(),
                        const SizedBox(height: 32),
                        Text(
                          'Welcome back',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: ink,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Sign in to continue to your NCDF workspace.',
                          style: TextStyle(
                            color: Colors.blueGrey.shade600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 32),
                        TextField(
                          controller: email,
                          decoration: const InputDecoration(
                            labelText: 'Work email',
                            prefixIcon: Icon(Icons.mail_outline),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: password,
                          obscureText: obscure,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  setState(() => obscure = !obscure),
                              icon: Icon(
                                obscure
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Forgot password?'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: FilledButton.icon(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const PersonaScreen(),
                              ),
                            ),
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text('Sign in'),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Center(
                          child: Text(
                            'Protected by NCDF identity and access controls',
                            style: TextStyle(
                              color: Colors.blueGrey.shade500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}

class BrandMark extends StatelessWidget {
  const BrandMark({super.key});
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: teal,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.hub_outlined, color: Colors.white),
      ),
      const SizedBox(width: 12),
      const Text(
        'NCDF / CONNECT',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: ink,
          letterSpacing: 1.2,
        ),
      ),
    ],
  );
}

class WelcomePanel extends StatelessWidget {
  const WelcomePanel({super.key});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const BrandMark(),
      const SizedBox(height: 72),
      const Text(
        'Capital that moves\nNigeria forward.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 42,
          height: 1.08,
          fontWeight: FontWeight.w800,
        ),
      ),
      const SizedBox(height: 22),
      Text(
        'One connected workspace for founders, investors, mentors, partners and the people powering the NCDF network.',
        style: TextStyle(
          color: Colors.white.withValues(alpha: .72),
          fontSize: 17,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 48),
      Row(
        children: [
          const Icon(Icons.verified_user_outlined, color: Color(0xFF8AD3C8)),
          const SizedBox(width: 10),
          Text(
            'One identity. Role-based access. Full visibility.',
            style: TextStyle(color: Colors.white.withValues(alpha: .8)),
          ),
        ],
      ),
    ],
  );
}

class PersonaScreen extends StatefulWidget {
  const PersonaScreen({super.key});
  @override
  State<PersonaScreen> createState() => _PersonaScreenState();
}

class _PersonaScreenState extends State<PersonaScreen> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 700;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BrandMark(),
                const SizedBox(height: 58),
                Text(
                  'Choose your workspace',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: ink,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Your workspace is tailored to the way you contribute to NCDF.',
                  style: TextStyle(
                    color: Colors.blueGrey.shade600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: personas.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: wide ? 3 : 1,
                    childAspectRatio: wide ? 1.25 : 3.6,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) => PersonaCard(
                    persona: personas[index],
                    selected: index == selected,
                    onTap: () => setState(() => selected = index),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 220,
                  height: 50,
                  child: FilledButton.icon(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            WorkspaceScreen(persona: personas[selected]),
                      ),
                    ),
                    icon: const Icon(Icons.open_in_new),
                    label: const Text('Enter workspace'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PersonaCard extends StatelessWidget {
  const PersonaCard({
    super.key,
    required this.persona,
    required this.selected,
    required this.onTap,
  });
  final Persona persona;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(16),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: selected ? navy : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: selected ? teal : const Color(0xFFE1E9E6),
          width: selected ? 2 : 1,
        ),
        boxShadow: selected
            ? [
                BoxShadow(
                  color: teal.withValues(alpha: .16),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: selected
                  ? Colors.white.withValues(alpha: .12)
                  : persona.color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(persona.icon, color: selected ? Colors.white : ink),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  persona.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: selected ? Colors.white : ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  persona.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: selected
                        ? Colors.white.withValues(alpha: .72)
                        : Colors.blueGrey.shade600,
                  ),
                ),
              ],
            ),
          ),
          if (selected)
            const Icon(Icons.check_circle, color: Color(0xFF8AD3C8)),
        ],
      ),
    ),
  );
}

class WorkspaceScreen extends StatefulWidget {
  const WorkspaceScreen({super.key, required this.persona});
  final Persona persona;
  @override
  State<WorkspaceScreen> createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen> {
  int page = 0;
  bool mfaRequired = true;
  bool readOnlyMode = false;
  bool securityAlerts = true;
  final logs = <AuditLog>[
    AuditLog(
      'Alex Morgan',
      'Signed in',
      'Founder workspace',
      'Just now',
      Icons.login,
      Color(0xFFE3F2F4),
    ),
    AuditLog(
      'Tunde Adebayo',
      'Viewed application',
      'Founder pipeline',
      '8 min ago',
      Icons.description_outlined,
      Color(0xFFFFF1DB),
    ),
    AuditLog(
      'Grace Okafor',
      'Completed security check',
      'Investor workspace',
      '21 min ago',
      Icons.verified_user_outlined,
      Color(0xFFEAF4ED),
    ),
    AuditLog(
      'Ibrahim Musa',
      'Exported report',
      'Admin console',
      '42 min ago',
      Icons.file_download_outlined,
      Color(0xFFEDEBFA),
    ),
  ];
  void addLog(String action, String module) => setState(
    () => logs.insert(
      0,
      AuditLog(
        'Alex Morgan',
        action,
        module,
        'Just now',
        Icons.touch_app_outlined,
        Color(0xFFE3F2F4),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final admin = widget.persona.name == 'Administrator';
    final pages = admin
        ? ['Overview', 'People', 'Audit logs', 'Security']
        : ['Overview', 'My applications', 'Opportunities', 'Messages'];
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 780;
          return Row(
            children: [
              if (wide)
                Sidebar(
                  persona: widget.persona,
                  pages: pages,
                  page: page,
                  onSelect: (index) => setState(() => page = index),
                  onSignOut: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const SignInScreen()),
                    (_) => false,
                  ),
                ),
              Expanded(
                child: Column(
                  children: [
                    TopBar(
                      persona: widget.persona,
                      wide: wide,
                      onMenu: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (var i = 0; i < pages.length; i++)
                                  ListTile(
                                    leading: Icon(pageIcons[i]),
                                    title: Text(pages[i]),
                                    onTap: () {
                                      Navigator.pop(context);
                                      setState(() => page = i);
                                    },
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(wide ? 34 : 20),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: Dashboard(
                            persona: widget.persona,
                            page: page,
                            admin: admin,
                            logs: logs,
                            onAction: addLog,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

const pageIcons = [
  Icons.dashboard_outlined,
  Icons.folder_open_outlined,
  Icons.explore_outlined,
  Icons.chat_bubble_outline,
  Icons.people_outline,
  Icons.receipt_long_outlined,
  Icons.shield_outlined,
];

class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
    required this.persona,
    required this.pages,
    required this.page,
    required this.onSelect,
    required this.onSignOut,
  });
  final Persona persona;
  final List<String> pages;
  final int page;
  final ValueChanged<int> onSelect;
  final VoidCallback onSignOut;
  @override
  Widget build(BuildContext context) => Container(
    width: 246,
    color: navy,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.hub_outlined, color: Color(0xFF8AD3C8)),
            SizedBox(width: 10),
            Text(
              'NCDF',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 18,
                letterSpacing: 1.4,
              ),
            ),
          ],
        ),
        const SizedBox(height: 48),
        Text(
          persona.name.toUpperCase(),
          style: TextStyle(
            color: Colors.white.withValues(alpha: .45),
            fontSize: 11,
            letterSpacing: 1.3,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        for (var i = 0; i < pages.length; i++)
          NavItem(
            label: pages[i],
            icon: pageIcons[i],
            selected: page == i,
            onTap: () => onSelect(i),
          ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .07),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 17,
                backgroundColor: Color(0xFF8AD3C8),
                child: Text(
                  'AM',
                  style: TextStyle(
                    color: navy,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 9),
              const Expanded(
                child: Text(
                  'Alex Morgan',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              IconButton(
                onPressed: onSignOut,
                icon: const Icon(Icons.logout, color: Colors.white70, size: 18),
                tooltip: 'Sign out',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: ListTile(
      dense: true,
      selected: selected,
      selectedTileColor: teal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: Icon(
        icon,
        size: 19,
        color: selected ? Colors.white : Colors.white60,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.white70,
          fontSize: 13,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
      onTap: onTap,
    ),
  );
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.persona,
    required this.wide,
    required this.onMenu,
  });
  final Persona persona;
  final bool wide;
  final VoidCallback onMenu;
  @override
  Widget build(BuildContext context) => Container(
    height: 76,
    color: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 22),
    child: Row(
      children: [
        if (!wide) IconButton(onPressed: onMenu, icon: const Icon(Icons.menu)),
        if (!wide) const SizedBox(width: 4),
        const Expanded(
          child: Text(
            'Tuesday, 22 September 2026',
            style: TextStyle(color: Colors.blueGrey, fontSize: 13),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none, color: ink),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 18,
          backgroundColor: persona.color,
          child: Text(
            persona.name.substring(0, 1),
            style: const TextStyle(color: ink, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    ),
  );
}

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
    required this.persona,
    required this.page,
    required this.admin,
    required this.logs,
    required this.onAction,
  });
  final Persona persona;
  final int page;
  final bool admin;
  final List<AuditLog> logs;
  final void Function(String, String) onAction;
  @override
  Widget build(BuildContext context) {
    if (admin && page == 2) return AuditView(logs: logs);
    if (admin && page == 1) return PeopleView(onAction: onAction);
    if (admin && page == 3) return SecurityCenter(onAction: onAction);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          admin ? 'Network overview' : 'Good morning, Alex',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: ink,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          admin
              ? 'A live pulse of activity across the NCDF network.'
              : 'Here is what is moving in your NCDF workspace.',
          style: const TextStyle(color: Colors.blueGrey, fontSize: 15),
        ),
        const SizedBox(height: 28),
        if (admin) AdminStats(logs: logs) else const UserStats(),
        const SizedBox(height: 28),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ActivityPanel(logs: logs, onAction: onAction),
            ),
            if (MediaQuery.sizeOf(context).width > 850) ...[
              const SizedBox(width: 22),
              const Expanded(child: NextStepPanel()),
            ],
          ],
        ),
      ],
    );
  }
}

class PeopleView extends StatelessWidget {
  const PeopleView({super.key, required this.onAction});
  final void Function(String, String) onAction;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'People & access',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: ink,
          fontWeight: FontWeight.w800,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'Review identities, roles, and access posture across every NCDF module.',
        style: TextStyle(color: Colors.blueGrey, fontSize: 15),
      ),
      const SizedBox(height: 28),
      Row(
        children: [
          Expanded(
            child: _AccessStat(
              label: '1,284',
              detail: 'Active identities',
              icon: Icons.people_outline,
              color: Color(0xFFE3F2F4),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: _AccessStat(
              label: '14',
              detail: 'Pending reviews',
              icon: Icons.pending_actions_outlined,
              color: Color(0xFFFFF1DB),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: _AccessStat(
              label: '06',
              detail: 'Suspended accounts',
              icon: Icons.person_off_outlined,
              color: Color(0xFFFBE9E4),
            ),
          ),
        ],
      ),
      const SizedBox(height: 22),
      Panel(
        title: 'Access review queue',
        action: FilledButton.icon(
          onPressed: () => onAction('Started access review', 'People & access'),
          icon: const Icon(Icons.play_arrow, size: 17),
          label: const Text('Start review'),
        ),
        child: Column(
          children: [
            _PersonRow(
              name: 'Grace Okafor',
              role: 'Investor',
              status: 'Needs MFA enrollment',
              tone: Colors.orange,
            ),
            _PersonRow(
              name: 'Tunde Adebayo',
              role: 'Founder',
              status: 'Active',
              tone: teal,
            ),
            _PersonRow(
              name: 'Ibrahim Musa',
              role: 'Administrator',
              status: 'Privileged access',
              tone: Colors.redAccent,
            ),
            _PersonRow(
              name: 'Nneka Eze',
              role: 'Mentor',
              status: 'Active',
              tone: teal,
            ),
          ],
        ),
      ),
    ],
  );
}

class _AccessStat extends StatelessWidget {
  const _AccessStat({
    required this.label,
    required this.detail,
    required this.icon,
    required this.color,
  });
  final String label;
  final String detail;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFE1E9E6)),
    ),
    child: Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: ink, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: ink,
              ),
            ),
            Text(
              detail,
              style: const TextStyle(fontSize: 11, color: Colors.blueGrey),
            ),
          ],
        ),
      ],
    ),
  );
}

class _PersonRow extends StatelessWidget {
  const _PersonRow({
    required this.name,
    required this.role,
    required this.status,
    required this.tone,
  });
  final String name;
  final String role;
  final String status;
  final Color tone;
  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: const EdgeInsets.symmetric(vertical: 4),
    leading: CircleAvatar(
      backgroundColor: mint,
      child: Text(
        name.substring(0, 1),
        style: const TextStyle(color: ink, fontWeight: FontWeight.w700),
      ),
    ),
    title: Text(
      name,
      style: const TextStyle(
        color: ink,
        fontWeight: FontWeight.w700,
        fontSize: 13,
      ),
    ),
    subtitle: Text(
      role,
      style: const TextStyle(color: Colors.blueGrey, fontSize: 12),
    ),
    trailing: Text(
      status,
      style: TextStyle(color: tone, fontSize: 12, fontWeight: FontWeight.w700),
    ),
  );
}

class SecurityCenter extends StatefulWidget {
  const SecurityCenter({super.key, required this.onAction});
  final void Function(String, String) onAction;
  @override
  State<SecurityCenter> createState() => _SecurityCenterState();
}

class _SecurityCenterState extends State<SecurityCenter> {
  bool mfaRequired = true;
  bool readOnlyMode = false;
  bool securityAlerts = true;

  void update(String action, void Function() change) {
    setState(change);
    widget.onAction(action, 'Security center');
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Security center',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: ink,
          fontWeight: FontWeight.w800,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'Control high-impact safeguards and respond to threats across the network.',
        style: TextStyle(color: Colors.blueGrey, fontSize: 15),
      ),
      const SizedBox(height: 28),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Panel(
              title: 'Protection controls',
              child: Column(
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Require MFA for privileged roles'),
                    subtitle: const Text(
                      'Administrators and security operators',
                    ),
                    value: mfaRequired,
                    onChanged: (value) => update(
                      value
                          ? 'Enabled mandatory MFA'
                          : 'Disabled mandatory MFA',
                      () => mfaRequired = value,
                    ),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Security alert notifications'),
                    subtitle: const Text(
                      'Notify admins about unusual activity',
                    ),
                    value: securityAlerts,
                    onChanged: (value) => update(
                      value
                          ? 'Enabled security alerts'
                          : 'Disabled security alerts',
                      () => securityAlerts = value,
                    ),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Read-only emergency mode'),
                    subtitle: const Text(
                      'Pause data changes during an incident',
                    ),
                    value: readOnlyMode,
                    onChanged: (value) => update(
                      value
                          ? 'Enabled read-only emergency mode'
                          : 'Disabled read-only emergency mode',
                      () => readOnlyMode = value,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Panel(
              title: 'Security posture',
              child: Column(
                children: [
                  const _SecurityCheck(
                    label: 'Identity provider',
                    detail: 'Operational',
                    good: true,
                  ),
                  const _SecurityCheck(
                    label: 'Privileged accounts',
                    detail: '2 reviews due',
                    good: false,
                  ),
                  const _SecurityCheck(
                    label: 'Recent failed logins',
                    detail: '3 in last 24 hours',
                    good: false,
                  ),
                  const _SecurityCheck(
                    label: 'Audit log integrity',
                    detail: 'Verified',
                    good: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 22),
      Panel(
        title: 'Incident response',
        action: OutlinedButton.icon(
          onPressed: () =>
              widget.onAction('Revoked all active sessions', 'Security center'),
          icon: const Icon(Icons.block_outlined, size: 17),
          label: const Text('Revoke all sessions'),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Use emergency actions only when an incident is confirmed.',
              style: TextStyle(color: Colors.blueGrey, fontSize: 13),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                OutlinedButton.icon(
                  onPressed: () => widget.onAction(
                    'Locked suspicious accounts',
                    'Security center',
                  ),
                  icon: const Icon(Icons.lock_outline, size: 17),
                  label: const Text('Lock suspicious accounts'),
                ),
                OutlinedButton.icon(
                  onPressed: () => widget.onAction(
                    'Opened security incident',
                    'Security center',
                  ),
                  icon: const Icon(Icons.warning_amber_outlined, size: 17),
                  label: const Text('Open incident'),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

class _SecurityCheck extends StatelessWidget {
  const _SecurityCheck({
    required this.label,
    required this.detail,
    required this.good,
  });
  final String label;
  final String detail;
  final bool good;
  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Icon(
      good ? Icons.check_circle_outline : Icons.warning_amber_outlined,
      color: good ? teal : Colors.orange,
    ),
    title: Text(
      label,
      style: const TextStyle(
        color: ink,
        fontWeight: FontWeight.w700,
        fontSize: 13,
      ),
    ),
    trailing: Text(
      detail,
      style: TextStyle(
        color: good ? teal : Colors.orange,
        fontSize: 11,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

class UserStats extends StatelessWidget {
  const UserStats({super.key});
  @override
  Widget build(BuildContext context) => const Wrap(
    spacing: 14,
    runSpacing: 14,
    children: [
      Metric(
        label: 'Active applications',
        value: '04',
        detail: '+2 this month',
        color: Color(0xFFE3F2F4),
      ),
      Metric(
        label: 'Connections',
        value: '28',
        detail: '+8% this quarter',
        color: Color(0xFFFFF1DB),
      ),
      Metric(
        label: 'Next milestone',
        value: '12 days',
        detail: 'Pitch review',
        color: Color(0xFFEAF4ED),
      ),
    ],
  );
}

class AdminStats extends StatelessWidget {
  const AdminStats({super.key, required this.logs});
  final List<AuditLog> logs;
  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 14,
    runSpacing: 14,
    children: [
      const Metric(
        label: 'Active users',
        value: '1,284',
        detail: '+12.4% this month',
        color: Color(0xFFE3F2F4),
      ),
      const Metric(
        label: 'Module visits',
        value: '8,642',
        detail: '+6.8% this week',
        color: Color(0xFFFFF1DB),
      ),
      const Metric(
        label: 'Security checks',
        value: '98.7%',
        detail: 'Healthy',
        color: Color(0xFFEAF4ED),
      ),
      Metric(
        label: 'Events today',
        value: '${logs.length + 18}',
        detail: 'Across 5 modules',
        color: Color(0xFFEDEBFA),
      ),
    ],
  );
}

class Metric extends StatelessWidget {
  const Metric({
    super.key,
    required this.label,
    required this.value,
    required this.detail,
    required this.color,
  });
  final String label;
  final String value;
  final String detail;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(
    width: 192,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFE1E9E6)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Icon(Icons.insights_outlined, size: 19, color: ink),
        ),
        const SizedBox(height: 16),
        Text(
          label,
          style: const TextStyle(color: Colors.blueGrey, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: ink,
            fontWeight: FontWeight.w800,
            fontSize: 27,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          detail,
          style: const TextStyle(
            color: teal,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

class ActivityPanel extends StatelessWidget {
  const ActivityPanel({super.key, required this.logs, required this.onAction});
  final List<AuditLog> logs;
  final void Function(String, String) onAction;
  @override
  Widget build(BuildContext context) => Panel(
    title: 'Recent activity',
    action: TextButton(
      onPressed: () => onAction('Opened activity feed', 'Overview'),
      child: const Text('View all'),
    ),
    child: Column(
      children: logs.take(4).map((log) => LogTile(log: log)).toList(),
    ),
  );
}

class AuditView extends StatelessWidget {
  const AuditView({super.key, required this.logs});
  final List<AuditLog> logs;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Audit logs',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: ink,
          fontWeight: FontWeight.w800,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'Every important action, captured in one place.',
        style: TextStyle(color: Colors.blueGrey),
      ),
      const SizedBox(height: 28),
      Panel(
        title: 'Live event stream',
        action: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.download_outlined, size: 17),
          label: const Text('Export'),
        ),
        child: Column(children: logs.map((log) => LogTile(log: log)).toList()),
      ),
    ],
  );
}

class LogTile extends StatelessWidget {
  const LogTile({super.key, required this.log});
  final AuditLog log;
  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: const EdgeInsets.symmetric(vertical: 5),
    leading: Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: log.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(log.icon, size: 19, color: ink),
    ),
    title: Text(
      log.action,
      style: const TextStyle(
        color: ink,
        fontWeight: FontWeight.w700,
        fontSize: 13,
      ),
    ),
    subtitle: Text(
      '${log.user}  •  ${log.module}',
      style: const TextStyle(color: Colors.blueGrey, fontSize: 12),
    ),
    trailing: Text(
      log.time,
      style: const TextStyle(color: Colors.blueGrey, fontSize: 11),
    ),
  );
}

class NextStepPanel extends StatelessWidget {
  const NextStepPanel({super.key});
  @override
  Widget build(BuildContext context) => const Panel(
    title: 'Your next steps',
    child: Column(
      children: [
        StepItem(
          icon: Icons.description_outlined,
          title: 'Complete your venture profile',
          detail: '3 sections remaining',
          progress: .65,
        ),
        Divider(height: 28),
        StepItem(
          icon: Icons.people_outline,
          title: 'Meet your new connections',
          detail: '5 people waiting',
          progress: 1,
        ),
      ],
    ),
  );
}

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.icon,
    required this.title,
    required this.detail,
    required this.progress,
  });
  final IconData icon;
  final String title;
  final String detail;
  final double progress;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 38,
        height: 38,
        decoration: const BoxDecoration(color: mint, shape: BoxShape.circle),
        child: Icon(icon, color: teal, size: 19),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: ink,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              detail,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 11),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              minHeight: 5,
              borderRadius: BorderRadius.circular(4),
              color: teal,
              backgroundColor: mint,
            ),
          ],
        ),
      ),
    ],
  );
}

class Panel extends StatelessWidget {
  const Panel({
    super.key,
    required this.title,
    required this.child,
    this.action,
  });
  final String title;
  final Widget child;
  final Widget? action;
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFE1E9E6)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: ink,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
            ?action,
          ],
        ),
        const SizedBox(height: 10),
        child,
      ],
    ),
  );
}

class AuditLog {
  const AuditLog(
    this.user,
    this.action,
    this.module,
    this.time,
    this.icon,
    this.color,
  );
  final String user;
  final String action;
  final String module;
  final String time;
  final IconData icon;
  final Color color;
}
