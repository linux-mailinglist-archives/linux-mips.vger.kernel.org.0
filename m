Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403682DE8B7
	for <lists+linux-mips@lfdr.de>; Fri, 18 Dec 2020 19:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgLRSF1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Dec 2020 13:05:27 -0500
Received: from mail-m972.mail.163.com ([123.126.97.2]:34908 "EHLO
        mail-m972.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgLRSF1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 18 Dec 2020 13:05:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=S9q13
        h/b+0Tss/SWDAT2DgytS40mX0tTqnVQceDQNoo=; b=JXWC5lhCIz8N6ssqJzGBe
        mcNSrOGOOiVgd5pSpksZV+LEObGvAklke3n0WeJRfNX3lwUEzXQUQKhw52JscsLG
        kbRCmt6ukQznZxA3Dhr2+0v3qcq+gsRPA/BTNC1+31GuGKsy6X5bofcO7M8z3i0K
        GP/arOwhj+TX+qk5V/jJCc=
Received: from JiadeiMac-Pro.lan (unknown [112.65.13.175])
        by smtp2 (Coremail) with SMTP id GtxpCgCHTb7K2NxfurDfFg--.16491S2;
        Sat, 19 Dec 2020 00:28:58 +0800 (CST)
From:   jiaqingtong97@163.com
To:     tsbogend@alpha.franken.de, mark.tomlinson@alliedtelesis.co.nz,
        paulburton@kernel.org, jiaxun.yang@flygoat.com
Cc:     linux-mips@vger.kernel.org, Jia Qingtong <jiaqingtong97@163.com>
Subject: [PATCH] MIPS: OCTEON: Add OCTEON II build and configuration option
Date:   Sat, 19 Dec 2020 00:28:45 +0800
Message-Id: <20201218162845.9317-1-jiaqingtong97@163.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GtxpCgCHTb7K2NxfurDfFg--.16491S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trW3Cw43XFWDZw15ZF1kZrb_yoW8CFWfpa
        n8Cw1kGr48WFyfArZ3CryvgrZ3Gan8KrWa9FyDX34UZ3WY93savrZ7tr98JFyUJwsFya4F
        9r9Ygw15JFyIv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMGQgUUUUU=
X-Originating-IP: [112.65.13.175]
X-CM-SenderInfo: 5mld1xpqjw00rjzxqiywtou0bp/xtbCCxD7b13LeVWkCAACsb
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jia Qingtong <jiaqingtong97@163.com>

If building for OCTEON II only,we can select compiler options that
give better code, but will not run on earlier chips.

Signed-off-by: Jia Qingtong <jiaqingtong97@163.com>
---
 arch/mips/cavium-octeon/Kconfig | 9 +++++++++
 arch/mips/include/asm/sync.h    | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kconfig
index 4984e462be30..3e0759142656 100644
--- a/arch/mips/cavium-octeon/Kconfig
+++ b/arch/mips/cavium-octeon/Kconfig
@@ -1,6 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
 if CPU_CAVIUM_OCTEON
 
+config CAVIUM_OCTEON2
+	bool "Build the kernel to be used only OCTEON II processor cores"
+	default "n"
+	help
+		This option enables the generation of Octeon2 specific
+		instructions by the compiler, resulting in a kernel that is
+		more efficient, but that will not run on Octeon and
+		OcteonPlus processor cores.
+
 config CAVIUM_CN63XXP1
 	bool "Enable CN63XXP1 errata workarounds"
 	default "n"
diff --git a/arch/mips/include/asm/sync.h b/arch/mips/include/asm/sync.h
index aabd097933fe..fda181c16c5f 100644
--- a/arch/mips/include/asm/sync.h
+++ b/arch/mips/include/asm/sync.h
@@ -155,10 +155,11 @@
  * effective barrier as noted by commit 6b07d38aaa52 ("MIPS: Octeon: Use
  * optimized memory barrier primitives."). Here we specify that the affected
  * sync instructions should be emitted twice.
+ * Cavium OcteonII and later CPUs has fixed above bug.
  * Note that this expression is evaluated by the assembler (not the compiler),
  * and that the assembler evaluates '==' as 0 or -1, not 0 or 1.
  */
-#ifdef CONFIG_CPU_CAVIUM_OCTEON
+#if defined CONFIG_CPU_CAVIUM_OCTEON && !defined CONFIG_CAVIUM_OCTEON2
 # define __SYNC_rpt(type)	(1 - (type == __SYNC_wmb))
 #else
 # define __SYNC_rpt(type)	1
-- 
2.28.0

