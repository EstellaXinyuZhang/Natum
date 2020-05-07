package betago.dao;

import java.util.ArrayList;

import betago.entity.Post;
import betago.entity.Reply;

public interface CommunityDAO {
	public ArrayList<Post> getAllPosts();
	public Post getContentById(String id);
	public ArrayList<Reply> getReplyById(String id);
	public int setNewPost(Post post) throws Exception;
	public int setNewReply(Reply reply) throws Exception;
}
