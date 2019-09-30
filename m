Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4674CC2A73
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732566AbfI3XIg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:36 -0400
Received: from mail-eopbgr820094.outbound.protection.outlook.com ([40.107.82.94]:14848
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732442AbfI3XIf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKSiPINiG1dgTHdiMqzw134f68OvbIcqfl0x8/PWxAHRZ618XElLf3EWwg8AyVAZL+dBsIvQk6Nmp5Cs6mPvHaG5WPky71EYtpDqXrRNLWHffoFvzV0jmrd2NHFo+SbiWxalwuakYZ9mDy7gi9Lpn2QeL7wo4a1/QKzAHVtAKawZZ1oKEiztM/ntlbD6JOWMKzZ4B3CRV5BC46rSLpNFe7fkxFgamOWWdcp5mNhSQafVkQiaRZMMSTALHXZKIW9/fDRU3MsURdb4dowuIE8uL14ar67Gw0f3MQqPZShZH/us4GF2uaz60E6RTJs0+uVa5/yDdkMoCLgMttNvFLCNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcgA+itlK1YNuZoFXAB+qA5g1HU3tXjbDM5vRUIi+oU=;
 b=UG3BCi55pkqfZ/8Hh0nOLUj/CihqnNwQc+y7iGWXnIFQNNVKQCfyh/1UOpZ7R+4F/j1Zvra9+K2HCaE5gouUwYSSH7LnOycuL0crdhaUXhyunvNFmJE/RfoCLpfiGraZnk4etJ8SsLquffzfpsZQdeR+548IQXVXfDh2qi9amMfhlZC+O4QG5ue1FX0OlDF0icQbmwIyrIXUtB/Oa5NgzHFsY99Bx5dzsMvs5Cn0zWX86p10pKlqmBXmlsFPBOjMvc9HgdnF/ka5XO20lz3N1CCdzC0Gizkq94k/z5cvvsPOdso0O5p6OfL2EKQLV/nhmahPjfZebE4iXGXXSc1Jnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcgA+itlK1YNuZoFXAB+qA5g1HU3tXjbDM5vRUIi+oU=;
 b=rf8yOL/0O8SNb6TcQRDY06rTM3VqMAnbL6BAfCkb+3El5A9lONSbm/1ftKXnMBhXFu/NX67TLUTYGj7k34zsMTAMWVI1ihyeyXs5PRse6/EP5PTmbc6l0pRet3w1l9fwUL208Yn26t7rMjz3IUofMRfX6+UEYO9D6FLSg58fXm4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:26 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:26 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 14/37] MIPS: atomic: Unify 32b & 64b sub_if_positive
Thread-Topic: [PATCH 14/37] MIPS: atomic: Unify 32b & 64b sub_if_positive
Thread-Index: AQHVd+P3bFYVrsF/RkKQr9JneB8VKw==
Date:   Mon, 30 Sep 2019 23:08:26 +0000
Message-ID: <20190930230806.2940505-15-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 1b324e64-94ba-48f0-273a-08d745fb197e
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB10224FB23622F93BDF28B5F5C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eooLJqn/vha0TmCg5lvN8+Xx9mbJlz8gE+zc7xP8VG+yMItA01mHsfu3W0a6loUHIQMDGDjn02fvrKhYqcEIePFb5QMy/Yn9p7BjhevdKpZoE2KWL8/BGQ+7H1yeeX2d0Xl99jxSzi5eg7VPbyl+xRXsb1aJjrNPe3PNOdu0LqmpIrXjm8+iyUDGpBmSvsXRnwPV2rBk1BVOFsP3Y04QIifUc5aoM21vfy7VcVLhY6oFN72SSIuwaKKXo0AhUvNbvQ/tbo9ch7j42lM+6+7Fk9Chyah2jKY9lmXt0/r1Kib4lyZVjQof4Nhg7aRIkPjk1Bf1Dgq/2ctgtC+y6vtpsziOpqnxTTELKBkCrSuZ0kimSyFphDjdB9ZtGiM6pKTskfQtF3k/Ah+ss8LsgFDtZ3m0gsjKuvCDmV4WYJ5y/EU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b324e64-94ba-48f0-273a-08d745fb197e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:26.5229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxhXk2Er6bhd2po8pe/n8j589wJ7OuhO7hB31lt3WyrceIH36aKCBF1iTPKY+GcIV7AgDPOrjlpwpZItlwpTaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Unify the definitions of atomic_sub_if_positive() &
atomic64_sub_if_positive() using a macro like we do for most other
atomic functions. This allows us to share the implementation ensuring
consistency between the two. Notably this provides the appropriate
loongson3_war barriers in the atomic64_sub_if_positive() case which were
previously missing.

