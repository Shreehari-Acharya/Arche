class LearningJourney {
  final String id;
  final String topicName;
  final String userId;
  final String createdAt;
  // subTopics might be null in the "List" API response, but present in "Detail" response
  final List<SubTopic>? subTopics; 

  LearningJourney({
    required this.id,
    required this.topicName,
    required this.userId,
    required this.createdAt,
    this.subTopics,
  });

  factory LearningJourney.fromJson(Map<String, dynamic> json) {
    var list = json['subTopics'] as List?;
    List<SubTopic>? subTopicList;
    
    if (list != null) {
      subTopicList = list.map((i) => SubTopic.fromJson(i)).toList();
    }

    return LearningJourney(
      id: json['id'] ?? '',
      topicName: json['topicName'] ?? 'Untitled Topic',
      userId: json['userId'] ?? '',
      createdAt: json['createdAt'] ?? '',
      subTopics: subTopicList,
    );
  }
}

class SubTopic {
  final String id;
  final String description;
  final List<VideoResource> videoResources;

  SubTopic({
    required this.id,
    required this.description,
    required this.videoResources,
  });

  factory SubTopic.fromJson(Map<String, dynamic> json) {
    var list = json['videoResources'] as List?;
    List<VideoResource> resourcesList = [];
    
    if (list != null) {
      resourcesList = list.map((i) => VideoResource.fromJson(i)).toList();
    }

    return SubTopic(
      id: json['id'] ?? '',
      description: json['description'] ?? '',
      videoResources: resourcesList,
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
      id: json['id'] ?? '',
      title: json['title'] ?? 'Untitled Video',
      url: json['url'] ?? '',
      duration: json['duration'] ?? 0,
    );
  }
}