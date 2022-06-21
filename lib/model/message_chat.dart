class MessageChatModel {
  final int id;
  final int transmitterID;
  final int receiverID;
  final String message;
  final String created;
  
  const MessageChatModel(this.id, this.transmitterID, this.receiverID, this.message, this.created);
}