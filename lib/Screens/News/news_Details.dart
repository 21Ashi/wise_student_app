import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetails extends StatefulWidget {
  final String? title;
  final String? imagePath;
  final String? description;
  final String? createdAt;
  final String? whoCanSee;
  final String? author;

  const NewsDetails({
    super.key,
    this.title,
    this.imagePath,
    this.description,
    this.createdAt,
    this.whoCanSee,
    this.author,
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    iconTheme: const IconThemeData(color: Colors.white),
                    pinned: true,
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        widget.title ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          widget.imagePath != null
                              ? Image.network(
                                  widget.imagePath!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey,
                                      child: const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  color: Colors.grey,
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: Colors.white,
                                  ),
                                ),
                          Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Image.asset('assets/user.png'),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).SpecifiedNewsAdmin,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    widget.author ?? '',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              _buildButton(
                                icon: Icons.bookmark_outline,
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Bookmark functionality coming soon!'),
                                    ),
                                  );
                                },
                              ),
                              _buildButton(
                                icon: Icons.share,
                                onPressed: _shareContent,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            widget.description ?? '',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.access_time_filled,
              color: Theme.of(context).colorScheme.secondary,
              size: 12,
            ),
            const SizedBox(width: 4),
            Text(
              widget.createdAt ?? S.of(context).SpecifiedNewsDate,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.5),
          ),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Future<void> _shareContent() async {
    final message = '${widget.title ?? ''}\n\n${widget.description ?? ''}';
    try {
      await Share.share(message);
    } catch (e) {
      // Handle the error if necessary
    }
  }
}
