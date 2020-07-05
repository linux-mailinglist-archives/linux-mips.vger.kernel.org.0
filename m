Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E318214E0A
	for <lists+linux-mips@lfdr.de>; Sun,  5 Jul 2020 18:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgGEQvt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Jul 2020 12:51:49 -0400
Received: from [115.28.160.31] ([115.28.160.31]:46966 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726956AbgGEQvt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Jul 2020 12:51:49 -0400
Received: from ld50.lan (unknown [112.65.61.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7BBE760132;
        Mon,  6 Jul 2020 00:51:44 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1593967904; bh=CDfZZtTdS2hrpuKPB0TxgEgBr0Zwd//Fhga1A8gsa+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u+0Ds6SFe6dtZR4lleNOTxFpAkIjnmg/XIY95LDQWoGYQnYyFVGJQ9ThFuxpNYRO2
         2fN4NCsqxnxBG30jCUSzqwNAXy2GgH+XuF8o6E1gOsFwdtXHtx64/jmXb31N+gpLPh
         ZSqo4mYmoI/ypScVZ8hmWeW3GilGRXwaVmzyXydk=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 2/3] MIPS: add definitions for Loongson-specific CP0.Diag1 register
Date:   Mon,  6 Jul 2020 00:50:49 +0800
Message-Id: <20200705165050.2078964-3-git@xen0n.name>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200705165050.2078964-1-git@xen0n.name>
References: <20200705165050.2078964-1-git@xen0n.name>
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
index 20d6d40c59a4..513b1a054588 100644
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

