Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9E8C4310
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbfJAVxp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:45 -0400
Received: from mail-eopbgr750107.outbound.protection.outlook.com ([40.107.75.107]:29167
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728206AbfJAVxk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfEnthP9G2b7/xZ19kw37z/vIN8nS+7xeNoqDD+qfa4wZsfBCghkgGldO8AZLKllkMCMF8exJXztGAKBuyjKvJTNEkIx6156rvBROLGIahk6aNjDx8cnU36E4ZUzOtbMBVFM8ZiySKziMBBC3PR98ozcWU7VJaJQwPAKJgTxvEv5IUb/vd34A+bx8lRFIV1gI5lsdRZ8mNcmMSWb0P3GrO2WsPUSwbXDc66ZuUsM0MQp8kRv8wiQ63trvzGfLgjLiaf4KriJ7JKp2GumaHEgDe4Olrff/7ZRewDQQZjHaM7fernh06v1DCm9RF8PTtSI29pUqFEX6vtzq0e3gG2lig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cesVpm9iaWg8/mEmkyc7BFfg1I1588Rr4QlIPaQRPiU=;
 b=PIYI/V4+EEQ9+N9k9mnyMPT2XcMl4eLQXpw2NMg17rbv2fl4/6/XbMCUepweHPbetoGnqDWi+rKzib+kTLPVLMwz6ERJYAVoKdGpjSgyQHTnhfB7qXc8SB6LgMOZj1/1rhmL1tcd1NTdx3tDcEnZQ4lXcB4RrchAlwOMa5bggj0BfIas1mfyOaJcXC/EK/l3iTE6Tukiz1ys3ci00o+wB3SPFrgOMlMZyPUmC1Sv3k8S96+PKxEVI6jNrsx2HtJu29nU17NEshn1bbZtRMzLVzMohijaPqUuvI6WxOEujpsnqkriiVN9JBjCy8qJ4EG7qecHOc9I/FuUPKWFi85yaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cesVpm9iaWg8/mEmkyc7BFfg1I1588Rr4QlIPaQRPiU=;
 b=qcWHbxwp/j4I39V+mQega4XfN9N+icoYbc2Z+yZGD7o9QqQRNWggO6/Kcv/I7RvaGT+xnNrkrmcrTkorkiPzs/+dP108rlNqcq5+/J1Pjq7AGJ/t+OjMSuk3L3FU7oe80BDvfrpHsNGC+XvhbIgwbpnDthb+sThQDsJIJKr8T6I=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1581.namprd22.prod.outlook.com (10.174.167.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Tue, 1 Oct 2019 21:53:36 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:36 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 27/36] MIPS: bitops: Use smp_mb__before_atomic in test_*
 ops
Thread-Topic: [PATCH v2 27/36] MIPS: bitops: Use smp_mb__before_atomic in
 test_* ops
Thread-Index: AQHVeKKtOOr6hECUOEGysD9KJdfMKg==
Date:   Tue, 1 Oct 2019 21:53:36 +0000
Message-ID: <20191001215249.4157062-28-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 293abf96-075f-4007-0363-08d746b9cfa1
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1581EB62768F791F8967BEF6C19D0@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(366004)(346002)(396003)(376002)(189003)(199004)(8936002)(26005)(478600001)(6512007)(8676002)(81166006)(81156014)(6916009)(386003)(76176011)(186003)(6506007)(25786009)(52116002)(6436002)(99286004)(6486002)(316002)(102836004)(54906003)(14454004)(5640700003)(2501003)(486006)(66476007)(7736002)(256004)(14444005)(66556008)(66946007)(1076003)(64756008)(36756003)(107886003)(66066001)(66446008)(4326008)(42882007)(2906002)(3846002)(6116002)(476003)(446003)(2616005)(11346002)(2351001)(71190400001)(44832011)(5660300002)(50226002)(305945005)(71200400001)(101420200001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ItjOJvWp4BzWFI1Kdp2svZtYDlGbNf5zWk5vyVobfr0yWrXuGcAigXsAKqGKkbnwVYseDlNQPe3TKMrBw0VCEs2vthGPkbvSypTgDyi8wFeYzi2Koe4DN3OK+AxsbpIEhIwn7ObPc3bcvRHk+ZnMBoNpgMfacKA1kLgSoMvgWexz4o0ag8EuSR7XG7t9f9XoN+Vl0XyU3kSnIGpID6cvXPL73zyX0vZMt4n/Ik9VWDdI2ljZK7bJOycO0yOo/LxfvAbbzYxCjYxIQ+j2o78tAK06pwe8qQ/Drl26F9i5ridaW3bhCXLAZubADfZr9jw4njiBNgthj7lrLn3NuhoRIBYJJb9fEZ3AIaVLCJM3QOkDstEVsxgpj/UMAkuqr5kXBTpuL8SOww9t5qvB+kuhR+r2R4Z9NdRVMXlT5YI102k=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293abf96-075f-4007-0363-08d746b9cfa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:36.5353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x88NzXtKH7dNZFJRPqCEn3lQXqdzogmacEMlSPoq95EOrDOeODy66qwEkokxlJcaB1H7c/brgwQLsrGdGJjPGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use smp_mb__before_atomic() rather than smp_mb__before_llsc() in
test_and_set_bit(), test_and_clear_bit() & test_and_change_bit(). The
_atomic() versions make semantic sense in these cases, and will allow a
later patch to omit redundant barriers for Loongson3 systems that
already include a barrier within __test_bit_op().

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/bitops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index c08b6d225f10..a74769940fbd 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -209,7 +209,7 @@ static inline int test_and_set_bit_lock(unsigned long n=
r,
 static inline int test_and_set_bit(unsigned long nr,
 	volatile unsigned long *addr)
 {
-	smp_mb__before_llsc();
+	smp_mb__before_atomic();
 	return test_and_set_bit_lock(nr, addr);
 }
=20
@@ -228,7 +228,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 	int bit =3D nr % BITS_PER_LONG;
 	unsigned long res, orig;
=20
-	smp_mb__before_llsc();
+	smp_mb__before_atomic();
=20
 	if (!kernel_uses_llsc) {
 		res =3D __mips_test_and_clear_bit(nr, addr);
@@ -265,7 +265,7 @@ static inline int test_and_change_bit(unsigned long nr,
 	int bit =3D nr % BITS_PER_LONG;
 	unsigned long res, orig;
=20
-	smp_mb__before_llsc();
+	smp_mb__before_atomic();
=20
 	if (!kernel_uses_llsc) {
 		res =3D __mips_test_and_change_bit(nr, addr);
--=20
2.23.0

