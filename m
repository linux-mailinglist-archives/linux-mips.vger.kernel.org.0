Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23F9A9E2A8
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 10:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730370AbfH0I2p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 04:28:45 -0400
Received: from mail-eopbgr710099.outbound.protection.outlook.com ([40.107.71.99]:26624
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729326AbfH0I2o (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 04:28:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2aOvwDo3DO7TJy/M2WHGw70FTL4gdfWaU9TxnbbuK8SCy8LDjPkDbXbpDR/tuGmLl+Lab+Y0qksU8mpuJb76hwQ/RJs7XlQQh3Due30YbJ6gRwW5YfsUDH3/XDkxE8t+pFfx7FHIe1gICcrZMMhrYy4sB/OGT2/znL3Guqvxqc0Gml58l2fik/mS13481rc+2aem4SH1uygMOLTulBl3yWymUMSI3cQr76v8xxo7r6xer8S/Y1y8jkCisEBNODJYpuRtPc6Dt5BLvrCgqHT2dC2BG7QypTQfiMmnL1HtcZvj0AKVDy6YRce2Uo96aII5zU1vPK2Sfgb6zTo+6omoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlxRSdDYNyWqaoSoF6dR0ioPgO8EG1dRFe4ZZiCSTmQ=;
 b=hIK1kMHnbm7VdE3PGMG1xX4QK5ecqfX5xynjqiBH1cW1JBM5vdt6xtN/MkCVjcrMncqo7ZpiuXO4UZVDhzKt5jPj0t5sM3+i/45H9I0awGn509viA0eae72GY6mk3dVGQoz79W7Z/41lj6ALLW6b7lyiXwcMwIqvkJRdwx+mhUc2RXToKRaKCsf7b/kjr1Q6CohoYxctzlw2vkCzdRfaKTEMODi4njI0jey0GC7gG6ul0+L0wjYlyKgaIZUdkHVxzFh7hlnQG7BvEdqD10AwVqAhkjfyzFzUT9BTmNI67Yv4CPYew5j68E4SfqaT4dWQgNex+CXAdXnsoOUPZv3yTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=wavecomp.com;
 dkim=pass header.d=wavecomp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlxRSdDYNyWqaoSoF6dR0ioPgO8EG1dRFe4ZZiCSTmQ=;
 b=d2QHgtTQCAo/wa8BvjzT3x+bpEZd1zsaVmX0cKayVWVPCxmpy0gMraMk7+lBoH7xG/SEXs5PDETJoDhvr+HjwlBu9GZtqKos+1PYXgi13aBLGi4wXqRj88mVg8vi842KfB4UQlZbTk7qUv1TecG5L+ILqPHlDwYmW00a09Q4kTs=
Received: from MWHPR2201MB1119.namprd22.prod.outlook.com (10.174.169.157) by
 MWHPR2201MB1486.namprd22.prod.outlook.com (10.174.170.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 08:28:38 +0000
Received: from MWHPR2201MB1119.namprd22.prod.outlook.com
 ([fe80::e4d2:1317:ef3:82d8]) by MWHPR2201MB1119.namprd22.prod.outlook.com
 ([fe80::e4d2:1317:ef3:82d8%7]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 08:28:38 +0000
From:   Tommy Jin <tjin@wavecomp.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Zhongwu Zhu <zzhu@wavecomp.com>, Tommy Jin <tjin@wavecomp.com>
Subject: [PATCH] MIPS64: add KASAN support
Thread-Topic: [PATCH] MIPS64: add KASAN support
Thread-Index: AQHVXLFs0tG/c5h8Kka7BqSfDHskmQ==
Date:   Tue, 27 Aug 2019 08:28:38 +0000
Message-ID: <1566894474-31011-1-git-send-email-tjin@wavecomp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To MWHPR2201MB1119.namprd22.prod.outlook.com
 (2603:10b6:301:33::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tjin@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [218.108.86.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f01d8217-f2e7-4720-398a-08d72ac88eef
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1486;
x-ms-traffictypediagnostic: MWHPR2201MB1486:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1486C6D6AD1E0E800B833A7AB8A00@MWHPR2201MB1486.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(396003)(376002)(366004)(39840400004)(189003)(199004)(386003)(99286004)(30864003)(6506007)(478600001)(5660300002)(86362001)(186003)(26005)(66556008)(64756008)(14454004)(52116002)(6916009)(2351001)(6436002)(3846002)(6486002)(316002)(66476007)(71200400001)(54906003)(107886003)(6512007)(2501003)(102836004)(66446008)(5640700003)(53946003)(66946007)(53936002)(6116002)(256004)(25786009)(4326008)(36756003)(14444005)(81166006)(8676002)(50226002)(8936002)(81156014)(66066001)(7736002)(305945005)(476003)(2906002)(486006)(71190400001)(2616005)(2004002)(559001)(579004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1486;H:MWHPR2201MB1119.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: weSYm1cZ3oMPfXXiby3kBlTtHIhRsZgWQZbp/UXbuhXFBFgpj5DxraXbC8JCXvwPW49wWuj6KaKa27Q8TySawUlSIpRPb4kgu2kbHHuqlu4bLFd5Ke6cALerSV78+fwnw2AePa4SXCSJ1KH+aCrHQakToFXMOkurlsJICSSIt9Er7xcCu4AE/MC+vPcDXdthgba15XPT2DnnrPg+ks2KogE1ByM59d5lUuH7vv/TqDLrfEvdQ79ZxZpbqEz3JTqEpPPqPRStFSFKJJAihO8xov7F9bXACLqeuf0htn9gniow5DBEjpHVgbANipWa8jbzqTmNbWRCOqSPcEgJGdgfXCjVtDFj9KSVAYcL2T4J2GkmOm4jGz29gCNAMeBw74oM8bITF9vn9t9c2jYPtKMKG2kvR1MwcLxWVqttwUhckqk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01d8217-f2e7-4720-398a-08d72ac88eef
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 08:28:38.3648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3cikIOfZE09ANCZ8FSxFudpswvcdV52PlhsOmdmcHF5C20KCiTR94+iGK76R5dn6dF8CpeO//mZbzrJrYnladQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1486
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: tjin <tjin@wavecomp.com>

This patch adds arch specific code for kernel address sanitizer

1/8 of kernel addresses reserved for shadow memory. But for misp64,
There are a lot of holes between different segments and valid address
space(256T available) is insufficient to map all these segments
(Scattered in 8192P space) to kasan shadow memory with the common
formula provided by kasan core, saying
addr >> KASAN_SHADOW_SCALE_SHIFT) + KASAN_SHADOW_OFFSET

So MIPS64 has a ARCH specific mapping formula,different segments
are mapped individually, and only limited length of space of that
specific segment is mapped to shadow. for example,XKPHYS CACHE starts
from 0xa800000000000000, around 1T of this segment is going be mapped
to shadow in case that 40-bit address is using.
XKPHYS UNCACHE starts from 0x9000000000000000, the gap between
0xa800000000000000 + 1T and 0x9000000000000000 is not going to be
mapped to shadow.

At early boot stage the whole shadow region populated with just
one physical page (kasan_early_shadow_page). Later, this page is
reused as readonly zero shadow for some memory that Kasan currently
don't track.
After mapping the physical memory, pages for shadow memory are
allocated and mapped.

Functions like memset/memmove/memcpy do a lot of memory accesses.
If bad pointer passed to one of these function it is important
to catch this. Compiler's instrumentation cannot do this since
these functions are written in assembly.
KASan replaces memory functions with manually instrumented variants.
Original functions declared as weak symbols so strong definitions
in mm/kasan/kasan.c could replace them. Original functions have aliases
with '__' prefix in name, so we could call non-instrumented variant
if needed.

Some files built without kasan instrumentation(e.g. mm/slub.c).
Original mem* function replaced (via #define) with prefixed variants
to disable memory access checks for such files.

With GCC, it requires 9.0 or later version for the basic support of
MIPS address SANitizer.

Signed-off-by: tjin <tjin@wavecomp.com>
---
 arch/mips/Kconfig                  |   1 +
 arch/mips/include/asm/kasan.h      | 201 +++++++++++++++++++++++++++++++++=
+
 arch/mips/include/asm/pgtable-64.h |  12 ++-
 arch/mips/include/asm/string.h     |  20 ++++
 arch/mips/kernel/Makefile          |   8 ++
 arch/mips/kernel/head.S            |   3 +
 arch/mips/kernel/setup.c           |   3 +
 arch/mips/kernel/traps.c           |  11 ++
 arch/mips/lib/memcpy.S             |  20 ++--
 arch/mips/lib/memset.S             |  18 ++--
 arch/mips/mm/Makefile              |   5 +
 arch/mips/mm/kasan_init.c          | 216 +++++++++++++++++++++++++++++++++=
++++
 arch/mips/vdso/Makefile            |   5 +
 include/linux/kasan.h              |   2 +
 mm/kasan/generic.c                 |  17 ++-
 mm/kasan/kasan.h                   |   2 +
 16 files changed, 522 insertions(+), 22 deletions(-)
 create mode 100644 arch/mips/include/asm/kasan.h
 create mode 100644 arch/mips/mm/kasan_init.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 70d3200..0ed8eb0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -80,6 +80,7 @@ config MIPS
 	select RTC_LIB
 	select SYSCTL_EXCEPTION_TRACE
 	select VIRT_TO_BUS
+	select HAVE_ARCH_KASAN if 64BIT
=20
 menu "Machine selection"
=20
diff --git a/arch/mips/include/asm/kasan.h b/arch/mips/include/asm/kasan.h
new file mode 100644
index 0000000..62e75d1
--- /dev/null
+++ b/arch/mips/include/asm/kasan.h
@@ -0,0 +1,201 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_KASAN_H
+#define __ASM_KASAN_H
+
+#ifndef __ASSEMBLY__
+
+#include <linux/linkage.h>
+#include <asm/addrspace.h>
+#include <asm/pgtable-64.h>
+
+#define KASAN_SHADOW_SCALE_SHIFT 3
+#define KASAN_SHADOW_OFFSET 0
+
+#define XSEG_SHIFT (56)
+/* 32-bit compatatibility address length .*/
+#define CSEG_SHIFT (28)
+
+/* Valid address length. */
+#define XXSEG_SHADOW_SHIFT (PGDIR_SHIFT + PGD_ORDER + PAGE_SHIFT - 3)
+/* Used for taking out the valid address. */
+#define XXSEG_SHADOW_MASK  GENMASK_ULL(XXSEG_SHADOW_SHIFT - 1, 0)
+/* One segment whole address space size. */
+#define	XXSEG_SIZE (XXSEG_SHADOW_MASK + 1)
+
+#define CKSEG_SHADOW_MASK  GENMASK_ULL(CSEG_SHIFT - 1, 0)
+/* One segment whole address space size. */
+#define	CKSEG_SIZE (CKSEG_SHADOW_MASK + 1)
+
+/* Mask used to take CSEG segmet value, e.g. CKSEGx_SEG.
+ * Take one bit more to cover segment start from:
+ * - 0xFFFF FFFF 9000 0000
+ * - 0xFFFF FFFF B000 0000
+ * - 0xFFFF FFFF F000 0000
+ */
+#define CSEG_SHIFT_1BM (CSEG_SHIFT + 1)
+#define CSSEG_SHADOW_MASK_1BM GENMASK_ULL(CSEG_SHIFT_1BM - 1, 0)
+
+/* 64-bit segment value. */
+#define XKPHYS_CACHE_SEG	(0xa8)
+#define XKPHYS_UNCACHE_SEG	(0x90)
+#define XKSEG_SEG	(0xc0)
+
+/* 32-bit compatatibility segment value.
+ * Shift the address CSEG_SHIFT bit to the left, then &0F can get this val=
ue.
+ */
+#define CKSEGX_SEG	(0xff)
+#define CKSEG0_SEG	(0x08)
+#define CKSEG1_SEG	(0x0a)
+#define CSSEG_SEG	(0x0c)
+#define CKSEG3_SEG	(0x0e)
+/* COH_SHAREABLE */
+#define XKPHYS_CACHE_START	(0xa800000000000000)
+#define XKPHYS_CACHE_SIZE	XXSEG_SIZE
+#define XKPHYS_CACHE_KASAN_OFFSET	(0)
+#define XKPHYS_CACHE_SHADOW_SIZE	(XKPHYS_CACHE_SIZE >> KASAN_SHADOW_SCALE_=
SHIFT)
+#define XKPHYS_CACHE_SHADOW_END	(XKPHYS_CACHE_KASAN_OFFSET + XKPHYS_CACHE_=
SHADOW_SIZE)
+/* IO/UNCACHED */
+#define XKPHYS_UNCACHE_START		(0x9000000000000000)
+#define XKPHYS_UNCACHE_SIZE			XXSEG_SIZE
+#define XKPHYS_UNCACHE_KASAN_OFFSET	XKPHYS_CACHE_SHADOW_END
+#define XKPHYS_UNCACHE_SHADOW_SIZE	(XKPHYS_UNCACHE_SIZE >> KASAN_SHADOW_SC=
ALE_SHIFT)
+#define XKPHYS_UNCACHE_SHADOW_END	(XKPHYS_UNCACHE_KASAN_OFFSET + XKPHYS_UN=
CACHE_SHADOW_SIZE)
+/* VMALLOC  */
+#define XKSEG_VMALLOC_START VMALLOC_START
+/* 1MB alignment. */
+#define XKSEG_VMALLOC_SIZE			round_up(VMALLOC_END - VMALLOC_START + 1, 0x1=
0000)
+#define XKSEG_VMALLOC_KASAN_OFFSET	XKPHYS_UNCACHE_SHADOW_END
+#define XKPHYS_VMALLOC_SHADOW_SIZE	(XKSEG_VMALLOC_SIZE >> KASAN_SHADOW_SCA=
LE_SHIFT)
+#define XKPHYS_VMALLOC_SHADOW_END	(XKSEG_VMALLOC_KASAN_OFFSET + XKPHYS_VMA=
LLOC_SHADOW_SIZE)
+
+/* 32-bit compatibiity address space. */
+#define CKSEG0_START	(0xffffffff80000000)
+#define CKSEG0_SIZE		CKSEG_SIZE
+#define CKSEG0_KASAN_OFFSET	XKPHYS_VMALLOC_SHADOW_END
+#define CKSEG0_SHADOW_SIZE	(CKSEG0_SIZE >> KASAN_SHADOW_SCALE_SHIFT)
+#define CKSEG0_SHADOW_END	(CKSEG0_KASAN_OFFSET + CKSEG0_SHADOW_SIZE)
+
+#define CKSEG1_START (0xffffffffa0000000)
+#define CKSEG1_SIZE  CKSEG_SIZE
+#define CKSEG1_KASAN_OFFSET CKSEG0_SHADOW_END
+#define CKSEG1_SHADOW_SIZE	(CKSEG1_SIZE >> KASAN_SHADOW_SCALE_SHIFT)
+#define CKSEG1_SHADOW_END	(CKSEG1_KASAN_OFFSET + CKSEG1_SHADOW_SIZE)
+
+#define CSSEG_START  (0xffffffffc0000000)
+#define CSSEG_SIZE  CKSEG_SIZE
+#define CSSEG_KASAN_OFFSET CKSEG1_SHADOW_END
+#define CSSEG_SHADOW_SIZE	(CSSEG_SIZE >> KASAN_SHADOW_SCALE_SHIFT)
+#define CSSEG_SHADOW_END	(CSSEG_KASAN_OFFSET + CSSEG_SHADOW_SIZE)
+
+#define CKSEG3_START (0xffffffffe0000000)
+#define CKSEG3_SIZE  CKSEG_SIZE
+#define CKSEG3_KASAN_OFFSET (CSSEG_KASAN_OFFSET + (CSSEG_SIZE >> KASAN_SHA=
DOW_SCALE_SHIFT))
+#define CKSEG3_SHADOW_SIZE	(CKSEG3_SIZE >> KASAN_SHADOW_SCALE_SHIFT)
+#define CKSEG3_SHADOW_END	(CKSEG3_KASAN_OFFSET + CKSEG3_SHADOW_SIZE)
+
+/* Kasan shadow memory start right after vmalloc. */
+#define KASAN_SHADOW_START	round_up(VMALLOC_END, PGDIR_SIZE)
+#define KASAN_SHADOW_SIZE	(CKSEG3_SHADOW_END - XKPHYS_CACHE_KASAN_OFFSET)
+#define KASAN_SHADOW_END	round_up(KASAN_SHADOW_START + KASAN_SHADOW_SIZE, =
PGDIR_SIZE)
+
+#define XKPHYS_CACHE_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPHYS_CACHE_KASA=
N_OFFSET)
+#define XKPHYS_UNCACHE_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPHYS_UNCACHE_=
KASAN_OFFSET)
+#define XKSEG_SHADOW_OFFSET	(KASAN_SHADOW_START + XKSEG_VMALLOC_KASAN_OFFS=
ET)
+#define CKSEG0_SHADOW_OFFSET	(KASAN_SHADOW_START + CKSEG0_KASAN_OFFSET)
+#define CKSEG1_SHADOW_OFFSET	(KASAN_SHADOW_START + CKSEG1_KASAN_OFFSET)
+#define CSSEG_SHADOW_OFFSET	(KASAN_SHADOW_START + CSSEG_KASAN_OFFSET)
+#define CKSEG3_SHADOW_OFFSET	(KASAN_SHADOW_START + CKSEG3_KASAN_OFFSET)
+
+extern bool kasan_early_stage;
+extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
+static inline void *kasan_mem_to_shadow(const void *addr)
+{
+	if (kasan_early_stage) {
+		return (void *)(kasan_early_shadow_page);
+	} else {
+		unsigned long maddr =3D (unsigned long)addr;
+		unsigned char xreg =3D (maddr >> XSEG_SHIFT) & 0xff;
+		unsigned char creg =3D (maddr >> CSEG_SHIFT) & 0x0f;
+		unsigned long offset =3D 0;
+
+		maddr &=3D XXSEG_SHADOW_MASK;
+		switch (xreg) { /*xkphys,cached*/
+		case XKPHYS_CACHE_SEG:
+			offset =3D XKPHYS_CACHE_SHADOW_OFFSET;
+			break;
+		case XKPHYS_UNCACHE_SEG:/* xkphys, uncached*/
+			offset =3D XKPHYS_UNCACHE_SHADOW_OFFSET;
+			break;
+		case XKSEG_SEG:/* xkseg*/
+			offset =3D XKSEG_SHADOW_OFFSET;
+			break;
+		case CKSEGX_SEG:/* cksegx*/
+			maddr &=3D  CSSEG_SHADOW_MASK_1BM;
+			switch (creg) {
+			case CKSEG0_SEG:
+			case (CKSEG0_SEG + 1):
+				offset =3D CKSEG0_SHADOW_OFFSET;
+				break;
+			case CKSEG1_SEG:
+			case (CKSEG1_SEG + 1):
+				offset =3D CKSEG1_SHADOW_OFFSET;
+				break;
+			case CSSEG_SEG:
+			case (CSSEG_SEG + 1):
+				offset =3D CSSEG_SHADOW_OFFSET;
+				break;
+			case CKSEG3_SEG:
+			case (CKSEG3_SEG + 1):
+				offset =3D CKSEG3_SHADOW_OFFSET;
+				break;
+			default:
+				WARN_ON(1);
+				return NULL;
+			}
+			break;
+		default:/*unlikely*/
+		    WARN_ON(1);
+			return NULL;
+		}
+
+		return (void *)((maddr >> KASAN_SHADOW_SCALE_SHIFT) + offset);
+	}
+}
+
+static inline const void *kasan_shadow_to_mem(const void *shadow_addr)
+{
+	unsigned long addr =3D (unsigned long)shadow_addr;
+
+	if (unlikely(addr > KASAN_SHADOW_END) ||
+		unlikely(addr < KASAN_SHADOW_START)) {
+		WARN_ON(1);
+		return NULL;
+	}
+
+	if (addr >=3D CKSEG3_SHADOW_OFFSET)
+		return (void *)(((addr - CKSEG3_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHI=
FT) + CKSEG3_START);
+	else if (addr >=3D CSSEG_SHADOW_OFFSET)
+		return (void *)(((addr - CSSEG_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIF=
T) + CSSEG_START);
+	else if (addr >=3D CKSEG1_SHADOW_OFFSET)
+		return (void *)(((addr - CKSEG1_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHI=
FT) + CKSEG1_START);
+	else if (addr >=3D CKSEG0_SHADOW_OFFSET)
+		return (void *)(((addr - CKSEG0_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHI=
FT) + CKSEG0_START);
+	else if (addr >=3D XKSEG_SHADOW_OFFSET)
+		return (void *)(((addr - XKSEG_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIF=
T) + XKSEG_VMALLOC_START);
+	else if (addr >=3D XKPHYS_UNCACHE_SHADOW_OFFSET)
+		return (void *)(((addr - XKPHYS_UNCACHE_SHADOW_OFFSET) << KASAN_SHADOW_S=
CALE_SHIFT) + XKPHYS_UNCACHE_START);
+	else if (addr >=3D XKPHYS_CACHE_SHADOW_OFFSET)
+		return (void *)(((addr - XKPHYS_CACHE_SHADOW_OFFSET) << KASAN_SHADOW_SCA=
LE_SHIFT) + XKPHYS_CACHE_START);
+	else
+		WARN_ON(1);
+
+	return NULL;
+}
+
+#define __HAVE_ARCH_SHADOW_MAP
+
+void kasan_init(void);
+asmlinkage void kasan_early_init(void);
+
+#endif
+#endif
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgt=
able-64.h
index 93a9dce..e3f5c4e 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -144,10 +144,17 @@
  * reliably trap.
  */
 #define VMALLOC_START		(MAP_BASE + (2 * PAGE_SIZE))
+#ifdef CONFIG_KASAN
+#define VMALLOC_END	\
+	(MAP_BASE + \
+	 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * PAGE_SIZ=
E / 2, \
+	     (1UL << cpu_vmbits)) - (1UL << 32))
+#else
 #define VMALLOC_END	\
 	(MAP_BASE + \
 	 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * PAGE_SIZ=
E, \
 	     (1UL << cpu_vmbits)) - (1UL << 32))
+#endif
=20
 #if defined(CONFIG_MODULES) && defined(KBUILD_64BIT_SYM32) && \
 	VMALLOC_START !=3D CKSSEG
@@ -352,7 +359,8 @@ static inline pmd_t *pmd_offset(pud_t * pud, unsigned l=
ong address)
 #define pte_offset_map(dir, address)					\
 	((pte_t *)page_address(pmd_page(*(dir))) + __pte_offset(address))
 #define pte_unmap(pte) ((void)(pte))
-
+#define pte_index(addr)		(((addr) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1))
+#define pte_none(pte)		(!(pte_val(pte) & ~_PAGE_GLOBAL))
 /*
  * Initialize a new pgd / pmd table with invalid pointers.
  */
@@ -372,5 +380,5 @@ static inline pte_t mk_swap_pte(unsigned long type, uns=
igned long offset)
 #define __swp_entry(type, offset) ((swp_entry_t) { pte_val(mk_swap_pte((ty=
pe), (offset))) })
 #define __pte_to_swp_entry(pte) ((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
