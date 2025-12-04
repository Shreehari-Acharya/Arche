class LearningJourney {
  final String id;
  final String topicName;
  final String userId;
  final String createdAt;
  final List<SubTopic> subTopics;

  LearningJourney({
    required this.id,
    required this.topicName,
    required this.userId,
    required this.createdAt,
    required this.subTopics,
  });

  factory LearningJourney.fromJson(Map<String, dynamic> json) {
    return LearningJourney(
      id: json['id']?.toString() ?? '',
      topicName: json['topicName'] ?? 'Untitled Topic',
      userId: json['userId'] ?? '',
      createdAt: json['createdAt'] ?? '',
      subTopics: json['subTopics'] != null
          ? (json['subTopics'] as List)
              .map((e) => SubTopic.fromJson(e))
              .toList()
          : [],
    );
  }
}

class SubTopic {
  final String id;
  final String description;
  final bool isCompleted;
  final List<VideoResource> videoResources;

  SubTopic({
    required this.id,
    required this.description,
    required this.isCompleted,
    required this.videoResources,
  });

  factory SubTopic.fromJson(Map<String, dynamic> json) {
    return SubTopic(
      id: json['id']?.toString() ?? '',
      description: json['description'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
      videoResources: json['videoResources'] != null
          ? (json['videoResources'] as List)
              .map((e) => VideoResource.fromJson(e))
              .toList()
          : [],
    );
  }
}

class VideoResource {
  final String id;
  final String title;
  final String url;
  final int duration;

  VideoResource({
    required this.id,
    required this.title,
    required this.url,
    required this.duration,
  });

  factory VideoResource.fromJson(Map<String, dynamic> json) {
    return VideoResource(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      duration: json['duration'] ?? 0,
    );
  }
}
