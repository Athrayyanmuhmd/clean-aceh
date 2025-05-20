import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';
import 'dart:math';
import 'package:clean_aceh/screens/order_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  final String cleanerName;
  final String cleanerInitial;

  const ChatScreen({
    super.key,
    required this.cleanerName,
    required this.cleanerInitial,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isTyping = false;
  String? _editingMessageId; // Track which message is being edited
  final String _orderInfo = 'Pesanan Pembersihan Umum - Selasa, 29 April 2025, 12:00';
  final String _orderId = '12345';

  @override
  void initState() {
    super.initState();

    // Load initial messages
    _loadInitialMessages();
  }

  void _loadInitialMessages() {
    final List<Map<String, dynamic>> initialMessages = [
      {
        'id': '1',
        'text': 'Halo! Saya Mustapa Jamija, pelanggan Anda untuk pembersihan hari ini.',
        'isUser': true,
        'time': DateTime.now().subtract(const Duration(minutes: 40)),
      },
      {
        'id': '2',
        'text': 'Halo Pak Mustapa! Saya ${widget.cleanerName}, terima kasih sudah memesan layanan kami. Ada yang bisa saya bantu?',
        'isUser': false,
        'time': DateTime.now().subtract(const Duration(minutes: 38)),
      },
      {
        'id': '3',
        'text': 'Saya ingin menanyakan apakah Anda sudah dalam perjalanan menuju rumah saya?',
        'isUser': true,
        'time': DateTime.now().subtract(const Duration(minutes: 35)),
      },
      {
        'id': '4',
        'text': 'Ya, saya sedang dalam perjalanan. Perkiraan tiba dalam 15 menit lagi. Mohon maaf atas keterlambatan, ada sedikit kemacetan di jalan.',
        'isUser': false,
        'time': DateTime.now().subtract(const Duration(minutes: 23)),
      },
      {
        'id': '5',
        'text': 'Baik, tidak masalah. Saya akan menunggu kedatangan Anda.',
        'isUser': true,
        'time': DateTime.now().subtract(const Duration(minutes: 20)),
      },
    ];

    setState(() {
      _messages.addAll(initialMessages);
    });
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) {
      return;
    }

    if (_editingMessageId != null) {
      // Update existing message if in edit mode
      setState(() {
        final messageIndex = _messages.indexWhere((msg) => msg['id'] == _editingMessageId);
        if (messageIndex != -1) {
          _messages[messageIndex]['text'] = _messageController.text.trim();
          _messages[messageIndex]['isEdited'] = true;
        }
        _editingMessageId = null;
        _messageController.clear();
      });
    } else {
      // Add new message
      setState(() {
        _messages.add({
          'id': 'msg_${DateTime.now().millisecondsSinceEpoch}',
          'text': _messageController.text.trim(),
          'isUser': true,
          'time': DateTime.now(),
        });
        _messageController.clear();
        _isTyping = true;
      });

      // Scroll to bottom
      _scrollToBottom();

      // Simulate cleaner response after 1-3 seconds
      Future.delayed(Duration(seconds: Random().nextInt(2) + 1), () {
        if (mounted) {
          setState(() {
            _isTyping = false;
            _messages.add({
              'id': 'msg_${DateTime.now().millisecondsSinceEpoch + 1}',
              'text': _getRandomResponse(),
              'isUser': false,
              'time': DateTime.now(),
            });
          });

          // Scroll to bottom again
          _scrollToBottom();
        }
      });
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _getRandomResponse() {
    final List<String> responses = [
      'Baik, saya mengerti.',
      'Terima kasih atas informasinya.',
      'Saya akan segera sampai di lokasi Anda.',
      'Mohon tunggu sebentar ya.',
      'Apakah ada hal lain yang perlu saya persiapkan?',
      'Saya sudah mencatat permintaan Anda.',
      'Mohon maaf atas ketidaknyamanannya.',
      'Tentu, saya akan melakukannya sesuai permintaan Anda.',
    ];

    return responses[Random().nextInt(responses.length)];
  }

  void _editMessage(String messageId) {
    final message = _messages.firstWhere((msg) => msg['id'] == messageId);
    setState(() {
      _editingMessageId = messageId;
      _messageController.text = message['text'];
    });
    // Focus on text field
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _deleteMessage(String messageId) {
    setState(() {
      _messages.removeWhere((msg) => msg['id'] == messageId);
    });
    Navigator.pop(context); // Close the modal
  }

  void _showOrderDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrderDetailScreen(),
      ),
    );
  }

  void _showCleanerProfile() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.primary,
                    child: Text(
                      widget.cleanerInitial,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cleanerName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 5),
                            Text('4.8 (230 ulasan)'),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '124 pekerjaan selesai',
                          style: TextStyle(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              
              // Profile Info
              const Text(
                'Tentang',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Saya adalah seorang pembersih profesional dengan pengalaman lebih dari 5 tahun. Saya mengutamakan kepuasan pelanggan dan hasil yang bersih, rapi, serta higienis.',
                style: TextStyle(height: 1.5),
              ),
              const SizedBox(height: 20),
              
              // Skill Section
              const Text(
                'Keahlian',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildSkillChip('Pembersihan Umum'),
                  _buildSkillChip('Pembersihan Dapur'),
                  _buildSkillChip('Pembersihan Kamar Mandi'),
                  _buildSkillChip('Pembersihan Furnitur'),
                ],
              ),
              
              const Spacer(),
              
              // Action Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigate to full profile page
                  },
                  child: const Text('Lihat Profil Lengkap'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Tutup'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: AppColors.primary.withOpacity(0.1),
      labelStyle: const TextStyle(
        color: AppColors.primary,
        fontSize: 12,
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _showCleanerProfile,
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.primary,
                child: Text(
                  widget.cleanerInitial,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(widget.cleanerName),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Make a call
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Menghubungi ${widget.cleanerName}...')),
              );
            },
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'profile') {
                _showCleanerProfile();
              } else if (value == 'block') {
                _showBlockDialog();
              } else if (value == 'report') {
                _showReportDialog();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person, size: 20),
                    SizedBox(width: 8),
                    Text('Lihat Profil'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'block',
                child: Row(
                  children: [
                    Icon(Icons.block, size: 20),
                    SizedBox(width: 8),
                    Text('Blokir Pembersih'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'report',
                child: Row(
                  children: [
                    Icon(Icons.report_problem, size: 20),
                    SizedBox(width: 8),
                    Text('Laporkan Masalah'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat header with current order info
          GestureDetector(
            onTap: _showOrderDetails,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: AppColors.primary.withOpacity(0.1),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _orderInfo,
                      style: const TextStyle(fontSize: 12, color: AppColors.primary),
                    ),
                  ),
                  TextButton(
                    onPressed: _showOrderDetails,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(60, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Lihat',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Chat messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final bool isUser = message['isUser'] as bool;

                return _buildMessageBubble(
                  id: message['id'] as String,
                  text: message['text'] as String,
                  isUser: isUser,
                  time: message['time'] as DateTime,
                  showAvatar: _shouldShowAvatar(index),
                  isEdited: message['isEdited'] ?? false,
                );
              },
            ),
          ),

          // Typing indicator
          if (_isTyping)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.primary,
                    child: Text(
                      widget.cleanerInitial,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 2),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 2),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          // Message input
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.photo),
                  color: AppColors.primary,
                  onPressed: () {
                    // Upload image
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fitur upload gambar belum tersedia'),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: _editingMessageId == null 
                          ? 'Tulis pesan...' 
                          : 'Edit pesan...',
                      prefixIcon: _editingMessageId != null 
                          ? Icon(
                              Icons.edit,
                              color: AppColors.primary,
                              size: 20,
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors.lightGrey.withOpacity(0.5),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                if (_editingMessageId != null)
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _editingMessageId = null;
                        _messageController.clear();
                      });
                    },
                  ),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: AppColors.primary,
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble({
    required String id,
    required String text,
    required bool isUser,
    required DateTime time,
    required bool showAvatar,
    bool isEdited = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser && showAvatar)
            CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.primary,
              child: Text(
                widget.cleanerInitial,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else if (!isUser && !showAvatar)
            const SizedBox(width: 32),

          const SizedBox(width: 8),

          Flexible(
            child: GestureDetector(
              onLongPress: isUser ? () => _showMessageOptions(id) : null,
              child: Column(
                crossAxisAlignment:
                    isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isUser ? AppColors.primary : AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft:
                            isUser ? const Radius.circular(16) : Radius.zero,
                        bottomRight:
                            isUser ? Radius.zero : const Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: isUser ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _formatTime(time),
                        style: const TextStyle(color: AppColors.grey, fontSize: 10),
                      ),
                      if (isEdited)
                        const Text(
                          ' • diedit',
                          style: TextStyle(color: AppColors.grey, fontSize: 10, fontStyle: FontStyle.italic),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 8),

          if (isUser && showAvatar)
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.orange,
              child: Text(
                'MJ',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else if (isUser && !showAvatar)
            const SizedBox(width: 32),
        ],
      ),
    );
  }

  void _showMessageOptions(String messageId) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit Pesan'),
                onTap: () {
                  Navigator.pop(context);
                  _editMessage(messageId);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Hapus Pesan', style: TextStyle(color: Colors.red)),
                onTap: () {
                  _showDeleteConfirmation(messageId);
                },
              ),
              ListTile(
                leading: const Icon(Icons.copy),
                title: const Text('Salin Pesan'),
                onTap: () {
                  final message = _messages.firstWhere((msg) => msg['id'] == messageId);
                  // Copy to clipboard would go here
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pesan disalin')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteConfirmation(String messageId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Pesan'),
        content: const Text('Apakah Anda yakin ingin menghapus pesan ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => _deleteMessage(messageId),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  void _showBlockDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Blokir Pembersih'),
        content: Text(
          'Anda yakin ingin memblokir ${widget.cleanerName}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                SnackBar(
                  content: Text(
                    '${widget.cleanerName} telah diblokir',
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Blokir'),
          ),
        ],
      ),
    );
  }

  void _showReportDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Laporkan Masalah'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pilih jenis masalah:'),
            const SizedBox(height: 16),
            _buildReportOption('Pembersih tidak sopan'),
            _buildReportOption('Kualitas pembersihan buruk'),
            _buildReportOption('Pembersih tidak datang tepat waktu'),
            _buildReportOption('Penipuan'),
            _buildReportOption('Lainnya'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
        ],
      ),
    );
  }

  Widget _buildReportOption(String option) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Anda telah melaporkan: $option')),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(option),
      ),
    );
  }

  bool _shouldShowAvatar(int index) {
    if (index == 0) return true;

    final currentMessage = _messages[index];
    final previousMessage = _messages[index - 1];

    return currentMessage['isUser'] != previousMessage['isUser'];
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(time.year, time.month, time.day);

    String timeStr =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

    if (messageDate == today) {
      return timeStr;
    } else {
      return '${time.day}/${time.month} $timeStr';
    }
  }
}