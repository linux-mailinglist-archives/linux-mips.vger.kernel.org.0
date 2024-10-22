Return-Path: <linux-mips+bounces-6260-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 331AC9AB106
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2024 16:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8D59284950
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2024 14:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0235819DF66;
	Tue, 22 Oct 2024 14:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="kYQZuxLr";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="kYQZuxLr"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FAA1A0BD1;
	Tue, 22 Oct 2024 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729607960; cv=none; b=AJR6pDZ3k54CHwKAzMey/9uElctxF3o0xuH5AsNr/csUr02tWvcqQve3lpqstOxgd2ys7IndHQqt4MD0NuBKj6t/dgOeMaiwO8a+B+du8FCw+CyzrU1Thc17BvXNfNmQFYG1z7mL93+Bk/e2rmUP9fDJKpAKcy7iBs4+5LOEhSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729607960; c=relaxed/simple;
	bh=VKnutRGFuSrO61OQLtwCNyi/7TOtjCJ50Qm64vuM92Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mhRsAJaQQAzcNPSr/1V2j4otjFnG3L6Wcjk6oQDuGkd2hl2UHwjh/oi9Aw1p+m3PxjYkm13F/10o4KJSUk6QRFqb5qCPxIMrOOCTVI8qTpp0li++yIWB5UoiPTkC+kUS3YtVH1RD96+RxPSJRWXMGExW+Zey/3jM0OSnCEWnYnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=kYQZuxLr; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=kYQZuxLr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 40E441FB57;
	Tue, 22 Oct 2024 14:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729607957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cptWr7049rCL0kY9m2Sh5lbxcxM7fOvLZKwrDl8BwQY=;
	b=kYQZuxLr/zy9AS3kl831eI8GKKwGx6IA/Iia+T3B+Att/KDpCc/v+ZDjYJB2fDYxPGtgNF
	137rzzMk6WYTogZJdBYXvpwkSuKDmaLR26c6rr7s+Su1A0B8a03JabJ17TCJ1rGSD354sm
	pxBJb1uJyaK4i9INL/u29YQ5zporypc=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=kYQZuxLr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729607957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cptWr7049rCL0kY9m2Sh5lbxcxM7fOvLZKwrDl8BwQY=;
	b=kYQZuxLr/zy9AS3kl831eI8GKKwGx6IA/Iia+T3B+Att/KDpCc/v+ZDjYJB2fDYxPGtgNF
	137rzzMk6WYTogZJdBYXvpwkSuKDmaLR26c6rr7s+Su1A0B8a03JabJ17TCJ1rGSD354sm
	pxBJb1uJyaK4i9INL/u29YQ5zporypc=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39CBB13894;
	Tue, 22 Oct 2024 14:39:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1RQXDhW5F2didgAAD6G6ig
	(envelope-from <dsterba@suse.com>); Tue, 22 Oct 2024 14:39:17 +0000
From: David Sterba <dsterba@suse.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: David Sterba <dsterba@suse.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: export __cmpxchg_small()
Date: Tue, 22 Oct 2024 16:39:13 +0200
Message-ID: <20241022143914.27372-1-dsterba@suse.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 40E441FB57
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Export the symbol __cmpxchg_small() for btrfs.ko that will use it to
store blk_status_t, which is u8. Reported by LKP:

>> ERROR: modpost: "__cmpxchg_small" [fs/btrfs/btrfs.ko] undefined!

Patch using the cmpxchg() https://lore.kernel.org/linux-btrfs/1d4f72f7fee285b2ddf4bf62b0ac0fd89def5417.1728575379.git.naohiro.aota@wdc.com/

Link: https://lore.kernel.org/all/20241016134919.GO1609@suse.cz/
Signed-off-by: David Sterba <dsterba@suse.com>
---

I can merge it via the btrfs git tree along the fix or wait until it's
merged the usual way, please let me know.

 arch/mips/kernel/cmpxchg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/cmpxchg.c b/arch/mips/kernel/cmpxchg.c
index e974a4954df8..c371def2302d 100644
--- a/arch/mips/kernel/cmpxchg.c
+++ b/arch/mips/kernel/cmpxchg.c
@@ -102,3 +102,4 @@ unsigned long __cmpxchg_small(volatile void *ptr, unsigned long old,
 			return old;
 	}
 }
+EXPORT_SYMBOL(__cmpxchg_small);
-- 
2.45.0


