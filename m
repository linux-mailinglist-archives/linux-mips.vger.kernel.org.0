Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBB41E8461
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 19:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgE2RLA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 13:11:00 -0400
Received: from [115.28.160.31] ([115.28.160.31]:54488 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725821AbgE2RK7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 13:10:59 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D9C18600B5;
        Sat, 30 May 2020 01:10:57 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590772258; bh=ASNrwX7HcQNFnmL60IP5kN40LCybxL+sHSIsAtXoOO4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D8CRaCp0ECq0JxH7MUAxChMWY25HhHcV56UP1AwcPOVLBW0T4RWJVa1RnvKFiRKzL
         8xTsZQAvBAWi2ZtjBJz2QDJii5SL6LSWznVdJOX0F+WcrC55ZgLRHBllzUEuFw1bUh
         zSnTWOao6svdt6LLNRUGxPDk2GHim2eWqSMMtZmA=
From:   WANG Xuerui <git@xen0n.name>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 2/2] MIPS: Expose Loongson CPUCFG availability via HWCAP
Date:   Sat, 30 May 2020 01:10:00 +0800
Message-Id: <20200529171000.8905-3-git@xen0n.name>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529171000.8905-1-git@xen0n.name>
References: <20200529171000.8905-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The point is to allow userspace to probe for CPUCFG without possibly
triggering invalid instructions. In addition to that, future Loongson
feature bits could all be stuffed into CPUCFG bit fields (or "leaves"
in x86-speak) if Loongson does not make mistakes, so ELF HWCAP bits are
conserved.

The other existing Loongson-specific HWCAP bits are, to my best
knowledge, unused, as

(1) they are fairly recent additions,
(2) Loongson never back-ported the patch into their kernel fork, and
(3) Loongson's existing installed base rarely upgrade, if ever;

However, they are still considered userspace ABI, hence unfortunately
unremovable. But at least we could stop adding new Loongson HWCAP bits
in the future.

Cc: Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Huacai Chen <chenhc@lemote.com>
Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/mips/include/uapi/asm/hwcap.h | 1 +
 arch/mips/loongson64/cpucfg-emul.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/uapi/asm/hwcap.h b/arch/mips/include/uapi/asm/hwcap.h
index 1ade1daa4921..b7e02bdc1985 100644
--- a/arch/mips/include/uapi/asm/hwcap.h
+++ b/arch/mips/include/uapi/asm/hwcap.h
@@ -17,5 +17,6 @@
 #define HWCAP_LOONGSON_MMI  (1 << 11)
 #define HWCAP_LOONGSON_EXT  (1 << 12)
 #define HWCAP_LOONGSON_EXT2 (1 << 13)
+#define HWCAP_LOONGSON_CPUCFG (1 << 14)
 
 #endif /* _UAPI_ASM_HWCAP_H */
diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
index c16023a13379..ca75f07252df 100644
--- a/arch/mips/loongson64/cpucfg-emul.c
+++ b/arch/mips/loongson64/cpucfg-emul.c
@@ -4,6 +4,7 @@
 #include <linux/types.h>
 #include <asm/cpu.h>
 #include <asm/cpu-info.h>
+#include <asm/elf.h>
 
 #include <loongson_regs.h>
 #include <cpucfg-emul.h>
@@ -128,7 +129,7 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
 
 	/* CPUs with CPUCFG support don't need to synthesize anything. */
 	if (cpu_has_cfg())
-		return;
+		goto have_cpucfg_now;
 
 	c->loongson3_cpucfg_data[0] = 0;
 	c->loongson3_cpucfg_data[1] = 0;
@@ -217,4 +218,10 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
 	patch_cpucfg_sel1(c);
 	patch_cpucfg_sel2(c);
 	patch_cpucfg_sel3(c);
+
+have_cpucfg_now:
+	/* We have usable CPUCFG now, emulated or not.
+	 * Announce CPUCFG availability to userspace via hwcap.
+	 */
+	elf_hwcap |= HWCAP_LOONGSON_CPUCFG;
 }
-- 
2.26.2

