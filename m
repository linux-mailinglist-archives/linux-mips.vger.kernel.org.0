Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8036C2A86
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730573AbfI3XJm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:42 -0400
Received: from mail-eopbgr690120.outbound.protection.outlook.com ([40.107.69.120]:5486
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732495AbfI3XJl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:09:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H94x+5/eLp3RhaZxu6ai5ErJfhzu4u489AbCBDP3Owolct8O0Cp1zvuuEQfgq9/PEdzeu1RNDbAjQCN6lMMFsYz3G1tuvBxVitaFYsNAn62CAHSGdbjC95yqLL0sS1QqPWAie7DLQ3haAf0STDBoJG0q+cPkvin9EuRk2DaW/m+bhadJVkfYC6E9ylqdhSxF+xpOA/JN6gq6UPwHkSQiuU9I+rnbhsGjvM3TolXN815deSA2lyiscsTgNRtsDTLw207/ujaHxzco9ZwsuITEHr+7rMWySbcYZ11bjFdcKGpZwCP+7wB+f2HXppZ3iyxujz0UzTxmBKbQ4Me3sxP1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teHP17IFWXIfuZRdFHCsldo74h/QIqpIXn+WjpeR/aA=;
 b=SRznxDMz6D19RCVGdnVLsZQ/hnr4FU3vKVQJuLszSpn66YrMXGMatf+wYHohCfRKNwNo+FatXwrUweBDer2hCMIz3uLYWO6DWTsqjUGpNylsBzig+lRdNw4rE7BcQ90Lkrd4eEv8tdeRkyFvU2m99X/qAyd4LGMeCe8nXJYc0g/Q4ERcM14Nvh7YXsOXzDBabw0NQklyin6LadwxxNH5aQ3UwfuUW35FGsWSMmahNr/EvmGnAfM24sTimcndE4EoaugyRU1dVsIDdRGN+9aAr4DgDby2sP5U0EvMe0tt/qpieIrBk/yrIYNcyutlXQS1iQJS4XoQ/a479zQcfQT0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teHP17IFWXIfuZRdFHCsldo74h/QIqpIXn+WjpeR/aA=;
 b=r1/J0cyruvY/J+/l6EKDTb5RUfyWJV9u80R69bmtHmARSJHqMbyTJhgWWg0XhfQUa9n9rmPtuEwWfzFwfwb8s46CxNjnKp2uIT0fMHgq0ABAqNtOpBSspbn76JFjZVfh4wCtiPvvA6Upt3wbtE9Hcbaub0ymgITdYwlZyqCB1Nc=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:28 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:28 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 16/37] MIPS: bitops: Use generic builtin ffs/fls; drop
 cpu_has_clo_clz
Thread-Topic: [PATCH 16/37] MIPS: bitops: Use generic builtin ffs/fls; drop
 cpu_has_clo_clz
Thread-Index: AQHVd+P4sxZAmDQwJUGcaxRTKS+8Gg==
Date:   Mon, 30 Sep 2019 23:08:28 +0000
Message-ID: <20190930230806.2940505-17-paul.burton@mips.com>
References: <20190930230806.2940505-1-paul.burton@mips.com>
In-Reply-To: <20190930230806.2940505-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fc58cc5-2f85-4292-622f-08d745fb1a7e
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022B502D5D4F86777FA19CDC1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DErhcZ1UuLtrsYEZRVxIWVBs/dvnPMXLhMIYVb0urDw0caV0dDMonr2nQwHglZKxQuWOhKP36YrTAuzjRHET3zwRMZH0IxaJSgwZ1jZZ/qhJ8/TiVBSGWkrF1Q6cTh1duCPvabw1pXlTJOaWjmxqtCmy3mGOIQ5gzkS9WB7x034SXQ6G4dBGHh0NIu1oiHWtT8kNDVzF4RKG65sE4oCW1Ob9vkXMXVHXcidagDUz/xBBiRFXZGtJ8T6409OhnC/2EfAmaEl6Lzye5v6QbhbiYKkdZ0KngezDt7CWVxgbnTM8djiDNSE5ifGO0TBxi5qRJVwJpArMjXgFzc1Z00pWFRsAjkPzcPWZ1j9YLRyToxxIqCUzdUhDUWqIeAxPt+a+Tka7MTpPolBazECbRxiVh4xiXpy+LxnBLDNvVexgzqw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc58cc5-2f85-4292-622f-08d745fb1a7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:28.1751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+WEHG9E2n8mqTKNslxi2ndQnyn6bQbKzAtny12rOaNKk1qbzN+KOrcFNiMn/AqIhxsVyT81Vsuqz/D1Dkn7PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The MIPS-specific implementations of __ffs(), ffs(), __fls() & fls()
make use of the MIPS clz instruction where possible. They do this via
inline asm, but in any configuration in which the kernel is built for a
MIPS32 or MIPS64 release 1 or higher instruction set we know that these
instructions are available & can be emitted using the __builtin_clz()
function & other associated builtins which are provided by all currently
supported versions of gcc.

