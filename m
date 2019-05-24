Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DB229025
	for <lists+linux-mips@lfdr.de>; Fri, 24 May 2019 06:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfEXEwI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 May 2019 00:52:08 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:23604 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfEXEwI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 May 2019 00:52:08 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x4O4pFMK011278;
        Fri, 24 May 2019 13:51:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x4O4pFMK011278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558673475;
        bh=xMojSgTaksT8fr0/CwoXOqedNhh7y1X4Zp8fV5JYm4E=;
        h=From:To:Cc:Subject:Date:From;
        b=LvyD3mS7tA3tVuNJBW3UYGchUP9djXxrHzVDgtmm9ILrXt/XgqeNuUI4aKi8L9p52
         3UA3VN78H6JVnQBEDTxyYTVs5r41QLUuFhmACYbHzKTfhcJHZQP6/tl6qpHskG7gLm
         csjZx33JCR3UKoGSoxEcbGkJ3DcWcf/bhLVzodF5R2+52JU3CDR6eoOEPM7Id8WMHY
         5gZSEhA3zWK9ipS7waV4p2e5NQ/91VEOGb8Uk+u+88ye6L4neiWkrXL0ZWYxB4MXv5
         pYRGHVgUZHMYCz5w2E0UY2J4AHo4x0oIRNKYKLI39ygmfadcA7wIKhOpDmx1O60df4
         gpoxWTGvnylfQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        James Hogan <jhogan@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] MIPS: replace MBIT_ULL() with BIT_ULL()
Date:   Fri, 24 May 2019 13:51:11 +0900
Message-Id: <20190524045112.21411-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros
from <linux/bitops.h> to a new <linux/bits.h> file") moved BIT_ULL()
into <linux/bits.h>. It only includes <asm/bitsperlong.h>, so there is
no longer "include file recursion hell".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/mips/include/asm/cpu.h | 125 +++++++++++++++++-------------------
 1 file changed, 60 insertions(+), 65 deletions(-)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 6ad7d3cabd91..290369fa44a4 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -9,6 +9,8 @@
 #ifndef _ASM_CPU_H
 #define _ASM_CPU_H
 
+#include <linux/bits.h>
+
 /*
    As of the MIPS32 and MIPS64 specs from MTI, the PRId register (CP0
    register 15, select 0) is defined in this (backwards compatible) way:
@@ -352,77 +354,70 @@ enum cpu_type_enum {
 	MIPS_CPU_ISA_V | MIPS_CPU_ISA_M64R1 | MIPS_CPU_ISA_M64R2 | \
 	MIPS_CPU_ISA_M64R6)
 
-/*
- * Private version of BIT_ULL() to escape include file recursion hell.
- * We soon will have to switch to another mechanism that will work with
- * more than 64 bits anyway.
- */
-#define MBIT_ULL(bit)		(1ULL << (bit))
-
 /*
  * CPU Option encodings
  */
