Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7501DA4515
	for <lists+linux-mips@lfdr.de>; Sat, 31 Aug 2019 17:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbfHaPmk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Aug 2019 11:42:40 -0400
Received: from mail-eopbgr690114.outbound.protection.outlook.com ([40.107.69.114]:40430
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726354AbfHaPmk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 31 Aug 2019 11:42:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DavY5EJKJnCfHBkKZmhbrFqCk0ixjWIexsvv1NLnXuXz448jPYM/ArGRuasKZyEqfIzCpL5xIuQeurO1PV125/LK2PPt5HDOMciEigRPeMQpet1IjjitBQkQv0pbrXzYmvc0rtasd85SHMBT5VjzyekA58iTYJ/7ngycvkWZfACINJHb60SS7QdamOx+NtYGKbVFwVnj5/wFJxJ0pdqpUcPKE3bMmBmsTlRKyx5pNKhUSckUshLSKKmptOYF//w1Y+5+mDaL/Gu+M9qoUnMkBYG+hF2KkIGBSTIhsm55RM98TuYe/YkVcV1YBlWFVsr0N1SbxgdDU2RpclYfXIE/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ1rA2mTpfhzwbtTW/jLrb4/emvNRj+1eetGX8TehL0=;
 b=AjXqRnRe2Imc5dQMfJN6YY/fs5Du1nUHc//BzATHpwk8fOSlBI1EZiR5y328gHce1edVlQ7wkHC1gpl+CXf90OZ9WwVllzEp/3+lqbCgVn2yhasZSwZGHq41P9A88u+5CoxmT2g/ZGnGoO4hAKjPV4YVnY12W3XY4evEMPBu+9Hi0Zy+BMYj4iTHlzVaWB+19/VgDD0hWUtf+kB+8Ox43z+nqx6eImBZdFgYDaCx8BLwOLAwLABt57qnlzxsa7phECWezbgX9dgbdzVVMVAEsGPcefbaLfM8YFGqAM5whgOToI/2XK0zj5wa4+wmI2R/35bn+iOZIRIgadDzbUfSjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ1rA2mTpfhzwbtTW/jLrb4/emvNRj+1eetGX8TehL0=;
 b=k+dEiMABr31WwEa7D7EeZirKPzFmZNeTiUKGU4+6zXTzTg8EoeT0jo8Lfs/cwG/sJvkZBGMLi84TfmXfL0/UDnZdBJ3bpi6ImRdZhOmMelaNeLwn8SJ7XcoUEC+C42iXiaM5R2JZ2HV9dyBHevGqwXFwEQx6m7PA5UYUqd6SAvY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1311.namprd22.prod.outlook.com (10.172.62.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Sat, 31 Aug 2019 15:40:46 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2220.013; Sat, 31 Aug
 2019 15:40:46 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 3/3] MIPS: tlbex: Remove cpu_has_local_ebase
Thread-Topic: [PATCH 3/3] MIPS: tlbex: Remove cpu_has_local_ebase
Thread-Index: AQHVYBJ0xEIBPHvDYUCMR3MGJkqWlQ==
Date:   Sat, 31 Aug 2019 15:40:46 +0000
Message-ID: <20190831154027.6943-3-paul.burton@mips.com>
References: <20190831154027.6943-1-paul.burton@mips.com>
In-Reply-To: <20190831154027.6943-1-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 87039808-faa3-4fed-d535-08d72e29974f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1311;
x-ms-traffictypediagnostic: MWHPR2201MB1311:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB13110D3F37C4A74EA8EF3096C1BC0@MWHPR2201MB1311.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 014617085B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(376002)(136003)(366004)(346002)(199004)(189003)(2501003)(14454004)(386003)(102836004)(42882007)(6506007)(186003)(52116002)(476003)(2616005)(486006)(44832011)(26005)(11346002)(446003)(76176011)(2351001)(6916009)(1076003)(478600001)(5660300002)(71190400001)(66446008)(64756008)(66556008)(71200400001)(66476007)(2906002)(107886003)(66946007)(8936002)(81156014)(6116002)(66066001)(5640700003)(8676002)(6486002)(50226002)(316002)(6512007)(256004)(6436002)(53936002)(99286004)(25786009)(305945005)(36756003)(7736002)(4326008)(81166006)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1311;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r4KnfjbpFgCvMdAPsNSgKrs3ksMhSAqxJaUmDTKLX3R6Iwf3sEh24DJJz1XgAPQ7mmMwk3PNVv3QO78u8i6Jo8jrvj5RldVQpAGCNTd0TPgYdfbzWjnBi89fiwqhMsqBXaTswpoGcbrgfQhLC50v6kMTZ/6fOhgshUCoqpJetwD4PRzWiUZCv1V0ESytCZOuh767n/ndFUUPLqrYgT6iTsgRRcpBlRwL/99sPsdqeUTrrwslrZ1ISdHOuqcn9/EK8B3HQ3VwOk/YpZ9YQ/ZOXqySy61PR7dSj5ILpsVe5oteEMEU5rqnwdVs6NCpbzpoHXyiYIUNjO4+otnIsuicBjIsgtWq9nF7JJUWsQF5DOY5XBzMJL/feTvh7jK+oiea0+hWgUckFGOnUX18rTZnCS4bJnT2OzgzMS6qvR1PZ/k=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87039808-faa3-4fed-d535-08d72e29974f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2019 15:40:46.5771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GyqOPZlNTZcc7kwjz3AIq0hYHpdlcCGxv938YVLD2MnKFA+7xFJcbAiDhlBnEWszjjN/UFzUpNzsE/Siuq+U2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1311
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The cpu_has_local_ebase macro is, confusingly, not used to indicate
whether the EBase register is local to a CPU or not. Instead it
indicates whether we want to generate the TLB refill exception vector
each time a CPU is brought online. Doing this makes little sense on any
system, since we always use the same value for EBase & thus we cannot
have different TLB refill exception handlers per CPU.

Regenerating the code is not only pointless but also can be actively
harmful, as commit 8759934e2b6b ("MIPS: Build uasm-generated code only
once to avoid CPU Hotplug problem") described. That commit introduced
cpu_has_local_ebase to disable the handler regeneration for Loongson
machines, but this is by no means a Loongson-specific problem.

Remove cpu_has_local_ebase & simply generate the TLB refill handler once
during boot, just like the rest of the TLB exception handlers.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/cpu-features.h                     | 3 ---
 arch/mips/include/asm/mach-dec/cpu-feature-overrides.h   | 1 -
 .../include/asm/mach-loongson64/cpu-feature-overrides.h  | 1 -
 arch/mips/mm/tlbex.c                                     | 9 ++-------
 4 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/c=
pu-features.h
index 4e2bea8875f5..983a6a7f43a1 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -243,9 +243,6 @@
 #ifndef cpu_has_pindexed_dcache
 #define cpu_has_pindexed_dcache	(cpu_data[0].dcache.flags & MIPS_CACHE_PIN=
DEX)
 #endif
-#ifndef cpu_has_local_ebase
-#define cpu_has_local_ebase	1
-#endif
=20
 /*
  * I-Cache snoops remote store.	 This only matters on SMP.  Some multiproc=
essors
diff --git a/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h b/arch/=
mips/include/asm/mach-dec/cpu-feature-overrides.h
index 1c11310bc8ad..00beb69bfab9 100644
--- a/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h
@@ -32,7 +32,6 @@
 #define cpu_has_vtag_icache		0
 #define cpu_has_ic_fills_f_dc		0
 #define cpu_has_pindexed_dcache		0
-#define cpu_has_local_ebase		0
 #define cpu_icache_snoops_remote_store	1
 #define cpu_has_mips_4			0
 #define cpu_has_mips_5			0
diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h =
b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
index 581915ce231c..4aca25f2ff06 100644
--- a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
@@ -43,7 +43,6 @@
 #define cpu_has_vint		0
 #define cpu_has_vtag_icache	0
 #define cpu_has_watch		1
-#define cpu_has_local_ebase	0
=20
 #ifdef CONFIG_CPU_LOONGSON3
 #define cpu_has_wsbh		1
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 6e3ca9cc5249..e01cb33bfa1a 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -2609,12 +2609,9 @@ void build_tlb_refill_handler(void)
=20
 	if (cpu_has_3kex) {
 #ifndef CONFIG_MIPS_PGD_C0_CONTEXT
-		if (cpu_has_local_ebase)
-			build_r3000_tlb_refill_handler();
 		if (!run_once) {
-			if (!cpu_has_local_ebase)
-				build_r3000_tlb_refill_handler();
 			build_setup_pgd();
+			build_r3000_tlb_refill_handler();
 			build_r3000_tlb_load_handler();
 			build_r3000_tlb_store_handler();
 			build_r3000_tlb_modify_handler();
@@ -2638,13 +2635,11 @@ void build_tlb_refill_handler(void)
 		build_r4000_tlb_modify_handler();
 		if (cpu_has_ldpte)
 			build_loongson3_tlb_refill_handler();
-		else if (!cpu_has_local_ebase)
+		else
 			build_r4000_tlb_refill_handler();
 		flush_tlb_handlers();
 		run_once++;
 	}
-	if (cpu_has_local_ebase)
-		build_r4000_tlb_refill_handler();
 	if (cpu_has_xpa)
 		config_xpa_params();
 	if (cpu_has_htw)
--=20
2.22.1

