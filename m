Return-Path: <linux-mips+bounces-3694-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EAA909DBD
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 15:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4ACADB21102
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 13:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD2A18F2FC;
	Sun, 16 Jun 2024 13:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="L4KSUUsl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AwDYXwfh"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBE318F2DE;
	Sun, 16 Jun 2024 13:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718544348; cv=none; b=RWs69unkEf6x1Rbf8dWik8HgsgE7aakqD8C0/jkBwvtf2DdmZdQKVbZVXZ77+CXZNY+tl8RYvcB9rBnm7bTGiesAImwRituHG/hHGXGaFni71oYRrU0z6+rTb5ki6gBYohVkOIX+WQgM4MuwxRdUHfQXWw/Jb4H8NKlEenAcXLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718544348; c=relaxed/simple;
	bh=GtXXopSw9hxQiRf/LvNggLCC3XC0HHzH5OdP5ohyH1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVfY7Yk2wF0SH+U3lycxUN5OdDL81ot2SSaTRWBExGaDm1ewG6jTyUBfCicJqzz6sHi0eGs3iEm5rX/32mRrpG6u22HJq4I2bY2CERDdFMtM/M+ZJ+MHb1POT+IMhC6sBd656B5G1oN2QLkXitu4fyubbn0BspXU79XTSKRSqZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=L4KSUUsl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AwDYXwfh; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id B8ED11C00099;
	Sun, 16 Jun 2024 09:25:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 16 Jun 2024 09:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718544345;
	 x=1718630745; bh=FX2B+78UWiFhpuuYQCfJnH0iQUQy8ppKjXTRK5/qQFA=; b=
	L4KSUUsldpb/WTSIIW61gEWVr40s/DoeblCMZCWaZPEdJCZVAXHJ1s9EXsrI5G9H
	a+T+9Dil5NCDAwjyg3X3SoPNIgBvPuwAiGwGUOYh3keUx5ZNrHSsIFKrYDObKHBc
	40q6icGnxw/C24ec6OsEwogTMzYmktxlTgn25teaafdMZMQV24us/0f5YkSl5Lvk
	oxv0wMnD8IzDBqm7XUcu+tsiRygP7VJste8fGysrp9cYqQ8HXrLYNX4aUCCPLOp+
	NpPxG3QO/9nmpRG1O3hxLYG+mHx8erm1Q1rHV7eqQkZhb2pfN0pGWFCE3RSgB2kW
	Tspq+07s19xlRMeWbo6C2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718544345; x=
	1718630745; bh=FX2B+78UWiFhpuuYQCfJnH0iQUQy8ppKjXTRK5/qQFA=; b=A
	wDYXwfhRIhuygZ0l+rrot8TQYPVXaWOC+s1umMcMUc01nxpYHic77snbQcAOV2Qp
	PFUz20GDUoB6ucETO8hk7nxrCr34GlNbggmUtkzgeqIRjsSXah7JrUGGJkbFGuDa
	Z5USzlMZPy+bUBxVBDldmsUtZGkjuSU/tiqFc5GTbhGoNxR+pY4gaBxDiNslZKqP
	bvbg59NEr0qnKN4WOXACWANObnhUOmez3DVTFEi8bnWMz5xFd5IPJplUCm47QI2W
	qzAt3qbSWEQL9nEM/5kKBZqlfLVCeBDIJdvxyprS+bcvg+k/gAqLgn4loVRb76sa
	AqokoPfCD8ODfCopLIBew==
X-ME-Sender: <xms:2eduZvdpBU3h8jfxZzB8ayGuslLU_5Rr-Hq0mPwY3F0lydJpc8VezQ>
    <xme:2eduZlMkLNJcPwU0eGGfkad76MfASP6b_HJAK3YSiSU3A53p_jc85psj5n6VqUFop
    9fBaQy1bb8JxXzwDZw>
