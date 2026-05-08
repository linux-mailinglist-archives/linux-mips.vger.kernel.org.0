Return-Path: <linux-mips+bounces-14517-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fGGqFEJm/WlhdQAAu9opvQ
	(envelope-from <linux-mips+bounces-14517-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 08 May 2026 06:27:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E04F1848
	for <lists+linux-mips@lfdr.de>; Fri, 08 May 2026 06:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B17703038D36
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2026 04:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315B532D0FC;
	Fri,  8 May 2026 04:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ej8qc55X"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB690256C6C
	for <linux-mips@vger.kernel.org>; Fri,  8 May 2026 04:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778214464; cv=none; b=ssyDSYOAVhxl2ZOwyqpvN5Kl2LMZsxLOADhZN+ndSNRhcggNva+f3RRIwJlRMF9M4iC+Z9RpdiD/T3oqdxw39gLNYwVdDIlEg+lNtT+Cqc2s8HzHQmIVsHQiqhRLgAPpg88x1kbc4BgkAe3u9Yx2Cj18hfKqNkFgrkFCMEZzSGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778214464; c=relaxed/simple;
	bh=dRgBASCjUNx5SN5LsIkj+KaJ7VaMCYSxWIQfS1ykmAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKDrm8FIX2rSV7z+296Wk2IFiJOdHR3aPbal4rQIcKAyDWd6VZQK8/iKtH9CsspYbfEDLWPly3/nYHEjdO2qrnh40E2aqZJamI9osoCCxuAd68Iqq3icHTikwLt/hafpQN2gQD1LDY7jfmyJDK84E+y5IHMG5C3DPGvL/yhNoNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ej8qc55X; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b45cb89f7eso10409525ad.0
        for <linux-mips@vger.kernel.org>; Thu, 07 May 2026 21:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778214462; x=1778819262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8dG7m6dGz7quI2IVG777qTbZeQGQjj17FebKN4BjmE=;
        b=Ej8qc55X8d+vKtYb1UQei9ZwJdEENMsUE1uKlDNrVnHvcLxZuEMl4pOYi6z475g56c
         awLnyj6kcVacRTdhHta9D0Ruvyqzu/aPcgVyYhJNPMqkZJsK9GocJJyL0X9UNUqSZ3cl
         PTypXnMO3dilVr1w4xlY69WVxvYzxQfuw4Se3NHlkZHTZvwps10prZfcItst9Qwke6oc
         LSnZHgz90X/I+z5zQzyrFVnDNV37p414VFLQIGPi+vTynb2tQ0sZFRoXKbUJbeUPoo21
         58If/KSryYSyQd1OsN9G8LcKTGyrloTikHGATNYroCKHJL0LgiRp8WKPH7n7CTWp45nt
         cJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778214462; x=1778819262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8dG7m6dGz7quI2IVG777qTbZeQGQjj17FebKN4BjmE=;
        b=jQALYhyyJ/rXySqYgmjS2WHKWmtdaU9ZDwEwsxTIz+wOyFM/Ba5l9HyOGQz6iVjwEt
         oUjX7WeVwf6mxvYqbwzFfN3zPIeYzC91fY69R5nHOD8MyB9s+odcdFFSENYbEu474fU7
         sEkfRGWYbSvsokk4ETI/4YLGX+/Cci4tjMEg7MuT09xirlsbjqSYKVcyZr3ly3tuw68D
         0v8FBiGH4NhDxKhs0tcx1MSSovRhc3Arm32WvCWnToRWKMFasRWRcnMoFGwqCig/hL2l
         bM/cPF+y51aqOrl3NZK6cbJINNQq76vKtS5OmSKHjZma11wVLxFnHcSBLtURS5BLohvT
         XE8g==
X-Gm-Message-State: AOJu0Yx2oMKuwoaFKwRygsmXc+DddutuGRO0C71S1NslnMWzy4PTBWXb
	Bz98/rRv0fXTbSW507yAz93AuucCG2Z9u+Un2AmbHRzAEZWQsd+qBVgGWJqsRczB
X-Gm-Gg: Acq92OFsUd3jODrykKvD6xo0E9GkSprhHYYG4V/aRNL2CIzcmjR+7nbEfwGrwds0LTl
	CPfvYt8ql99rV0Ft9492qIqaUFXuHq2Idk8VN9DXnz42HU6GmmxD+K6sAe0AzpCvXArnxPzHZxY
	g5Yw4kxb/zB+dbcjSnjKqwVlPuaiYxR1pGn1q96FeWIVlRQcCzS+QKRxGpOYARZKksz4BXiKT4G
	UKE49J9idZNyfCm+gXITZPw1ElnKHLOA9HVbDVv2bTB/vSJMBQUOVCP8/0TdacCc/fyUpVOegJm
	76JZ5hTBCJZbM1HY/9TQGZUf03Pbk8uMvhodVBqg+0gsmiVHNSbx8DLlj9OJ3grCnKIe/a4eOmy
	z4yx5AFY9NLTBKlNLGklQIfn4j+XvNGlUPq9TjhttCEALwa0xxRFi8H0SuKPGteLhw4bWPX2UDz
	Uwng+TD0ySMTm/p2CETPzYjS4qdizUIGtxjcnKD3yOr9n38Pma8rSHf16c7OsSnJTw56BGX6GdY
	XH5fsmi2sXrMxIQhgRZdRDVL7a1Zj9oclB+ikDE2KcraQ==
X-Received: by 2002:a17:902:e54e:b0:2ba:4eee:6c1e with SMTP id d9443c01a7336-2ba78e40c8fmr113612765ad.15.1778214461560;
        Thu, 07 May 2026 21:27:41 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eac3afsm5346695ad.71.2026.05.07.21.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:27:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] mips: ralink: mt7621: add missing __iomem
Date: Thu,  7 May 2026 21:27:24 -0700
Message-ID: <20260508042724.1719688-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BC0E04F1848
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[phrozen.org,gmail.com,alpha.franken.de,collabora.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14517-lists,linux-mips=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action

raw_readl and writel calls expect pointers annotated with __iomem.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild/202211060456.cnV6IK6G-lkp@intel.com/
Fixes: cc19db8b312a ("MIPS: ralink: mt7621: do memory detection on KSEG1")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ralink/mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index a4bdda8541c0..ae7b8cfedd5f 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -63,7 +63,7 @@ phys_addr_t mips_cpc_default_phys_base(void)
 
 static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
 {
-	void *dm = (void *)KSEG1ADDR(&detect_magic);
+	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
 
 	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
 		return true;
-- 
2.54.0


