Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F5DA4A0F
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbfIAPpj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:45:39 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:8839 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbfIAPpj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:45:39 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 925D93F9E2
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:36:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7FIUlIm4-6mT for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:36:57 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 91AF73F9CE
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:36:57 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:36:57 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 003/120] MIPS: R5900: Sign-extend o32 system call registers
Message-ID: <2a8a082cea486293c0f1f64356e3cb9cd55ef869.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The R5900 has 64-bit instructions but does not implement CP0.Status.UX
so a 32-bit kernel cannot assume o32 registers are sign-extended[1].

CP0.Status.{UX,SX,KX} are read-only and always read as zero.

CP0.Status.PX (bit 23) is called CP0.Status.DEV and controls the
location of performance counter and debug/SIO exception vectors.

In other MIPS ISA implementations, attempting to execute 64-bit
operations in 32-bit user or supervisor mode may cause the reserved
instruction exception. In the Emotion Engine core, however, 64-bit
operations are always valid, regardless of the operation mode[2].

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. 4-16, https://wiki.qemu.org/File:C790.pdf

[2] "EE Core User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    p. 107.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/kernel/scall32-o32.S | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/mips/kernel/scall32-o32.S b/arch/mips/kernel/scall32-o32.S
index d9434cd0f568..b5ad6798978c 100644
--- a/arch/mips/kernel/scall32-o32.S
+++ b/arch/mips/kernel/scall32-o32.S
@@ -25,6 +25,18 @@
 	.align	5
 NESTED(handle_sys, PT_SIZE, sp)
 	.set	noat
+#ifdef CONFIG_CPU_R5900
+	/*
+	 * We don't want to stumble over broken sign extensions from
+	 * userland. O32 does never use the upper half, but since the
+	 * R5900 does not implement CP0.Status.UX it cannot enforce it.
+	 */
+	sll	v0, v0, 0
+	sll	a0, a0, 0
+	sll	a1, a1, 0
+	sll	a2, a2, 0
+	sll	a3, a3, 0
+#endif
 	SAVE_SOME
 	TRACE_IRQS_ON_RELOAD
 	STI
-- 
2.21.0

