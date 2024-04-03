Return-Path: <linux-mips+bounces-2579-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 249AA897AA5
	for <lists+linux-mips@lfdr.de>; Wed,  3 Apr 2024 23:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8A3E1F23C90
	for <lists+linux-mips@lfdr.de>; Wed,  3 Apr 2024 21:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42408156640;
	Wed,  3 Apr 2024 21:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ktc2F9up"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D69154C03;
	Wed,  3 Apr 2024 21:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712179600; cv=none; b=quaZA7XRxJRW/JBSK389xRHLCNOusG5cYlRz16jXVHrurRcpyPvI+BIIUZioRnkSagvERxu6NfX1+aHaGrDpjBgdaj58nbErpa3gu2b2O9HGzbniOzJoFrwFlKIqwivhZLd3lpTdOJdJSioxsP8HfmMDjYyY41CL+PszzrMG1Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712179600; c=relaxed/simple;
	bh=kJE+lfdH+I/Zdzhe3po1uIOJn2JpkwG6xhHLBNDZ5dA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r3WduC3nkk4/E3Cn0UNyIrTz4EURRXIGZHVNcjraSeqWYO830q0DxUHa0+AWvRURYCJkEPl9fFazrdzhWa8MybwZWk7VVqO/L/oDnwCSLnlRC3aDphejONJ+D39hONvtO+1ur6mJe/eMAb4as9G+po18lO//4HFpl5mB9dGG5Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ktc2F9up; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8DAC433C7;
	Wed,  3 Apr 2024 21:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712179599;
	bh=kJE+lfdH+I/Zdzhe3po1uIOJn2JpkwG6xhHLBNDZ5dA=;
	h=From:Date:Subject:To:Cc:From;
	b=Ktc2F9upSHLYJeJBJNHTOnUusHoxtK47LjzSsOYnKfz+Qsa85rSAD88zEaFDsypRk
	 us2jhXnYu7LYyWBgNuV6QD3TTVvpuPxSp4QAufjTVuAF5fVRFVI9kSmVUK5xPVVF2A
	 fM9piB+FjZhUehw1koZF6tYQ57QyZbjE9mX1ny41BBHa4oVVcyyJEBNE3MUFasW+dF
	 Xrh4GxfZQy4nUYT8w3FWVeWKdXWjuh5+toyRaYDXHC5Z/1xek7xy1u0jTyq52TfpUs
	 0q/gfS439vzgQctyZGMT5uQpCCCexawI1093iT7UroMnaTnUgf1ihLcerBigU3T0xC
	 GnrySdKdnjxXg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 03 Apr 2024 14:26:33 -0700
Subject: [PATCH] MIPS: Add prototypes for plat_post_relocation() and
 relocate_kernel()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-mips-kaslr-missing-prototypes-v1-1-26b2390c1b7a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIjJDWYC/x3MSwqFMAxA0a1IxgZaPyBuRRz4STWobUlEFHHvr
 7zZPZP7gpIwKbTZC0IXKwefYPMMpnXwCyHPyVCYojKVKfHgqLgNuktKVfYLRglnOJ9IiqOtp9E
 1TW1LB+kRhRzf/3/Xf98PQpSEnW8AAAA=
To: tsbogend@alpha.franken.de
Cc: arnd@arndb.de, nathan@kernel.org, linux-mips@vger.kernel.org, 
 patches@lists.linux.dev
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=nathan@kernel.org;
 h=from:subject:message-id; bh=kJE+lfdH+I/Zdzhe3po1uIOJn2JpkwG6xhHLBNDZ5dA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGm8J/vPLO/X/6l7fI2P1O6CzZ9stp1idLt76szlpdtsP
 /HEWaS7dpSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJrKln+Key+pHAbDWpuA1f
 407dOrlMcLVT1OojVWyO/890X74jZ3KMkeFBHOc2i4+Kal6b159e+/OF2sKCjm1SPxn+2mcr/Mz
 ZbMcNAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building malta_defconfig with CONFIG_RELOCATABLE=y, there are two
warnings due to missing prototypes for functions only used when that
configuration is enabled:

  arch/mips/kernel/relocate.c:42:12: warning: no previous prototype for 'plat_post_relocation' [-Wmissing-prototypes]
     42 | int __weak plat_post_relocation(long offset)
        |            ^~~~~~~~~~~~~~~~~~~~
  arch/mips/kernel/relocate.c:324:14: warning: no previous prototype for 'relocate_kernel' [-Wmissing-prototypes]
    324 | void *__init relocate_kernel(void)
        |              ^~~~~~~~~~~~~~~

While relocate_kernel() is only called from assembly, it makes sense to
keep the prototypes together in C to fix the warnings. Add them to
silence the warnings.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/mips/include/asm/setup.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/setup.h b/arch/mips/include/asm/setup.h
index 4dce41138bad..d8077136372c 100644
--- a/arch/mips/include/asm/setup.h
+++ b/arch/mips/include/asm/setup.h
@@ -2,6 +2,7 @@
 #ifndef _MIPS_SETUP_H
 #define _MIPS_SETUP_H
 
+#include <linux/init.h>
 #include <linux/types.h>
 #include <uapi/asm/setup.h>
 
@@ -29,4 +30,9 @@ extern void per_cpu_trap_init(bool);
 extern void cpu_cache_init(void);
 extern void tlb_init(void);
 
+#ifdef CONFIG_RELOCATABLE
+extern void * __init relocate_kernel(void);
+extern int plat_post_relocation(long);
+#endif
+
 #endif /* __SETUP_H */

---
base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
change-id: 20240403-mips-kaslr-missing-prototypes-b15cbf88513f

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


