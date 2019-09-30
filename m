Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1B6C2A54
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732662AbfI3XIw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:52 -0400
Received: from mail-eopbgr690119.outbound.protection.outlook.com ([40.107.69.119]:48448
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732650AbfI3XIv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTZc1MLwcDB3OPOLZxrRQbQztHA6k2zklOLQKzXBjvX9sfmtQHRZBiZ51MT9UEevBlqwFicbBVH5hxtBTsTks1bEHT+oLViiuI6TRPR3Nuc+Nkx+39r9qwM+XCA+3ljHVtEAtFxHuFOyAEh0RE/+VUd8BDOlwR2bWTPK8ALFb93F3ku09chhaX/db8riKt3xJfEHW+yqHRQTgLTQQwFZ/ei2INEfDrziV0GIePnMjIVoEhVk/43hryy7wM/T/enM2JkNAsQE5SKknGry1pbiqPxTjhQKWS/2D2QbXWN4PKVrOXKbX+jf/UAJAQW7Dk+/KPi0IdNYZdbxDXOYatAbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKr1DgS/ZnHEXFw4XWbybZYH/AiQC2vw2bR6v+Hzmks=;
 b=NbqAkDZSbdZ2lt5yIuKQxZdaejtDQL5xh7WrTsxSUegcl5T6VCl3MVd+ZHSj7nMTdkG28MgdBpQOKHvOcABjfAVNez65g2ry/ihiL2wpu1ejQfQe/ylfKvphabwKBCEvKE7U0nrarEmY8eP+VkjNjHC7qTnwVWuXu0oWjpprNAbVtqKONQRtvDzk0hP/Z8LRbPgOu9V7ysF4LsnOA/nctexEksbyPp6P+X0wdy3/k2Ml/EXS3BMTut6Omgq0daOoQ7LVg/PZweFQ9C0VvX6Wb+JNuCg5obKWfjqSUKWycYQTHSnOIExXz87TCc4X1pvutJHg01f9jczCoOUdE7ZLWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKr1DgS/ZnHEXFw4XWbybZYH/AiQC2vw2bR6v+Hzmks=;
 b=DM+8yivJFx/SuNTMEt1P9Rz5h00BHAcsY1gdEI8OoaP03GMG8gefpO3fO1Inh8U3IVCY7Dg3W7jxd9C4yCEJWGlB+Ubu/P9DCFM8qmYP6WAPu6m7kbIZ6flUg7Wt9YbOcu18GrB4hRs0ILWsA5uH75K2yIx9554gHhkQyWjp/Bo=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:34 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:34 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 23/37] MIPS: bitops: Use the BIT() macro
Thread-Topic: [PATCH 23/37] MIPS: bitops: Use the BIT() macro
Thread-Index: AQHVd+P7X5zAOzc0lEaViWRl0/7agA==
Date:   Mon, 30 Sep 2019 23:08:34 +0000
Message-ID: <20190930230806.2940505-24-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: d8ee0c01-fa9e-469b-93fe-08d745fb1e07
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022DF56C974FFC640BEEB3FC1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yd232fM1G/XgdBcgtDYCBIKVVSxFRRSP+1yWq/lDPkAI/Z/SXjtf9g5BcP/Q5G/zCadGsnvJEczZCwXt4g2xnvzGXibmqFhHNgLvXw0K/sm6Fj8iyLarBamEDJQZvkvLia+gF5LPRTx83oY9OXbWI9jEhnZhIJILrrqzmrxZw7/Qip4xH5mXkwB9r7sO5eED8RaywMVxhpXtdgv9n23nxbmHPLlJ4n6AUGF/OxL2y3hRgRzM0nqFMBe4nAkz//7rTUMynUIv7aLPwWWh1M11AMMYsyBqiyGrDwhmvoiyQN3gzIbG9xjRQVCc7vDuoWuRZV+9SP+Y7YDhgOdeiHvk0I5ROcbLiEmEn3YGJ1LLMafa/Wy4zFoRfDCesqDOCA8tDVwwybWFdmYBU9SUnEhBqD7V4HT4mNxg0muf1/q+4+0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ee0c01-fa9e-469b-93fe-08d745fb1e07
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:34.1814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lF63xttofUb7+j2e35M1KJcOm0NoOfOrSmwTnbkqseniEH0dZk2Zwy+MD1DqYmzP8KscSEFgnj6a2rqZvePO2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the BIT() macro in asm/bitops.h rather than open-coding its
equivalent.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/bitops.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 0b0ce0adce8f..35582afc057b 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -13,6 +13,7 @@
 #error only <linux/bitops.h> can be included directly
 #endif
