Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07793C432E
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbfJAVys (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:48 -0400
Received: from mail-eopbgr750119.outbound.protection.outlook.com ([40.107.75.119]:27367
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728228AbfJAVyS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:54:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItEcVh/Rqqr2fr6Ob0XvUWplq8StD4J4iAixgVEJ8e1DXsCGhxsVvV9uPBF/1Mun4ixBth0L7++teKFf1enNdtqMTCd90CzEviC/cB1d0/bMuTR1vCAuut1U6jR9LqVenkcfHFXn35W43RGMXcjTknbtqikFf9uihkD9xeFuizznJYd2Z2bV3qW0xkm2R9IPn3DPBPj0sgeXDJZw4DqkYs9gNZjEozJpC40oPsIf0JiZKtBHM//qvHBzxFSMLets09rq6FBPZ5J/1MU/NkXBf0Y4K0Qi7j43CK78A9gyw/sujh0xONpO2i0B7jTROWGdLqZ1FxdzQx49wbwyY3xK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsap2fxNVD+tllp6cUv0r68bu6emowL+UFRcAVsZBKc=;
 b=BVISKLY+88b+JAMMXAfdHv/U2fRqIXURxdCewkTwMXjPvR3oq+dFx7qY21AYx13nK3wmRxV9m2Bi5499kb8BT5vU1cmWSpbgxD+dbSj4CvrGH5Kc4FZcFKIpMp2S4WB9r+bo5n55sPdbhHdP7BZFSxvzSyNEszjH1SXRbN2P5wmXlUM772aJfWr1ILC5eg288PwuvvMFOJogOyTNn12WjcXkCWSYABJp7HfJ1UP3Q7rr2uoLEq6m+x0Wa4QzyH6KQppx14DAdd4ITQZOpglneUYRneiUPyh27d1lTpRiBhVijyVedB3iIcFPoX3VoViZVLSFzja6J9ljSlhffqgTZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsap2fxNVD+tllp6cUv0r68bu6emowL+UFRcAVsZBKc=;
 b=LPNzDjm29DmAQJnGIv15+qxz0//ZabJYQ+GD+KTsx4i0tK+DNcQNyzUnTeZDnvguHiVc3Wdgm0MnexVtItqfIHZGN10GMBplU5axhc9K/ST2FBNmiE0wh1QZu8emvnppqJsdGSvEf6ORp4CLdCk3kRfmIkywS9Wn1mksmRC/0ms=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1581.namprd22.prod.outlook.com (10.174.167.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Tue, 1 Oct 2019 21:54:14 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:54:14 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 32/36] MIPS: barrier: Remove loongson_llsc_mb()
Thread-Topic: [PATCH v2 32/36] MIPS: barrier: Remove loongson_llsc_mb()
Thread-Index: AQHVeKKvI6s8IftE90ee2xJAk8okiw==
Date:   Tue, 1 Oct 2019 21:53:40 +0000
Message-ID: <20191001215249.4157062-33-paul.burton@mips.com>
References: <20191001215249.4157062-1-paul.burton@mips.com>
In-Reply-To: <20191001215249.4157062-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09afb3fd-110d-456f-184a-08d746b9d225
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB158101C465F6D2025570EF23C19D0@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(366004)(346002)(396003)(376002)(189003)(199004)(8936002)(26005)(478600001)(6512007)(8676002)(81166006)(81156014)(6916009)(386003)(76176011)(186003)(6506007)(25786009)(52116002)(6436002)(99286004)(6486002)(316002)(102836004)(54906003)(14454004)(5640700003)(2501003)(486006)(66476007)(7736002)(256004)(14444005)(66556008)(66946007)(1076003)(64756008)(36756003)(107886003)(66066001)(66446008)(4326008)(42882007)(2906002)(6666004)(3846002)(6116002)(476003)(446003)(2616005)(11346002)(2351001)(71190400001)(44832011)(5660300002)(50226002)(305945005)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B+BAVSanta6ZOUd5Vp/ih4ulA+KhIcYMlH46PsilOGLTsI9UcL6yycovvGUksYtP8I/9SrU4i6L3/Fiuzfvc5jcC0zovf5fgV/JXaG1BEfQWeVBcCCgDgoWFKx/Eu5cDQB6Kg4h0vSsjFVpYH5gL1yVZFKsW/2TYNOzqm4ugBv0lcVvZU9OQgjiuZO8b0yy074F10p32CsZsUgXsSxvRvx9De/aH5usip7oNHFjO4aKykun4DUw1LfLJ9wTNjrKfMYzohmyggGFOPVL078gQgwxSJ3HCzVv2fEyMA9tbYqaFedj5sIw2VZxKmx0oCH9WdOF8pQjhwFinmAIdGpYqvkDL0MfONZqOznS54KA1Qsu6VZLh569E7Vt5DN6Ip9EbGcPBAKUc1MVRfpx4gOb/NWO5AZVyRBNDErmp6QQBwZk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09afb3fd-110d-456f-184a-08d746b9d225
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:40.7923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vkulqkgoJHdhKtX7+jMxcnrnslmxtWD0jjTq5SK7xJ5WBjtaF2u429T+kbZu3hakXHOhjq6NayjcqJadC+Avg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The loongson_llsc_mb() macro is no longer used - instead barriers are
emitted as part of inline asm using the __SYNC() macro. Remove the
now-defunct loongson_llsc_mb() macro.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/barrier.h | 40 ---------------------------------
 arch/mips/loongson64/Platform   |  2 +-
 2 files changed, 1 insertion(+), 41 deletions(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index 133afd565067..6d92d5ccdafa 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -122,46 +122,6 @@ static inline void wmb(void)
 #define __smp_mb__before_atomic()	__smp_mb__before_llsc()
 #define __smp_mb__after_atomic()	smp_llsc_mb()
=20
-/*
- * Some Loongson 3 CPUs have a bug wherein execution of a memory access (l=
oad,
- * store or prefetch) in between an LL & SC can cause the SC instruction t=
o
- * erroneously succeed, breaking atomicity. Whilst it's unusual to write c=
ode
- * containing such sequences, this bug bites harder than we might otherwis=
e
- * expect due to reordering & speculation:
- *
- * 1) A memory access appearing prior to the LL in program order may actua=
lly
- *    be executed after the LL - this is the reordering case.
- *
- *    In order to avoid this we need to place a memory barrier (ie. a SYNC
- *    instruction) prior to every LL instruction, in between it and any ea=
rlier
- *    memory access instructions.
- *
- *    This reordering case is fixed by 3A R2 CPUs, ie. 3A2000 models and l=
ater.
- *
- * 2) If a conditional branch exists between an LL & SC with a target outs=
ide
- *    of the LL-SC loop, for example an exit upon value mismatch in cmpxch=
g()
- *    or similar, then misprediction of the branch may allow speculative
- *    execution of memory accesses from outside of the LL-SC loop.
- *
- *    In order to avoid this we need a memory barrier (ie. a SYNC instruct=
ion)
- *    at each affected branch target, for which we also use loongson_llsc_=
mb()
- *    defined below.
- *
- *    This case affects all current Loongson 3 CPUs.
- *
- * The above described cases cause an error in the cache coherence protoco=
l;
- * such that the Invalidate of a competing LL-SC goes 'missing' and SC
- * erroneously observes its core still has Exclusive state and lets the SC
- * proceed.
- *
- * Therefore the error only occurs on SMP systems.
- */
-#ifdef CONFIG_CPU_LOONGSON3_WORKAROUNDS /* Loongson-3's LLSC workaround */
-#define loongson_llsc_mb()	__asm__ __volatile__("sync" : : :"memory")
-#else
-#define loongson_llsc_mb()	do { } while (0)
-#endif
-
 static inline void sync_ginv(void)
 {
 	asm volatile(__SYNC(ginv, always));
diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
index c1a4d4dc4665..28172500f95a 100644
--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -27,7 +27,7 @@ cflags-$(CONFIG_CPU_LOONGSON3)	+=3D -Wa,--trap
 #
 # Some versions of binutils, not currently mainline as of 2019/02/04, supp=
ort
 # an -mfix-loongson3-llsc flag which emits a sync prior to each ll instruc=
tion
-# to work around a CPU bug (see loongson_llsc_mb() in asm/barrier.h for a
+# to work around a CPU bug (see __SYNC_loongson3_war in asm/sync.h for a
 # description).
 #
 # We disable this in order to prevent the assembler meddling with the
--=20
2.23.0

