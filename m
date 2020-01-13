Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 027D4138ED3
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 11:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgAMKQd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 05:16:33 -0500
Received: from forward104p.mail.yandex.net ([77.88.28.107]:46237 "EHLO
        forward104p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725992AbgAMKQd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 05:16:33 -0500
Received: from mxback28g.mail.yandex.net (mxback28g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:328])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id AFE7D4B017C7;
        Mon, 13 Jan 2020 13:16:30 +0300 (MSK)
Received: from myt2-ea6a2e0cbf34.qloud-c.yandex.net (myt2-ea6a2e0cbf34.qloud-c.yandex.net [2a02:6b8:c00:2e8e:0:640:ea6a:2e0c])
        by mxback28g.mail.yandex.net (mxback/Yandex) with ESMTP id Kjzm8TnQeW-GUX0kSjA;
        Mon, 13 Jan 2020 13:16:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578910590;
        bh=AdO3hNoa5w14TPU24AoXFQxot8A7u9uaaeXiwtje1kc=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=vbe6q/Fs4/BYkKXPXLWaLZpBZVUqcWf1n7+DyYKVAudgMA1mEaiDUvcSCf/JutAXA
         WIiQ71BPd8hoLzPBemHusU+N2J40Qnzs5iljFds2vH1DvcSvcrIBhvuriVqeW/3LZ9
         VNxbQGhHMsn+KYerttK6dt6SVfe6lKPG06GFIg+I=
Authentication-Results: mxback28g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt2-ea6a2e0cbf34.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id u1kiDDYFMW-GNV4DMiP;
        Mon, 13 Jan 2020 13:16:28 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] MIPS: Add MAC2008 Support
Date:   Mon, 13 Jan 2020 18:16:11 +0800
Message-Id: <20200113101612.38335-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MAC2008 means the processor implemented IEEE754 style Fused MADD
instruction. It was introduced in Release3 but removed in Release5.

The toolchain support of MAC2008 have never landed except for Loongson
processors.

This patch aimed to disabled the MAC2008 if it's optional. For
MAC2008 only processors, we corrected math-emu behavior to align
with actual hardware behavior.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/cpu-features.h |  4 +++
 arch/mips/include/asm/cpu.h          |  1 +
 arch/mips/include/asm/mipsregs.h     |  3 ++
 arch/mips/kernel/cpu-probe.c         | 16 ++++++++-
 arch/mips/math-emu/cp1emu.c          | 38 ++++++++++++++++----
 arch/mips/math-emu/dp_maddf.c        | 53 ++++++++++++++++++----------
 arch/mips/math-emu/ieee754.h         | 16 +++++++++
 arch/mips/math-emu/ieee754int.h      |  1 +
 arch/mips/math-emu/sp_maddf.c        | 53 ++++++++++++++++++----------
 9 files changed, 141 insertions(+), 44 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 983a6a7f43a1..de44c92b1c1f 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -555,6 +555,10 @@
 # define cpu_has_perf		__opt(MIPS_CPU_PERF)
 #endif
 
+#ifndef cpu_has_mac2008_only
+# define cpu_has_mac2008_only	__opt(MIPS_CPU_MAC_2008_ONLY)
+#endif
+
 #ifdef CONFIG_SMP
 /*
  * Some systems share FTLB RAMs between threads within a core (siblings in
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 0e10ffcf0c1b..216a22916740 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -416,6 +416,7 @@ enum cpu_type_enum {
 #define MIPS_CPU_MT_PER_TC_PERF_COUNTERS \
 				BIT_ULL(56)	/* CPU has perf counters implemented per TC (MIPSMT ASE) */
 #define MIPS_CPU_MMID		BIT_ULL(57)	/* CPU supports MemoryMapIDs */
+#define MIPS_CPU_MAC_2008_ONLY	BIT_ULL(58)	/* CPU Only support MAC2008 Fused multiply-add instruction */
 
 /*
  * CPU ASE encodings
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 0d5a30988697..796fe47cfd17 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1101,9 +1101,12 @@
 /*
  * Bits 22:20 of the FPU Status Register will be read as 0,
  * and should be written as zero.
+ * MAC2008 was removed in Release 5 so we still treat it as
+ * reserved.
  */
 #define FPU_CSR_RSVD	(_ULCAST_(7) << 20)
 
