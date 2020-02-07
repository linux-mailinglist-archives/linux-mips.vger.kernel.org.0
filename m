Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE38156138
	for <lists+linux-mips@lfdr.de>; Fri,  7 Feb 2020 23:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgBGWdc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Feb 2020 17:33:32 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37028 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbgBGWdc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Feb 2020 17:33:32 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so4455987wmf.2;
        Fri, 07 Feb 2020 14:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HYbNrbDezqfZF1wBFeFzFf02ySDPoWlJvHUKWTn+phw=;
        b=tbOaSbGh0ynTwyw1vsxp8nLGrfui+dYqHpRXSFX1thwZ+sDHqEilc3czu+ZF2pjuT+
         oZXVc02YPp8Mi57uvk2krTmjM800hZom+dCL2mc2LBULcVtK2O3sUsKQS7siO+IQdmFP
         +OyX1LQb7f3nP3fPz8Rmciif1Z5HXhXXzFj32xHjmjJZmdDdrweX4t5xAg2Fp15GtBh+
         sE/3qH6b8YWzKErFpNbf2S9slB5ewSa1hdYlGSVd0q//1JVQ19ZYjGyPZc/yjLLMtigi
         NJTC8nau26pAVA40OmnqO51RzTupvomBX90Y67l7WF4uxcba5BR5xmIi4uhW2wYyTdFQ
         wYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HYbNrbDezqfZF1wBFeFzFf02ySDPoWlJvHUKWTn+phw=;
        b=lNF1pisT2pEjf1USUQdnkMqgRG/poG8o6NwYGPMNs7k71BBN1JQeNnN9djLmyuEAmh
         R3mF0c9saoiXqowMXQEnMhc9YX3+3lSHIY9hHuCjhFmYCFD/z4OzVzNI12Fm/Ue0z8rz
         xPny2Nn6B73XF8EURDEVDpDG9vsBr/N4QAb7bpGFIfp302RkVUMkGyhAX3gSYE0YSKb/
         lXtTj+mmiVT4+hX13dM56t+m/EJ5JBMR5FcdSz8iXAJnwwk6Y0xsEkptWPfRbPgZnT56
         9Li+SyPVG5CssC5sxS0ihhw31yhDWXnT6MtdC6X0G9VLe208EqkYxv98dinhgXmGgjXt
         AM0g==
X-Gm-Message-State: APjAAAUq7sAd4RY/knTiBYJIB5qLOavfaqn0g9ttd4u6gucOT2KZCUu0
        1BWRlRo9Gt+bw37/bC3tEjIUdxAE3+c=
X-Google-Smtp-Source: APXvYqwXJtsVM5eIvPXfOPtyIG1mmrkUNZKlLYckb+aqK2BYuKt3/KGXL/Kqhoc+7u/BYxPqg8+8UQ==
X-Received: by 2002:a1c:4c8:: with SMTP id 191mr451359wme.148.1581114808401;
        Fri, 07 Feb 2020 14:33:28 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id w15sm5170024wrs.80.2020.02.07.14.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 14:33:27 -0800 (PST)
From:   Kamal Dasu <kdasu.kdev@gmail.com>
To:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: c-r4k: Invalidate BMIPS5000 ZSCM prefetch lines
Date:   Fri,  7 Feb 2020 17:33:07 -0500
Message-Id: <20200207223324.46011-1-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Zephyr secondary cache is 256KB, 128B lines. 32B sectors. A secondary cache
line can contain two instruction cache lines (64B), or four data cache
lines (32B). Hardware prefetch Cache detects stream access, and prefetches
ahead of processor access. Add support to invalidate BMIPS5000 cpu zephyr
secondary cache module (ZSCM) on DMA from device so that data returned is
coherent during DMA read operations.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 arch/mips/mm/c-r4k.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5f3d0103b95d..acd9ef383e97 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -901,6 +901,31 @@ static void r4k_dma_cache_wback_inv(unsigned long addr, unsigned long size)
 	__sync();
 }
 
+static void prefetch_cache_inv(unsigned long addr, unsigned long size)
+{
+	unsigned int linesz = cpu_scache_line_size();
+	unsigned long addr0 = addr, addr1;
+
+	addr0 &= ~(linesz - 1);
+	addr1 = (addr0 + size - 1) & ~(linesz - 1);
+
+	protected_writeback_scache_line(addr0);
+	if (likely(addr1 != addr0))
+		protected_writeback_scache_line(addr1);
+	else
+		return;
+
+	addr0 += linesz;
+	if (likely(addr1 != addr0))
+		protected_writeback_scache_line(addr0);
+	else
+		return;
+
+	addr1 -= linesz;
+	if (likely(addr1 > addr0))
+		protected_writeback_scache_line(addr0);
+}
+
 static void r4k_dma_cache_inv(unsigned long addr, unsigned long size)
 {
 	/* Catch bad driver code */
@@ -908,6 +933,10 @@ static void r4k_dma_cache_inv(unsigned long addr, unsigned long size)
 		return;
 
 	preempt_disable();
+
+	if (current_cpu_type() == CPU_BMIPS5000)
+		prefetch_cache_inv(addr, size);
+
 	if (cpu_has_inclusive_pcaches) {
 		if (size >= scache_size) {
 			if (current_cpu_type() != CPU_LOONGSON64)
-- 
2.17.1

