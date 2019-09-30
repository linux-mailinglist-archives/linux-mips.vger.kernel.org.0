Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 183EEC2A77
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732644AbfI3XIu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:50 -0400
Received: from mail-eopbgr690119.outbound.protection.outlook.com ([40.107.69.119]:48448
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732626AbfI3XIs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFy9eP0i7wgXBbC2Cz1vS1D7JH4CTXILLGc9j+t9lzOTB4hF3A19MNZsVfGmNEu/3Z58se+Rk6t56GvrbQ8P04Rg96nd9NcEY0NAiDKMKYLd0nk2Y+l+Fj2io2IlbZ3OI+hQ9y2Fx0SiXz6ybvJZgtSfpl2ckxzr6Jl479BQRO/YVLbh8OTTbwwM/lHARuyu3nFgPckgtbhFCgrEvUtEkIqe6N6Lmd5wsdkgGNW49p9f8d5DtJaVm927U/dSASv7ZeKlC96ENhjEHPDbjRvYc+XG2r8r5ZrRagojDGE08p1uLWc6Q/NkQfzU9Wx55lSg7fP8U9HDVjsjCnc1p5UO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfAVvGvI2aPckslAY0N2YIANjNjzPYFO+OauvzKZOUs=;
 b=OtzmAI4cdl3jMy08PQaExOZ4fZk1zeLR8Z+VV94VZNqGfqgJxVF0p0DSInO+/z0mbdBlM1ZbXHX9JvGfr1ksrFpG4BJ+sxuXQ6Fay3tyMgI5RU0gQCq2SyLn6JCWE/qfAstB91K2OBfOPmUbb70kgzhJ4uw4qTNqpqfDvt4pg1znwyLTZYX7HgWh2e4MzNhFMOow7ZmxMmSRRpldj6hvjVRD8U2EwPzypNOcEC5kpXF3Xvu6tltPauypJHRFVdi//4sF7TRNsKisBNOKlOWmFio9kOLHVhH3thHpaFRH1jRIASRRad79Ifbo7bpfKvftN1QtsUZz6OelPG8fxh1jFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfAVvGvI2aPckslAY0N2YIANjNjzPYFO+OauvzKZOUs=;
 b=h9kK2ywUUnUVXHfc5B8My/08ZQlB7EjUVbfdxvaDmkhguypbuVGLMsP4eErqVZVvi8BGjHq6pEt4prmNXAkeXo2baRKhKkwJrbjXO9bsf1HQQUt5CHCBs6HEaTUMNgNIYmm20kkXt6T87INMWs3N4pFONzrVgMeephlIpYCghjM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:32 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:32 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 21/37] MIPS: bitops: Implement test_and_set_bit() in terms of
 _lock variant
Thread-Topic: [PATCH 21/37] MIPS: bitops: Implement test_and_set_bit() in
 terms of _lock variant
Thread-Index: AQHVd+P6iWZRVNZFTkSLRs37dgW89Q==
Date:   Mon, 30 Sep 2019 23:08:32 +0000
Message-ID: <20190930230806.2940505-22-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 63001d44-d434-440c-5d12-08d745fb1d0e
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB102286AFEAE3B61D70624D13C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AcHyZX3BwJe9LWnyA5nQjylcFTDS4oMYnEeFJWnGXliGqVYlZ5zyyVUglJpxLStGv+Y3FdPn8NPbSjWYHEquqn12l21YKN34tk7PjSH18Jrpno7EKT+jGuj+VUdpPs8SXEb79LriRsbtqhMe84F4xX79FwiI54dG6im4j3UsxIfeVbGNkaFgz15p3WZbYccXTSmqYnrsQTp1CrsaJsvZTphU7Elhi6/Ip0ik96Ji5ZwqOBHuSyKSPXgL0SmombDSmtEo5fvf34cxLeZ2nVqAXJBwQJBfp2sKqki5wtsHV2F3BNKeqZCGVsSK3UFMNzDSTrY499w2GCw5GYkqkEwyOzGj00XmpQnVWDJSea/lbvn77KeC3fMsgGcnWE9UaqkDKm42+uTUAqqMgUnvr8h+xRd8lN4kMyKcVPYu2s6nkM0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63001d44-d434-440c-5d12-08d745fb1d0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:32.4602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VRZb82qP8cNWXFM/sH3OL743g0Gmdo1aB1Yr6dCdTWWQQyLgvU6VNLgRg526m+KEQaPz66LHLFYTB6jz+gTSnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The only difference between test_and_set_bit() & test_and_set_bit_lock()
is memory ordering barrier semantics - the former provides a full
barrier whilst the latter only provides acquire semantics.

We can therefore implement test_and_set_bit() in terms of
test_and_set_bit_lock() with the addition of the extra memory barrier.
Do this in order to avoid duplicating logic.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/bitops.h | 66 +++++++---------------------------
 arch/mips/lib/bitops.c         | 26 --------------
 2 files changed, 13 insertions(+), 79 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 83fd1f1c3ab4..34d6fe3f18d0 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -31,8 +31,6 @@
 void __mips_set_bit(unsigned long nr, volatile unsigned long *addr);
 void __mips_clear_bit(unsigned long nr, volatile unsigned long *addr);
 void __mips_change_bit(unsigned long nr, volatile unsigned long *addr);