+#define FPU_CSR_MAC2008	(_ULCAST_(1) << 20)
 #define FPU_CSR_ABS2008	(_ULCAST_(1) << 19)
 #define FPU_CSR_NAN2008	(_ULCAST_(1) << 18)
 
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index c06365404a8e..21171df1363e 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -102,7 +102,12 @@ static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
 		if (fir & MIPS_FPIR_HAS2008) {
 			fcsr = read_32bit_cp1_register(CP1_STATUS);
 
-			fcsr0 = fcsr & ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008);
+			/*
+			 * MAC2008 toolchain never landed in real world, so we're only
+			 * testing wether it can be disabled and don't try to enabled
+			 * it.
+			 */
+			fcsr0 = fcsr & ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008 | FPU_CSR_MAC2008);
 			write_32bit_cp1_register(CP1_STATUS, fcsr0);
 			fcsr0 = read_32bit_cp1_register(CP1_STATUS);
 
@@ -112,6 +117,15 @@ static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
 
 			write_32bit_cp1_register(CP1_STATUS, fcsr);
 
+			if (MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2) {
+				/*
+				 * The bit for MAC2008 might be reused by R6 in future,
+				 * so we only test for R2-R5.
+				 */
+				if (fcsr0 & FPU_CSR_MAC2008)
+					c->options |= MIPS_CPU_MAC_2008_ONLY;
+			}
+
 			if (!(fcsr0 & FPU_CSR_NAN2008))
 				c->options |= MIPS_CPU_NAN_LEGACY;
 			if (fcsr1 & FPU_CSR_NAN2008)
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 710e1f804a54..9701c89e7e14 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -1514,16 +1514,28 @@ static int fpux_emu(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
 			break;
 
 		case madd_s_op:
-			handler = fpemu_sp_madd;
+			if (cpu_has_mac2008_only)
+				handler = ieee754sp_madd;
+			else
+				handler = fpemu_sp_madd;
 			goto scoptop;
 		case msub_s_op:
-			handler = fpemu_sp_msub;
+			if (cpu_has_mac2008_only)
+				handler = ieee754sp_msub;
+			else
+				handler = fpemu_sp_msub;
 			goto scoptop;
 		case nmadd_s_op:
-			handler = fpemu_sp_nmadd;
+			if (cpu_has_mac2008_only)
+				handler = ieee754sp_nmadd;
+			else
+				handler = fpemu_sp_nmadd;
 			goto scoptop;
 		case nmsub_s_op:
-			handler = fpemu_sp_nmsub;
+			if (cpu_has_mac2008_only)
+				handler = ieee754sp_nmsub;
+			else
+				handler = fpemu_sp_nmsub;
 			goto scoptop;
 
 		      scoptop:
@@ -1610,15 +1622,27 @@ static int fpux_emu(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
 			break;
 
 		case madd_d_op:
-			handler = fpemu_dp_madd;
+			if (cpu_has_mac2008_only)
+				handler = ieee754dp_madd;
+			else
+				handler = fpemu_dp_madd;
 			goto dcoptop;
 		case msub_d_op:
-			handler = fpemu_dp_msub;
+			if (cpu_has_mac2008_only)
+				handler = ieee754dp_msub;
+			else
+				handler = fpemu_dp_msub;
 			goto dcoptop;
 		case nmadd_d_op:
-			handler = fpemu_dp_nmadd;
+			if (cpu_has_mac2008_only)
+				handler = ieee754dp_nmadd;
+			else
+				handler = fpemu_dp_nmadd;
 			goto dcoptop;
 		case nmsub_d_op:
+			if (cpu_has_mac2008_only)
+				handler = ieee754dp_nmsub;
+			else
 			handler = fpemu_dp_nmsub;
 			goto dcoptop;
 
diff --git a/arch/mips/math-emu/dp_maddf.c b/arch/mips/math-emu/dp_maddf.c
index 3da0ce44cdef..e24ef374d828 100644
--- a/arch/mips/math-emu/dp_maddf.c
+++ b/arch/mips/math-emu/dp_maddf.c
@@ -68,6 +68,12 @@ static union ieee754dp _dp_maddf(union ieee754dp z, union ieee754dp x,
 
 	ieee754_clearcx();
 
+	rs = xs ^ ys;
+	if (flags & MADDF_NEGATE_PRODUCT)
+		rs ^= 1;
+	if (flags & MADDF_NEGATE_ADDITION)
+		zs ^= 1;
+
 	/*
 	 * Handle the cases when at least one of x, y or z is a NaN.
 	 * Order of precedence is sNaN, qNaN and z, x, y.
@@ -104,9 +110,7 @@ static union ieee754dp _dp_maddf(union ieee754dp z, union ieee754dp x,
 	case CLPAIR(IEEE754_CLASS_INF, IEEE754_CLASS_NORM):
 	case CLPAIR(IEEE754_CLASS_INF, IEEE754_CLASS_DNORM):
 	case CLPAIR(IEEE754_CLASS_INF, IEEE754_CLASS_INF):
-		if ((zc == IEEE754_CLASS_INF) &&
-		    ((!(flags & MADDF_NEGATE_PRODUCT) && (zs != (xs ^ ys))) ||
-		     ((flags & MADDF_NEGATE_PRODUCT) && (zs == (xs ^ ys))))) {
+		if ((zc == IEEE754_CLASS_INF) && (zs != rs)) {
 			/*
 			 * Cases of addition of infinities with opposite signs
 			 * or subtraction of infinities with same signs.
@@ -116,15 +120,10 @@ static union ieee754dp _dp_maddf(union ieee754dp z, union ieee754dp x,
 		}
 		/*
 		 * z is here either not an infinity, or an infinity having the
-		 * same sign as product (x*y) (in case of MADDF.D instruction)
-		 * or product -(x*y) (in MSUBF.D case). The result must be an
-		 * infinity, and its sign is determined only by the value of
-		 * (flags & MADDF_NEGATE_PRODUCT) and the signs of x and y.
+		 * same sign as product (x*y). The result must be an infinity,
+		 * and its sign is determined only by the sign of product (x*y).
 		 */
-		if (flags & MADDF_NEGATE_PRODUCT)
-			return ieee754dp_inf(1 ^ (xs ^ ys));
-		else
-			return ieee754dp_inf(xs ^ ys);
+		return ieee754dp_inf(rs);
 
 	case CLPAIR(IEEE754_CLASS_ZERO, IEEE754_CLASS_ZERO):
 	case CLPAIR(IEEE754_CLASS_ZERO, IEEE754_CLASS_NORM):
@@ -135,10 +134,7 @@ static union ieee754dp _dp_maddf(union ieee754dp z, union ieee754dp x,
 			return ieee754dp_inf(zs);
 		if (zc == IEEE754_CLASS_ZERO) {
 			/* Handle cases +0 + (-0) and similar ones. */
-			if ((!(flags & MADDF_NEGATE_PRODUCT)
-					&& (zs == (xs ^ ys))) ||
-			    ((flags & MADDF_NEGATE_PRODUCT)
-					&& (zs != (xs ^ ys))))
+			if (zs == rs)
 				/*
 				 * Cases of addition of zeros of equal signs
 				 * or subtraction of zeroes of opposite signs.
@@ -187,9 +183,6 @@ static union ieee754dp _dp_maddf(union ieee754dp z, union ieee754dp x,
 	assert(ym & DP_HIDDEN_BIT);
 
 	re = xe + ye;
-	rs = xs ^ ys;
-	if (flags & MADDF_NEGATE_PRODUCT)
-		rs ^= 1;
 
 	/* shunt to top of word */
 	xm <<= 64 - (DP_FBITS + 1);
@@ -340,3 +333,27 @@ union ieee754dp ieee754dp_msubf(union ieee754dp z, union ieee754dp x,
 {
 	return _dp_maddf(z, x, y, MADDF_NEGATE_PRODUCT);
 }
+
+union ieee754dp ieee754dp_madd(union ieee754dp z, union ieee754dp x,
+				union ieee754dp y)
+{
+	return _dp_maddf(z, x, y, 0);
+}
+
+union ieee754dp ieee754dp_msub(union ieee754dp z, union ieee754dp x,
+				union ieee754dp y)
+{
+	return _dp_maddf(z, x, y, MADDF_NEGATE_ADDITION);
+}
+
+union ieee754dp ieee754dp_nmadd(union ieee754dp z, union ieee754dp x,
+				union ieee754dp y)
+{
+	return _dp_maddf(z, x, y, MADDF_NEGATE_PRODUCT|MADDF_NEGATE_ADDITION);
+}
+
+union ieee754dp ieee754dp_nmsub(union ieee754dp z, union ieee754dp x,
+				union ieee754dp y)
+{
+	return _dp_maddf(z, x, y, MADDF_NEGATE_PRODUCT);
+}
diff --git a/arch/mips/math-emu/ieee754.h b/arch/mips/math-emu/ieee754.h
index b9167bd4eb60..090caa740b1e 100644
--- a/arch/mips/math-emu/ieee754.h
+++ b/arch/mips/math-emu/ieee754.h
@@ -68,6 +68,14 @@ union ieee754sp ieee754sp_maddf(union ieee754sp z, union ieee754sp x,
 				union ieee754sp y);
 union ieee754sp ieee754sp_msubf(union ieee754sp z, union ieee754sp x,
 				union ieee754sp y);
+union ieee754sp ieee754sp_madd(union ieee754sp z, union ieee754sp x,
+				union ieee754sp y);
+union ieee754sp ieee754sp_msub(union ieee754sp z, union ieee754sp x,
+				union ieee754sp y);
+union ieee754sp ieee754sp_nmadd(union ieee754sp z, union ieee754sp x,
+				union ieee754sp y);
+union ieee754sp ieee754sp_nmsub(union ieee754sp z, union ieee754sp x,
+				union ieee754sp y);
 int ieee754sp_2008class(union ieee754sp x);
 union ieee754sp ieee754sp_fmin(union ieee754sp x, union ieee754sp y);
 union ieee754sp ieee754sp_fmina(union ieee754sp x, union ieee754sp y);
@@ -103,6 +111,14 @@ union ieee754dp ieee754dp_maddf(union ieee754dp z, union ieee754dp x,
 				union ieee754dp y);
 union ieee754dp ieee754dp_msubf(union ieee754dp z, union ieee754dp x,
 				union ieee754dp y);
+union ieee754dp ieee754dp_madd(union ieee754dp z, union ieee754dp x,
+				union ieee754dp y);
+union ieee754dp ieee754dp_msub(union ieee754dp z, union ieee754dp x,
+				union ieee754dp y);
+union ieee754dp ieee754dp_nmadd(union ieee754dp z, union ieee754dp x,
+				union ieee754dp y);
+union ieee754dp ieee754dp_nmsub(union ieee754dp z, union ieee754dp x,
+				union ieee754dp y);
 int ieee754dp_2008class(union ieee754dp x);
 union ieee754dp ieee754dp_fmin(union ieee754dp x, union ieee754dp y);
 union ieee754dp ieee754dp_fmina(union ieee754dp x, union ieee754dp y);
diff --git a/arch/mips/math-emu/ieee754int.h b/arch/mips/math-emu/ieee754int.h
index 52b20119e315..2c3b13546ac8 100644
--- a/arch/mips/math-emu/ieee754int.h
+++ b/arch/mips/math-emu/ieee754int.h
@@ -16,6 +16,7 @@
 
 enum maddf_flags {
 	MADDF_NEGATE_PRODUCT	= 1 << 0,
+	MADDF_NEGATE_ADDITION	= 1 << 1,
 };
 
 static inline void ieee754_clearcx(void)
diff --git a/arch/mips/math-emu/sp_maddf.c b/arch/mips/math-emu/sp_maddf.c
index d638354add6d..1b85b1a527ac 100644
--- a/arch/mips/math-emu/sp_maddf.c
+++ b/arch/mips/math-emu/sp_maddf.c
@@ -36,6 +36,12 @@ static union ieee754sp _sp_maddf(union ieee754sp z, union ieee754sp x,
 
 	ieee754_clearcx();
 
+	rs = xs ^ ys;
+	if (flags & MADDF_NEGATE_PRODUCT)
+		rs ^= 1;
+	if (flags & MADDF_NEGATE_ADDITION)
+		zs ^= 1;
+
 	/*
 	 * Handle the cases when at least one of x, y or z is a NaN.
 	 * Order of precedence is sNaN, qNaN and z, x, y.
@@ -73,9 +79,7 @@ static union ieee754sp _sp_maddf(union ieee754sp z, union ieee754sp x,
 	case CLPAIR(IEEE754_CLASS_INF, IEEE754_CLASS_NORM):
 	case CLPAIR(IEEE754_CLASS_INF, IEEE754_CLASS_DNORM):
 	case CLPAIR(IEEE754_CLASS_INF, IEEE754_CLASS_INF):
-		if ((zc == IEEE754_CLASS_INF) &&
-		    ((!(flags & MADDF_NEGATE_PRODUCT) && (zs != (xs ^ ys))) ||
-		     ((flags & MADDF_NEGATE_PRODUCT) && (zs == (xs ^ ys))))) {
+		if ((zc == IEEE754_CLASS_INF) && (zs != rs)) {
 			/*
 			 * Cases of addition of infinities with opposite signs
 			 * or subtraction of infinities with same signs.
@@ -85,15 +89,10 @@ static union ieee754sp _sp_maddf(union ieee754sp z, union ieee754sp x,
 		}
 		/*
 		 * z is here either not an infinity, or an infinity having the
-		 * same sign as product (x*y) (in case of MADDF.D instruction)
-		 * or product -(x*y) (in MSUBF.D case). The result must be an
-		 * infinity, and its sign is determined only by the value of
-		 * (flags & MADDF_NEGATE_PRODUCT) and the signs of x and y.
+		 * same sign as product (x*y). The result must be an infinity,
+		 * and its sign is determined only by the sign of product (x*y).
 		 */
-		if (flags & MADDF_NEGATE_PRODUCT)
-			return ieee754sp_inf(1 ^ (xs ^ ys));
-		else
-			return ieee754sp_inf(xs ^ ys);
+		return ieee754sp_inf(rs);
 
 	case CLPAIR(IEEE754_CLASS_ZERO, IEEE754_CLASS_ZERO):
 	case CLPAIR(IEEE754_CLASS_ZERO, IEEE754_CLASS_NORM):
@@ -104,10 +103,7 @@ static union ieee754sp _sp_maddf(union ieee754sp z, union ieee754sp x,
 			return ieee754sp_inf(zs);
 		if (zc == IEEE754_CLASS_ZERO) {
 			/* Handle cases +0 + (-0) and similar ones. */
-			if ((!(flags & MADDF_NEGATE_PRODUCT)
-					&& (zs == (xs ^ ys))) ||
-			    ((flags & MADDF_NEGATE_PRODUCT)
-					&& (zs != (xs ^ ys))))
+			if (zs == rs)
 				/*
 				 * Cases of addition of zeros of equal signs
 				 * or subtraction of zeroes of opposite signs.
@@ -158,9 +154,6 @@ static union ieee754sp _sp_maddf(union ieee754sp z, union ieee754sp x,
 	assert(ym & SP_HIDDEN_BIT);
 
 	re = xe + ye;
-	rs = xs ^ ys;
-	if (flags & MADDF_NEGATE_PRODUCT)
-		rs ^= 1;
 
 	/* Multiple 24 bit xm and ym to give 48 bit results */
 	rm64 = (uint64_t)xm * ym;
@@ -260,3 +253,27 @@ union ieee754sp ieee754sp_msubf(union ieee754sp z, union ieee754sp x,
 {
 	return _sp_maddf(z, x, y, MADDF_NEGATE_PRODUCT);
 }
+
+union ieee754sp ieee754sp_madd(union ieee754sp z, union ieee754sp x,
+				union ieee754sp y)
+{
+	return _sp_maddf(z, x, y, 0);
+}
+
+union ieee754sp ieee754sp_msub(union ieee754sp z, union ieee754sp x,
+				union ieee754sp y)
+{
+	return _sp_maddf(z, x, y, MADDF_NEGATE_ADDITION);
+}
+
+union ieee754sp ieee754sp_nmadd(union ieee754sp z, union ieee754sp x,
+				union ieee754sp y)
+{
+	return _sp_maddf(z, x, y, MADDF_NEGATE_PRODUCT|MADDF_NEGATE_ADDITION);
+}
+
+union ieee754sp ieee754sp_nmsub(union ieee754sp z, union ieee754sp x,
+				union ieee754sp y)
+{
+	return _sp_maddf(z, x, y, MADDF_NEGATE_PRODUCT);
+}
-- 
2.24.1

