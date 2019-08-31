Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0435A4511
	for <lists+linux-mips@lfdr.de>; Sat, 31 Aug 2019 17:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbfHaPkr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Aug 2019 11:40:47 -0400
Received: from mail-eopbgr690114.outbound.protection.outlook.com ([40.107.69.114]:40430
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726354AbfHaPkq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 31 Aug 2019 11:40:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJSpMEy6xnHjufeAY9pwyIxkOGOd4YxLyAvD2O48PMQRxpoAE1A+71BZ7BVWMSufaGlzXKcD363zXQMJj1UcdC5PkGO8ilg776EAfhuvF2XXuDSKFGC/nEA9OamMboJt26wS+pkmhzKKMZg4CdX4/Pb2f4VdafnGGKa/H/WSQ7DD/7Z4BELpPYPV71KDpctZg+pg7vfcsHicTwBEq3NG0gCJ+jb2ZFZQNGu7m4AutQJ9bfryk/oh+uqKgtkpBWJvhv39KtyHvuIPqMB6zmMZ9HXv4WBcmDpVujhc4rR3fcMvvB3sUKJFV9on2QHbNxSTJ56dCCzS2IOjb0jU9RNVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzW79WDKLjwcmg57vDIGZM7VRw6ZcHmESskEzGO8rSE=;
 b=ehv8R9vsB1uJ7l3gTO+LerKBpuZFPXdNcDt+W4sAIo+Q0NyQVuRpDDc93GuqWmxLVY6mjrXOewCTcutzP4sRMyHVUvMaMgniqSSN6XGpPfvkWZj+R2hGjW21K7Je3nxO8/8Iy5KaTpjhZfF5KhJAU4v3MtP6wLMk/0wHe7/3c0S0vFcvFdjG1BAyKQveoomYbBQGSrEr+BopnXIxbEgWALF3/aW5o5mmO6I/OY06uF2RjZs+NaVvdiUCN4NSNU70zJev7yjN2sYkZohuAzN9BzgASorH/zoPk2D/JtjaBgy6ze5ydJzWJ3NKAnQ/TrF9LRU8AFPgFrbiKoEeEc9iVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzW79WDKLjwcmg57vDIGZM7VRw6ZcHmESskEzGO8rSE=;
 b=IvczWC1+MD/ICoONVqJWnKm8o5z0NfB85ojhLPxoSNuB4mvNqvNRtlHx/cVY5lRaf4O6Z1L5QWiUEJkLzc+SvnpW6AcVlUabuMJggYd/7nkzKU64ylwrTgunzM1tvQG0SuahA+rfqCNefKSFHbgd0bs4JFHOobHssU1I1ro4a8k=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1311.namprd22.prod.outlook.com (10.172.62.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Sat, 31 Aug 2019 15:40:43 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2220.013; Sat, 31 Aug
 2019 15:40:43 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 1/3] MIPS: Select R3k-style TLB in Kconfig
Thread-Topic: [PATCH 1/3] MIPS: Select R3k-style TLB in Kconfig
Thread-Index: AQHVYBJy2mKp+srajkmCkRUcVHwG5g==
Date:   Sat, 31 Aug 2019 15:40:43 +0000
Message-ID: <20190831154027.6943-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0161.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::29) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.1
x-originating-ip: [78.144.179.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 644dbfb9-d19c-4f71-0d22-08d72e29952d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1311;
x-ms-traffictypediagnostic: MWHPR2201MB1311:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1311F18F8F252C6CEFA1199BC1BC0@MWHPR2201MB1311.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 014617085B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(376002)(136003)(366004)(346002)(199004)(189003)(2501003)(14454004)(386003)(102836004)(42882007)(6506007)(186003)(52116002)(476003)(2616005)(486006)(44832011)(26005)(2351001)(6916009)(1076003)(478600001)(5660300002)(71190400001)(66446008)(64756008)(66556008)(71200400001)(66476007)(2906002)(107886003)(66946007)(8936002)(81156014)(6116002)(66066001)(5640700003)(8676002)(6486002)(50226002)(316002)(6512007)(256004)(6436002)(53936002)(99286004)(25786009)(305945005)(36756003)(7736002)(4326008)(81166006)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1311;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: om0E0F18SrW1kEdTCx0zOidTtzdd+n05OOiz+Z60XW1etCFp2VrZYZrXH7yRzNxdFs13TUutKX2hZRIUOfnTKnNd4lIFhaMFqpQcURf1/jt9+iAERrqGvziIn5rLf2mefGDwvYWz8zFlJ6CVAV00RR9nMIQZIePGAhigubdU+3ZUsUsdVpye4VgQrriINqc444zXFS4dUoFwIuduBjTQG4SKLzKjejxa5yAjH+c/s+TjdI3NmZhVewji9oNHivmniZgcV7RiSHM3aakDgIkJmv7PNECMq4LJtZkfePPQi1Ph437vjxqC7mB0WEbE5YmFWVsDjjD9fFbA6Eu8vkqDbiPg6843omC2hEDtdj1HGIJXSmRNheMTAHAWZMO3XX/KSOBa3vrCu7+IHLFn5/YZTg6UREFXwcEDh+JsZvHiPX8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644dbfb9-d19c-4f71-0d22-08d72e29952d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2019 15:40:43.1397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4J4QbC3zpRQIlAp3t0DcEzCTAXUGKAAb6OQOBUI4xa9VUlLEUmv9dPf8Ng4TxNF1HAuTNnFYFBAc1eYYuhEa/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1311
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently areas where we need to determine whether the TLB is R3k-style
need to check for either of CONFIG_CPU_R3000 || CONFIG_CPU_TX39XX.

Introduce a new CONFIG_CPU_R3K_TLB & select it from both of the above,
allowing us to simplify checks for R3k-style TLBs by only checking for
this new Kconfig option.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/Kconfig                    | 7 ++++++-
 arch/mips/include/asm/pgtable-32.h   | 4 ++--
 arch/mips/include/asm/pgtable-bits.h | 6 +++---
 arch/mips/include/asm/pgtable.h      | 4 ++--
 arch/mips/mm/Makefile                | 5 +++--
 5 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 31c7044e34e6..3f18aa018a0c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1575,6 +1575,7 @@ config CPU_R3000
 	depends on SYS_HAS_CPU_R3000
 	select CPU_HAS_WB
 	select CPU_HAS_LOAD_STORE_LR
+	select CPU_R3K_TLB
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	help
@@ -1590,6 +1591,7 @@ config CPU_TX39XX
 	depends on SYS_HAS_CPU_TX39XX
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_HAS_LOAD_STORE_LR
+	select CPU_R3K_TLB
=20
 config CPU_VR41XX
 	bool "R41xx"
@@ -2280,6 +2282,9 @@ config CPU_R2300_FPU
 	depends on MIPS_FP_SUPPORT
 	default y if CPU_R3000 || CPU_TX39XX
=20
+config CPU_R3K_TLB
+	bool
+
 config CPU_R4K_FPU
 	bool
 	depends on MIPS_FP_SUPPORT
@@ -2287,7 +2292,7 @@ config CPU_R4K_FPU
=20
 config CPU_R4K_CACHE_TLB
 	bool
-	default y if !(CPU_R3000 || CPU_SB1 || CPU_TX39XX || CPU_CAVIUM_OCTEON)
+	default y if !(CPU_R3K_TLB || CPU_SB1 || CPU_CAVIUM_OCTEON)
=20
 config MIPS_MT_SMP
 	bool "MIPS MT SMP support (1 TC on each available VPE)"
diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgt=
able-32.h
index e600570789f4..ba967148b016 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -221,7 +221,7 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t=
 prot)
 	((pte_t *)page_address(pmd_page(*(dir))) + __pte_offset(address))
 #define pte_unmap(pte) ((void)(pte))