When targeting an older instruction set GCC will generate a longer code
sequence similar to the fallback cases we have in our implementations.

As such, remove our custom implementations of these functions & use the
generic versions built atop compiler builtins. This allows us to drop a
significant chunk of code, along with the cpu_has_clo_clz feature macro
which was only used by these functions.

The only thing we lose here is the ability for kernels built to target a
pre-r1 ISA to opportunistically make use of clz when running on a CPU
that implements it. This seems like a small cost, and well worth paying
to simplify the code.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/bitops.h                | 146 +-----------------
 arch/mips/include/asm/cpu-features.h          |  10 --
 .../asm/mach-malta/cpu-feature-overrides.h    |   2 -
 3 files changed, 4 insertions(+), 154 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 985d6a02f9ea..4b618afbfa5b 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -491,149 +491,11 @@ static inline void __clear_bit_unlock(unsigned long =
nr, volatile unsigned long *
 	nudge_writes();
 }
=20
-/*
- * Return the bit position (0..63) of the most significant 1 bit in a word
- * Returns -1 if no 1 bit exists
- */
-static __always_inline unsigned long __fls(unsigned long word)
-{
-	int num;
-
-	if (BITS_PER_LONG =3D=3D 32 && !__builtin_constant_p(word) &&
-	    __builtin_constant_p(cpu_has_clo_clz) && cpu_has_clo_clz) {
-		__asm__(
-		"	.set	push					\n"
-		"	.set	"MIPS_ISA_LEVEL"			\n"
-		"	clz	%0, %1					\n"
-		"	.set	pop					\n"
-		: "=3Dr" (num)
-		: "r" (word));
-
-		return 31 - num;
-	}
-
-	if (BITS_PER_LONG =3D=3D 64 && !__builtin_constant_p(word) &&
-	    __builtin_constant_p(cpu_has_mips64) && cpu_has_mips64) {
-		__asm__(
-		"	.set	push					\n"
-		"	.set	"MIPS_ISA_LEVEL"			\n"
-		"	dclz	%0, %1					\n"
-		"	.set	pop					\n"
-		: "=3Dr" (num)
-		: "r" (word));
-
-		return 63 - num;
-	}
-
-	num =3D BITS_PER_LONG - 1;
-
-#if BITS_PER_LONG =3D=3D 64
-	if (!(word & (~0ul << 32))) {
-		num -=3D 32;
-		word <<=3D 32;
-	}
-#endif
-	if (!(word & (~0ul << (BITS_PER_LONG-16)))) {
-		num -=3D 16;
-		word <<=3D 16;
-	}
-	if (!(word & (~0ul << (BITS_PER_LONG-8)))) {
-		num -=3D 8;
-		word <<=3D 8;
-	}
-	if (!(word & (~0ul << (BITS_PER_LONG-4)))) {
-		num -=3D 4;
-		word <<=3D 4;
-	}
-	if (!(word & (~0ul << (BITS_PER_LONG-2)))) {
-		num -=3D 2;
-		word <<=3D 2;
-	}
-	if (!(word & (~0ul << (BITS_PER_LONG-1))))
-		num -=3D 1;
-	return num;
-}
-
-/*
- * __ffs - find first bit in word.
- * @word: The word to search
- *
- * Returns 0..SZLONG-1
- * Undefined if no bit exists, so code should check against 0 first.
- */
-static __always_inline unsigned long __ffs(unsigned long word)
-{
-	return __fls(word & -word);
-}
-
-/*
- * fls - find last bit set.
- * @word: The word to search
- *
- * This is defined the same way as ffs.
- * Note fls(0) =3D 0, fls(1) =3D 1, fls(0x80000000) =3D 32.
- */
-static inline int fls(unsigned int x)
-{
-	int r;
-
-	if (!__builtin_constant_p(x) &&
-	    __builtin_constant_p(cpu_has_clo_clz) && cpu_has_clo_clz) {
-		__asm__(
-		"	.set	push					\n"
-		"	.set	"MIPS_ISA_LEVEL"			\n"
-		"	clz	%0, %1					\n"
-		"	.set	pop					\n"
-		: "=3Dr" (x)
-		: "r" (x));
-
-		return 32 - x;
-	}
-
-	r =3D 32;
-	if (!x)
-		return 0;
-	if (!(x & 0xffff0000u)) {
-		x <<=3D 16;
-		r -=3D 16;
-	}
-	if (!(x & 0xff000000u)) {
-		x <<=3D 8;
-		r -=3D 8;
-	}
-	if (!(x & 0xf0000000u)) {
-		x <<=3D 4;
-		r -=3D 4;
-	}
-	if (!(x & 0xc0000000u)) {
-		x <<=3D 2;
-		r -=3D 2;
-	}
-	if (!(x & 0x80000000u)) {
-		x <<=3D 1;
-		r -=3D 1;
-	}
-	return r;
-}
-
+#include <asm-generic/bitops/builtin-__ffs.h>
+#include <asm-generic/bitops/builtin-ffs.h>
+#include <asm-generic/bitops/builtin-__fls.h>
+#include <asm-generic/bitops/builtin-fls.h>
 #include <asm-generic/bitops/fls64.h>