-
+#define sym_to_pfn(x)	    __phys_to_pfn(__pa_symbol(x))
 #endif /* _ASM_PGTABLE_64_H */
diff --git a/arch/mips/include/asm/string.h b/arch/mips/include/asm/string.=
h
index 29030cb..19d3740 100644
--- a/arch/mips/include/asm/string.h
+++ b/arch/mips/include/asm/string.h
@@ -133,11 +133,31 @@ strncmp(__const__ char *__cs, __const__ char *__ct, s=
ize_t __count)
=20
 #define __HAVE_ARCH_MEMSET
 extern void *memset(void *__s, int __c, size_t __count);
+extern void *__memset(void *__s, int __c, size_t __count);
=20
 #define __HAVE_ARCH_MEMCPY
 extern void *memcpy(void *__to, __const__ void *__from, size_t __n);
+extern void *__memcpy(void *__to, __const__ void *__from, size_t __n);
=20
 #define __HAVE_ARCH_MEMMOVE
 extern void *memmove(void *__dest, __const__ void *__src, size_t __n);
+extern void *__memmove(void *__dest, __const__ void *__src, size_t __n);
+
+#if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
+
+/*
+ * For files that are not instrumented (e.g. mm/slub.c) we
+ * should use not instrumented version of mem* functions.
+ */
+
+#define memcpy(dst, src, len) __memcpy(dst, src, len)
+#define memmove(dst, src, len) __memmove(dst, src, len)
+#define memset(s, c, n) __memset(s, c, n)
+
+#ifndef __NO_FORTIFY
+#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
+#endif
+
+#endif
=20
 #endif /* _ASM_STRING_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 89b07ea..196564b 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -17,6 +17,14 @@ CFLAGS_REMOVE_perf_event.o =3D -pg
 CFLAGS_REMOVE_perf_event_mipsxx.o =3D -pg
 endif