=20
-#if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
+#if defined(CONFIG_CPU_R3K_TLB)
=20
 /* Swap entries must have VALID bit cleared. */
 #define __swp_type(x)			(((x).val >> 10) & 0x1f)
@@ -266,6 +266,6 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t=
 prot)
=20
 #endif /* defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32) =
*/
=20
-#endif /* defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX) */
+#endif /* defined(CONFIG_CPU_R3K_TLB) */
=20
 #endif /* _ASM_PGTABLE_32_H */
diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/p=
gtable-bits.h
index c2c1060b43ef..5f1ced8cba07 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -82,7 +82,7 @@ enum pgtable_bits {
 	_PAGE_SPECIAL_SHIFT,
 };
=20
-#elif defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
+#elif defined(CONFIG_CPU_R3K_TLB)
=20
 /* Page table bits used for r3k systems */
 enum pgtable_bits {
@@ -151,7 +151,7 @@ enum pgtable_bits {
 #define _PAGE_GLOBAL		(1 << _PAGE_GLOBAL_SHIFT)
 #define _PAGE_VALID		(1 << _PAGE_VALID_SHIFT)
 #define _PAGE_DIRTY		(1 << _PAGE_DIRTY_SHIFT)
-#if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
+#if defined(CONFIG_CPU_R3K_TLB)
 # define _CACHE_UNCACHED	(1 << _CACHE_UNCACHED_SHIFT)
 # define _CACHE_MASK		_CACHE_UNCACHED
 # define _PFN_SHIFT		PAGE_SHIFT
@@ -209,7 +209,7 @@ static inline uint64_t pte_to_entrylo(unsigned long pte=
_val)
 /*
  * Cache attributes
  */
-#if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
+#if defined(CONFIG_CPU_R3K_TLB)
=20
 #define _CACHE_CACHABLE_NONCOHERENT 0
 #define _CACHE_UNCACHED_ACCELERATED _CACHE_UNCACHED
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtabl=
e.h
index d60f47a9088c..4dca733d5076 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -199,7 +199,7 @@ static inline void pte_clear(struct mm_struct *mm, unsi=
gned long addr, pte_t *pt
 static inline void set_pte(pte_t *ptep, pte_t pteval)
 {
 	*ptep =3D pteval;
-#if !defined(CONFIG_CPU_R3000) && !defined(CONFIG_CPU_TX39XX)
+#if !defined(CONFIG_CPU_R3K_TLB)
 	if (pte_val(pteval) & _PAGE_GLOBAL) {
 		pte_t *buddy =3D ptep_buddy(ptep);
 		/*
@@ -218,7 +218,7 @@ static inline void set_pte(pte_t *ptep, pte_t pteval)
 static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte=
_t *ptep)
 {
 	htw_stop();
-#if !defined(CONFIG_CPU_R3000) && !defined(CONFIG_CPU_TX39XX)
+#if !defined(CONFIG_CPU_R3K_TLB)
 	/* Preserve global status for the pair */
 	if (pte_val(*ptep_buddy(ptep)) & _PAGE_GLOBAL)
 		set_pte_at(mm, addr, ptep, __pte(_PAGE_GLOBAL));
diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
index 949d43eefda1..46f483e952c8 100644
--- a/arch/mips/mm/Makefile
+++ b/arch/mips/mm/Makefile
@@ -28,10 +28,11 @@ obj-$(CONFIG_HIGHMEM)		+=3D highmem.o
 obj-$(CONFIG_HUGETLB_PAGE)	+=3D hugetlbpage.o
 obj-$(CONFIG_DMA_NONCOHERENT)	+=3D dma-noncoherent.o
=20
+obj-$(CONFIG_CPU_R3K_TLB)	+=3D tlb-r3k.o
 obj-$(CONFIG_CPU_R4K_CACHE_TLB) +=3D c-r4k.o cex-gen.o tlb-r4k.o
-obj-$(CONFIG_CPU_R3000)		+=3D c-r3k.o tlb-r3k.o
+obj-$(CONFIG_CPU_R3000)		+=3D c-r3k.o
 obj-$(CONFIG_CPU_SB1)		+=3D c-r4k.o cerr-sb1.o cex-sb1.o tlb-r4k.o
-obj-$(CONFIG_CPU_TX39XX)	+=3D c-tx39.o tlb-r3k.o
+obj-$(CONFIG_CPU_TX39XX)	+=3D c-tx39.o
 obj-$(CONFIG_CPU_CAVIUM_OCTEON) +=3D c-octeon.o cex-oct.o tlb-r4k.o
=20
 obj-$(CONFIG_IP22_CPU_SCACHE)	+=3D sc-ip22.o
--=20
2.22.1

