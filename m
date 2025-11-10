Return-Path: <linux-mips+bounces-12170-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E2AC4920B
	for <lists+linux-mips@lfdr.de>; Mon, 10 Nov 2025 20:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8210C3A3A21
	for <lists+linux-mips@lfdr.de>; Mon, 10 Nov 2025 19:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD7033BBA1;
	Mon, 10 Nov 2025 19:48:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E171E1E1C
	for <linux-mips@vger.kernel.org>; Mon, 10 Nov 2025 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762804083; cv=none; b=tJh+ZFSxeElaceKyoY0x5vATPvbAED14vf1n6PDWf8P7S4c4CZGMg8M7+vPVaUWjP07ebyqoX1P9YvWrld4l/CJP/PWpELhl9zmIhf9HQgh+UEOU7UMoOk5VmnbG+CjgApubVyU1l4bvN2d71bl3t5eahqYG8786zxj9UKhVXgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762804083; c=relaxed/simple;
	bh=b5zKcyU0ifV1/YwfcnGB0uAwSbt1bgfiFv5tAB5q6LM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eTg6F9XElmL5wAvOBe29bz2V1ox1NSUhSYQQipYDb9QoG9ntNWGaLiL24p3KHiolHHnyXmYCHde2jA+jBUglbkTA7Lb+U4QpofDIBFbuzYMd9NF9cePQji8gTJpot0SH9CEIihFK1E3EBnBkrYsK4T6xKhMIVuCA/IEpGI/tZlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=fail smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=alpha.franken.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5DAF822004;
	Mon, 10 Nov 2025 19:47:58 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	dkim=none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47BC414575;
	Mon, 10 Nov 2025 19:47:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I2AMEW5BEmmtRwAAD6G6ig
	(envelope-from <tsbogend@alpha.franken.de>); Mon, 10 Nov 2025 19:47:58 +0000
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: mm: Only uniquify on CPU cores where it's needed
Date: Mon, 10 Nov 2025 20:47:53 +0100
Message-ID: <20251110194754.47626-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5DAF822004
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.47
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.47 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	R_DKIM_NA(2.20)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-0.99)[-0.991];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM_SHORT(-0.07)[-0.327];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spamd-Bar: /

Commit 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
switches initial TLB flushing to a mode needed for microAptiv/M5150
cores.  This breaks (at least) R4x00 cores if the tlb probe hits
multiple matching TLB entries (SGI IP22 prom for examples sets up all
TLBs to the same virtual address). Use the new TLB flushing only on
M5150 and local_tlb_flush_all() for everything else.

Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/mm/tlb-r4k.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 347126dc010d..c39a16d377a1 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -601,7 +601,10 @@ static void r4k_tlb_configure(void)
 	temp_tlb_entry = current_cpu_data.tlbsize - 1;
 
 	/* From this point on the ARC firmware is dead.	 */
-	r4k_tlb_uniquify();
+	if (current_cpu_type() == CPU_M5150)
+		r4k_tlb_uniquify();
+	else
+		local_flush_tlb_all();
 
 	/* Did I tell you that ARC SUCKS?  */
 }
-- 
2.43.0