=20
+KASAN_SANITIZE_head.o :=3D n
+KASAN_SANITIZE_spram.o :=3D n
+KASAN_SANITIZE_traps.o :=3D n
+KASAN_SANITIZE_vdso.o :=3D n
+KASAN_SANITIZE_watch.o :=3D n
+KASAN_SANITIZE_stacktrace.o :=3D n
+KASAN_SANITIZE_cpu-probe.o :=3D n
+
 obj-$(CONFIG_CEVT_BCM1480)	+=3D cevt-bcm1480.o
 obj-$(CONFIG_CEVT_R4K)		+=3D cevt-r4k.o
 obj-$(CONFIG_CEVT_DS1287)	+=3D cevt-ds1287.o
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 351d40f..f2e4910 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -159,6 +159,9 @@ dtb_found:
 	 */
 	jr.hb		v0
 #else  /* !CONFIG_RELOCATABLE */
+#ifdef CONFIG_KASAN
+	jal kasan_early_init
+#endif /* CONFIG_KASAN */
 	j		start_kernel
 #endif /* !CONFIG_RELOCATABLE */
 	END(kernel_entry)
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index ab349d2..7c28fe4 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -942,6 +942,9 @@ void __init setup_arch(char **cmdline_p)
=20
 	cpu_cache_init();
 	paging_init();
