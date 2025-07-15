Return-Path: <linux-mips+bounces-9815-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 629CEB053C9
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jul 2025 09:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2226D4E31A1
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jul 2025 07:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF82274B24;
	Tue, 15 Jul 2025 07:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R0rBqHPa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J8QlqNrx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R0rBqHPa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J8QlqNrx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C102F274674
	for <linux-mips@vger.kernel.org>; Tue, 15 Jul 2025 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752565972; cv=none; b=st1b5MXvwjXed4isW5303B0+1/F17ejqds4GM83mRtZqB3XjtOMAmgeAbhe3J8696rFrbrDLFIPDyJhpYbErXO4Qv8MG8qXy6S59gxz7hvpnuaQ6shmo51vroVuA8kOaN6jD830wf3Xzpe697sUpaVVZv5dMFB7Uc69tU1xWAQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752565972; c=relaxed/simple;
	bh=VW/rtkRI/DBbhjOzkqkNl6B60/7W0ThWrUUEKvgh1Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HTDHnEckeHIKKKO5+JsG7+iF84+9Etf4hzNsMPNeJVUPZkr6SzJk57ZjGeU2iNt0HBfCu6GDad3JIW1YjcGS+/2ZBKE5QWYAZ0+qX5XnlJMdnZ0C5JuPQnVaOTyH7cO61eDQohfikes5AEr4qs79gIU2OLHKz87FWfm0bUAzTeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R0rBqHPa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J8QlqNrx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R0rBqHPa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J8QlqNrx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CC5F21F445;
	Tue, 15 Jul 2025 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752565962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pf2cVC+OGBS7EBscBGuJH0P+TqU9FmA4WqwxuJ06ceY=;
	b=R0rBqHPaJB+hptSlk7xt62zH5UemcUYhUqu4kyfnZw7o2kVunamRijEQHZe8oka8WRCfDz
	Eu7kxuluo2OdiSupZCUO+uPsnbTjwupmAKuxTEnvm9/q1ppRnJHrkkde8z6B0tFwkxXb2r
	/xVJ/v81fLLXhoO9usL9U1gzf3FtgVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752565962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pf2cVC+OGBS7EBscBGuJH0P+TqU9FmA4WqwxuJ06ceY=;
	b=J8QlqNrxu073sJ/1JVF1IuxanHzHw/R9j7+K1a5zcdsuHLMrcxIyUNS81A06fah/jfzFI1
	fFbgUUvz5NvC/pAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=R0rBqHPa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=J8QlqNrx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752565962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pf2cVC+OGBS7EBscBGuJH0P+TqU9FmA4WqwxuJ06ceY=;
	b=R0rBqHPaJB+hptSlk7xt62zH5UemcUYhUqu4kyfnZw7o2kVunamRijEQHZe8oka8WRCfDz
	Eu7kxuluo2OdiSupZCUO+uPsnbTjwupmAKuxTEnvm9/q1ppRnJHrkkde8z6B0tFwkxXb2r
	/xVJ/v81fLLXhoO9usL9U1gzf3FtgVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752565962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pf2cVC+OGBS7EBscBGuJH0P+TqU9FmA4WqwxuJ06ceY=;
	b=J8QlqNrxu073sJ/1JVF1IuxanHzHw/R9j7+K1a5zcdsuHLMrcxIyUNS81A06fah/jfzFI1
	fFbgUUvz5NvC/pAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9593613A68;
	Tue, 15 Jul 2025 07:52:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IJ5uI8oIdmjnSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Jul 2025 07:52:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mips: loongson3_defconfig: Update HD-audio configs
Date: Tue, 15 Jul 2025 09:51:22 +0200
Message-ID: <20250715075237.28476-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715075237.28476-1-tiwai@suse.de>
References: <20250715075237.28476-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: CC5F21F445
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Since the reorganization of HD-audio drivers, Realtek driver has been
split.  Update to the new Kconfigs to catch up.

Fixes: aeeb85f26c3b ("ALSA: hda: Split Realtek HD-audio codec driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

I'm going to put to sound git tree if no one objects

 arch/mips/configs/loongson3_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 98844b457b7f..5ff0c1554168 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -292,7 +292,9 @@ CONFIG_SND_SEQ_DUMMY=m
 # CONFIG_SND_ISA is not set
 CONFIG_SND_HDA_INTEL=m
 CONFIG_SND_HDA_PATCH_LOADER=y
-CONFIG_SND_HDA_CODEC_REALTEK=m
+CONFIG_SND_HDA_CODEC_REALTEK=y
+CONFIG_SND_HDA_CODEC_REALTEK_LIB=m
+CONFIG_SND_HDA_CODEC_ALC269=m
 CONFIG_SND_HDA_CODEC_SIGMATEL=m
 CONFIG_SND_HDA_CODEC_HDMI=m
 CONFIG_SND_HDA_CODEC_CONEXANT=m
-- 
2.50.1


