import 'package:flutter/material.dart';
import 'contact_page.dart';

// Post Model
class Post {
  final String username;
  final String userSubtitle;
  final String userAvatarUrl;
  final String postImageUrl;
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
  // 4 Posts with CORS-compliant Picsum Image URLs
  final List<Post> posts = [
    Post(
      username: 'flutter_student',
      userSubtitle: 'Learning Flutter',
      userAvatarUrl: 'https://picsum.photos/id/64/150/150',
      postImageUrl: 'https://picsum.photos/id/10/800/800',
      caption: 'Learning Flutter one widget at a time! 🚀',
      likes: 42,
      comments: [
        {'user': 'alex_dev', 'text': 'Flutter UI looks super clean! 🔥'},
        {'user': 'sarah_codes', 'text': 'Great composition in this shot 👌'},
        {'user': 'john_flutter', 'text': 'Keep up the good work! 🚀'},
        {'user': 'emily_tech', 'text': 'Love the rounded card design! ❤️'},
      ],
    ),
    Post(
      username: 'dart_master',
      userSubtitle: 'Dart & Mobile Dev',
      userAvatarUrl: 'https://picsum.photos/id/91/150/150',
      postImageUrl: 'https://picsum.photos/id/20/800/800',
      caption: 'Writing clean, asynchronous code with Dart ⚡',
      likes: 128,
      comments: [
        {'user': 'flutter_fan', 'text': 'Pattern matching in Dart is amazing!'},
        {'user': 'coder_guy', 'text': 'Best language for modern app dev.'},
        {'user': 'ui_designer', 'text': 'Super clean architecture.'},
        {'user': 'dev_sam', 'text': 'Keep these developer tips coming! 🙌'},
      ],
    ),
    Post(
      username: 'ui_designer_pro',
      userSubtitle: 'UI/UX & Animation',
      userAvatarUrl: 'https://picsum.photos/id/103/150/150',
      postImageUrl: 'https://picsum.photos/id/26/800/800',
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
      username: 'cloud_architect',
      userSubtitle: 'Backend & Firebase',
      userAvatarUrl: 'https://picsum.photos/id/177/150/150',
      postImageUrl: 'https://picsum.photos/id/42/800/800',
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

  // Helper method to navigate to Contact & Services Page
  void openContactPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ContactPage()),
    );
  }

  // Increment likes on every tap
  void addLike(Post post) {
    setState(() {
      post.likes++;
      post.isLiked = true;
    });
  }

  // Toggle bookmark saved state
  void toggleSave(Post post) {
    setState(() {
      post.isSaved = !post.isSaved;
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          post.isSaved ? 'Post saved to bookmarks' : 'Post removed from bookmarks',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // Comments Bottom Sheet Modal
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
      // ==========================================
      // APP BAR
      // ==========================================
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
          // Contact Page Navigation Icon Button
          IconButton(
            tooltip: 'Contact & Services',
            onPressed: openContactPage,
            icon: const Icon(Icons.support_agent, color: Colors.black87),
          ),
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

      // ==========================================
      // BODY FEED
      // ==========================================
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: ListView.separated(
            itemCount: posts.length + 1, // +1 for the Contact Us banner at top
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
              height: 40,
              color: Color(0xFFEEEEEE),
            ),
            itemBuilder: (context, index) {
              // INDEX 0: Contact & Services Banner Button
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.design_services_outlined, color: Colors.black87),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Need Services or Help?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Explore our Flutter packages & support',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        FilledButton(
                          onPressed: openContactPage,
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Contact Page'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              // INDEX 1 to 4: The Posts
              final post = posts[index - 1];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Profile Section
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

                  // Curved Post Image Box
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
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

                  // Actions Row
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

                  // Likes Counter
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

                  // Comments Action Link
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

                  // Full-width Like Button
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