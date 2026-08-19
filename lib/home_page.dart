import 'package:flutter/material.dart';

class Post {
  final String username;
  final String userSubtitle;
  final String userAvatarUrl;
  final String postImageUrl;
  final String? localAsset; // optional local asset path
  final String caption;
  int likes;
  bool isLiked;
  bool isSaved;
  final List<Map<String, String>> comments;

  Post({
    required this.username,
    required this.userSubtitle,
    required this.userAvatarUrl,
    required this.postImageUrl,
    this.localAsset,
    required this.caption,
    required this.likes,
    this.isLiked = false,
    this.isSaved = false,
    required this.comments,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 4 Unique Posts with Network Images and Pre-loaded Comments
  final List<Post> posts = [
    Post(
      username: 'Modinho',
      userSubtitle: 'The only one',
      userAvatarUrl: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=150',
      postImageUrl: '',
      localAsset: 'assets/images/modinho.jpg',
      caption: '400 goals',
      likes: 0,
      comments: [],
    ),
    Post(
      username: 'Mbappu',
      userSubtitle: 'Goat he kehde',
      userAvatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      postImageUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=800',
      caption: 'Writing clean, asynchronous code with Dart 3 ⚡',
      likes: 128,
      comments: [
        {'user': 'flutter_fan', 'text': 'Dart 3 pattern matching is amazing!'},
        {'user': 'coder_guy', 'text': 'Best language for modern app dev.'},
        {'user': 'ui_designer', 'text': 'Super clean architecture.'},
        {'user': 'dev_sam', 'text': 'Keep these developer tips coming! 🙌'},
      ],
    ),
    Post(
      username: 'Bheege Hoth',
      userSubtitle: 'Pyaar se maru',
      userAvatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
      postImageUrl: 'https://images.unsplash.com/photo-1507238691740-187a5b1d37b8?w=800',
      caption: 'Designing sleek and modern user interfaces in Flutter 🎨',
      likes: 89,
      comments: [
        {'user': 'sarah_codes', 'text': 'Color scheme is so pleasant ✨'},
        {'user': 'pixel_art', 'text': 'The curved border radius feels great.'},
        {'user': 'app_builder', 'text': 'Which design tool did you use for mockup?'},
        {'user': 'creative_mind', 'text': 'Stunning layout!'},
      ],
    ),
    Post(
      username: 'Baba G',
      userSubtitle: 'The only fit player',
      userAvatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150',
      postImageUrl: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=800',
      caption: 'Real-time database integration deployed to production! ☁️🔥',
      likes: 215,
      comments: [
        {'user': 'john_flutter', 'text': 'Firestore or Supabase?'},
        {'user': 'alex_dev', 'text': 'Cloud functions make backend super easy.'},
        {'user': 'cloud_geek', 'text': 'Scales effortlessly!'},
        {'user': 'startup_ceo', 'text': 'We use this stack in production too 💯'},
      ],
    ),
  ];

  final TextEditingController _commentController = TextEditingController();

  // Continuously increment likes
  void addLike(Post post) {
    setState(() {
      post.likes++;
      post.isLiked = true;
    });
  }

  // Toggle bookmark save
  void toggleSave(Post post) {
    setState(() {
      post.isSaved = !post.isSaved;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          post.isSaved ? 'Post saved to bookmarks' : 'Post removed from bookmarks',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // Interactive Comments Modal Bottom Sheet
  void openCommentModal(Post post) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 16,
                left: 16,
                right: 16,
              ),
              child: SizedBox(
                height: 480,
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Comments (${post.comments.length})',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 24),
                    Expanded(
                      child: ListView.builder(
                        itemCount: post.comments.length,
                        itemBuilder: (context, index) {
                          final comment = post.comments[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.grey[200],
                                  child: Text(
                                    comment['user']![0].toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '${comment['user']} ',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: comment['text']),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _commentController,
                                decoration: InputDecoration(
                                  hintText: 'Add a comment...',
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.send, color: Colors.blueAccent),
                              onPressed: () {
                                if (_commentController.text.trim().isNotEmpty) {
                                  setState(() {
                                    post.comments.add({
                                      'user': 'you',
                                      'text': _commentController.text.trim(),
                                    });
                                  });
                                  setModalState(() {});
                                  _commentController.clear();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send_outlined),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: ListView.separated(
            itemCount: posts.length,
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
              height: 40,
              color: Color(0xFFEEEEEE),
            ),
            itemBuilder: (context, index) {
              final post = posts[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Profile Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(post.userAvatarUrl),
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.username,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                post.userSubtitle,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        FilledButton.tonal(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            visualDensity: VisualDensity.compact,
                          ),
                          child: const Text('Follow'),
                        ),
                      ],
                    ),
                  ),

                  // Post Image in Curved Box
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: post.localAsset != null
                          ? Image.asset(
                              post.localAsset!,
                              width: double.infinity,
                              height: 380,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 380,
                                  color: Colors.grey[200],
                                  child: const Center(
                                    child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                                  ),
                                );
                              },
                            )
                          : Image.network(
                              post.postImageUrl,
                              width: double.infinity,
                              height: 380,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  height: 380,
                                  color: Colors.grey[100],
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 380,
                                  color: Colors.grey[200],
                                  child: const Center(
                                    child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),

                  // Action Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => addLike(post),
                          icon: Icon(
                            post.isLiked ? Icons.favorite : Icons.favorite_border,
                            size: 28,
                            color: post.isLiked ? Colors.red : Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () => openCommentModal(post),
                          icon: const Icon(Icons.chat_bubble_outline, size: 26),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.send_outlined, size: 26),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => toggleSave(post),
                          icon: Icon(
                            post.isSaved ? Icons.bookmark : Icons.bookmark_border,
                            size: 28,
                            color: post.isSaved ? Colors.black : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Like Counter
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '${post.likes} likes',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Caption
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black87, fontSize: 14),
                        children: [
                          TextSpan(
                            text: '${post.username} ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: post.caption),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // View Comments Trigger
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: () => openCommentModal(post),
                      child: Text(
                        'View all ${post.comments.length} comments',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Increment Like Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () => addLike(post),
                        icon: const Icon(Icons.favorite),
                        label: Text('Like (${post.likes})'),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}