-
-/*
- * ffs - find first bit set.
- * @word: The word to search
- *
- * This is defined the same way as
- * the libc and compiler builtin ffs routines, therefore
- * differs in spirit from the above ffz (man ffs).
- */
-static inline int ffs(int word)
-{
-	if (!word)
-		return 0;
-
-	return fls(word & -word);
-}
-
 #include <asm-generic/bitops/ffz.h>
 #include <asm-generic/bitops/find.h>
=20
diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/c=
pu-features.h
index 983a6a7f43a1..274a35ae15af 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -362,16 +362,6 @@
 })
 #endif
=20
-/*
- * MIPS32, MIPS64, VR5500, IDT32332, IDT32334 and maybe a few other
- * pre-MIPS32/MIPS64 processors have CLO, CLZ.	The IDT RC64574 is 64-bit a=
nd
- * has CLO and CLZ but not DCLO nor DCLZ.  For 64-bit kernels
- * cpu_has_clo_clz also indicates the availability of DCLO and DCLZ.
- */
-#ifndef cpu_has_clo_clz
-#define cpu_has_clo_clz	cpu_has_mips_r
-#endif
-
 /*
  * MIPS32 R2, MIPS64 R2, Loongson 3A and Octeon have WSBH.
  * MIPS64 R2, Loongson 3A and Octeon have WSBH, DSBH and DSHD.
diff --git a/arch/mips/include/asm/mach-malta/cpu-feature-overrides.h b/arc=
h/mips/include/asm/mach-malta/cpu-feature-overrides.h
index de3b66a3723e..193c0912d38e 100644
--- a/arch/mips/include/asm/mach-malta/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-malta/cpu-feature-overrides.h
@@ -32,7 +32,6 @@
 /* #define cpu_has_vtag_icache	? */
 /* #define cpu_has_dc_aliases	? */
 /* #define cpu_has_ic_fills_f_dc ? */
-#define cpu_has_clo_clz		1
 #define cpu_has_nofpuex		0
 /* #define cpu_has_64bits	? */
 /* #define cpu_has_64bit_zero_reg ? */
@@ -59,7 +58,6 @@
 /* #define cpu_has_vtag_icache	? */
 /* #define cpu_has_dc_aliases	? */
 /* #define cpu_has_ic_fills_f_dc ? */
-#define cpu_has_clo_clz		1
 #define cpu_has_nofpuex		0
 /* #define cpu_has_64bits	? */
 /* #define cpu_has_64bit_zero_reg ? */
--=20
2.23.0