X-ME-Received: <xmr:2eduZohhUpPtma3z3Lbnh4WYPchSdI5e-odLoLV8uAOJ8BTTTrtySW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:2eduZg8j99uK7IlJG121gKaTLoCXj-H_9FzLQ5ebL8lbQzI0x6Sc6A>
    <xmx:2eduZrsr0UFMMT21E6M2uDhO9Q60pwI_oFVkvHI81e99h56dKeeO3g>
    <xmx:2eduZvE8pO714akFVbInyejAE95jp-lBhLevR7XyY9Xk0OT2HZlCUw>
    <xmx:2eduZiMKeMlaGbaOMyQB08O8iqwRr5Nj2Kxqkes72iJf_8DBrA9hsQ>
    <xmx:2eduZhVXqdPnsTa0kfZNVkXOYhE9LmBQAuHP6Emr6JZ8xl515-oVbIdb>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 09:25:44 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 14:25:05 +0100
Subject: [PATCH fixes 4/4] MIPS: Use toolchain MT ASE support whenever
 possible
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mips-mt-fixes-v1-4-83913e0e60fc@flygoat.com>
References: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
In-Reply-To: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6957;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=GtXXopSw9hxQiRf/LvNggLCC3XC0HHzH5OdP5ohyH1o=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS85xcFv/eaLvNa7+QS9u6i+GsF84WCP0Pr3QOezQ8Pl
 vm34dSHjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZhIVwnDf1fuV0ULMz2WSsdP
 4Z9UWHC2TUg+xLDJOVDN5snSNs+YFIb/kX+21hc9rGFwulpu3Mqe6+pz4tj/86YX2vy799S2qK9
 mBwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Probe toolchain support to MT ASE and use it in code whenever
possible.

Fix build on MIPS downstream toolchain that is not really happy
with our .insn usage.

Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Makefile                 |  2 +
 arch/mips/include/asm/asmmacro.h   | 75 ++++++++++++++++++++++++++++++++++++--
 arch/mips/include/asm/mipsmtregs.h | 40 ++++++++++++++++++++
 3 files changed, 114 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 80aecba24892..e3d1c5a0e8e9 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -257,6 +257,8 @@ toolchain-dsp				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mdsp)
 cflags-$(toolchain-dsp)			+= -DTOOLCHAIN_SUPPORTS_DSP
 toolchain-ginv				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mginv)
 cflags-$(toolchain-ginv)		+= -DTOOLCHAIN_SUPPORTS_GINV
+toolchain-mt				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mt)
+cflags-$(toolchain-mt)			+= -DTOOLCHAIN_SUPPORTS_MT
 
 #
 # Firmware support
diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index 6eadd59f53e9..b60fa51e5fbb 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -318,9 +318,77 @@
 	.endm
 #endif /* !CONFIG_CPU_MIPSR2 && !CONFIG_CPU_MIPSR5 && !CONFIG_CPU_MIPSR6 */
 
-/*
- * Temporary until all gas have MT ASE support
- */
+#ifdef TOOLCHAIN_SUPPORTS_MT
+	.macro	_dmt	reg = $0
+	.set	push
+	.set	mt
+	dmt	\reg
+	.set	pop
+	.endm
+
+	.macro	_emt	reg = $0
+	.set	push
+	.set	mt
+	emt	\reg
+	.set	pop
+	.endm
+
+	.macro	_dvpe	reg = $0
+	.set	push
+	.set	mt
+	dvpe	\reg
+	.set	pop
+	.endm
+
+	.macro	_evpe	reg = $0
+	.set	push
+	.set	mt
+	evpe	\reg
+	.set	pop
+	.endm
+
+	.macro	_mftr	rs, rt, u, sel, h = 0
+	.set	push
+	.set	mt
+	mftr	\rs, \rt, \u, \sel, \h
+	.set	pop
+	.endm
+
+	.macro	_mttr	rt, rs, u, sel, h = 0
+	.set	push
+	.set	mt
+	mttr	\rt, \rs, \u, \sel, \h
+	.set	pop
+	.endm
+
+	.macro	_mftc0	rs, rt, sel = 0
+	.set	push
+	.set	mt
+	mftc0	\rs, \rt, \sel
+	.set	pop
+	.endm
+
+	.macro	_mttc0	rt, rs, sel = 0
+	.set	push
+	.set	mt
+	mttc0	\rt, \rs, \sel
+	.set	pop
+	.endm
+
+	.macro	_mftgpr	rs, rt
+	.set	push
+	.set	mt
+	mftgpr	\rs, \rt
+	.set	pop
+	.endm
+
+	.macro	_mttgpr	rs, rt
+	.set	push
+	.set	mt
+	mttgpr	\rs, \rt
+	.set	pop
+	.endm
+#else
 	.macro	_dmt	reg = $0
 	parse_r		__reg, \reg
 	insn_if_mips	0x41600bc1 | (__reg << 16)
