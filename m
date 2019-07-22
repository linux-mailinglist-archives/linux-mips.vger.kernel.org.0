Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB14270C3A
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2019 00:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730830AbfGVWAK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 18:00:10 -0400
Received: from mail-eopbgr690127.outbound.protection.outlook.com ([40.107.69.127]:58497
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726553AbfGVWAK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 18:00:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmNXiF6sKCy6zyfEB/9Xl+gyyKjg72Sh7GhLObnLJxfF9PhR3Sy98hCrRNJP7lMgxf8xGksQRuP9s5C3oEkUwNzwImHVulyHvzemWwvzH4Y08Ehk/X6uR5HzimDX8Xc4qR80GrZklo/mEMx/EXRF8fQUvvt8JTmS3x+ME5jsjMM5HZwvKrHKLmY8gTGbTwM7WJS1m2csOOCBKfSiED7vRBmNQ9R8scKzZM0psf4J6XL6NFIpTEwRbcMCy86XSr646tSy/JvpSiD7htmExyKW7NeYZi9A4DFdtVQ9TNr55bfilo1LOvXxBSxa8aGuSjTiob4Qb0dX+Xktwgss6QVQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ys5wcKd7nMwKzhBm6uT1ZxdOKusGHCothfIZ6fBVuWI=;
 b=bMGA3n+vTtxfO6STGQdbaMbCebvBY9THn9FpYVG7aAkj4/rWcJF5j+C9Outb/SfCTk41Xt2Ou5PTgNJWkMoqyKgtIb17I83BLxfst3jLz6K6fQERB2UMGQbI1GkClrEsDmAp52D+PhN9C4TWCdG5LKD/EGO/YeHqXSsBa3quQz4XRCkVUeM/sraJKQNkXMADj8GhgEYqUcUxfuMisMV6Syq2vOaxWrtPDNOolvGF8Ygp86SsC7Z5cwMEJGc3R7FkTZBdpF0eQBOXIcKmsgaJC7q4SKuN5NSKWD+UzxKDcdqdQJ0/TLgcRw58G8SLJPR0+D7p0AGYLiGKd9hGvaMnfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ys5wcKd7nMwKzhBm6uT1ZxdOKusGHCothfIZ6fBVuWI=;
 b=CsgVeAyvgIxx2a11gG3mN092t5cAAUXPNUXriszyLvtj0qbyBpLrTf7lkJz3SBhyQEdjL88SXJRpXKCeZVkkHWK/itobf72b5/nPxJZ9Q3BU8mdBm5+XUhpC1I41bLGX1OL+R9BDpY69bl2X0Bheuw1gHN2nmPR61bMcJrMcLc8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1184.namprd22.prod.outlook.com (10.174.171.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 22:00:03 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 22:00:03 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 4/4] MIPS: Remove unused R8000 CPU support
Thread-Topic: [PATCH 4/4] MIPS: Remove unused R8000 CPU support
Thread-Index: AQHVQNjQCu3EbbWQj0iHu6S8wIbGMw==
Date:   Mon, 22 Jul 2019 22:00:03 +0000
Message-ID: <20190722215705.20109-4-paul.burton@mips.com>
References: <20190722215705.20109-1-paul.burton@mips.com>
In-Reply-To: <20190722215705.20109-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0057.namprd11.prod.outlook.com
 (2603:10b6:a03:80::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a8d4f4d-4a0e-4478-65ae-08d70eeff2cd
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1184;
x-ms-traffictypediagnostic: MWHPR2201MB1184:
x-microsoft-antispam-prvs: <MWHPR2201MB11849ECCAD9EFB0552A43831C1C40@MWHPR2201MB1184.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(136003)(376002)(39840400004)(366004)(199004)(189003)(2351001)(6436002)(4326008)(316002)(99286004)(66066001)(6916009)(107886003)(2906002)(6512007)(68736007)(386003)(478600001)(66946007)(36756003)(44832011)(7736002)(66476007)(66556008)(66446008)(64756008)(5640700003)(305945005)(25786009)(8936002)(6486002)(53936002)(446003)(50226002)(5660300002)(1076003)(102836004)(14444005)(186003)(256004)(8676002)(2501003)(42882007)(81156014)(26005)(81166006)(14454004)(476003)(76176011)(30864003)(486006)(71190400001)(71200400001)(11346002)(6116002)(3846002)(6506007)(2616005)(52116002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1184;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C89W8lSgzIkHssMfEsh6wAlFFD5Wfx5csqWORi9v3NjVBRoBqAqEXa4f90gGSXKloT1Dh/j0v8EqedjrxA3wn75/hBFQXExQ+mxUiBEloC8GYHkpHSL4gdXgw1PV038A/iNbKbv+Vy+8UoRNSJ8wUxe2B1Ybi20bzYMtpsEqhizoAdrFTKsg0O2iTxKcEXo0VCcImEtQ5pgcK8sz58QXnkwOtPLZWzvEMplRkUk98a9HL8GVpxR1DzX6A/vZTSdS+XFRljmZGCLD3+/vNGuNT0vqcQ0lJvKLBQuOBDep7EbXAA5sBQ27YRYAeNhuP1CnJDefsjMxzhcDDUKTCMyo2ty1aumhnu7QysKH2LraYbyfMVzN7BKw8UkroAIhKEkwdaIOqJF7tGI07sCtHnqQdc9Os4w8rc5W5pA0K5uoJrk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8d4f4d-4a0e-4478-65ae-08d70eeff2cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 22:00:03.8301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1184
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Our R8000 CPU support can only be included if a system selects
CONFIG_SYS_HAS_CPU_R8000. No system does, making all R8000-related CPU
support dead code. Remove it.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/Kconfig                 |  24 +--
 arch/mips/Makefile                |   1 -
 arch/mips/include/asm/addrspace.h |   9 --
 arch/mips/include/asm/cpu-type.h  |   4 -
 arch/mips/include/asm/cpu.h       |   5 -
 arch/mips/include/asm/module.h    |   2 -
 arch/mips/kernel/cpu-probe.c      |   9 --
 arch/mips/mm/Makefile             |   1 -
 arch/mips/mm/tlb-r8k.c            | 239 ------------------------------
 arch/mips/mm/tlbex.c              |   4 -
 10 files changed, 5 insertions(+), 293 deletions(-)
 delete mode 100644 arch/mips/mm/tlb-r8k.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0f4e1a7eb006..a0b6591f8de3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1650,16 +1650,6 @@ config CPU_NEVADA
 	help
 	  QED / PMC-Sierra RM52xx-series ("Nevada") processors.
=20
-config CPU_R8000
-	bool "R8000"
-	depends on SYS_HAS_CPU_R8000
-	select CPU_HAS_PREFETCH
-	select CPU_HAS_LOAD_STORE_LR
-	select CPU_SUPPORTS_64BIT_KERNEL
-	help
-	  MIPS Technologies R8000 processors.  Note these processors are
-	  uncommon and the support for them is incomplete.
-
 config CPU_R10000
 	bool "R10000"
 	depends on SYS_HAS_CPU_R10000
@@ -1967,9 +1957,6 @@ config SYS_HAS_CPU_R5500
 config SYS_HAS_CPU_NEVADA
 	bool
=20
-config SYS_HAS_CPU_R8000
-	bool
-
 config SYS_HAS_CPU_R10000
 	bool
 	select ARCH_HAS_SYNC_DMA_FOR_CPU if DMA_NONCOHERENT
@@ -2169,13 +2156,13 @@ config PAGE_SIZE_4KB
=20
 config PAGE_SIZE_8KB
 	bool "8kB"
-	depends on CPU_R8000 || CPU_CAVIUM_OCTEON
+	depends on CPU_CAVIUM_OCTEON
 	depends on !MIPS_VA_BITS_48
 	help
 	  Using 8kB page size will result in higher performance kernel at
 	  the price of higher memory consumption.  This option is available
-	  only on R8000 and cnMIPS processors.  Note that you will need a
-	  suitable Linux distribution to support this.
+	  only on cnMIPS processors.  Note that you will need a suitable Linux
+	  distribution to support this.
=20
 config PAGE_SIZE_16KB
 	bool "16kB"
@@ -2266,7 +2253,7 @@ config CPU_HAS_PREFETCH
=20
 config CPU_GENERIC_DUMP_TLB
 	bool
-	default y if !(CPU_R3000 || CPU_R8000 || CPU_TX39XX)
+	default y if !(CPU_R3000 || CPU_TX39XX)
=20
 config MIPS_FP_SUPPORT
 	bool "Floating Point support" if EXPERT
@@ -2295,7 +2282,7 @@ config CPU_R4K_FPU
=20
 config CPU_R4K_CACHE_TLB
 	bool
-	default y if !(CPU_R3000 || CPU_R8000 || CPU_SB1 || CPU_TX39XX || CPU_CAV=
IUM_OCTEON)
+	default y if !(CPU_R3000 || CPU_SB1 || CPU_TX39XX || CPU_CAVIUM_OCTEON)
=20
 config MIPS_MT_SMP
 	bool "MIPS MT SMP support (1 TC on each available VPE)"
@@ -2552,7 +2539,6 @@ config CPU_R4400_WORKAROUNDS
 config MIPS_ASID_SHIFT
 	int
 	default 6 if CPU_R3000 || CPU_TX39XX
-	default 4 if CPU_R8000
 	default 0
=20
 config MIPS_ASID_BITS
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e507e5b6e606..cdc09b71febe 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -183,7 +183,6 @@ cflags-$(CONFIG_CPU_SB1)	+=3D $(call cc-option,-march=
=3Dsb1,-march=3Dr5000) \
 			-Wa,--trap
 cflags-$(CONFIG_CPU_SB1)	+=3D $(call cc-option,-mno-mdmx)
 cflags-$(CONFIG_CPU_SB1)	+=3D $(call cc-option,-mno-mips3d)
-cflags-$(CONFIG_CPU_R8000)	+=3D -march=3Dr8000 -Wa,--trap
 cflags-$(CONFIG_CPU_R10000)	+=3D $(call cc-option,-march=3Dr10000,-march=
=3Dr8000) \
 			-Wa,--trap
 cflags-$(CONFIG_CPU_CAVIUM_OCTEON) +=3D $(call cc-option,-march=3Docteon) =
-Wa,--trap
diff --git a/arch/mips/include/asm/addrspace.h b/arch/mips/include/asm/addr=
space.h
index 4856adc8906e..59a48c60a065 100644
--- a/arch/mips/include/asm/addrspace.h
+++ b/arch/mips/include/asm/addrspace.h
@@ -135,18 +135,9 @@
  */
 #define TO_PHYS_MASK	_CONST64_(0x07ffffffffffffff)	/* 2^^59 - 1 */
=20
-#ifndef CONFIG_CPU_R8000
-
-/*
- * The R8000 doesn't have the 32-bit compat spaces so we don't define them
- * in order to catch bugs in the source code.
- */
-
 #define COMPAT_K1BASE32		_CONST64_(0xffffffffa0000000)
 #define PHYS_TO_COMPATK1(x)	((x) | COMPAT_K1BASE32) /* 32-bit compat k1 */
=20
-#endif
-
 #define KDM_TO_PHYS(x)		(_ACAST64_ (x) & TO_PHYS_MASK)
 #define PHYS_TO_K0(x)		(_ACAST64_ (x) | CAC_BASE)
=20
diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-t=
ype.h
index 2f1677c360c4..73f4b240f95c 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -146,10 +146,6 @@ static inline int __pure __get_cpu_type(const int cpu_=
type)
 	case CPU_NEVADA:
 #endif
=20
-#ifdef CONFIG_SYS_HAS_CPU_R8000
-	case CPU_R8000:
-#endif
-
 #ifdef CONFIG_SYS_HAS_CPU_R10000
 	case CPU_R10000:
 	case CPU_R12000:
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 0f52e4b099ea..60b4dff0ff62 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -300,11 +300,6 @@ enum cpu_type_enum {
 	CPU_VR4122, CPU_VR4131, CPU_VR4133, CPU_VR4181, CPU_VR4181A, CPU_RM7000,
 	CPU_SR71000, CPU_TX49XX,
=20
-	/*
-	 * R8000 class processors
-	 */
-	CPU_R8000,
-
 	/*
 	 * TX3900 class processors
 	 */
diff --git a/arch/mips/include/asm/module.h b/arch/mips/include/asm/module.=
h
index 92cb94ef0231..ed70994fbbec 100644
--- a/arch/mips/include/asm/module.h
+++ b/arch/mips/include/asm/module.h
@@ -113,8 +113,6 @@ search_module_dbetables(unsigned long addr)
 #define MODULE_PROC_FAMILY "R5500 "
 #elif defined CONFIG_CPU_NEVADA
 #define MODULE_PROC_FAMILY "NEVADA "
-#elif defined CONFIG_CPU_R8000
-#define MODULE_PROC_FAMILY "R8000 "
 #elif defined CONFIG_CPU_R10000
 #define MODULE_PROC_FAMILY "R10000 "
 #elif defined CONFIG_CPU_RM7000
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index be717be2ca5f..62280b1070c6 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1491,15 +1491,6 @@ static inline void cpu_probe_legacy(struct cpuinfo_m=
ips *c, unsigned int cpu)
 		 */
 		c->tlbsize =3D (read_c0_info() & (1 << 29)) ? 64 : 48;
 		break;
-	case PRID_IMP_R8000:
-		c->cputype =3D CPU_R8000;
-		__cpu_name[cpu] =3D "RM8000";
-		set_isa(c, MIPS_CPU_ISA_IV);
-		c->options =3D MIPS_CPU_TLB | MIPS_CPU_4KEX |
-			     MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_LLSC;
-		c->tlbsize =3D 384;      /* has weird TLB: 3-way x 128 */
-		break;
 	case PRID_IMP_R10000:
 		c->cputype =3D CPU_R10000;
 		__cpu_name[cpu] =3D "R10000";
diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
index 1e8d335025d7..949d43eefda1 100644
--- a/arch/mips/mm/Makefile
+++ b/arch/mips/mm/Makefile
@@ -30,7 +30,6 @@ obj-$(CONFIG_DMA_NONCOHERENT)	+=3D dma-noncoherent.o
=20
 obj-$(CONFIG_CPU_R4K_CACHE_TLB) +=3D c-r4k.o cex-gen.o tlb-r4k.o
 obj-$(CONFIG_CPU_R3000)		+=3D c-r3k.o tlb-r3k.o
-obj-$(CONFIG_CPU_R8000)		+=3D c-r4k.o cex-gen.o tlb-r8k.o
 obj-$(CONFIG_CPU_SB1)		+=3D c-r4k.o cerr-sb1.o cex-sb1.o tlb-r4k.o
 obj-$(CONFIG_CPU_TX39XX)	+=3D c-tx39.o tlb-r3k.o
 obj-$(CONFIG_CPU_CAVIUM_OCTEON) +=3D c-octeon.o cex-oct.o tlb-r4k.o
diff --git a/arch/mips/mm/tlb-r8k.c b/arch/mips/mm/tlb-r8k.c
deleted file mode 100644
index c1e9e144007e..000000000000
--- a/arch/mips/mm/tlb-r8k.c
+++ /dev/null
@@ -1,239 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Pub=
lic
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 1996 David S. Miller (davem@davemloft.net)
- * Copyright (C) 1997, 1998, 1999, 2000 Ralf Baechle ralf@gnu.org
- * Carsten Langgaard, carstenl@mips.com
- * Copyright (C) 2002 MIPS Technologies, Inc.  All rights reserved.
- */
-#include <linux/sched.h>
-#include <linux/smp.h>
-#include <linux/mm.h>
-
-#include <asm/cpu.h>
-#include <asm/bootinfo.h>
-#include <asm/mmu_context.h>
-#include <asm/pgtable.h>
-
-extern void build_tlb_refill_handler(void);
-
-#define TFP_TLB_SIZE		384
-#define TFP_TLB_SET_SHIFT	7
-
-/* CP0 hazard avoidance. */
-#define BARRIER __asm__ __volatile__(".set noreorder\n\t" \
-				     "nop; nop; nop; nop; nop; nop;\n\t" \
-				     ".set reorder\n\t")
-
-void local_flush_tlb_all(void)
-{
-	unsigned long flags;
-	unsigned long old_ctx;
-	int entry;
-
-	local_irq_save(flags);
-	/* Save old context and create impossible VPN2 value */
-	old_ctx =3D read_c0_entryhi();
-	write_c0_entrylo(0);
-
-	for (entry =3D 0; entry < TFP_TLB_SIZE; entry++) {
-		write_c0_tlbset(entry >> TFP_TLB_SET_SHIFT);
-		write_c0_vaddr(entry << PAGE_SHIFT);
-		write_c0_entryhi(CKSEG0 + (entry << (PAGE_SHIFT + 1)));
-		mtc0_tlbw_hazard();
-		tlb_write();
-	}
-	tlbw_use_hazard();
-	write_c0_entryhi(old_ctx);
-	local_irq_restore(flags);
-}
-
-void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start=
,
-	unsigned long end)
-{
-	struct mm_struct *mm =3D vma->vm_mm;
-	int cpu =3D smp_processor_id();
-	unsigned long flags;
-	int oldpid, newpid, size;
-
-	if (!cpu_context(cpu, mm))
-		return;
-
-	size =3D (end - start + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
-	size =3D (size + 1) >> 1;
-
-	local_irq_save(flags);
-
-	if (size > TFP_TLB_SIZE / 2) {
-		drop_mmu_context(mm);
-		goto out_restore;
-	}
-
-	oldpid =3D read_c0_entryhi();
-	newpid =3D cpu_asid(cpu, mm);
-
-	write_c0_entrylo(0);
-
-	start &=3D PAGE_MASK;
-	end +=3D (PAGE_SIZE - 1);
-	end &=3D PAGE_MASK;
-	while (start < end) {
-		signed long idx;
-
-		write_c0_vaddr(start);
-		write_c0_entryhi(start);
-		start +=3D PAGE_SIZE;
-		tlb_probe();
-		idx =3D read_c0_tlbset();
-		if (idx < 0)
-			continue;
-
-		write_c0_entryhi(CKSEG0 + (idx << (PAGE_SHIFT + 1)));
-		tlb_write();
-	}
-	write_c0_entryhi(oldpid);
-
-out_restore:
-	local_irq_restore(flags);
-}
-
-/* Usable for KV1 addresses only! */
-void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
-{
-	unsigned long size, flags;
-
-	size =3D (end - start + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
-	size =3D (size + 1) >> 1;
-
-	if (size > TFP_TLB_SIZE / 2) {
-		local_flush_tlb_all();
-		return;
-	}
-
-	local_irq_save(flags);
-
-	write_c0_entrylo(0);
-
-	start &=3D PAGE_MASK;
-	end +=3D (PAGE_SIZE - 1);
-	end &=3D PAGE_MASK;
-	while (start < end) {
-		signed long idx;
-
-		write_c0_vaddr(start);
-		write_c0_entryhi(start);
-		start +=3D PAGE_SIZE;
-		tlb_probe();
-		idx =3D read_c0_tlbset();
-		if (idx < 0)
-			continue;
-
-		write_c0_entryhi(CKSEG0 + (idx << (PAGE_SHIFT + 1)));
-		tlb_write();
-	}
-
-	local_irq_restore(flags);
-}
-
-void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
-{
-	int cpu =3D smp_processor_id();
-	unsigned long flags;
-	int oldpid, newpid;
-	signed long idx;
-
-	if (!cpu_context(cpu, vma->vm_mm))
-		return;
-
-	newpid =3D cpu_asid(cpu, vma->vm_mm);
-	page &=3D PAGE_MASK;
-	local_irq_save(flags);
-	oldpid =3D read_c0_entryhi();
-	write_c0_vaddr(page);
-	write_c0_entryhi(newpid);
-	tlb_probe();
-	idx =3D read_c0_tlbset();
-	if (idx < 0)
-		goto finish;
-
-	write_c0_entrylo(0);
-	write_c0_entryhi(CKSEG0 + (idx << (PAGE_SHIFT + 1)));
-	tlb_write();
-
-finish:
-	write_c0_entryhi(oldpid);
-	local_irq_restore(flags);
-}
-
-/*
- * We will need multiple versions of update_mmu_cache(), one that just
- * updates the TLB with the new pte(s), and another which also checks
- * for the R4k "end of page" hardware bug and does the needy.
- */
-void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_=
t pte)
-{
-	unsigned long flags;
-	pgd_t *pgdp;
-	pmd_t *pmdp;
-	pte_t *ptep;
-	int pid;
-
-	/*
-	 * Handle debugger faulting in for debugee.
-	 */
-	if (current->active_mm !=3D vma->vm_mm)
-		return;
-
-	pid =3D read_c0_entryhi() & cpu_asid_mask(&current_cpu_data);
-
-	local_irq_save(flags);
-	address &=3D PAGE_MASK;
-	write_c0_vaddr(address);
-	write_c0_entryhi(pid);
-	pgdp =3D pgd_offset(vma->vm_mm, address);
-	pmdp =3D pmd_offset(pgdp, address);
-	ptep =3D pte_offset_map(pmdp, address);
-	tlb_probe();
-
-	write_c0_entrylo(pte_val(*ptep++) >> 6);
-	tlb_write();
-
-	write_c0_entryhi(pid);
-	local_irq_restore(flags);
-}
-
-static void probe_tlb(unsigned long config)
-{
-	struct cpuinfo_mips *c =3D &current_cpu_data;
-
-	c->tlbsize =3D 3 * 128;		/* 3 sets each 128 entries */
-}
-
-void tlb_init(void)
-{
-	unsigned int config =3D read_c0_config();
-	unsigned long status;
-
-	probe_tlb(config);
-
-	status =3D read_c0_status();
-	status &=3D ~(ST0_UPS | ST0_KPS);
-#ifdef CONFIG_PAGE_SIZE_4KB
-	status |=3D (TFP_PAGESIZE_4K << 32) | (TFP_PAGESIZE_4K << 36);
-#elif defined(CONFIG_PAGE_SIZE_8KB)
-	status |=3D (TFP_PAGESIZE_8K << 32) | (TFP_PAGESIZE_8K << 36);
-#elif defined(CONFIG_PAGE_SIZE_16KB)
-	status |=3D (TFP_PAGESIZE_16K << 32) | (TFP_PAGESIZE_16K << 36);
-#elif defined(CONFIG_PAGE_SIZE_64KB)
-	status |=3D (TFP_PAGESIZE_64K << 32) | (TFP_PAGESIZE_64K << 36);
-#endif
-	write_c0_status(status);
-
-	write_c0_wired(0);
-
-	local_flush_tlb_all();
-
-	build_tlb_refill_handler();
-}
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 9b2fcf421321..027c32310c60 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -2633,10 +2633,6 @@ void build_tlb_refill_handler(void)
 #endif
 		break;
=20
-	case CPU_R8000:
-		panic("No R8000 TLB refill handler yet");
-		break;
-
 	default:
 		if (cpu_has_ldpte)
 			setup_pw();
--=20
2.22.0

