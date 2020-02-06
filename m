Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD740154C4A
	for <lists+linux-mips@lfdr.de>; Thu,  6 Feb 2020 20:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbgBFTap (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Feb 2020 14:30:45 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51650 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgBFTao (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Feb 2020 14:30:44 -0500
Received: by mail-wm1-f65.google.com with SMTP id t23so15510wmi.1;
        Thu, 06 Feb 2020 11:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WVXxvdnecOHHPSMEpYhU98LOQNanSGQy7dqix/yCj14=;
        b=rld0aMEN8ENxF6NsO4UBquyzfTqkVnCfO4ttYXcOnQTIiZ2T5BaetOtb+iUxm/digi
         GwXCxFCbf5j7C0+xHtVjg/+qN5LphmxCz9rsPcbNeGphW/jgXiPcz7/K3138J67nxkND
         EIuIdsyJlk+291aRA0ZRZ/5N9If1Qn61r1QrWBc3V4pDnKy8msHD7ha2d/bAk+c4bfho
         hXyIwWkkpmAKSbwU4S4ijV78TN4d5cq0w4L39UqKbj974eX5quRRnA9eRK0H0TNqIBj1
         N2Zusf3OCJYB9fL/YJ7cLFTCgkHzuRC70YInw8O98N6xfPJ+D+NAJ8adRhFlQi2RexSC
         rx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WVXxvdnecOHHPSMEpYhU98LOQNanSGQy7dqix/yCj14=;
        b=eeWhAat/dpLT/+wGeFAI6n2hh7LgtJwtYkqNN+i4hE9qz4AcdKEjZsBbazPpMYH9sG
         9Vi4cmZhpuJT2gWjo/JSY3IedGGCzy08okzLp3mGSdjJWw42ApKQ0F7aS7/7GgNDuukp
         wyl4Y+of0RTIwe50yKyj/qxLu70C1B9DuSGTO5Ejz7ReJI1HmnWFKgdJCOVqAxZdzCAf
         XG7yUh7M1ewILbuZdxTj9ha95MfIbsMjwmEvPl1ZeplEyhi4Aoot4vCbF91smeYsn2EG
         jH3IKyZkZLA/l5s18oqgzIRkA1Jpgmt/HnQdJf4+GGEs1KnZjQYwFnbvAr2op9yIt5Rl
         Wnrw==
X-Gm-Message-State: APjAAAXpdyh8su4xSnewyiJoQ3yvzg+mTu5OEtuteffwSeOQHPh78V3J
        VzQgQ9uG8VQaMlLHH4kDgxmPb8fImAI=
X-Google-Smtp-Source: APXvYqyUtf3IIJnos/BEz0mLtu3pt+RIDgoWIXskDhqxOOYrmnTSVr7eGt0o8sCfa5DWMJh0NB1Jvg==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr3249087wrs.365.1581017442402;
        Thu, 06 Feb 2020 11:30:42 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id b128sm537014wmb.25.2020.02.06.11.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 11:30:41 -0800 (PST)
From:   Kamal Dasu <kdasu.kdev@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH] MIPS: c-r4k: Invalidate BMIPS5000 ZSCM prefetch lines
Date:   Thu,  6 Feb 2020 14:30:37 -0500
Message-Id: <20200206193037.32041-1-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Zephyr secondary cache is 256KB, 128B lines. 32B sectors. A secondary cache
line can contain two instruction cache lines (64B), or four data cache
lines (32B). Hardware prefetch Cache detects stream access, and prefetches
ahead of processor access. Add support to inavalidate BMIPS5000 cpu zephyr
secondary cache module (ZSCM) on DMA from device so that data returned is
coherent during DMA read operations.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 arch/mips/mm/c-r4k.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5f3d0103b95d..2d8892ba68ab 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -901,6 +901,35 @@ static void r4k_dma_cache_wback_inv(unsigned long addr, unsigned long size)
 	__sync();
 }
 
+static void prefetch_cache_inv(unsigned long addr, unsigned long size)
+{
+	unsigned int linesz = cpu_scache_line_size();
+	unsigned long addr0 = addr, addr1;
+	int cpu_type = current_cpu_type();
+
+	if (cpu_type == CPU_BMIPS5000) {
+		/* invalidate zephyr secondary cache module prefetch lines */
+		addr0 &= ~(linesz - 1);
+		addr1 = (addr0 + size - 1) & ~(linesz - 1);
+
+		protected_writeback_scache_line(addr0);
+		if (likely(addr1 != addr0))
+			protected_writeback_scache_line(addr1);
+		else
+			return;
+
+		addr0 += linesz;
+		if (likely(addr1 != addr0))
+			protected_writeback_scache_line(addr0);
+		else
+			return;
+
+		addr1 -= linesz;
+		if (likely(addr1 > addr0))
+			protected_writeback_scache_line(addr0);
+	}
+}
+
 static void r4k_dma_cache_inv(unsigned long addr, unsigned long size)
 {
 	/* Catch bad driver code */
@@ -908,6 +937,7 @@ static void r4k_dma_cache_inv(unsigned long addr, unsigned long size)
 		return;
 
 	preempt_disable();
+	prefetch_cache_inv(addr, size);
 	if (cpu_has_inclusive_pcaches) {
 		if (size >= scache_size) {
 			if (current_cpu_type() != CPU_LOONGSON64)
-- 
2.17.1

