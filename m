Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556411C25E6
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 15:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgEBNqf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 09:46:35 -0400
Received: from [115.28.160.31] ([115.28.160.31]:46292 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1728034AbgEBNqf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 09:46:35 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F145860161;
        Sat,  2 May 2020 21:39:44 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1588426785; bh=Yn5Z+8DuiLQa/cJoX6ZPjTfvrkeW8daV39JuqCOjncU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LwCFPJa1IQlHNPrUJoiwMwVjqjsrAGXI4Hmf5pPaunBrgQ3YQgqLOROyMZzEkt1zg
         idYNXm3u1jnrRquGh59TYqbBSJhtEoIW+ALTHIC3MBV7N13eQ1JoNLSTdR1SrB9sWe
         OaQVPErj+VfZy97kh1eB4fm1ZG3EgBdHgy9rDuw4=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/4] MIPS: Loongson64: define offsets and known revisions for some CPUCFG features
Date:   Sat,  2 May 2020 21:38:44 +0800
Message-Id: <20200502133846.40590-3-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200502133846.40590-1-git@xen0n.name>
References: <20200502133846.40590-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the constants for easier and maintainable composition of CPUCFG
values.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../asm/mach-loongson64/loongson_regs.h       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
index 3fa94c6ec3b9..8508afffdfd1 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
@@ -67,6 +67,8 @@ static inline u32 read_cpucfg(u32 reg)
 #define LOONGSON_CFG1_SFBP	BIT(29)
 #define LOONGSON_CFG1_CDMAP	BIT(30)
 
+#define LOONGSON_CFG1_FPREV_OFFSET	1
+
 #define LOONGSON_CFG2 0x2
 #define LOONGSON_CFG2_LEXT1	BIT(0)
 #define LOONGSON_CFG2_LEXT2	BIT(1)
@@ -90,6 +92,13 @@ static inline u32 read_cpucfg(u32 reg)
 #define LOONGSON_CFG2_LCSRP	BIT(27)
 #define LOONGSON_CFG2_LDISBLIKELY	BIT(28)
 
+#define LOONGSON_CFG2_LPMREV_OFFSET	9
+#define LOONGSON_CFG2_LPM_REV1		(1 << LOONGSON_CFG2_LPMREV_OFFSET)
+#define LOONGSON_CFG2_LPM_REV2		(2 << LOONGSON_CFG2_LPMREV_OFFSET)
+#define LOONGSON_CFG2_LVZREV_OFFSET	16
+#define LOONGSON_CFG2_LVZ_REV1		(1 << LOONGSON_CFG2_LVZREV_OFFSET)
+#define LOONGSON_CFG2_LVZ_REV2		(2 << LOONGSON_CFG2_LVZREV_OFFSET)
+
 #define LOONGSON_CFG3 0x3
 #define LOONGSON_CFG3_LCAMP	BIT(0)
 #define LOONGSON_CFG3_LCAMREV	GENMASK(3, 1)
@@ -97,6 +106,16 @@ static inline u32 read_cpucfg(u32 reg)
 #define LOONGSON_CFG3_LCAMKW	GENMASK(19, 12)
 #define LOONGSON_CFG3_LCAMVW	GENMASK(27, 20)
 
+#define LOONGSON_CFG3_LCAMREV_OFFSET	1
+#define LOONGSON_CFG3_LCAM_REV1		(1 << LOONGSON_CFG3_LCAMREV_OFFSET)
+#define LOONGSON_CFG3_LCAM_REV2		(2 << LOONGSON_CFG3_LCAMREV_OFFSET)
+#define LOONGSON_CFG3_LCAMNUM_OFFSET	4
+#define LOONGSON_CFG3_LCAMNUM_REV1	(0x3f << LOONGSON_CFG3_LCAMNUM_OFFSET)
+#define LOONGSON_CFG3_LCAMKW_OFFSET	12
+#define LOONGSON_CFG3_LCAMKW_REV1	(0x27 << LOONGSON_CFG3_LCAMKW_OFFSET)
+#define LOONGSON_CFG3_LCAMVW_OFFSET	20
+#define LOONGSON_CFG3_LCAMVW_REV1	(0x3f << LOONGSON_CFG3_LCAMVW_OFFSET)
+
 #define LOONGSON_CFG4 0x4
 #define LOONGSON_CFG4_CCFREQ	GENMASK(31, 0)
 
-- 
2.21.0