-int __mips_test_and_set_bit(unsigned long nr,
-			    volatile unsigned long *addr);
 int __mips_test_and_set_bit_lock(unsigned long nr,
 				 volatile unsigned long *addr);
 int __mips_test_and_clear_bit(unsigned long nr,
@@ -236,24 +234,22 @@ static inline void change_bit(unsigned long nr, volat=
ile unsigned long *addr)
 }
=20
 /*
- * test_and_set_bit - Set a bit and return its old value
+ * test_and_set_bit_lock - Set a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
- * This operation is atomic and cannot be reordered.
- * It also implies a memory barrier.
+ * This operation is atomic and implies acquire ordering semantics
+ * after the memory operation.
  */
-static inline int test_and_set_bit(unsigned long nr,
+static inline int test_and_set_bit_lock(unsigned long nr,
 	volatile unsigned long *addr)
 {
 	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
 	unsigned long res, temp;
=20
-	smp_mb__before_llsc();
-
 	if (!kernel_uses_llsc) {
-		res =3D __mips_test_and_set_bit(nr, addr);
+		res =3D __mips_test_and_set_bit_lock(nr, addr);
 	} else if (R10000_LLSC_WAR) {
 		__asm__ __volatile__(
 		"	.set	push					\n"
@@ -264,7 +260,7 @@ static inline int test_and_set_bit(unsigned long nr,
 		"	beqzl	%2, 1b					\n"
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
-		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
+		: "=3D&r" (temp), "+m" (*m), "=3D&r" (res)
 		: "r" (1UL << bit)
 		: __LLSC_CLOBBER);
 	} else {
@@ -291,56 +287,20 @@ static inline int test_and_set_bit(unsigned long nr,
 }
=20
 /*
- * test_and_set_bit_lock - Set a bit and return its old value
+ * test_and_set_bit - Set a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
- * This operation is atomic and implies acquire ordering semantics
- * after the memory operation.
+ * This operation is atomic and cannot be reordered.
+ * It also implies a memory barrier.
  */
-static inline int test_and_set_bit_lock(unsigned long nr,
+static inline int test_and_set_bit(unsigned long nr,
 	volatile unsigned long *addr)
 {
-	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
-	int bit =3D nr & SZLONG_MASK;
-	unsigned long res, temp;
-
-	if (!kernel_uses_llsc) {
-		res =3D __mips_test_and_set_bit_lock(nr, addr);
-	} else if (R10000_LLSC_WAR) {
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	arch=3Dr4000				\n"
-		"1:	" __LL "%0, %1		# test_and_set_bit	\n"
-		"	or	%2, %0, %3				\n"
-		"	" __SC	"%2, %1					\n"
-		"	beqzl	%2, 1b					\n"
-		"	and	%2, %0, %3				\n"
-		"	.set	pop					\n"
-		: "=3D&r" (temp), "+m" (*m), "=3D&r" (res)
-		: "r" (1UL << bit)
-		: __LLSC_CLOBBER);
-	} else {
-		do {
-			__asm__ __volatile__(
-			"	.set	push				\n"
-			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-			"	" __LL "%0, %1	# test_and_set_bit	\n"
-			"	or	%2, %0, %3			\n"
-			"	" __SC	"%2, %1				\n"
-			"	.set	pop				\n"
-			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "r" (1UL << bit)
-			: __LLSC_CLOBBER);
-		} while (unlikely(!res));
-
-		res =3D temp & (1UL << bit);
-	}
-
-	smp_llsc_mb();
-
-	return res !=3D 0;
+	smp_mb__before_llsc();
+	return test_and_set_bit_lock(nr, addr);
 }
+
 /*
  * test_and_clear_bit - Clear a bit and return its old value
  * @nr: Bit to clear
diff --git a/arch/mips/lib/bitops.c b/arch/mips/lib/bitops.c
index 3b2a1e78a543..fba402c0879d 100644
--- a/arch/mips/lib/bitops.c
+++ b/arch/mips/lib/bitops.c
@@ -77,32 +77,6 @@ void __mips_change_bit(unsigned long nr, volatile unsign=
ed long *addr)
 EXPORT_SYMBOL(__mips_change_bit);
=20
=20
-/**
- * __mips_test_and_set_bit - Set a bit and return its old value.  This is
- * called by test_and_set_bit() if it cannot find a faster solution.
- * @nr: Bit to set
- * @addr: Address to count from
- */
-int __mips_test_and_set_bit(unsigned long nr,
-			    volatile unsigned long *addr)
-{
-	unsigned long *a =3D (unsigned long *)addr;
-	unsigned bit =3D nr & SZLONG_MASK;
-	unsigned long mask;
-	unsigned long flags;
-	int res;
-
-	a +=3D nr >> SZLONG_LOG;
-	mask =3D 1UL << bit;
-	raw_local_irq_save(flags);
-	res =3D (mask & *a) !=3D 0;
-	*a |=3D mask;
-	raw_local_irq_restore(flags);
-	return res;
-}
-EXPORT_SYMBOL(__mips_test_and_set_bit);
-
-
 /**
  * __mips_test_and_set_bit_lock - Set a bit and return its old value.  Thi=
s is
  * called by test_and_set_bit_lock() if it cannot find a faster solution.
--=20
2.23.0

