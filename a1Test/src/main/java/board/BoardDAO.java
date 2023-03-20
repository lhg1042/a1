package board;

import java.util.*;

public class BoardDAO {

	private static ArrayList<BoardDTO> boards = new ArrayList<BoardDTO>();
	
	public void insert(BoardDTO board) {
		boards.add(board);
	}
	
	public ArrayList<BoardDTO> selectAll() {		
		return boards;
	}
	
	public BoardDTO selectNick(String nick) {
		for(BoardDTO board : boards) {
			if(board.getNick().equals(nick)) {
				return board;
			}
		}
		return null;
	}
	
	public BoardDTO selectTitle(String title) {
		for(BoardDTO board : boards) {
			if(board.getTitle().equals(title)) {
				return board;
			}
		}
		return null;
	}
	
	public BoardDTO selectSearch(String search) {
		for(BoardDTO board : boards) {
			if(board.getNick().equals(search) || board.getTitle().equals(search)) {
				return board;
			}
		}
		return null;
	}
	
	public void update(BoardDTO board) {
		BoardDTO ex = selectTitle(board.getTitle());
		int index = boards.indexOf(ex);
		boards.set(index, board);
	}
	
	public void delete(BoardDTO board) {
		boards.remove(board);
	}
}