+#if defined(CONFIG_KASAN)
+	kasan_init();
+#endif
 }
=20
 unsigned long kernelsp[NR_CPUS];
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index c52766a..a63ff86 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2273,6 +2273,17 @@ void __init trap_init(void)
 	unsigned long i, vec_size;
 	phys_addr_t ebase_pa;
=20
+	/*
+	 * If kasan is enabled, instrumented code may cause tlb excpetion.
+	 * trap_init will be called in kasan_init, once tarp is initialized,
+	 * ebase should be a non-zero value , so use it as a flag that trap
+	 * won't be initialized more than once.
+	 */
+#if defined(CONFIG_KASAN)
+	if (ebase)
+		return;
+#endif
+
 	check_wait();
=20
 	if (!cpu_has_mips_r2_r6) {
diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
index cdd19d85..a150f0b 100644
--- a/arch/mips/lib/memcpy.S
+++ b/arch/mips/lib/memcpy.S
@@ -271,10 +271,10 @@
 	 */
 	.macro __BUILD_COPY_USER mode, from, to
=20
-	/* initialize __memcpy if this the first time we execute this macro */
-	.ifnotdef __memcpy
-	.set __memcpy, 1
-	.hidden __memcpy /* make sure it does not leak */
+	/* initialize _memcpy if this the first time we execute this macro */
+	.ifnotdef _memcpy
+	.set _memcpy, 1
+	.hidden _memcpy /* make sure it does not leak */
 	.endif
=20
 	/*
@@ -535,10 +535,10 @@
 	b	1b
 	 ADD	dst, dst, 8
 #endif /* !CONFIG_CPU_HAS_LOAD_STORE_LR */
-	.if __memcpy =3D=3D 1
+	.if _memcpy =3D=3D 1
 	END(memcpy)
-	.set __memcpy, 0
-	.hidden __memcpy
+	.set _memcpy, 0
+	.hidden _memcpy
 	.endif
=20
 .Ll_exc_copy\@:
@@ -599,6 +599,9 @@ SEXC(1)
 	.endm
=20
 	.align	5
+    .weak memmove
+FEXPORT(__memmove)
+EXPORT_SYMBOL(__memmove)
 LEAF(memmove)
 EXPORT_SYMBOL(memmove)
 	ADD	t0, a0, a2
@@ -656,6 +659,9 @@ LEAF(__rmemcpy)					/* a0=3Ddst a1=3Dsrc a2=3Dlen */
  * memcpy sets v0 to dst.
  */
 	.align	5
+    .weak memcpy
+FEXPORT(__memcpy)
+EXPORT_SYMBOL(__memcpy)
 LEAF(memcpy)					/* a0=3Ddst a1=3Dsrc a2=3Dlen */
 EXPORT_SYMBOL(memcpy)
 	move	v0, dst				/* return value */
diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
index 418611e..0234328 100644
--- a/arch/mips/lib/memset.S
+++ b/arch/mips/lib/memset.S
@@ -86,10 +86,10 @@
 	 * mode: LEGACY_MODE or EVA_MODE
 	 */
 	.macro __BUILD_BZERO mode
-	/* Initialize __memset if this is the first time we call this macro */
-	.ifnotdef __memset
-	.set __memset, 1
-	.hidden __memset /* Make sure it does not leak */
+	/* Initialize _memset if this is the first time we call this macro */
+	.ifnotdef _memset
+	.set _memset, 1
+	.hidden _memset /* Make sure it does not leak */
 	.endif
=20
 	sltiu		t0, a2, STORSIZE	/* very small region? */
@@ -228,10 +228,10 @@
=20
 2:	move		a2, zero
 	jr		ra			/* done */
-	.if __memset =3D=3D 1
+	.if _memset =3D=3D 1
 	END(memset)
-	.set __memset, 0
-	.hidden __memset
+	.set _memset, 0
+	.hidden _memset
 	.endif
=20
 #ifndef CONFIG_CPU_HAS_LOAD_STORE_LR
@@ -295,7 +295,9 @@
  * a1: char to fill with
  * a2: size of area to clear
  */
-
+    .weak memset
+FEXPORT(__memset)
+EXPORT_SYMBOL(__memset)
 LEAF(memset)
 EXPORT_SYMBOL(memset)
 	move		v0, a0			/* result */
diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
index f34d7ff..cf2a4a9 100644
--- a/arch/mips/mm/Makefile
+++ b/arch/mips/mm/Makefile
@@ -41,3 +41,8 @@ obj-$(CONFIG_R5000_CPU_SCACHE)	+=3D sc-r5k.o
 obj-$(CONFIG_RM7000_CPU_SCACHE) +=3D sc-rm7k.o
 obj-$(CONFIG_MIPS_CPU_SCACHE)	+=3D sc-mips.o
 obj-$(CONFIG_SCACHE_DEBUGFS)	+=3D sc-debugfs.o
+obj-$(CONFIG_KASAN)     +=3D kasan_init.o
+KASAN_SANITIZE_kasan_init.o     :=3D n
+KASAN_SANITIZE_pgtable-64.o     :=3D n
+KASAN_SANITIZE_tlb-r4k.o        :=3D n
+KASAN_SANITIZE_tlbex.o          :=3D n
diff --git a/arch/mips/mm/kasan_init.c b/arch/mips/mm/kasan_init.c
new file mode 100644
index 0000000..8ef1275
--- /dev/null
+++ b/arch/mips/mm/kasan_init.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * This file contains kasan initialization code for MIPS64.
+ *
+ * Author: Tommy Jin <tjin@wavecomp.com> Zhongwu Zhu<zzhu@wavecomp.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#define pr_fmt(fmt) "kasan: " fmt
+#include <linux/kasan.h>
+#include <linux/kernel.h>
+#include <linux/sched/task.h>
+#include <linux/memblock.h>
+#include <linux/start_kernel.h>
+#include <linux/mm.h>
+#include <linux/cpu.h>
+
+#include <asm/mmu_context.h>
+#include <asm/page.h>
+#include <asm/pgalloc.h>
+#include <asm/pgtable.h>
+#include <asm/sections.h>
+#include <asm/tlbflush.h>
+
+#define __pgd_none(early, pgd) (early ? (pgd_val(pgd) =3D=3D 0) : \
+(__pa(pgd_val(pgd)) =3D=3D (unsigned long)__pa(kasan_early_shadow_pmd)))
+
+#define __pmd_none(early, pmd) (early ? (pmd_val(pmd) =3D=3D 0) : \
+(__pa(pmd_val(pmd)) =3D=3D (unsigned long)__pa(kasan_early_shadow_pte)))
+
+#define __pte_none(early, pte) (early ? pte_none(pte) : \
+((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_early_shadow_=
page)))
+
+bool kasan_early_stage =3D true;
+
+/*
+ * Alloc memory for shadow memory page table.
+ */
+static phys_addr_t __init kasan_alloc_zeroed_page(int node)
+{
+	void *p =3D memblock_alloc_try_nid(PAGE_SIZE, PAGE_SIZE,
+					__pa(MAX_DMA_ADDRESS),
+						MEMBLOCK_ALLOC_ACCESSIBLE, node);
+	return __pa(p);
+}
+
+static pte_t *kasan_pte_offset(pmd_t *pmdp, unsigned long addr, int node,
+				      bool early)
+{
+	if (__pmd_none(early, READ_ONCE(*pmdp))) {
+		phys_addr_t pte_phys =3D early ?
+				__pa_symbol(kasan_early_shadow_pte)
+					: kasan_alloc_zeroed_page(node);
+		if (!early)
+			memcpy(__va(pte_phys), kasan_early_shadow_pte,
+				sizeof(kasan_early_shadow_pte));
+
+		pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
+	}
+
+	return pte_offset_kernel(pmdp, addr);
+}
+
+static inline void kasan_set_pgd(pgd_t *pgdp, pgd_t pgdval)
+{
+	WRITE_ONCE(*pgdp, pgdval);
+}
+
+static pmd_t *kasan_pmd_offset(pgd_t *pgdp, unsigned long addr, int node,
+				      bool early)
+{
+	if (__pgd_none(early, READ_ONCE(*pgdp))) {
+		phys_addr_t pmd_phys =3D early ?
+				__pa_symbol(kasan_early_shadow_pmd)
+					: kasan_alloc_zeroed_page(node);
+		if (!early)
+			memcpy(__va(pmd_phys), kasan_early_shadow_pmd,
+				sizeof(kasan_early_shadow_pmd));
+		kasan_set_pgd(pgdp, __pgd((unsigned long)__va(pmd_phys)));
+	}
+
+	return (pmd_t *)((pmd_t *)pgd_val(*pgdp) + pmd_index(addr));
+}
+
+static void  kasan_pte_populate(pmd_t *pmdp, unsigned long addr,
+				      unsigned long end, int node, bool early)
+{
+	unsigned long next;
+	pte_t *ptep =3D kasan_pte_offset(pmdp, addr, node, early);
+
+	do {
+		phys_addr_t page_phys =3D early ?
+					__pa_symbol(kasan_early_shadow_page)
+					      : kasan_alloc_zeroed_page(node);
+		next =3D addr + PAGE_SIZE;
+		set_pte(ptep, pfn_pte(__phys_to_pfn(page_phys), PAGE_KERNEL));
+	} while (ptep++, addr =3D next, addr !=3D end && __pte_none(early, READ_O=
NCE(*ptep)));
+}
+
+static void kasan_pmd_populate(pgd_t *pgdp, unsigned long addr,
+				      unsigned long end, int node, bool early)
+{
+	unsigned long next;
+	pmd_t *pmdp =3D kasan_pmd_offset(pgdp, addr, node, early);
+
+	do {
+		next =3D pmd_addr_end(addr, end);
+		kasan_pte_populate(pmdp, addr, next, node, early);
+	} while (pmdp++, addr =3D next, addr !=3D end && __pmd_none(early, READ_O=
NCE(*pmdp)));
+}
+
+static void __init kasan_pgd_populate(unsigned long addr, unsigned long en=
d,
+				      int node, bool early)
+{
+	unsigned long next;
+	pgd_t *pgdp;
+
+	pgdp =3D pgd_offset_k(addr);
+
+	do {
+		next =3D pgd_addr_end(addr, end);
+		kasan_pmd_populate(pgdp, addr, next, node, early);
+	} while (pgdp++, addr =3D next, addr !=3D end);
+}
+
+/* The early shadow maps everything to a single page of zeroes */
+asmlinkage void __init kasan_early_init(void)
+{
+	BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_START, PGDIR_SIZE));
+	BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_END, PGDIR_SIZE));
+}
+
+/* Set up full kasan mappings, ensuring that the mapped pages are zeroed *=
/
+static void __init kasan_map_populate(unsigned long start, unsigned long e=
nd,
+				      int node)
+{
+	kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, false);
+}
+
+static void __init clear_pgds(unsigned long start,
+			unsigned long end)
+{
+	for (; start < end; start +=3D PGDIR_SIZE)
+		kasan_set_pgd((pgd_t *)pgd_offset_k(start), __pgd(0));
+}
+
+void __init kasan_init(void)
+{
+	u64 kimg_shadow_start, kimg_shadow_end;
+	struct memblock_region *reg;
+	int i;
+
+	/*
+	 * Instrumented code may cause tlb excpetion,
+	 * so if kasan if enabled, We need to init trap
+	 */
+	trap_init();
+
+	/*
+	 * Pgd was populated as invalid_pmd_table or invalid_pud_table
+	 * in pagetable_init() which depends on how many levels of page
+	 * table you are using, but we had to clean the gpd of kasan
+	 * shadow memory, as the pgd value is none-zero.
+	 * The assertion pgd_none is gong to be false and the formal populate
+	 * afterwards is not going to create any new pgd at all.
+	 */
+	clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
+
+	/* Maps everything to a single page of zeroes */
+	kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NODE,
+			true);
+
+	kasan_early_stage =3D false;
+	kimg_shadow_start =3D (u64)kasan_mem_to_shadow(_text) & PAGE_MASK;
+	kimg_shadow_end =3D PAGE_ALIGN((u64)kasan_mem_to_shadow(_end));
+
+	/*
+	 * Instrumented code couldn't execute without shadow memory.
+	 * tmp_pg_dir used to keep early shadow mapped until full shadow
+	 * setup will be finished.
+	 */
+	kasan_map_populate(kimg_shadow_start, kimg_shadow_end,
+			   early_pfn_to_nid(virt_to_pfn(lm_alias(_text))));
+
+	for_each_memblock(memory, reg) {
+		void *start =3D (void *)phys_to_virt(reg->base);
+		void *end =3D (void *)phys_to_virt(reg->base + reg->size);
+
+		if (start >=3D end)
+			break;
+
+		kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
+				   (unsigned long)kasan_mem_to_shadow(end),
+				   early_pfn_to_nid(virt_to_pfn(start)));
+	}
+
+	/*
+	 * KAsan may reuse the contents of kasan_zero_pte directly, so we
+	 * should make sure that it maps the zero page read-only.
+	 */
+	for (i =3D 0; i < PTRS_PER_PTE; i++)
+		set_pte(&kasan_early_shadow_pte[i],
+			pfn_pte(sym_to_pfn(kasan_early_shadow_page),
+				PAGE_KERNEL_RO));
+
+	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
+
+	/* At this point kasan is fully initialized. Enable error messages */
+	init_task.kasan_depth =3D 0;
+	pr_info("KernelAddressSanitizer initialized.\n");
+}
+
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 7221df2..b84ceb4 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -1,5 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 # Objects to go into the VDSO.
+
+ifdef CONFIG_KASAN
+KASAN_SANITIZE	:=3D n
+endif
+
 obj-vdso-y :=3D elf.o gettimeofday.o sigreturn.o