The code is rearranged a little to handle the !kernel_uses_llsc case
first in order to de-indent the LL/SC case & allow us not to go over 80
characters per line.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/atomic.h | 164 ++++++++++++---------------------
 1 file changed, 58 insertions(+), 106 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.=
h
index 24443ef29337..96ef50fa2817 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -192,65 +192,71 @@ ATOMIC_OPS(atomic64, xor, s64, ^=3D, xor, lld, scd)
  * Atomically test @v and subtract @i if @v is greater or equal than @i.
  * The function returns the old value of @v minus @i.
  */
-static __inline__ int atomic_sub_if_positive(int i, atomic_t * v)
-{
-	int result;
-
-	smp_mb__before_atomic();
-
-	if (kernel_uses_llsc) {
-		int temp;
-
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	"MIPS_ISA_LEVEL"			\n"
-		"	" __SYNC(full, loongson3_war) "			\n"
-		"1:	ll	%1, %2		# atomic_sub_if_positive\n"
-		"	.set	pop					\n"
-		"	subu	%0, %1, %3				\n"
-		"	move	%1, %0					\n"
-		"	bltz	%0, 2f					\n"
-		"	.set	push					\n"
-		"	.set	"MIPS_ISA_LEVEL"			\n"
-		"	sc	%1, %2					\n"
-		"\t" __SC_BEQZ "%1, 1b					\n"
-		"2:	" __SYNC(full, loongson3_war) "			\n"
-		"	.set	pop					\n"
-		: "=3D&r" (result), "=3D&r" (temp),
-		  "+" GCC_OFF_SMALL_ASM() (v->counter)
-		: "Ir" (i) : __LLSC_CLOBBER);
-	} else {
-		unsigned long flags;
+#define ATOMIC_SIP_OP(pfx, type, op, ll, sc)				\
+static __inline__ int pfx##_sub_if_positive(type i, pfx##_t * v)	\
+{									\
+	type temp, result;						\
+									\
+	smp_mb__before_atomic();					\
+									\
+	if (!kernel_uses_llsc) {					\
+		unsigned long flags;					\
+									\
+		raw_local_irq_save(flags);				\
+		result =3D v->counter;					\
+		result -=3D i;						\
+		if (result >=3D 0)					\
+			v->counter =3D result;				\
+		raw_local_irq_restore(flags);				\
+		smp_mb__after_atomic();					\
+		return result;						\
+	}								\
+									\
+	__asm__ __volatile__(						\
+	"	.set	push					\n"	\
+	"	.set	" MIPS_ISA_LEVEL "			\n"	\
+	"	" __SYNC(full, loongson3_war) "			\n"	\
+	"1:	" #ll "	%1, %2		# atomic_sub_if_positive\n"	\
+	"	.set	pop					\n"	\
+	"	" #op "	%0, %1, %3				\n"	\
+	"	move	%1, %0					\n"	\
+	"	bltz	%0, 2f					\n"	\
+	"	.set	push					\n"	\
+	"	.set	" MIPS_ISA_LEVEL "			\n"	\
+	"	" #sc "	%1, %2					\n"	\
+	"	" __SC_BEQZ "%1, 1b				\n"	\
+	"2:	" __SYNC(full, loongson3_war) "			\n"	\
+	"	.set	pop					\n"	\
+	: "=3D&r" (result), "=3D&r" (temp),					\
+	  "+" GCC_OFF_SMALL_ASM() (v->counter)				\
+	: "Ir" (i)							\
+	: __LLSC_CLOBBER);						\
+									\
+	/*								\
+	 * In the Loongson3 workaround case we already have a		\
+	 * completion barrier at 2: above, which is needed due to the	\
+	 * bltz that can branch	to code outside of the LL/SC loop. As	\
+	 * such, we don't need to emit another barrier here.		\
+	 */								\
+	if (!__SYNC_loongson3_war)					\
+		smp_mb__after_atomic();					\
+									\
+	return result;							\
+}
=20
-		raw_local_irq_save(flags);
-		result =3D v->counter;
-		result -=3D i;
-		if (result >=3D 0)
-			v->counter =3D result;
-		raw_local_irq_restore(flags);
-	}
+ATOMIC_SIP_OP(atomic, int, subu, ll, sc)
+#define atomic_dec_if_positive(v)	atomic_sub_if_positive(1, v)
=20
-	/*
-	 * In the Loongson3 workaround case we already have a completion
-	 * barrier at 2: above, which is needed due to the bltz that can branch
-	 * to code outside of the LL/SC loop. As such, we don't need to emit
-	 * another barrier here.
-	 */
-	if (!__SYNC_loongson3_war)
-		smp_mb__after_atomic();
+#ifdef CONFIG_64BIT
+ATOMIC_SIP_OP(atomic64, s64, dsubu, lld, scd)
+#define atomic64_dec_if_positive(v)	atomic64_sub_if_positive(1, v)
+#endif
=20
-	return result;
-}
+#undef ATOMIC_SIP_OP
=20
 #define atomic_cmpxchg(v, o, n) (cmpxchg(&((v)->counter), (o), (n)))
 #define atomic_xchg(v, new) (xchg(&((v)->counter), (new)))
