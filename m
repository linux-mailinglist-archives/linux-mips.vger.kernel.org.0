Return-Path: <linux-mips+bounces-8045-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB66A49C24
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 15:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB13B3A9A31
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 14:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B6A26FD9C;
	Fri, 28 Feb 2025 14:37:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1297B26FD84
	for <linux-mips@vger.kernel.org>; Fri, 28 Feb 2025 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740753433; cv=none; b=cruhxdISB1/TW0lF6EZE31ZA9ZG3zUmHPyyKWxfJtjtS2Hg8yA1M/QibUaB/64/0WySTzGe6LEY4cIIWsxoPS6kRhfcyAo7EKrVT8Cahw78eIzkJIA+fg48Yt3KU56wY6hGVE0HOZCz1AvFjkWMEnTEVPVHstw2duxDhPFRdAbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740753433; c=relaxed/simple;
	bh=UvnTs/1/XnhiDr9pfMYDThu3k8FYy9I1ewxX6+CXfpk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HCdiNLICMvzaOMR6gT3Edbx5Oppw9s11A1hAyoic0of/RgP2LUfM7xGRS+1gjMs79/rp0mlM89YBKV18dZ0X+QAkMDkUjLN16Dye2LdgVk5QZKH2Tj6iFrZamJUtf7cxzL/1hqdQrvHdXxQMWcsoaxCHU+uI7AghAhzn41JOJfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=fail smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=alpha.franken.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1D06C1F38F;
	Fri, 28 Feb 2025 14:37:07 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 152B513888;
	Fri, 28 Feb 2025 14:37:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zLzABBPKwWc4OQAAD6G6ig
	(envelope-from <tsbogend@alpha.franken.de>); Fri, 28 Feb 2025 14:37:07 +0000
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: cm: Fix warning if MIPS_CM is disabled
Date: Fri, 28 Feb 2025 15:37:02 +0100
Message-Id: <20250228143703.33381-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

Commit e27fbe16af5c ("MIPS: cm: Detect CM quirks from device tree")
introduced

arch/mips/include/asm/mips-cm.h:119:13: error: ‘mips_cm_update_property’
	defined but not used [-Werror=unused-function]

Fix this by making empty function implementation inline

Fixes: e27fbe16af5c ("MIPS: cm: Detect CM quirks from device tree")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mips-cm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 3bfe0633b576..407f253bb4a1 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -116,7 +116,7 @@ static inline bool mips_cm_present(void)
 #ifdef CONFIG_MIPS_CM
 extern void mips_cm_update_property(void);
 #else
-static void mips_cm_update_property(void) {}
+static inline void mips_cm_update_property(void) {}
 #endif
 
 /**
-- 
2.35.3