@@ -374,6 +442,7 @@
 	.macro	_mttgpr	rs, rt
 	_mttr		\rt, \rs, 1, 0, 0
 	.endm
+#endif
 
 #ifdef TOOLCHAIN_SUPPORTS_MSA
 	.macro	_cfcmsa	rd, cs
diff --git a/arch/mips/include/asm/mipsmtregs.h b/arch/mips/include/asm/mipsmtregs.h
index b1ee3c48e84b..93b8aa807b82 100644
--- a/arch/mips/include/asm/mipsmtregs.h
+++ b/arch/mips/include/asm/mipsmtregs.h
@@ -189,11 +189,16 @@ static inline unsigned core_nvpes(void)
 	return ((conf0 & MVPCONF0_PVPE) >> MVPCONF0_PVPE_SHIFT) + 1;
 }
 
+#ifndef TOOLCHAIN_SUPPORTS_MT
 #define _ASM_SET_DVPE							\
 	_ASM_MACRO_1R(dvpe, rt,						\
 			_ASM_INSN_IF_MIPS(0x41600001 | __rt << 16)	\
 			_ASM_INSN32_IF_MM(0x0000157C | __rt << 21))
 #define _ASM_UNSET_DVPE ".purgem dvpe\n\t"
+#else
+#define _ASM_SET_DVPE ".set\tmt\n\t"
+#define _ASM_UNSET_DVPE
+#endif
 
 static inline unsigned int dvpe(void)
 {
@@ -214,11 +219,16 @@ static inline unsigned int dvpe(void)
 	return res;
 }
 
+#ifndef TOOLCHAIN_SUPPORTS_MT
 #define _ASM_SET_EVPE							\
 	_ASM_MACRO_1R(evpe, rt,					\
 			_ASM_INSN_IF_MIPS(0x41600021 | __rt << 16)	\
 			_ASM_INSN32_IF_MM(0x0000357C | __rt << 21))
 #define _ASM_UNSET_EVPE ".purgem evpe\n\t"
+#else
+#define _ASM_SET_EVPE ".set\tmt\n\t"
+#define _ASM_UNSET_EVPE
+#endif
 
 static inline void __raw_evpe(void)
 {
@@ -243,11 +253,16 @@ static inline void evpe(int previous)
 		__raw_evpe();
 }
 
+#ifndef TOOLCHAIN_SUPPORTS_MT
 #define _ASM_SET_DMT							\
 	_ASM_MACRO_1R(dmt, rt,						\
 			_ASM_INSN_IF_MIPS(0x41600bc1 | __rt << 16)	\
 			_ASM_INSN32_IF_MM(0x0000057C | __rt << 21))
 #define _ASM_UNSET_DMT ".purgem dmt\n\t"
+#else
+#define _ASM_SET_DMT ".set\tmt\n\t"
+#define _ASM_UNSET_DMT
+#endif
 
 static inline unsigned int dmt(void)
 {
@@ -268,11 +283,16 @@ static inline unsigned int dmt(void)
 	return res;
 }
 