=20
+#include <linux/bits.h>
 #include <linux/compiler.h>
 #include <linux/types.h>
 #include <asm/barrier.h>
@@ -70,7 +71,7 @@ static inline void set_bit(unsigned long nr, volatile uns=
igned long *addr)
 		"	beqzl	%0, 1b					\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "=3D" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (1UL << bit), GCC_OFF_SMALL_ASM() (*m)
+		: "ir" (BIT(bit)), GCC_OFF_SMALL_ASM() (*m)
 		: __LLSC_CLOBBER);
 		return;
 	}
@@ -99,7 +100,7 @@ static inline void set_bit(unsigned long nr, volatile un=
signed long *addr)
 		"	" __SC	"%0, %1				\n"
 		"	.set	pop				\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 	} while (unlikely(!temp));
 }
@@ -135,7 +136,7 @@ static inline void clear_bit(unsigned long nr, volatile=
 unsigned long *addr)
 		"	beqzl	%0, 1b					\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (~(1UL << bit))
+		: "ir" (~(BIT(bit)))
 		: __LLSC_CLOBBER);
 		return;
 	}
@@ -164,7 +165,7 @@ static inline void clear_bit(unsigned long nr, volatile=
 unsigned long *addr)
 		"	" __SC "%0, %1				\n"
 		"	.set	pop				\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (~(1UL << bit))
+		: "ir" (~(BIT(bit)))
 		: __LLSC_CLOBBER);
 	} while (unlikely(!temp));
 }
@@ -213,7 +214,7 @@ static inline void change_bit(unsigned long nr, volatil=
e unsigned long *addr)
 		"	beqzl	%0, 1b				\n"
 		"	.set	pop				\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 		return;
 	}
@@ -228,7 +229,7 @@ static inline void change_bit(unsigned long nr, volatil=
e unsigned long *addr)
 		"	" __SC	"%0, %1				\n"
 		"	.set	pop				\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 	} while (unlikely(!temp));
 }
@@ -261,7 +262,7 @@ static inline int test_and_set_bit_lock(unsigned long n=
r,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+m" (*m), "=3D&r" (res)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 	} else {
 		loongson_llsc_mb();
@@ -274,11 +275,11 @@ static inline int test_and_set_bit_lock(unsigned long=
 nr,
 			"	" __SC	"%2, %1				\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "ir" (1UL << bit)
+			: "ir" (BIT(bit))
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
-		res =3D temp & (1UL << bit);
+		res =3D temp & BIT(bit);
 	}
=20
 	smp_llsc_mb();
@@ -332,7 +333,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 	} else if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(nr)) {
 		loongson_llsc_mb();
@@ -358,11 +359,11 @@ static inline int test_and_clear_bit(unsigned long nr=
,
 			"	" __SC	"%2, %1				\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "ir" (1UL << bit)
+			: "ir" (BIT(bit))
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
-		res =3D temp & (1UL << bit);
+		res =3D temp & BIT(bit);
 	}
=20
 	smp_llsc_mb();
@@ -400,7 +401,7 @@ static inline int test_and_change_bit(unsigned long nr,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 	} else {
 		loongson_llsc_mb();
@@ -413,11 +414,11 @@ static inline int test_and_change_bit(unsigned long n=
r,
 			"	" __SC	"\t%2, %1			\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "ir" (1UL << bit)
+			: "ir" (BIT(bit))
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
-		res =3D temp & (1UL << bit);
+		res =3D temp & BIT(bit);
 	}
=20
 	smp_llsc_mb();
--=20
2.23.0

