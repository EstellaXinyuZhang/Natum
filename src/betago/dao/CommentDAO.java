package betago.dao;

import java.util.ArrayList;

import betago.entity.Comment;

public interface CommentDAO {
	public ArrayList<Comment> listComment(String productID);
	
}
