Return-Path: <linux-mips+bounces-15157-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kj+TMrYxOGriZQcAu9opvQ
	(envelope-from <linux-mips+bounces-15157-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 21 Jun 2026 20:47:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9C66AB74C
	for <lists+linux-mips@lfdr.de>; Sun, 21 Jun 2026 20:47:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cAXnD+ZN;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15157-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15157-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C46E43006440
	for <lists+linux-mips@lfdr.de>; Sun, 21 Jun 2026 18:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9739523A99F;
	Sun, 21 Jun 2026 18:47:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA742F6931
	for <linux-mips@vger.kernel.org>; Sun, 21 Jun 2026 18:47:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782067636; cv=none; b=qz5v+bqzp34INgePe3ZF7UfMnZd02tlOzd++n4+GTSBLYyQCCCWPbVkXQ70afne63cLeAC6Jshdvg9lPjmDCaKDRCPEc3RXJAKO5Z0lFJy0XRNaSoFT39m/PGt1udqJGr7gesFt+zwY/XIIQ5mYVP/Dn3LegFOS37ukYQxa4cZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782067636; c=relaxed/simple;
	bh=jBo8E/ey2qiKUkgg8W450tgjXTe7/1uoKkuGWGhy8pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KDPgpUe17caeEqWK8iSTbiF5mrFEI4aOZWDO5vIZcOZuOeaxZED9G4OOjnM6nYG9r38LZOuq6o5yrl/187JeKfLvyzW9OjLMgdxoiWKEjD9QATHdHZOWXpG3v60+sr4isvwA0k/fPqu3PYTica/VGBjokudyr4gkk8Z0yjh1H5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAXnD+ZN; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c3546924so27012595ad.3
        for <linux-mips@vger.kernel.org>; Sun, 21 Jun 2026 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782067635; x=1782672435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mm0LVTbIXUCoMUBReDnK+eI2xZg7Q5NIfMRbVcpkIIU=;
        b=cAXnD+ZNI+g+tJh1NHa+XQ1P7iW7zbv8r456wdp6rgdmSjfxE6mL+H9WMzMvJikj0T
         0hjaIjiu5wPuZPKCAw1YfNMqk94BmH6AmCxxEffF3lQb/qhFIr4rGgYyxLKS+ezOvFTM
         Beo9/4oE4vu1J1qO+IB0GJ2SOKb7qw1VjRnvLzPFV9wynUg8b8ZvHYwHIASVVuoy55JB
         rDLMRFzi1PeQgVuZI/vNzdA9E/OuMGAy8NOIxdmd/VZ5BTvpwJ8UxtnEp83V6MFPUxyw
         oUtHwaNZeVuHSzgK6dw+e1GFEKdFJ4L4OLewSmtNiHOxCn3sdN/PNRnc2eykecZEMBQb
         yywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782067635; x=1782672435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mm0LVTbIXUCoMUBReDnK+eI2xZg7Q5NIfMRbVcpkIIU=;
        b=QRiz082kQyO3v/sGYHFycSdCjkfoMCdCphGns8jMkglPZmD4csYmY8+i7N+lP9eoPd
         yG2CmSgB2XWEzS3o+h+g3mFz2AOiFavu/gmntcsHP3iAm8Kj/77rSrNEG88MLZxnwA0Y
         Y12usTE6WKmyThK4/DqHDLRn+9mLvk4mJzuDD8yhnp6I74QInfJc/VTq8Dq6/X+U9VYr
         3OLj81Xh0KJJqJfsZ/Nh/fGbcb7x3E3E2OH/i2gRIh98wCZiVl7FOJ+SzbH0pQtk/Lw+
         ZmwrjPHWOClFouxFj9RsLeB2xGwKf0rdLLhYlelFhhLuNqQ/QiVlwTrzuxApQhR2r/Iy
         LakQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaAQho29TQQgvt+QrEjgD0r26QcNrRRvbjmxaR4EA1e42Ur011RXFIlwEk6BN2zYEPBX4ZwOzz+1qV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ve43VTcPHHub7KXm9I65BtvqpQSfd0uRgtI9KKzav/XHjNhp
	hYY2BfDkAMqfYVZW9760WSTAZhruQ1Msszm8P2vVp7rslHAmcNJVr4qb1p1x3g==
X-Gm-Gg: AfdE7cmIZ+bLI/hplWMq3ApWIoJYUyCYvM65e1Nt1R49G72w8Cc0vCffiIDSx+X0GLN
	tL90sbYR4qJrSk3l7DXU3Cpt2euiLVZ4Yme7En9VyFJJSre3hW3qmwRqIP7EFChgOWk+C/E8G+k
	BxRPish4jfx0YJBqvGOIyMx3mRpstHge5VZXJTIAYzTEuvfb+u5uWCIXdJdh5ZiZ3CP+EWnnRT7
	PQqrAL66W9HUWzvS8Ew5RjI8zJHRniqRAgz97at9SVAd3pCiEFqfq7WralAub5g2rIRDnArTfdo
	eZy+d+myCf8lVr5ehv4jkwX84/Y2YTiQg09XC2SvnGek4mHYjHgl7op8JX+WbaKBC1c0zwy8fjl
	UWcrLbsLfZAneAjFv2y94fnJAHmodBYBZdbmLW2ZxLZjJ7cyjmVosOA2qY1FxF+LCplHl6wOHvM
	fKIyioKFExxJFG56Z0ylQY2Lts3VyVeKiTZeRIiTYNH26TTCT7N20=
X-Received: by 2002:a17:902:d2c5:b0:2c0:f807:56b2 with SMTP id d9443c01a7336-2c719043fd4mr133293175ad.34.1782067634727;
        Sun, 21 Jun 2026 11:47:14 -0700 (PDT)
Received: from connors.lan (d216-232-210-95.bchsia.telus.net. [216.232.210.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af558sm60243105ad.14.2026.06.21.11.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 11:47:14 -0700 (PDT)
From: Kyle Hendry <kylehendrydev@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Kyle Hendry <kylehendrydev@gmail.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: mm: Add check for highmem before removing memory block
Date: Sun, 21 Jun 2026 11:47:02 -0700
Message-ID: <20260621184702.17302-1-kylehendrydev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15157-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kylehendrydev@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:kylehendrydev@gmail.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kylehendrydev@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A9C66AB74C

If a device has less physical memory than the highmem threshold
bootmem_init() doesn't set highstart_pfn. This results in highmem_init()
wrongly disabling the entire memory range if the cpu doesn't support
highmem. Add a check that highstart_pfn is non zero before removing the
highmem block.

Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
---
 arch/mips/mm/init.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 1c07ca84ee21..352718e43f69 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -426,10 +426,11 @@ static inline void __init highmem_init(void)
 	unsigned long tmp;
 
 	/*
-	 * If CPU cannot support HIGHMEM discard the memory above highstart_pfn
+	 * If CPU cannot support HIGHMEM discard any memory above highstart_pfn
 	 */
 	if (cpu_has_dc_aliases) {
-		memblock_remove(PFN_PHYS(highstart_pfn), -1);
+		if (highstart_pfn)
+			memblock_remove(PFN_PHYS(highstart_pfn), -1);
 		return;
 	}
 
-- 
2.43.0


