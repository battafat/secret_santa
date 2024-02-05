/// * The participant identifier is an important concept and can have its own type.
typedef ParticipantID = String;

class Participant {
  const Participant({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.phoneNumber,
    });

  /// Unique product id
  final ParticipantID id;
  final String imageUrl;
  final String name;
  final String phoneNumber;
}
