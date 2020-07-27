Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E6022F5CE
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jul 2020 18:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729416AbgG0QvW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Jul 2020 12:51:22 -0400
Received: from [115.28.160.31] ([115.28.160.31]:48640 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1728642AbgG0QvV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Jul 2020 12:51:21 -0400
Received: from ld50.lan (unknown [112.64.68.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 1555D60161;
        Tue, 28 Jul 2020 00:51:18 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1595868678; bh=YKM4pWUr/TTnRrD58Tu3PqhbSybuMCXBZ5kx9+rb3yU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lgh873vpv5yM+vZHCc1Ryrj507cW9LBO57qOpDyeOPUaadg5+Ddj9F4WgFijhI25J
         gtQcxMqtlyoRYBHoJw2hZSHN9IHNguJQytUQrdLY4Dd+4BDf4k/jBx0Lh0M917N46A
         Zrj6cizjeewNdOz3eINQX4EpcMAF214mEIBF1I4M=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v3 2/3] MIPS: add definitions for Loongson-specific CP0.Diag1 register
Date:   Tue, 28 Jul 2020 00:51:07 +0800
Message-Id: <20200727165108.2378227-3-git@xen0n.name>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727165108.2378227-1-git@xen0n.name>
References: <20200727165108.2378227-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This register is named GSCause in Loongson manuals. It carries Loongson
extended exception information.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/mipsregs.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 11094d857b92..5ba268266d16 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -86,6 +86,7 @@
 #define CP0_XCONTEXT $20
 #define CP0_FRAMEMASK $21
 #define CP0_DIAGNOSTIC $22
+#define CP0_DIAGNOSTIC1 $22, 1
 #define CP0_DEBUG $23
 #define CP0_DEPC $24
 #define CP0_PERFORMANCE $25
@@ -1051,6 +1052,13 @@
 /* Flush FTLB */
 #define LOONGSON_DIAG_FTLB	(_ULCAST_(1) << 13)
 
+/*
+ * Diag1 (GSCause in Loongson-speak) fields
+ */
+/* Loongson-specific exception code (GSExcCode) */
+#define LOONGSON_DIAG1_EXCCODE_SHIFT	2
+#define LOONGSON_DIAG1_EXCCODE		GENMASK(6, 2)
+
 /* CvmCtl register field definitions */
 #define CVMCTL_IPPCI_SHIFT	7
 #define CVMCTL_IPPCI		(_U64CAST_(0x7) << CVMCTL_IPPCI_SHIFT)
-- 
2.25.1

