Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60EFF70C35
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbfGVV7q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:59:46 -0400
Received: from mail-eopbgr690130.outbound.protection.outlook.com ([40.107.69.130]:62950
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726553AbfGVV7q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:59:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVvJF35DM7agmc7913JivuQvuAgayhePJSLmdoI81GhTVWv7YF/OBh14Ft45F0+wse4IIN1Pc1ypALkkJ0vkeNkBGvvLYaCb9mH+WsAohmsmRriIn0FYlt8dA5nBs451cfwxX3kCcaUTt9WbpC/Uh1mhVCe4xP3w6Ft1V1yj4gbu7+A5GlEIvyOgF55M8bEGnxMI4ogJN8y4bvyT22WhfKXT/xo6yiubhtfci34gWfsPYhmekrW4nluj300/7IqW20C2kI5T/ynPNgBFDoM23bexOEJgFRGum/8l0QPqd2m0nFav8XgfQr+d8TxnAXAuYU9ys/hrvrEqYbjgY48ISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JDVsr5KnRnALH9LfNntqfg/wzYYxtyROsyqATgU0J4=;
 b=HP/cYpEBnlRY1BX90Y1PWxrdx6R3yjcv9aJs4ARf0UovUqvYxJ8Je8PBVKqxtyRQ4ua7JCOwBn3k/WX+HdpXODk6tIxC2So36Hf8NZ6xc/sjqlVVVyMp3pETaOAQlL22sgZO4P/hYpp7Ekk3wQWN6XwSuazuIwYTA43lHtnqHe/ywbSfygRafFcJ7EnQMNHMEo+nzAyiSAoZxb2mqdHwwuIuXPfs9GAl6oUeD18PWi23yGodr5VgW/Gdiee+pxl+Jh/8Yy5TPz66+rWPkO0GAjUtUYrOKwkUrkvpk5Y9mAsx+l2V7MPJHcXtWqz4n9gCgaysFX6ttKQpdGjZiRM65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JDVsr5KnRnALH9LfNntqfg/wzYYxtyROsyqATgU0J4=;
 b=nVspauKds6Eg3axeCm8JmddbBwjqFQaBAhsxGIYNx0QfF14+CO3JuU7PWXkzXiZGeWzVWQWRbwe30xszNC87inQ4e/vgFyRWDWtLjs5iJm045Wjtj0m6JHmpyh7K04szGUEFcZ8HzeyRe088AvynLY1rBShmUBXvAhIF5pK2X28=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1184.namprd22.prod.outlook.com (10.174.171.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 21:59:43 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:59:43 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 1/4] MIPS: Remove unused R4300 CPU support
Thread-Topic: [PATCH 1/4] MIPS: Remove unused R4300 CPU support
Thread-Index: AQHVQNjE2OmJveifz0y924MF9xE0ug==
Date:   Mon, 22 Jul 2019 21:59:43 +0000
Message-ID: <20190722215705.20109-1-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: e189acd5-107b-485a-2fed-08d70eefe736
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1184;
x-ms-traffictypediagnostic: MWHPR2201MB1184:
x-microsoft-antispam-prvs: <MWHPR2201MB1184A578CFE194E3F0955E28C1C40@MWHPR2201MB1184.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:167;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(136003)(376002)(39850400004)(366004)(199004)(189003)(2351001)(6436002)(4326008)(316002)(99286004)(66066001)(6916009)(107886003)(2906002)(6512007)(68736007)(386003)(478600001)(66946007)(36756003)(44832011)(7736002)(66476007)(66556008)(66446008)(64756008)(5640700003)(305945005)(25786009)(8936002)(6486002)(53936002)(50226002)(5660300002)(1076003)(102836004)(186003)(256004)(8676002)(2501003)(42882007)(81156014)(26005)(81166006)(14454004)(476003)(486006)(71190400001)(71200400001)(6116002)(3846002)(6506007)(2616005)(52116002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1184;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kFIq+kk8fgNrU+nZL3//qwvsvc4lYfowz5PrBL+Sb6zTTGlDPMaafOAJoM49sR/e4iroKTELMzHwsG9+tjwJTCmrDjMrnvZ3WpHAxLzIxbYAGQN6bPPY8X76mmPxmywPPuF8RwBppCBBs4QSaxss5XCPlGRHst42+89SVirgsofYG7jxERqUFbalkBAgftukozuwKNCmYVN8l+fvzhXqzwrAR9rVZsjyPiMVknmfCYmmoKvQ7wq8JhjNEXLVDhxwZwYvLF1cJxgxzd7I4XO/ayKy+yZRGUkiafWLAdG4pNNlbalRO3vj9ArHo9n5vxdhuQsPVAPX25xazCv2zTL1bL0sq+F/vTVCm8RAdvOP4F4AXhloMwwtsxxBsJPuKZ0k4dQc89zxQ2zw8e/yZqR1wAao8iESM+i430IEfJQ2MBw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e189acd5-107b-485a-2fed-08d70eefe736
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:59:43.7086
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

Our R4300 CPU support can only be included if a system selects
CONFIG_SYS_HAS_CPU_R4300. No system does, making all R4300-related CPU
support dead code. Remove it.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/Kconfig                | 12 ------------
 arch/mips/Makefile               |  1 -
 arch/mips/include/asm/cpu-type.h |  5 -----
 arch/mips/include/asm/cpu.h      |  2 +-
 arch/mips/include/asm/module.h   |  2 --
 arch/mips/kernel/cpu-probe.c     |  9 ---------
 arch/mips/kernel/idle.c          |  1 -
 arch/mips/mm/c-r4k.c             |  1 -
 arch/mips/mm/tlbex.c             |  1 -
 9 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd7bf3a..2b28c6b02ff9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1599,15 +1599,6 @@ config CPU_VR41XX
 	  kernel built with this option will not run on any other type of
 	  processor or vice versa.
=20
-config CPU_R4300
-	bool "R4300"
-	depends on SYS_HAS_CPU_R4300
-	select CPU_SUPPORTS_32BIT_KERNEL
-	select CPU_SUPPORTS_64BIT_KERNEL
-	select CPU_HAS_LOAD_STORE_LR
-	help
-	  MIPS Technologies R4300-series processors.
-
 config CPU_R4X00
 	bool "R4x00"
 	depends on SYS_HAS_CPU_R4X00
@@ -1969,9 +1960,6 @@ config SYS_HAS_CPU_TX39XX
 config SYS_HAS_CPU_VR41XX
 	bool
=20
-config SYS_HAS_CPU_R4300
-	bool
-
 config SYS_HAS_CPU_R4X00
 	bool
=20
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index eceff9b75b22..e728d0555466 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -163,7 +163,6 @@ cflags-y +=3D -fno-stack-check
 #
 cflags-$(CONFIG_CPU_R3000)	+=3D -march=3Dr3000
 cflags-$(CONFIG_CPU_TX39XX)	+=3D -march=3Dr3900
-cflags-$(CONFIG_CPU_R4300)	+=3D -march=3Dr4300 -Wa,--trap
 cflags-$(CONFIG_CPU_VR41XX)	+=3D -march=3Dr4100 -Wa,--trap
 cflags-$(CONFIG_CPU_R4X00)	+=3D -march=3Dr4600 -Wa,--trap
 cflags-$(CONFIG_CPU_TX49XX)	+=3D -march=3Dr4600 -Wa,--trap
diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-t=
ype.h
index a45af3de075d..9774e6d0403f 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -116,11 +116,6 @@ static inline int __pure __get_cpu_type(const int cpu_=
type)
 	case CPU_VR4181A:
 #endif
=20
-#ifdef CONFIG_SYS_HAS_CPU_R4300
-	case CPU_R4300:
-	case CPU_R4310:
-#endif
-
 #ifdef CONFIG_SYS_HAS_CPU_R4X00
 	case CPU_R4000PC:
 	case CPU_R4000SC:
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 290369fa44a4..c70c43fc9e09 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -293,7 +293,7 @@ enum cpu_type_enum {
 	/*
 	 * R4000 class processors
 	 */
-	CPU_R4000PC, CPU_R4000SC, CPU_R4000MC, CPU_R4200, CPU_R4300, CPU_R4310,
+	CPU_R4000PC, CPU_R4000SC, CPU_R4000MC, CPU_R4200,
 	CPU_R4400PC, CPU_R4400SC, CPU_R4400MC, CPU_R4600, CPU_R4640, CPU_R4650,
 	CPU_R4700, CPU_R5000, CPU_R5500, CPU_NEVADA, CPU_R5432, CPU_R10000,
 	CPU_R12000, CPU_R14000, CPU_R16000, CPU_VR41XX, CPU_VR4111, CPU_VR4121,
diff --git a/arch/mips/include/asm/module.h b/arch/mips/include/asm/module.=
h
index 6dc0b21b8acd..eaf3f37ed583 100644
--- a/arch/mips/include/asm/module.h
+++ b/arch/mips/include/asm/module.h
@@ -103,8 +103,6 @@ search_module_dbetables(unsigned long addr)
 #define MODULE_PROC_FAMILY "TX39XX "
 #elif defined CONFIG_CPU_VR41XX
 #define MODULE_PROC_FAMILY "VR41XX "
-#elif defined CONFIG_CPU_R4300
-#define MODULE_PROC_FAMILY "R4300 "
 #elif defined CONFIG_CPU_R4X00
 #define MODULE_PROC_FAMILY "R4X00 "
 #elif defined CONFIG_CPU_TX49XX
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 9635c1db3ae6..d70bd6542a9f 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1384,15 +1384,6 @@ static inline void cpu_probe_legacy(struct cpuinfo_m=
ips *c, unsigned int cpu)
 			break;
 		}
 		break;
-	case PRID_IMP_R4300:
-		c->cputype =3D CPU_R4300;
-		__cpu_name[cpu] =3D "R4300";
-		set_isa(c, MIPS_CPU_ISA_III);
-		c->fpu_msk31 |=3D FPU_CSR_CONDX;
-		c->options =3D R4K_OPTS | MIPS_CPU_FPU | MIPS_CPU_32FPR |
-			     MIPS_CPU_LLSC;
-		c->tlbsize =3D 32;
-		break;
 	case PRID_IMP_R4600:
 		c->cputype =3D CPU_R4600;
 		__cpu_name[cpu] =3D "R4600";
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 7388f1374d5f..7cc0af34c6e6 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -151,7 +151,6 @@ void __init check_wait(void)
 		cpu_wait =3D r39xx_wait;
 		break;
 	case CPU_R4200:
-/*	case CPU_R4300: */
 	case CPU_R4600:
 	case CPU_R4640:
 	case CPU_R4650:
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5166e38cd1c6..07d9aa4f7491 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1134,7 +1134,6 @@ static void probe_pcache(void)
 	case CPU_R4400PC:
 	case CPU_R4400SC:
 	case CPU_R4400MC:
-	case CPU_R4300:
 		icache_size =3D 1 << (12 + ((config & CONF_IC) >> 9));
 		c->icache.linesz =3D 16 << ((config & CONF_IB) >> 5);
 		c->icache.ways =3D 1;
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 144ceb0fba88..b5dde6f4423c 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -545,7 +545,6 @@ void build_tlb_write_entry(u32 **p, struct uasm_label *=
*l,
 		tlbw(p);
 		break;
=20
-	case CPU_R4300:
 	case CPU_5KC:
 	case CPU_TX49XX:
 	case CPU_PR4450:
--=20
2.22.0

