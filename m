Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 119C3A4A12
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728929AbfIAPqL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:46:11 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:41312 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728888AbfIAPqL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:46:11 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 4B4633F65F;
        Sun,  1 Sep 2019 17:39:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nW21PdwY-Sph; Sun,  1 Sep 2019 17:39:19 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 427873F615;
        Sun,  1 Sep 2019 17:39:19 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:39:19 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>
Subject: [PATCH 008/120] MIPS: R5900: Add implicit SYNC.P to the
 UASM_i_M[FT]C0 macros
Message-ID: <7ca2326b3a86abb55904ddc930785f5590799a1d.1567326213.git.noring@nocrew.org>
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

The Toshiba TX79 manual specifies that all MTC0 instructions must be
followed by a SYNC.P instruction as a barrier to guarantee COP0 register
updates[1]. There is one exception to this rule:

An MTC0 instruction which loads the EntryHi COP0 register can be followed
by a TLBWI or a TLBWR instruction without having an intervening SYNC.P.
This special case is handled by a hardware interlock.

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. C-28, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
The Linux 2.6 port to the PlayStation 2 has SYNC.P preceding all MFC0
instructions, but I have not found any documentation stating that is
necessary. Perhaps this case can be removed?
---
 arch/mips/include/asm/uasm.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/include/asm/uasm.h b/arch/mips/include/asm/uasm.h
index 71ddf155ef85..34b61fb53da5 100644
--- a/arch/mips/include/asm/uasm.h
+++ b/arch/mips/include/asm/uasm.h
@@ -214,8 +214,19 @@ static inline void uasm_l##lb(struct uasm_label **lab, u32 *addr)	\
 # define UASM_i_LL(buf, rs, rt, off) uasm_i_lld(buf, rs, rt, off)
 # define UASM_i_LW(buf, rs, rt, off) uasm_i_ld(buf, rs, rt, off)
 # define UASM_i_LWX(buf, rs, rt, rd) uasm_i_ldx(buf, rs, rt, rd)
+#ifndef CONFIG_CPU_R5900
 # define UASM_i_MFC0(buf, rt, rd...) uasm_i_dmfc0(buf, rt, rd)
 # define UASM_i_MTC0(buf, rt, rd...) uasm_i_dmtc0(buf, rt, rd)
+#else
+# define UASM_i_MFC0(buf, rt, rd...) do { \
+		uasm_i_syncp(buf); \
+		uasm_i_mfc0(buf, rt, rd); \
+	} while(0)
+# define UASM_i_MTC0(buf, rt, rd...) do { \
+		uasm_i_mtc0(buf, rt, rd); \
+		uasm_i_syncp(buf); \
+	} while(0)
+#endif
 # define UASM_i_ROTR(buf, rs, rt, sh) uasm_i_drotr(buf, rs, rt, sh)
 # define UASM_i_SC(buf, rs, rt, off) uasm_i_scd(buf, rs, rt, off)
 # define UASM_i_SLL(buf, rs, rt, sh) uasm_i_dsll(buf, rs, rt, sh)
@@ -230,8 +241,19 @@ static inline void uasm_l##lb(struct uasm_label **lab, u32 *addr)	\
 # define UASM_i_LL(buf, rs, rt, off) uasm_i_ll(buf, rs, rt, off)
 # define UASM_i_LW(buf, rs, rt, off) uasm_i_lw(buf, rs, rt, off)
 # define UASM_i_LWX(buf, rs, rt, rd) uasm_i_lwx(buf, rs, rt, rd)
+#ifndef CONFIG_CPU_R5900
 # define UASM_i_MFC0(buf, rt, rd...) uasm_i_mfc0(buf, rt, rd)
 # define UASM_i_MTC0(buf, rt, rd...) uasm_i_mtc0(buf, rt, rd)
+#else
+# define UASM_i_MFC0(buf, rt, rd...) do { \
+		uasm_i_syncp(buf); \
+		uasm_i_mfc0(buf, rt, rd); \
+	} while(0)
+# define UASM_i_MTC0(buf, rt, rd...) do { \
+		uasm_i_mtc0(buf, rt, rd); \
+		uasm_i_syncp(buf); \
+	} while(0)
+#endif
 # define UASM_i_ROTR(buf, rs, rt, sh) uasm_i_rotr(buf, rs, rt, sh)
 # define UASM_i_SC(buf, rs, rt, off) uasm_i_sc(buf, rs, rt, off)
 # define UASM_i_SLL(buf, rs, rt, sh) uasm_i_sll(buf, rs, rt, sh)
-- 
2.21.0

