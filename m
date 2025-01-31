Return-Path: <linux-mips+bounces-7657-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B41FCA2402E
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 17:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E6761887501
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 16:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3411E0E0A;
	Fri, 31 Jan 2025 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EL9yU285";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+JZEpd0q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EL9yU285";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+JZEpd0q"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69078467;
	Fri, 31 Jan 2025 16:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340348; cv=none; b=Wgx95GhK68nidwpncN96m7Xe6TT3HzonHGEf3BszrVcLdBepgT3fdiJq+TvTpn37HPV5JZ2l5TY6Nm1JLQKAjrxeP5d8wxdYOKo4heByfecxEplxIoeq8TAAH/m5fGY7B28uNLtMZ0jMcU7eSeJ9RiG26odqTzMCqegPYwTJdw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340348; c=relaxed/simple;
	bh=PThD2MabR8Y87tmcYynBi2ukMbhhXgysRS52Ag0sKlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ugOpnzoKZV5bDuQPfvTx6tLEvsC0aXlim6IJZb0xvGwZVn+SCCtslvk5f4AXg1z8Kupp6QWctRawh/IzpzDnKG1eOf0zFRXVvuXrkdf3Xr0+M+fkWN3JCFWzeMoTgsGHASVNFbfTR86mS1uWuIBgK1cHg5bQrLYCYMqbd3iygR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EL9yU285; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+JZEpd0q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EL9yU285; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+JZEpd0q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE5F32116C;
	Fri, 31 Jan 2025 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738340343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8Q/Dw7GxWnqeqKY03nODnkWqA6O7L7VulYndOELNcTE=;
	b=EL9yU285OqLvfaLCrLIQWmifOYlWP1RWhhAbz0uQEtcseQqDF6I63luidH63LrbyJUzTmR
	WSVdaATplzzsH2bloJA+npV6zgVnvPImGo4mT5J8OYq7xkPzrGNxwwoLfAW5P6lVB9dV0Z
	aZCxykd+vETK+0VjjHEhW0t2FpegUM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738340343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8Q/Dw7GxWnqeqKY03nODnkWqA6O7L7VulYndOELNcTE=;
	b=+JZEpd0qyHnML/UKYuCDc7kXsYhE0NeQG+cNHbCUV0Zkjaz27ma9vvX0SW2izYaanqST2A
	gbGS8R8AHfNLbeBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EL9yU285;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+JZEpd0q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738340343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8Q/Dw7GxWnqeqKY03nODnkWqA6O7L7VulYndOELNcTE=;
	b=EL9yU285OqLvfaLCrLIQWmifOYlWP1RWhhAbz0uQEtcseQqDF6I63luidH63LrbyJUzTmR
	WSVdaATplzzsH2bloJA+npV6zgVnvPImGo4mT5J8OYq7xkPzrGNxwwoLfAW5P6lVB9dV0Z
	aZCxykd+vETK+0VjjHEhW0t2FpegUM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738340343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8Q/Dw7GxWnqeqKY03nODnkWqA6O7L7VulYndOELNcTE=;
	b=+JZEpd0qyHnML/UKYuCDc7kXsYhE0NeQG+cNHbCUV0Zkjaz27ma9vvX0SW2izYaanqST2A
	gbGS8R8AHfNLbeBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85309133A6;
	Fri, 31 Jan 2025 16:19:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lktIH/f3nGcUHQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 16:19:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] mips: sni: Do not include <linux/fb.h>
Date: Fri, 31 Jan 2025 17:18:47 +0100
Message-ID: <20250131161859.399573-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BE5F32116C
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The MIPS architecture's source files do not require <linux/fb.h>.
Remove the include statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/mips/sni/setup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/sni/setup.c b/arch/mips/sni/setup.c
index 42fdb939c88d8..03cb699372580 100644
--- a/arch/mips/sni/setup.c
+++ b/arch/mips/sni/setup.c
@@ -12,7 +12,6 @@
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/console.h>
-#include <linux/fb.h>
 #include <linux/screen_info.h>
 
 #ifdef CONFIG_FW_ARC
-- 
2.48.1


