Return-Path: <linux-mips+bounces-12310-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC240C73E69
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 13:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id B484E2A789
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 12:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB35133121F;
	Thu, 20 Nov 2025 12:10:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66582E4266
	for <linux-mips@vger.kernel.org>; Thu, 20 Nov 2025 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763640637; cv=none; b=TYrDIZSl7OO/tRY2XoWfWbSSTNK/JYA87vP4bd8fGOLW/M6A8Vz9fIm2YF16ztBeJZk6yci0eXgUFBQFwGbyXd10dJsXmM5PiH+V22RkyyMd0ZTq9cW8kAPrGv2zpXm+JtLvSpFxL+j8oYV/bBshA1X9mPsFvVHpWrFvH8m5CgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763640637; c=relaxed/simple;
	bh=g2pbcwnCtVpY/dI33xZ0tKBwAc6vnRi7cq8RordWA2c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ksZfVqzS1aPsLGK2csfayvK49kghc09Naf6Sbrn99l0PhMjGwBXm+3VzCYgIG+sJ7NPj37RsB5Cb6YLeX1a5eESq996r3EHOkRPjnzNHrzMXI1FSKxH/YOw/+KU+iQg8hGBPfE2wdjzyPDSAlZd5X2NawYVxUxmzu7yPFde6eNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=fail smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=alpha.franken.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 983882127A;
	Thu, 20 Nov 2025 12:10:31 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84B6D3EA61;
	Thu, 20 Nov 2025 12:10:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id u71GIDcFH2mYQAAAD6G6ig
	(envelope-from <tsbogend@alpha.franken.de>); Thu, 20 Nov 2025 12:10:31 +0000
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nam Cao <namcao@linutronix.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: kernel: Fix random segmentation faults
Date: Thu, 20 Nov 2025 13:10:29 +0100
Message-ID: <20251120121030.28524-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[franken.de:email,imap1.dmz-prg2.suse.org:helo,alpha.franken.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Commit 69896119dc9d ("MIPS: vdso: Switch to generic storage
implementation") switches to a generic vdso storage, which increases
the number of data pages from 1 to 4. But there is only one page
reserved, which causes segementation faults depending where the VDSO
area is randomized to. To fix this use the same size of reservation
and allocation of the VDSO data pages.

Fixes: 69896119dc9d ("MIPS: vdso: Switch to generic storage implementation")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
v2: Don't reserve additionnal VDSO_NR_PAGES, but reserve VDSO_NR_PAGES
    instead of the one page before.
    Reworked description
v1: https://lore.kernel.org/all/20251117191815.69556-1-tsbogend@alpha.franken.de/

 arch/mips/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 29191fa1801e..a3101f2268c6 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -692,7 +692,7 @@ unsigned long mips_stack_top(void)
 	/* Space for the VDSO, data page & GIC user page */
 	if (current->thread.abi) {
 		top -= PAGE_ALIGN(current->thread.abi->vdso->size);
-		top -= PAGE_SIZE;
+		top -= VDSO_NR_PAGES * PAGE_SIZE;
 		top -= mips_gic_present() ? PAGE_SIZE : 0;
 
 		/* Space to randomize the VDSO base */
-- 
2.43.0