-#define MIPS_CPU_TLB		MBIT_ULL( 0)	/* CPU has TLB */
-#define MIPS_CPU_4KEX		MBIT_ULL( 1)	/* "R4K" exception model */
-#define MIPS_CPU_3K_CACHE	MBIT_ULL( 2)	/* R3000-style caches */
-#define MIPS_CPU_4K_CACHE	MBIT_ULL( 3)	/* R4000-style caches */
-#define MIPS_CPU_TX39_CACHE	MBIT_ULL( 4)	/* TX3900-style caches */
-#define MIPS_CPU_FPU		MBIT_ULL( 5)	/* CPU has FPU */
-#define MIPS_CPU_32FPR		MBIT_ULL( 6)	/* 32 dbl. prec. FP registers */
-#define MIPS_CPU_COUNTER	MBIT_ULL( 7)	/* Cycle count/compare */
-#define MIPS_CPU_WATCH		MBIT_ULL( 8)	/* watchpoint registers */
-#define MIPS_CPU_DIVEC		MBIT_ULL( 9)	/* dedicated interrupt vector */
-#define MIPS_CPU_VCE		MBIT_ULL(10)	/* virt. coherence conflict possible */
-#define MIPS_CPU_CACHE_CDEX_P	MBIT_ULL(11)	/* Create_Dirty_Exclusive CACHE op */
-#define MIPS_CPU_CACHE_CDEX_S	MBIT_ULL(12)	/* ... same for seconary cache ... */
-#define MIPS_CPU_MCHECK		MBIT_ULL(13)	/* Machine check exception */
-#define MIPS_CPU_EJTAG		MBIT_ULL(14)	/* EJTAG exception */
-#define MIPS_CPU_NOFPUEX	MBIT_ULL(15)	/* no FPU exception */
-#define MIPS_CPU_LLSC		MBIT_ULL(16)	/* CPU has ll/sc instructions */
-#define MIPS_CPU_INCLUSIVE_CACHES	MBIT_ULL(17)	/* P-cache subset enforced */
-#define MIPS_CPU_PREFETCH	MBIT_ULL(18)	/* CPU has usable prefetch */
-#define MIPS_CPU_VINT		MBIT_ULL(19)	/* CPU supports MIPSR2 vectored interrupts */
-#define MIPS_CPU_VEIC		MBIT_ULL(20)	/* CPU supports MIPSR2 external interrupt controller mode */
-#define MIPS_CPU_ULRI		MBIT_ULL(21)	/* CPU has ULRI feature */
-#define MIPS_CPU_PCI		MBIT_ULL(22)	/* CPU has Perf Ctr Int indicator */
-#define MIPS_CPU_RIXI		MBIT_ULL(23)	/* CPU has TLB Read/eXec Inhibit */
-#define MIPS_CPU_MICROMIPS	MBIT_ULL(24)	/* CPU has microMIPS capability */
-#define MIPS_CPU_TLBINV		MBIT_ULL(25)	/* CPU supports TLBINV/F */
-#define MIPS_CPU_SEGMENTS	MBIT_ULL(26)	/* CPU supports Segmentation Control registers */
-#define MIPS_CPU_EVA		MBIT_ULL(27)	/* CPU supports Enhanced Virtual Addressing */
-#define MIPS_CPU_HTW		MBIT_ULL(28)	/* CPU support Hardware Page Table Walker */
-#define MIPS_CPU_RIXIEX		MBIT_ULL(29)	/* CPU has unique exception codes for {Read, Execute}-Inhibit exceptions */
-#define MIPS_CPU_MAAR		MBIT_ULL(30)	/* MAAR(I) registers are present */
-#define MIPS_CPU_FRE		MBIT_ULL(31)	/* FRE & UFE bits implemented */
-#define MIPS_CPU_RW_LLB		MBIT_ULL(32)	/* LLADDR/LLB writes are allowed */
-#define MIPS_CPU_LPA		MBIT_ULL(33)	/* CPU supports Large Physical Addressing */
-#define MIPS_CPU_CDMM		MBIT_ULL(34)	/* CPU has Common Device Memory Map */
-#define MIPS_CPU_BP_GHIST	MBIT_ULL(35)	/* R12K+ Branch Prediction Global History */
-#define MIPS_CPU_SP		MBIT_ULL(36)	/* Small (1KB) page support */
-#define MIPS_CPU_FTLB		MBIT_ULL(37)	/* CPU has Fixed-page-size TLB */
-#define MIPS_CPU_NAN_LEGACY	MBIT_ULL(38)	/* Legacy NaN implemented */
-#define MIPS_CPU_NAN_2008	MBIT_ULL(39)	/* 2008 NaN implemented */
-#define MIPS_CPU_VP		MBIT_ULL(40)	/* MIPSr6 Virtual Processors (multi-threading) */
-#define MIPS_CPU_LDPTE		MBIT_ULL(41)	/* CPU has ldpte/lddir instructions */
-#define MIPS_CPU_MVH		MBIT_ULL(42)	/* CPU supports MFHC0/MTHC0 */
-#define MIPS_CPU_EBASE_WG	MBIT_ULL(43)	/* CPU has EBase.WG */
-#define MIPS_CPU_BADINSTR	MBIT_ULL(44)	/* CPU has BadInstr register */
-#define MIPS_CPU_BADINSTRP	MBIT_ULL(45)	/* CPU has BadInstrP register */
-#define MIPS_CPU_CTXTC		MBIT_ULL(46)	/* CPU has [X]ConfigContext registers */
-#define MIPS_CPU_PERF		MBIT_ULL(47)	/* CPU has MIPS performance counters */
-#define MIPS_CPU_GUESTCTL0EXT	MBIT_ULL(48)	/* CPU has VZ GuestCtl0Ext register */
-#define MIPS_CPU_GUESTCTL1	MBIT_ULL(49)	/* CPU has VZ GuestCtl1 register */
-#define MIPS_CPU_GUESTCTL2	MBIT_ULL(50)	/* CPU has VZ GuestCtl2 register */
-#define MIPS_CPU_GUESTID	MBIT_ULL(51)	/* CPU uses VZ ASE GuestID feature */
-#define MIPS_CPU_DRG		MBIT_ULL(52)	/* CPU has VZ Direct Root to Guest (DRG) */
-#define MIPS_CPU_UFR		MBIT_ULL(53)	/* CPU supports User mode FR switching */
+#define MIPS_CPU_TLB		BIT_ULL( 0)	/* CPU has TLB */
+#define MIPS_CPU_4KEX		BIT_ULL( 1)	/* "R4K" exception model */
+#define MIPS_CPU_3K_CACHE	BIT_ULL( 2)	/* R3000-style caches */
+#define MIPS_CPU_4K_CACHE	BIT_ULL( 3)	/* R4000-style caches */
+#define MIPS_CPU_TX39_CACHE	BIT_ULL( 4)	/* TX3900-style caches */
+#define MIPS_CPU_FPU		BIT_ULL( 5)	/* CPU has FPU */
+#define MIPS_CPU_32FPR		BIT_ULL( 6)	/* 32 dbl. prec. FP registers */
+#define MIPS_CPU_COUNTER	BIT_ULL( 7)	/* Cycle count/compare */
+#define MIPS_CPU_WATCH		BIT_ULL( 8)	/* watchpoint registers */
+#define MIPS_CPU_DIVEC		BIT_ULL( 9)	/* dedicated interrupt vector */
+#define MIPS_CPU_VCE		BIT_ULL(10)	/* virt. coherence conflict possible */
+#define MIPS_CPU_CACHE_CDEX_P	BIT_ULL(11)	/* Create_Dirty_Exclusive CACHE op */
+#define MIPS_CPU_CACHE_CDEX_S	BIT_ULL(12)	/* ... same for seconary cache ... */
+#define MIPS_CPU_MCHECK		BIT_ULL(13)	/* Machine check exception */
+#define MIPS_CPU_EJTAG		BIT_ULL(14)	/* EJTAG exception */
+#define MIPS_CPU_NOFPUEX	BIT_ULL(15)	/* no FPU exception */
+#define MIPS_CPU_LLSC		BIT_ULL(16)	/* CPU has ll/sc instructions */
+#define MIPS_CPU_INCLUSIVE_CACHES BIT_ULL(17)	/* P-cache subset enforced */
+#define MIPS_CPU_PREFETCH	BIT_ULL(18)	/* CPU has usable prefetch */
+#define MIPS_CPU_VINT		BIT_ULL(19)	/* CPU supports MIPSR2 vectored interrupts */
+#define MIPS_CPU_VEIC		BIT_ULL(20)	/* CPU supports MIPSR2 external interrupt controller mode */
+#define MIPS_CPU_ULRI		BIT_ULL(21)	/* CPU has ULRI feature */
+#define MIPS_CPU_PCI		BIT_ULL(22)	/* CPU has Perf Ctr Int indicator */
+#define MIPS_CPU_RIXI		BIT_ULL(23)	/* CPU has TLB Read/eXec Inhibit */
+#define MIPS_CPU_MICROMIPS	BIT_ULL(24)	/* CPU has microMIPS capability */
+#define MIPS_CPU_TLBINV		BIT_ULL(25)	/* CPU supports TLBINV/F */
+#define MIPS_CPU_SEGMENTS	BIT_ULL(26)	/* CPU supports Segmentation Control registers */
+#define MIPS_CPU_EVA		BIT_ULL(27)	/* CPU supports Enhanced Virtual Addressing */
+#define MIPS_CPU_HTW		BIT_ULL(28)	/* CPU support Hardware Page Table Walker */
+#define MIPS_CPU_RIXIEX		BIT_ULL(29)	/* CPU has unique exception codes for {Read, Execute}-Inhibit exceptions */
+#define MIPS_CPU_MAAR		BIT_ULL(30)	/* MAAR(I) registers are present */
+#define MIPS_CPU_FRE		BIT_ULL(31)	/* FRE & UFE bits implemented */
+#define MIPS_CPU_RW_LLB		BIT_ULL(32)	/* LLADDR/LLB writes are allowed */
+#define MIPS_CPU_LPA		BIT_ULL(33)	/* CPU supports Large Physical Addressing */
+#define MIPS_CPU_CDMM		BIT_ULL(34)	/* CPU has Common Device Memory Map */
+#define MIPS_CPU_BP_GHIST	BIT_ULL(35)	/* R12K+ Branch Prediction Global History */
+#define MIPS_CPU_SP		BIT_ULL(36)	/* Small (1KB) page support */
+#define MIPS_CPU_FTLB		BIT_ULL(37)	/* CPU has Fixed-page-size TLB */
+#define MIPS_CPU_NAN_LEGACY	BIT_ULL(38)	/* Legacy NaN implemented */
+#define MIPS_CPU_NAN_2008	BIT_ULL(39)	/* 2008 NaN implemented */
+#define MIPS_CPU_VP		BIT_ULL(40)	/* MIPSr6 Virtual Processors (multi-threading) */
+#define MIPS_CPU_LDPTE		BIT_ULL(41)	/* CPU has ldpte/lddir instructions */
+#define MIPS_CPU_MVH		BIT_ULL(42)	/* CPU supports MFHC0/MTHC0 */
+#define MIPS_CPU_EBASE_WG	BIT_ULL(43)	/* CPU has EBase.WG */
+#define MIPS_CPU_BADINSTR	BIT_ULL(44)	/* CPU has BadInstr register */
+#define MIPS_CPU_BADINSTRP	BIT_ULL(45)	/* CPU has BadInstrP register */
+#define MIPS_CPU_CTXTC		BIT_ULL(46)	/* CPU has [X]ConfigContext registers */
+#define MIPS_CPU_PERF		BIT_ULL(47)	/* CPU has MIPS performance counters */
+#define MIPS_CPU_GUESTCTL0EXT	BIT_ULL(48)	/* CPU has VZ GuestCtl0Ext register */
+#define MIPS_CPU_GUESTCTL1	BIT_ULL(49)	/* CPU has VZ GuestCtl1 register */
+#define MIPS_CPU_GUESTCTL2	BIT_ULL(50)	/* CPU has VZ GuestCtl2 register */
+#define MIPS_CPU_GUESTID	BIT_ULL(51)	/* CPU uses VZ ASE GuestID feature */
+#define MIPS_CPU_DRG		BIT_ULL(52)	/* CPU has VZ Direct Root to Guest (DRG) */
+#define MIPS_CPU_UFR		BIT_ULL(53)	/* CPU supports User mode FR switching */
 #define MIPS_CPU_SHARED_FTLB_RAM \
-				MBIT_ULL(54)	/* CPU shares FTLB RAM with another */
+				BIT_ULL(54)	/* CPU shares FTLB RAM with another */
 #define MIPS_CPU_SHARED_FTLB_ENTRIES \
-				MBIT_ULL(55)	/* CPU shares FTLB entries with another */
+				BIT_ULL(55)	/* CPU shares FTLB entries with another */
 #define MIPS_CPU_MT_PER_TC_PERF_COUNTERS \
-				MBIT_ULL(56)	/* CPU has perf counters implemented per TC (MIPSMT ASE) */
-#define MIPS_CPU_MMID		MBIT_ULL(57)	/* CPU supports MemoryMapIDs */
+				BIT_ULL(56)	/* CPU has perf counters implemented per TC (MIPSMT ASE) */
+#define MIPS_CPU_MMID		BIT_ULL(57)	/* CPU supports MemoryMapIDs */
 
 /*
  * CPU ASE encodings
-- 
2.17.1

