Return-Path: <linux-mips+bounces-12267-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE20C65ED2
	for <lists+linux-mips@lfdr.de>; Mon, 17 Nov 2025 20:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id A6418293B0
	for <lists+linux-mips@lfdr.de>; Mon, 17 Nov 2025 19:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FE433123E;
	Mon, 17 Nov 2025 19:18:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1095F136358
	for <linux-mips@vger.kernel.org>; Mon, 17 Nov 2025 19:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763407102; cv=none; b=Ga02INumnSbeIT9HV5gDPuQeG/PyZsV1HEt9sCK1oCogspngVLkV5ZyDu9FLPtCGGXa5bXFrhviPw9tZgVErUHY3zBIclcFb5+fQXInGouIoVhNL5Ja7/4n30ncU/24gj3zQzEdfuP0Y7KeVtFqfjcFTo4HBs1rZ20cvSPDPbLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763407102; c=relaxed/simple;
	bh=9KjyumaacohDXDdRWOl0atT9YvOFtP1OrRAJAaU1maI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=PMCYt/FC+A0wpeYJeBUxnZlEZj6WMPFiixQmZzhG0tbXdQJn/vYxmjfkjN9yz9TXRuj9dtxhPWgdkJwt8poIOcSYUOiTKoo9fCLrWwmGxBXsrH/X7MqSK0Gz6HI2jLpfcHV0j4wf0f8ebjv460IdHPINyZzSzUO0pXiUz+R2ZNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=fail smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=alpha.franken.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B96BA1F393;
	Mon, 17 Nov 2025 19:18:16 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFC2B3EA61;
	Mon, 17 Nov 2025 19:18:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Gm65Kvh0G2klRQAAD6G6ig
	(envelope-from <tsbogend@alpha.franken.de>); Mon, 17 Nov 2025 19:18:16 +0000
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Nam Cao <namcao@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: kernel: Fix reservation for VDSO area
Date: Mon, 17 Nov 2025 20:18:14 +0100
Message-ID: <20251117191815.69556-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B96BA1F393
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.59
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.59 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	R_DKIM_NA(2.20)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-0.99)[-0.994];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.925];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spamd-Bar: /

Commit 69896119dc9d ("MIPS: vdso: Switch to generic storage
implementation") switches to a generic vdso storage, but missed to adapt
the max stack top by the number of generic VDSO pages.

Fixes: 69896119dc9d ("MIPS: vdso: Switch to generic storage implementation")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/process.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 29191fa1801e..9eb5b26d4b5f 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -693,6 +693,7 @@ unsigned long mips_stack_top(void)
 	if (current->thread.abi) {
 		top -= PAGE_ALIGN(current->thread.abi->vdso->size);
 		top -= PAGE_SIZE;
+		top -= VDSO_NR_PAGES * PAGE_SIZE;
 		top -= mips_gic_present() ? PAGE_SIZE : 0;
 
 		/* Space to randomize the VDSO base */
-- 
2.43.0


