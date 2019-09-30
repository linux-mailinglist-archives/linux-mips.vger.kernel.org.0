Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99958C2A62
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732783AbfI3XJY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:24 -0400
Received: from mail-eopbgr820129.outbound.protection.outlook.com ([40.107.82.129]:60959
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732777AbfI3XJY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:09:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXOHetU42QHEeg0MCv6+ThaYvd8+DYY8JhrDco1m+cX5BS3abGKQoM9ZzMHKKvCK4u9L1t2sy8Zjc/kuLzyYJb4p1OQ4sQDu0xi582xzbfyzRxen8GcZGwKV/rRlyGvvSs91ulkwfo9e7W/KV1GpaOrd1MTckVorCpWHGqT4tvxc1fRPDI8PSe+Y9Ta9pmIjr2Iy/hyoeIorafMuAXADgcgT9iAl8kZuIP3icjpcLskKInCt+pewTRB3VSPK5uv5mZ4u0iDQbBcEaA/Cz7y+c8dh5nS+cOMcWPfof2a3MApsQbxCmbXJG5C8RpEJ5iRf3Y+lUQuzVfS2kqtjPRywPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Oh8iGFaHrrSrAu0l0lxEekP4OgTK0dgdXb07ooT53M=;
 b=GShPitimI8dWEk9ykM/Po0eod9XXGH6b4KxTwFDJ1XiW1HbWul7+trtIGn2rkP7asqfLpVAI01J3+Pl66pVjTJr/dr097JRFFm1zagPUJaar1StAFGgEZ0xE/sGTkrXUGEuDrL6llnmUBqMxPcO3ZOAtqZMizjm7HyvU5/oDENaaQskzwUlYc3V1Y62xQzc/hUZ1QQxDMMTR3A+MomgVKwcJVq/wjZt6DK9v2BqonGlBhXBj6wWQaLl1/CUh1mJ4qZUUNNX7sMWgvEXU3KJwyPDmDSNfxcFTxaDJiUHhSzbi4xykw0VUSIpShk88kOJkWo1J7vDOt5khNIBhDU5KcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Oh8iGFaHrrSrAu0l0lxEekP4OgTK0dgdXb07ooT53M=;
 b=aBJvOhCOlYv6B3hug9f444Dacb3VhsWadaroTb81wFzo9Yvls1yS5NoILcvCZfFp0vVohdyNChbfPlu3KnaxikdAYNkid9nznlTGP6zNpncmRnmdD2rZVRwAVtQTUSvxdnijZJm8FP1O8sT5Ey7IIuSHAnCLNzVzgYmLutMtjMk=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:09:12 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:09:12 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 34/37] MIPS: barrier: Make __smp_mb__before_atomic() a no-op
 for Loongson3
Thread-Topic: [PATCH 34/37] MIPS: barrier: Make __smp_mb__before_atomic() a
 no-op for Loongson3
Thread-Index: AQHVd+QB2C5901uTZkGZ4j2e1Mzz7Q==
Date:   Mon, 30 Sep 2019 23:08:44 +0000
Message-ID: <20190930230806.2940505-35-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: e95359e3-2061-46ee-9aba-08d745fb2405
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022614EAB7332FECA6577AFC1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(6666004)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002)(101420200001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0xVEJ0+Hike8vH6HiFQ5zdqkxmQPmIB3hvBnS81IWNb/KzPIIuSxdCgM7Yw4r7iLRsN7oj8HUo2MdhUdl/ght4KPOSdjLrTDLx380ojE0W6jsfuKtYSZDwLDbGnZ4J3e329UZ/+Nm8qwlU6IFcPGYXEjvcmF+i8NSWc1TvZ5AGu4N+iYJ9t5Sqp3on0fwE48unvqqpFtN26hdOawcvFqReBiniTm7ese/2G0M8lAlUD+VWFLro4Dwq2dZyHybL6xx0KNLOgfLIoKDsE6VLjFI5XJtwokZunUKWyNjYgDlw3mDvOWr4YXhXUVcS1i4inP53vy+n1c+G4RAtU6VfSaLk+8oDznvrLwMC4WT3tpUEzDRbq+8CpGtJqe4WjI3hRdI7rNKzvRmjb0fTwkzOlla6mCxoG4FhlyfL7lNPnYMPg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95359e3-2061-46ee-9aba-08d745fb2405
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:44.1618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7vOFl4ys0Qyb1LOOiP/GWyOxyq871aQlvrHqw6ZQR1nCE8sydOh080dcZ61maUzNmOTCz9u092hL61d54iAtAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson3 systems with CONFIG_CPU_LOONGSON3_WORKAROUNDS enabled already
emit a full completion barrier as part of the inline assembly containing
LL/SC loops for atomic operations. As such the barrier emitted by
__smp_mb__before_atomic() is redundant, and we can remove it.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/barrier.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index 1a99a6c5b5dd..f3b5aa0938c1 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -118,7 +118,17 @@ static inline void wmb(void)
 #define nudge_writes() mb()
 #endif
=20
-#define __smp_mb__before_atomic()	__smp_mb__before_llsc()
+/*
+ * In the Loongson3 LL/SC workaround case, all of our LL/SC loops already =
have
+ * a completion barrier immediately preceding the LL instruction. Therefor=
e we
+ * can skip emitting a barrier from __smp_mb__before_atomic().
+ */
+#ifdef CONFIG_CPU_LOONGSON3_WORKAROUNDS
+# define __smp_mb__before_atomic()
+#else
+# define __smp_mb__before_atomic()	__smp_mb__before_llsc()
+#endif
+
 #define __smp_mb__after_atomic()	smp_llsc_mb()
=20
 static inline void sync_ginv(void)
--=20
2.23.0

