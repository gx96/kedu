package com.gaoxuan.kedu.service;

import java.sql.Timestamp;

public interface TalkService {
	void addMessage(int fromId, String fromName, int toId, String messageText, Timestamp messageDate);
}
