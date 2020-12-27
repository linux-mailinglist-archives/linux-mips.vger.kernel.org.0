Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E8C2E3230
	for <lists+linux-mips@lfdr.de>; Sun, 27 Dec 2020 18:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgL0Res (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Dec 2020 12:34:48 -0500
Received: from mail-m971.mail.163.com ([123.126.97.1]:52324 "EHLO
        mail-m971.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbgL0Rer (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 27 Dec 2020 12:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=9UBbU
        UXlO3sE92vjyKPWDgov2Z/zk5/Sljqb/Cc2CYs=; b=gowCZMtaoFW8tr9uccXd2
        l4rcAvWq0O0wUL2eROnaYZS2JnhVMj1vbr5NwkTMfYTSRXLs8ZHtOIeW2vsGetmz
        b2WFah4Lid1g+7P7WdAyUmFXyx816NqATUEukxKVGLKZkDwmeJpGxo7E6TGg3M3b
        ugoXjBOuE9wZga4e76wB6U=
Received: from JiadeiMac-Pro.lan (unknown [112.64.60.201])
        by smtp1 (Coremail) with SMTP id GdxpCgD3MCjKoOhfoDD_Ag--.52426S2;
        Sun, 27 Dec 2020 22:57:15 +0800 (CST)
From:   jiaqingtong97@163.com
To:     tsbogend@alpha.franken.de, mark.tomlinson@alliedtelesis.co.nz,
        paulburton@kernel.org, jiaxun.yang@flygoat.com
Cc:     linux-mips@vger.kernel.org, Jia Qingtong <jiaqingtong97@163.com>
Subject: [PATCH v2] MIPS: OCTEON: Add WAR_OCTEON_BARRIER workaround config
Date:   Sun, 27 Dec 2020 22:56:51 +0800
Message-Id: <20201227145651.4513-1-jiaqingtong97@163.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201219153957.GB5012@alpha.franken.de>
References: <20201219153957.GB5012@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GdxpCgD3MCjKoOhfoDD_Ag--.52426S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4ftw1kWw1fWF1DJw4DCFg_yoW8AF1kpa
        yqkw4kGr4kWFyfJ39xC3s7W3s3Jan5Grya9Fyj9r1jq3W5uasrZrZ3tr98t348Ww4DAayr
        uF93W3WUJFn7AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jP9N3UUUUU=
X-Originating-IP: [112.64.60.201]
X-CM-SenderInfo: 5mld1xpqjw00rjzxqiywtou0bp/1tbiKAsIb17WDo2-4QAAsR
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jia Qingtong <jiaqingtong97@163.com>

Some Cavium Octeon CPUs(Octeon & Octeon Plus) suffer from a bug that
causes a single wmb ordering barrier to be ineffective, requiring
the use of 2 in sequence to provide an effective barrier.
This patch make workaroud as a config for CPUs who didn't suffer
from that bug.

Signed-off-by: Jia Qingtong <jiaqingtong97@163.com>
---
 arch/mips/cavium-octeon/Kconfig | 9 +++++++++
 arch/mips/include/asm/sync.h    | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kconfig
index 4984e462be30..0dc910683df9 100644
--- a/arch/mips/cavium-octeon/Kconfig
+++ b/arch/mips/cavium-octeon/Kconfig
@@ -1,6 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
 if CPU_CAVIUM_OCTEON
 
+config WAR_OCTEON_BARRIER
+	bool "Enable Octeon & Octeon Plus barrier workaround"
+	default "y"
+	help
+	  Some Cavium Octeon CPUs(Octeon & Octeon Plus)
+	  suffer from a bug that causes a single wmb ordering barrier
+	  to be ineffective, requiring the use of 2 in sequence
+	  to provide an effective barrier.
+
 config CAVIUM_CN63XXP1
 	bool "Enable CN63XXP1 errata workarounds"
 	default "n"
diff --git a/arch/mips/include/asm/sync.h b/arch/mips/include/asm/sync.h
index aabd097933fe..b24a2f82ef19 100644
--- a/arch/mips/include/asm/sync.h
+++ b/arch/mips/include/asm/sync.h
@@ -158,7 +158,7 @@
  * Note that this expression is evaluated by the assembler (not the compiler),
  * and that the assembler evaluates '==' as 0 or -1, not 0 or 1.
  */
-#ifdef CONFIG_CPU_CAVIUM_OCTEON
+#ifdef CONFIG_WAR_OCTEON_BARRIER
 # define __SYNC_rpt(type)	(1 - (type == __SYNC_wmb))
 #else
 # define __SYNC_rpt(type)	1
-- 
2.28.0