=20
 # Common compiler flags between ABIs.
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index b40ea10..055eb85 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -23,11 +23,13 @@ extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
 int kasan_populate_early_shadow(const void *shadow_start,
 				const void *shadow_end);
=20
+#ifndef __HAVE_ARCH_SHADOW_MAP
 static inline void *kasan_mem_to_shadow(const void *addr)
 {
 	return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
 		+ KASAN_SHADOW_OFFSET;
 }
+#endif /* __HAVE_ARCH_SHADOW_MAP*/
=20
 /* Enable reporting bugs after kasan_disable_current() */
 extern void kasan_enable_current(void);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 504c7936..ce070fb 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -173,11 +173,18 @@ static __always_inline void check_memory_region_inlin=
e(unsigned long addr,
 	if (unlikely(size =3D=3D 0))
 		return;
=20
-	if (unlikely((void *)addr <
-		kasan_shadow_to_mem((void *)KASAN_SHADOW_START))) {
-		kasan_report(addr, size, write, ret_ip);
-		return;
-	}
+#ifndef __HAVE_ARCH_SHADOW_MAP
+		if (unlikely((void *)addr <
+			kasan_shadow_to_mem((void *)KASAN_SHADOW_START))) {
+			kasan_report(addr, size, write, ret_ip);
+			return;
+		}
+#else
+		if (unlikely(kasan_mem_to_shadow((void *)addr) =3D=3D NULL)) {
+			kasan_report(addr, size, write, ret_ip);
+			return;
+		}
+#endif
=20
 	if (likely(!memory_is_poisoned(addr, size)))
 		return;
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 3ce956e..5f86724 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -110,11 +110,13 @@ struct kasan_alloc_meta *get_alloc_info(struct kmem_c=
ache *cache,
 struct kasan_free_meta *get_free_info(struct kmem_cache *cache,
 					const void *object);
=20
+#ifndef __HAVE_ARCH_SHADOW_MAP
 static inline const void *kasan_shadow_to_mem(const void *shadow_addr)
 {
 	return (void *)(((unsigned long)shadow_addr - KASAN_SHADOW_OFFSET)
 		<< KASAN_SHADOW_SCALE_SHIFT);
 }
+#endif
=20
 static inline bool addr_has_shadow(const void *addr)
 {
--=20
2.7.4