+#ifndef TOOLCHAIN_SUPPORTS_MT
 #define _ASM_SET_EMT							\
 	_ASM_MACRO_1R(emt, rt,						\
 			_ASM_INSN_IF_MIPS(0x41600be1 | __rt << 16)	\
 			_ASM_INSN32_IF_MM(0x0000257C | __rt << 21))
 #define _ASM_UNSET_EMT ".purgem emt\n\t"
+#else
+#define _ASM_SET_EMT ".set\tmt\n\t"
+#define _ASM_UNSET_EMT
+#endif
 
 static inline void __raw_emt(void)
 {
@@ -306,6 +326,7 @@ static inline void ehb(void)
 	"	.set	pop				\n");
 }
 
+#ifndef TOOLCHAIN_SUPPORTS_MT
 #define _ASM_SET_MFTC0							\
 	_ASM_MACRO_2R_1S(mftc0, rs, rt, sel,				\
 			_ASM_INSN_IF_MIPS(0x41000000 | __rt << 16 |	\
@@ -313,6 +334,10 @@ static inline void ehb(void)
 			_ASM_INSN32_IF_MM(0x0000000E | __rt << 21 |	\
 				__rs << 16 | \\sel << 4))
 #define _ASM_UNSET_MFTC0 ".purgem mftc0\n\t"
+#else
+#define _ASM_SET_MFTC0 ".set\tmt\n\t"
+#define _ASM_UNSET_MFTC0
+#endif
 
 #define mftc0(rt, sel)							\
 ({									\
@@ -330,6 +355,7 @@ static inline void ehb(void)
 	__res;								\
 })
 
+#ifndef TOOLCHAIN_SUPPORTS_MT
 #define _ASM_SET_MFTGPR							\
 	_ASM_MACRO_2R(mftgpr, rs, rt,					\
 			_ASM_INSN_IF_MIPS(0x41000020 | __rt << 16 |	\
@@ -337,6 +363,10 @@ static inline void ehb(void)
 			_ASM_INSN32_IF_MM(0x0000040E | __rt << 21 |	\
 				__rs << 16))
 #define _ASM_UNSET_MFTGPR ".purgem mftgpr\n\t"
+#else
+#define _ASM_SET_MFTGPR ".set\tmt\n\t"
+#define _ASM_UNSET_MFTGPR
+#endif
 
 #define mftgpr(rt)							\
 ({									\
@@ -365,6 +395,7 @@ static inline void ehb(void)
 	__res;								\
 })
 
+#ifndef TOOLCHAIN_SUPPORTS_MT
 #define _ASM_SET_MTTGPR							\
 	_ASM_MACRO_2R(mttgpr, rt, rs,					\
 			_ASM_INSN_IF_MIPS(0x41800020 | __rt << 16 |	\
@@ -372,6 +403,10 @@ static inline void ehb(void)
 			_ASM_INSN32_IF_MM(0x00000406 | __rt << 21 |	\
 				__rs << 16))
 #define _ASM_UNSET_MTTGPR ".purgem mttgpr\n\t"
+#else
+#define _ASM_SET_MTTGPR ".set\tmt\n\t"
+#define _ASM_UNSET_MTTGPR
+#endif
 
 #define mttgpr(rs, v)							\
 do {									\
@@ -385,6 +420,7 @@ do {									\
 	: : "r" (v));							\
 } while (0)
 
+#ifndef TOOLCHAIN_SUPPORTS_MT
 #define _ASM_SET_MTTC0							\
 	_ASM_MACRO_2R_1S(mttc0, rt, rs, sel,				\
 			_ASM_INSN_IF_MIPS(0x41800000 | __rt << 16 |	\
@@ -392,6 +428,10 @@ do {									\
 			_ASM_INSN32_IF_MM(0x0000040E | __rt << 21 |	\
 				__rs << 16 | \\sel << 4))
 #define _ASM_UNSET_MTTC0 ".purgem mttc0\n\t"
+#else
+#define _ASM_SET_MTTC0 ".set\tmt\n\t"
+#define _ASM_UNSET_MTTC0
+#endif
 
 #define mttc0(rs, sel, v)							\
 ({									\

-- 
2.43.0


