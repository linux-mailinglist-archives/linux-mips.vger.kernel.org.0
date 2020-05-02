Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A701C25E7
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 15:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgEBNqg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 09:46:36 -0400
Received: from [115.28.160.31] ([115.28.160.31]:46286 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1728035AbgEBNqg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 09:46:36 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id BAB6960151;
        Sat,  2 May 2020 21:39:38 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1588426778; bh=tdKpBplNifWvkN5UuS6tT7yzWztyZrnQ2NydynI/6OM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bLT1/AAsgI/y2nzzB85L0bxrE34qh0M2RdvSb6XaDNLQOpvsunay7zNUKlSqUiDns
         xzR8giY3cp54R+eIrIjHMmSOBjvVvhTQNtQqztGWUqSkNxESe73WBygKRFAPeFr6Pm
         fcj+mbFb+Uwmp4nUUoMnV2STvPtmmZ6ilPF8yes0=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/4] MIPS: Loongson64: fix typos in loongson_regs.h
Date:   Sat,  2 May 2020 21:38:43 +0800
Message-Id: <20200502133846.40590-2-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200502133846.40590-1-git@xen0n.name>
References: <20200502133846.40590-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix some symbol names to align with Loongson's User Manual wording. Also
correct the comment in csr_readq() suggesting the wrong instruction in
use.

Fixes: 6a6f9b7dafd50efc ("MIPS: Loongson: Add CFUCFG&CSR support")
Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mach-loongson64/loongson_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
index 363a47a5d26e..3fa94c6ec3b9 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
@@ -77,12 +77,12 @@ static inline u32 read_cpucfg(u32 reg)
 #define LOONGSON_CFG2_LBT3	BIT(6)
 #define LOONGSON_CFG2_LBTMMU	BIT(7)
 #define LOONGSON_CFG2_LPMP	BIT(8)
-#define LOONGSON_CFG2_LPMPREV	GENMASK(11, 9)
+#define LOONGSON_CFG2_LPMREV	GENMASK(11, 9)
 #define LOONGSON_CFG2_LAMO	BIT(12)
 #define LOONGSON_CFG2_LPIXU	BIT(13)
 #define LOONGSON_CFG2_LPIXUN	BIT(14)
-#define LOONGSON_CFG2_LZVP	BIT(15)
-#define LOONGSON_CFG2_LZVREV	GENMASK(18, 16)
+#define LOONGSON_CFG2_LVZP	BIT(15)
+#define LOONGSON_CFG2_LVZREV	GENMASK(18, 16)
 #define LOONGSON_CFG2_LGFTP	BIT(19)
 #define LOONGSON_CFG2_LGFTPREV	GENMASK(22, 20)
 #define LOONGSON_CFG2_LLFTP	BIT(23)
@@ -139,7 +139,7 @@ static inline u64 csr_readq(u32 reg)
 {
 	u64 __res;
 
-	/* DWRCSR reg, val */
+	/* DRDCSR reg, val */
 	__asm__ __volatile__(
 		"parse_r __res,%0\n\t"
 		"parse_r reg,%1\n\t"
-- 
2.21.0

