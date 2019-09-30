Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C03E7C2A88
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732495AbfI3XJr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:47 -0400
Received: from mail-eopbgr820129.outbound.protection.outlook.com ([40.107.82.129]:60959
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732769AbfI3XJW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:09:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP6VM++DGr9zafJlBBHtO2VPXKFxhqDdcHwDwSoA/3DuDEQEKXUAU1el4zuyCTmnEZedpKe0EWV/vY4ZNARcwjM9BDgi0kNzBihi/Gx5wKF25ypXs7zY6h8jsqryZU2nSwcxEsvG9iUVKBv1mrVRPO12inOHFpOJvQf3Vo/5CDUuVfC4boDn2jsIMe0jEpRT10O/QTIZvIoaSo/Rtym0BRscbpsS/YZqCJklI3rPXPtpSl9TEIES1WzlLxC/g/eu6cxpSF6U6OBPUoEvSYzC3vjVKaC/NvufJco5LCezGJ+4uFX34yGqSmqMeqFKQohc9ri4Pzi3M2RKRnDIEXDp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vl7osInJbQCZYE9OyTPsqX3Ns4VCo+RgudalhIuW48U=;
 b=Ztcg6cxy2l8fih5WDspam+JXl2SZuJ1iRqgdBrSrDdhnOBaHg9JMqa3ISKFnUH7L2m6PfgeVF226mViCfLaWv9/03Ffj83uAr8xTXSAASQeOi3Csh74XsQoE1RcfMaF9IjX7UonXxeLpMx6wHK2ihgNtHw991/Jz/cBf6z2jDztcuzDoxLKVvo6p+TumQB4QiD2c4zT9ZgLeDHrbJTe6z8/4wrkIgfiwD46iZ8GTLLM40LCZ64uiViZlFZOAAhuZWcqEuLOqRJFP2CJM7nviZjwyyTTh/mFiLSReMX2ZEgpnoB3tXupXaBqRX3kT4mWAGYIu1uAUdvpuj6ygqCEeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vl7osInJbQCZYE9OyTPsqX3Ns4VCo+RgudalhIuW48U=;
 b=CxFp7+KBwGjVo8hjcKdE5yi6yHmt45WPIFzU+Bq4U7BIDHN1jKmSbteaI5DzXpnuxPjyn5lXi9ti70SG0DmXCPRHOWJYytghQv6RUKcVs3a4d/CqjLtEKWwfF6lcN1gOqn/D11twkbPdONA1FSi6NWmTobz7OaypRxcOw0utf0c=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:09:11 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:09:11 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 33/37] MIPS: barrier: Remove loongson_llsc_mb()
Thread-Topic: [PATCH 33/37] MIPS: barrier: Remove loongson_llsc_mb()
Thread-Index: AQHVd+QBGBvr0LXUB0q3rp1IZ4o/ww==
Date:   Mon, 30 Sep 2019 23:08:43 +0000
Message-ID: <20190930230806.2940505-34-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 5f8a0fc0-0e62-47d2-9bd4-08d745fb2380
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022A41218EBD610E5580739C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(6666004)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ApxVF9qBnojsfU2HMgpvSir3aDVCPXHb87d1EXmvpmGe3nzBEBWgVrlaklhb+WVGoRU8PJJ1YS97eFR71eAZiY2JLdxkuoWmi+5a0McWVkKvE3O6tyaUKq7Hrw6rlcX/dWOuGnvQYRo5Z6q/FG0ndhMU/QJEdOybo6PKkcGvHV1vZcgt3PzczjmLX2M1qFQjWWuNJKPvEgPrGM0+pH/uokRMvYBjPPwIofa4HeRkG4CTaEIuhIftwa5wmOr8i9pMqRNfVa9WScBJf2qddshjtKJJatQeLbvbI/COPQg6c47HrqTarq3x/AX9b+XbtP9zy4+Wvzas5E1sCsTlBkZTW7C5ISMc+pPeS4eZPteZIVNI7fmSquHG31MsgG9CfCC9uWCd4Xy+nqsO47ng2I/mREM1oc47PmGT8fIzYxQsYZU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8a0fc0-0e62-47d2-9bd4-08d745fb2380
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:43.3252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+hCP62m9CHW2lCRvyi9102ZU+kb860ujlY/FYDcYvTR03yK+Nr1kKbBpVGL5wZ1f6i2IJ7b+zj7jkyUaFwa6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The loongson_llsc_mb() macro is no longer used - instead barriers are
emitted as part of inline asm using the __SYNC() macro. Remove the
now-defunct loongson_llsc_mb() macro.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/barrier.h | 40 ---------------------------------
 arch/mips/loongson64/Platform   |  2 +-
 2 files changed, 1 insertion(+), 41 deletions(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index c7e05e832da9..1a99a6c5b5dd 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -121,46 +121,6 @@ static inline void wmb(void)
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

