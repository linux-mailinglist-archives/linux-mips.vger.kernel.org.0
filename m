Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449BE1C2B64
	for <lists+linux-mips@lfdr.de>; Sun,  3 May 2020 12:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgECKgz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 06:36:55 -0400
Received: from [115.28.160.31] ([115.28.160.31]:57450 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1727125AbgECKgz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 06:36:55 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id EC7E8600B4;
        Sun,  3 May 2020 18:36:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1588502213; bh=ONRtGOA4myqnZrJLa5c+bfIHlPkdzZQWJl5rHs3mfJA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JDZ75ZXkEHjpcKcdsM7mnSWIm82Wp1wA1Q+xXiopJS54dC0w8xf4H0dtQ4p9s7dx5
         3wHnNiuavKnzScdjx0+f7FQa6NlHoW/ax1ILxd2edMxz+R+LGd42m8ACTtD2W9o1gc
         l9PnPxbrwHQ8wOWWMrv04ZXl8bPCp4GfcaXMN1XQ=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 3/4] MIPS: define more Loongson CP0.Config6 and CP0.Diag feature bits
Date:   Sun,  3 May 2020 18:33:04 +0800
Message-Id: <20200503103304.40678-4-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200502133846.40590-1-git@xen0n.name>
References: <20200502133846.40590-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

These are exposed to userland alternatively via the new CPUCFG
instruction on Loongson-3A R4 and above. Add definitions for readback
on older cores.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mipsregs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 796fe47cfd17..90f843c72774 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -681,6 +681,10 @@
 #define MIPS_CONF6_FTLBDIS	(_ULCAST_(1) << 22)
 /* FTLB probability bits */
 #define MIPS_CONF6_FTLBP_SHIFT	(16)
+/* Loongson-3 feature bits */
+#define MIPS_CONF6_LOONGSON_SCRAND	(_ULCAST_(1) << 17)
+#define MIPS_CONF6_LOONGSON_LLEXC	(_ULCAST_(1) << 16)
+#define MIPS_CONF6_LOONGSON_STFILL	(_ULCAST_(1) << 8)
 
 #define MIPS_CONF7_WII		(_ULCAST_(1) << 31)
 
@@ -997,6 +1001,8 @@
 #define LOONGSON_DIAG_ITLB	(_ULCAST_(1) << 2)
 /* Flush DTLB */
 #define LOONGSON_DIAG_DTLB	(_ULCAST_(1) << 3)
+/* Allow some CACHE instructions (CACHE0, 1, 3, 21 and 23) in user mode */
+#define LOONGSON_DIAG_UCAC	(_ULCAST_(1) << 8)
 /* Flush VTLB */
 #define LOONGSON_DIAG_VTLB	(_ULCAST_(1) << 12)
 /* Flush FTLB */
-- 
2.21.0

