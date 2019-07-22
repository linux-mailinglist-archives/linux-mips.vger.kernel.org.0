Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3C170C36
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2019 00:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbfGVWAB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 18:00:01 -0400
Received: from mail-eopbgr690124.outbound.protection.outlook.com ([40.107.69.124]:8514
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726553AbfGVWAA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 18:00:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z14jFqEsUObWnDKAimDVgrFQChIuBKvsBmAkH6mQql2fvOVEyBBBbSnACPR+0tlAg26OwO76k3XUagPAsBpMnzqHPDXHWObytYqkitpGwTb0bcyPzNF9Di1pyBzlqvIEzmQt75o/vnmPiFHTzxiT1o0XZudANaHQ25G/6Q/qEjCpTu16p6oETTcAtygpq+lf3is9lLpgpKw9+YRMmLbdgQ5/J7FGVES4z8vx12Q3jTEdxY8sGqcgWlN1rgYlujERdjDgSkTw6rvm6Vin48NnmTVhoNsL87tzBOFhIYSyfTIJhPNLJkY2iAYpJFzybtZpYupYgqVWH1Dq+GIT2WbcBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T7atFJ2RH5oMNcaAXsQ1pDFoOxZPWDi7pY77JTi2h8=;
 b=C/fb9K+828fb5raZdZyxRV0eIChbJiDyt0dvh1XLEDYYRom+QZyWzhwfgoNRerhDCyp5wGgyM2hXcu8FzTilXDswLWkmWt1ADNayq2mdG2ce30o2GkSJGLWi3nP4T3gZBodjsTPM7M7+8T5X2RIbyqwHd2zccoBmO5YNiH/bJFUMr/ojGoOgAAPjkx4G5UNqgqpjxBwNNseZw1fDznteuMZ66tf7rzmYwnjQEZzhXCFG9AQhxJvm2ZUxCdbyYIeheDkUXxzxUYQOncjOFtDl5J0YJasYnG807neuJD483yse+e9iimTZr8cHbdqx1d4rR0HQtk7i1drzVk4emQv2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T7atFJ2RH5oMNcaAXsQ1pDFoOxZPWDi7pY77JTi2h8=;
 b=TmHTvDncun5EF9SzfAEr7QmAHSJioplm2Zq0EG00smgB79RbvkBr+djJfRlQIutK2xDAhsDqxb4pEyKR/UgaAlQt2mnuXyYuPfD/GY4fiZ8Hk/rfJbJayssD5vooryoV5QRYViUFkrcgXZxbyIKMH/9YDKjk34TjtTIWaeIKdyo=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1184.namprd22.prod.outlook.com (10.174.171.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 21:59:51 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:59:51 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 2/4] MIPS: Remove unused R5432 CPU support
Thread-Topic: [PATCH 2/4] MIPS: Remove unused R5432 CPU support
Thread-Index: AQHVQNjJ72/2ELPZjkuS3GO9PX2IzQ==
Date:   Mon, 22 Jul 2019 21:59:50 +0000
Message-ID: <20190722215705.20109-2-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 880c1c59-c9d2-4765-de2a-08d70eefeb8c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1184;
x-ms-traffictypediagnostic: MWHPR2201MB1184:
x-microsoft-antispam-prvs: <MWHPR2201MB1184E9D0A8060B5F23E85F57C1C40@MWHPR2201MB1184.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:96;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(136003)(376002)(39840400004)(366004)(199004)(189003)(2351001)(6436002)(4326008)(316002)(99286004)(66066001)(6916009)(107886003)(2906002)(6512007)(68736007)(386003)(478600001)(66946007)(36756003)(44832011)(7736002)(66476007)(66556008)(66446008)(64756008)(5640700003)(305945005)(25786009)(8936002)(6486002)(53936002)(446003)(50226002)(5660300002)(1076003)(102836004)(186003)(256004)(8676002)(2501003)(42882007)(81156014)(26005)(81166006)(14454004)(476003)(76176011)(486006)(71190400001)(71200400001)(11346002)(6116002)(3846002)(6506007)(2616005)(52116002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1184;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OyNWXWZR4EX11D8vqrbTRYGzu+KKG+U1xE4OoVe2dQSnKAK+ncUPG253ot7hZm5nL2LOwu3nwPbs0mSznvhTX2jMNhP7X0ovtOkhlakDeLg+a/OPefuSjnYmsrBxQeyWIdgMGAnVyt43fSRIzHLg72zDEyWkstgL56U2refX+N64aZowZg6e4dZfyRSG8LZ5oYSHGbWukSPWRdDIBF8I1jvipKbXHSnKN2/0pk3jWtS0YOnj8Echh9BJnI/N8RLjNcfCBhKf1oSYmHs74UDpHflwB9W/J86XWXj6PE7iBJoP5HkA/X4XYLZ6DqGbZWCBsA8COSXVbNsYhZsCNpIXWkDAxYg5o62Ebn2h+S6V8ckYBkOaMD9xBkL3QqQkG9CdykA/OOfqxRMse36LDhmrXd1L88hTf7bpaLSI19U/cZc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880c1c59-c9d2-4765-de2a-08d70eefeb8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:59:50.9936
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

Our R5432 CPU support can only be included if a system selects
CONFIG_SYS_HAS_CPU_R5432. No system does, making all R5432-related CPU
support dead code. Remove it.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/Kconfig                | 11 -----------
 arch/mips/Makefile               |  2 --
 arch/mips/include/asm/cpu-type.h |  4 ----
 arch/mips/include/asm/cpu.h      |  2 +-
 arch/mips/include/asm/module.h   |  2 --
 arch/mips/kernel/cpu-probe.c     |  8 --------
 arch/mips/mm/c-r4k.c             |  1 -
 arch/mips/mm/tlbex.c             |  1 -
 8 files changed, 1 insertion(+), 30 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2b28c6b02ff9..0f4e1a7eb006 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1629,14 +1629,6 @@ config CPU_R5000
 	help
 	  MIPS Technologies R5000-series processors other than the Nevada.
=20
-config CPU_R5432
-	bool "R5432"
-	depends on SYS_HAS_CPU_R5432
-	select CPU_SUPPORTS_32BIT_KERNEL
-	select CPU_SUPPORTS_64BIT_KERNEL
-	select CPU_SUPPORTS_HUGEPAGES
-	select CPU_HAS_LOAD_STORE_LR
-
 config CPU_R5500
 	bool "R5500"
 	depends on SYS_HAS_CPU_R5500
@@ -1969,9 +1961,6 @@ config SYS_HAS_CPU_TX49XX
 config SYS_HAS_CPU_R5000
 	bool
=20
-config SYS_HAS_CPU_R5432
-	bool
-
 config SYS_HAS_CPU_R5500
 	bool
=20
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e728d0555466..e507e5b6e606 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -173,8 +173,6 @@ cflags-$(CONFIG_CPU_MIPS64_R1)	+=3D -march=3Dmips64 -Wa=
,--trap
 cflags-$(CONFIG_CPU_MIPS64_R2)	+=3D -march=3Dmips64r2 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS64_R6)	+=3D -march=3Dmips64r6 -Wa,--trap
 cflags-$(CONFIG_CPU_R5000)	+=3D -march=3Dr5000 -Wa,--trap
-cflags-$(CONFIG_CPU_R5432)	+=3D $(call cc-option,-march=3Dr5400,-march=3Dr=
5000) \
-			-Wa,--trap
 cflags-$(CONFIG_CPU_R5500)	+=3D $(call cc-option,-march=3Dr5500,-march=3Dr=
5000) \
 			-Wa,--trap
 cflags-$(CONFIG_CPU_NEVADA)	+=3D $(call cc-option,-march=3Drm5200,-march=
=3Dr5000) \
diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-t=
ype.h
index 9774e6d0403f..2f1677c360c4 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -138,10 +138,6 @@ static inline int __pure __get_cpu_type(const int cpu_=
type)
 	case CPU_R5000:
 #endif
=20
-#ifdef CONFIG_SYS_HAS_CPU_R5432
-	case CPU_R5432:
-#endif
-
 #ifdef CONFIG_SYS_HAS_CPU_R5500
 	case CPU_R5500:
 #endif
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index c70c43fc9e09..0f52e4b099ea 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -295,7 +295,7 @@ enum cpu_type_enum {
 	 */
 	CPU_R4000PC, CPU_R4000SC, CPU_R4000MC, CPU_R4200,
 	CPU_R4400PC, CPU_R4400SC, CPU_R4400MC, CPU_R4600, CPU_R4640, CPU_R4650,
-	CPU_R4700, CPU_R5000, CPU_R5500, CPU_NEVADA, CPU_R5432, CPU_R10000,
+	CPU_R4700, CPU_R5000, CPU_R5500, CPU_NEVADA, CPU_R10000,
 	CPU_R12000, CPU_R14000, CPU_R16000, CPU_VR41XX, CPU_VR4111, CPU_VR4121,
 	CPU_VR4122, CPU_VR4131, CPU_VR4133, CPU_VR4181, CPU_VR4181A, CPU_RM7000,
 	CPU_SR71000, CPU_TX49XX,
diff --git a/arch/mips/include/asm/module.h b/arch/mips/include/asm/module.=
h
index eaf3f37ed583..92cb94ef0231 100644
--- a/arch/mips/include/asm/module.h
+++ b/arch/mips/include/asm/module.h
@@ -109,8 +109,6 @@ search_module_dbetables(unsigned long addr)
 #define MODULE_PROC_FAMILY "TX49XX "
 #elif defined CONFIG_CPU_R5000
 #define MODULE_PROC_FAMILY "R5000 "
-#elif defined CONFIG_CPU_R5432
-#define MODULE_PROC_FAMILY "R5432 "
 #elif defined CONFIG_CPU_R5500
 #define MODULE_PROC_FAMILY "R5500 "
 #elif defined CONFIG_CPU_NEVADA
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index d70bd6542a9f..be717be2ca5f 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1459,14 +1459,6 @@ static inline void cpu_probe_legacy(struct cpuinfo_m=
ips *c, unsigned int cpu)
 			     MIPS_CPU_LLSC;
 		c->tlbsize =3D 48;
 		break;
-	case PRID_IMP_R5432:
-		c->cputype =3D CPU_R5432;
-		__cpu_name[cpu] =3D "R5432";
-		set_isa(c, MIPS_CPU_ISA_IV);
-		c->options =3D R4K_OPTS | MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_WATCH | MIPS_CPU_LLSC;
-		c->tlbsize =3D 48;
-		break;
 	case PRID_IMP_R5500:
 		c->cputype =3D CPU_R5500;
 		__cpu_name[cpu] =3D "R5500";
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 07d9aa4f7491..89b9c851d822 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1098,7 +1098,6 @@ static void probe_pcache(void)
 		c->options |=3D MIPS_CPU_CACHE_CDEX_P;
 		break;
=20
-	case CPU_R5432:
 	case CPU_R5500:
 		icache_size =3D 1 << (12 + ((config & CONF_IC) >> 9));
 		c->icache.linesz =3D 16 << ((config & CONF_IB) >> 5);
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index b5dde6f4423c..9b2fcf421321 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -603,7 +603,6 @@ void build_tlb_write_entry(u32 **p, struct uasm_label *=
*l,
=20
 	case CPU_VR4131:
 	case CPU_VR4133:
-	case CPU_R5432:
 		uasm_i_nop(p);
 		uasm_i_nop(p);
 		tlbw(p);
--=20
2.22.0