=20
-/*
- * atomic_dec_if_positive - decrement by 1 if old value positive
- * @v: pointer of type atomic_t
- */
-#define atomic_dec_if_positive(v)	atomic_sub_if_positive(1, v)
-
 #ifdef CONFIG_64BIT
=20
 #define ATOMIC64_INIT(i)    { (i) }
@@ -269,64 +275,10 @@ static __inline__ int atomic_sub_if_positive(int i, a=
tomic_t * v)
  */
 #define atomic64_set(v, i)	WRITE_ONCE((v)->counter, (i))
=20
-/*
- * atomic64_sub_if_positive - conditionally subtract integer from atomic
- *                            variable
- * @i: integer value to subtract
- * @v: pointer of type atomic64_t
- *
- * Atomically test @v and subtract @i if @v is greater or equal than @i.
- * The function returns the old value of @v minus @i.
- */
-static __inline__ s64 atomic64_sub_if_positive(s64 i, atomic64_t * v)
-{
-	s64 result;
-
-	smp_mb__before_llsc();
-
-	if (kernel_uses_llsc) {
-		s64 temp;
-
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	"MIPS_ISA_LEVEL"			\n"
-		"1:	lld	%1, %2		# atomic64_sub_if_positive\n"
-		"	dsubu	%0, %1, %3				\n"
-		"	move	%1, %0					\n"
-		"	bltz	%0, 1f					\n"
-		"	scd	%1, %2					\n"
-		"\t" __SC_BEQZ "%1, 1b					\n"
-		"1:							\n"
-		"	.set	pop					\n"
-		: "=3D&r" (result), "=3D&r" (temp),
-		  "+" GCC_OFF_SMALL_ASM() (v->counter)
-		: "Ir" (i));
-	} else {
-		unsigned long flags;
-
-		raw_local_irq_save(flags);
-		result =3D v->counter;
-		result -=3D i;
-		if (result >=3D 0)
-			v->counter =3D result;
-		raw_local_irq_restore(flags);
-	}
-
-	smp_llsc_mb();
-
-	return result;
-}
-
 #define atomic64_cmpxchg(v, o, n) \
 	((__typeof__((v)->counter))cmpxchg(&((v)->counter), (o), (n)))
 #define atomic64_xchg(v, new) (xchg(&((v)->counter), (new)))
=20
-/*
- * atomic64_dec_if_positive - decrement by 1 if old value positive
- * @v: pointer of type atomic64_t
- */
-#define atomic64_dec_if_positive(v)	atomic64_sub_if_positive(1, v)
-
 #endif /* CONFIG_64BIT */
=20
 #endif /* _ASM_ATOMIC_H */
--=20
2.23.0

