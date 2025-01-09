Return-Path: <linux-mips+bounces-7329-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4720A08287
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 22:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 340A53A6ED1
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 21:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47AB204C35;
	Thu,  9 Jan 2025 21:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D2czicSE"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CDD1FF7DA
	for <linux-mips@vger.kernel.org>; Thu,  9 Jan 2025 21:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736459827; cv=none; b=XMViEtsDPJZWLVJb2oUQhWFef+9pdmbsE8MwHihou01P9wC1YXs7B4VG2JZ8fIwhHBB2a2FQUx8GhcIYCCmiboWJM5VZKtgT5ygZolmDR5DACw5mAFbHXyPtFhR0uhMR25cXh7jywXA2QbtjCqpZrnuhekN8Lal4x93OLY9eK9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736459827; c=relaxed/simple;
	bh=MPoTYYW3aVYVJe1Kfz54kXaWPqSbyqoky5hltKiZRtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YzIqJ9G5wq6x4G1uTvcTRclmGhssuNlsJ23a9wa/W8LQhLhowcOOPptNswYjr5k0riUN0zJQK9TiUu2h0t0r8jMp20xmfIlLAZ6znz53yJJ+x2K0TGgsvCx4nMDseqvevOpQFnT91VpYhIv1lcBXe64xI2B7LMhKiOoLE3oan2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D2czicSE; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736459806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g4xBrhilP04ffqSDin2J9OolRUY1DzLt+vsfdpAQ+7w=;
	b=D2czicSEBCUt3+iOKzrfyJdAlZURJS1dv+o0vh5mLAfMFJ/K8DmEEy2NxQrVUqHgYY0X7y
	9uYDMcsyzz22j7mS7gMFTZAxKa9VVqvIpInzc0JhpfRikJASeDUXykkRohFj0v5aBXGvtJ
	ziRmlpVanz8w14F/RCQggnmc8TANXIc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Huang Pei <huangpei@loongson.cn>,
	Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: traps: Use str_enabled_disabled() in parity_protection_init()
Date: Thu,  9 Jan 2025 22:55:23 +0100
Message-ID: <20250109215524.195008-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Use pr_info() instead of printk(KERN_INFO) to silence multiple
checkpatch warnings.

Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/kernel/traps.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index dc29bd9656b0..1536e9e2d1ef 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -38,6 +38,7 @@
 #include <linux/kdb.h>
 #include <linux/irq.h>
 #include <linux/perf_event.h>
+#include <linux/string_choices.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
@@ -1741,8 +1742,8 @@ static inline __init void parity_protection_init(void)
 		gcr_ectl &= CM_GCR_ERR_CONTROL_L2_ECC_EN;
 		WARN_ON(!!gcr_ectl != l2parity);
 
-		pr_info("Cache parity protection %sabled\n",
-			l1parity ? "en" : "dis");
+		pr_info("Cache parity protection %s\n",
+			str_enabled_disabled(l1parity));
 		return;
 	}
 
@@ -1797,14 +1798,14 @@ static inline __init void parity_protection_init(void)
 			printk(KERN_INFO "Readback ErrCtl register=%08lx\n", errctl);
 
 			if (l1parity_present)
-				printk(KERN_INFO "Cache parity protection %sabled\n",
-				       (errctl & ERRCTL_PE) ? "en" : "dis");
+				pr_info("Cache parity protection %s\n",
+					str_enabled_disabled(errctl & ERRCTL_PE));
 
 			if (l2parity_present) {
 				if (l1parity_present && l1parity)
 					errctl ^= ERRCTL_L2P;
-				printk(KERN_INFO "L2 cache parity protection %sabled\n",
-				       (errctl & ERRCTL_L2P) ? "en" : "dis");
+				pr_info("L2 cache parity protection %s\n",
+					str_enabled_disabled(errctl & ERRCTL_L2P));
 			}
 		}
 		break;
@@ -1815,8 +1816,8 @@ static inline __init void parity_protection_init(void)
 		write_c0_ecc(0x80000000);
 		back_to_back_c0_hazard();
 		/* Set the PE bit (bit 31) in the c0_errctl register. */
-		printk(KERN_INFO "Cache parity protection %sabled\n",
-		       (read_c0_ecc() & 0x80000000) ? "en" : "dis");
+		pr_info("Cache parity protection %s\n",
+			str_enabled_disabled(read_c0_ecc() & 0x80000000));
 		break;
 	case CPU_20KC:
 	case CPU_25KF:
-- 
2.47.1


