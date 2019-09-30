Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E39BBC2A70
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732515AbfI3XIe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:34 -0400
Received: from mail-eopbgr820094.outbound.protection.outlook.com ([40.107.82.94]:14848
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732495AbfI3XId (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxO7Vv2OwjZH9DPWNYnMHtZpdIP5cgSJpMO8VHKhm/ZEwP/sUrg9U7tZF0Uz75lqmKXPoXiXkLo2+1K8LkEsdKI++tF2VDm4/Ns5GoHsNcSz1rz54b01J5q6Xl0yIfqHsVQV2QdMqnjqDoYCkgi8Jn8igA8az3UtcJfh26bfiIr5AJ0oIKBxuQOjITQTnDnzbkJCy8+yXDAeyz3cDUCvLMIiFkDsMn7QoN0OPP5/rAr+SvXwbqL6CSpayNPumRYfsLB2y9Dd8Qx4r5mam7onWpXQvlEW6FO8ZUvXkKAQv3dd0laM+qCUvCnVx15GmJzvZclVGAKwEFNAyDkaGoQGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfFkFFyX4dZVqXccoMFyxLU1QIZHdxm2ySnEWOas+FE=;
 b=C3pfc8lL0Tn6nA7hbZ+XV4wuQIoT6hiCkJkPqHTIKg8GoZ+J+1SAdtJXvF5gPyc6n35hIKcM/auzbbPe1FMYRNoFracMFP9rHAcscBv5/Ed0okBQXsBZOF08PSCev+j5qLbCA3/zpMo7kjlRjbNtNIKjWq8yPRLQVIeU4BjIKbBJS6I7gW5MqO/VQkr9Yu31NEkxfgRqM0LZoY7pUIPx8tbDZTESPoKijG1Xrer6DkWEPSS0Eyl+QEzFKvAoO/S1o8MS7DvIImRsXcTEsctFVTrEucq5Xbn1Gntic+2e7vpC32liKvMlUD8w1698sUgE3eui16de+U03UejYnppptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfFkFFyX4dZVqXccoMFyxLU1QIZHdxm2ySnEWOas+FE=;
 b=YsGPy7HrMtPg2g8QyK/ZTgXKYfxLVeAimfbjXNubnlq1gwdmDh4qpwrCWWkdbUX5p+lwRsehgnlEo4c3vVYUO/vVFpudqb9MFke23M2kbXTK3OaocPBdx/kUPsQypTpBEKyhpqKDwHyMruq7nsxMnaiEeLpUOQwZ3Fy3b42+jUs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:25 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:25 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 13/37] MIPS: atomic: Use _atomic barriers in
 atomic_sub_if_positive()
Thread-Topic: [PATCH 13/37] MIPS: atomic: Use _atomic barriers in
 atomic_sub_if_positive()
Thread-Index: AQHVd+P2NMRzSLbeOE2Dihp5C2GVWg==
Date:   Mon, 30 Sep 2019 23:08:25 +0000
Message-ID: <20190930230806.2940505-14-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 5ad43eb9-0a5c-493d-421b-08d745fb18ff
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022073596E9C2020C2D1D29C1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(4744005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yBWvKHClNVX44CNiMysbB/O2iu2jPSi+wDFGrs9Ta1/khIl3Qyd5hP2JzEfCMlPeGiM85inb/8vEqJnzz/ozkx9lNW73AcPfpMQUsqX1CxnbdZDGzAdIWR4GyfaH+/kNkJR7i4abQ4kuS3kDNb44Latyti+p7nghYqdpuZrstGdM3RtQQH3nqu3VSt2jBJUvRHLAFgNALtD44BttWqsjfhzHyishQEiCNs+vOZUjbzNf002gCySQYOv5n1jp3DHZZL6LK5+kaApB872SQ/0iCNrsha/XtReSBqGU/echZMh8z8Oqol7r034iYEJS5Jvx7/Mu1zjfLAst/bxmRGIieEGJkG5JPxnNAMOafvkNzWw0bDuSPylwhsUx/pCQ8HzgnDlz2c50In++o4puzsWYIa6JwrjYUGq2YvKlFG3Wyhg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad43eb9-0a5c-493d-421b-08d745fb18ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:25.6503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KorPUaUHMf6sIzVklDMrF7LDX3nHI5NR5KiixxTiODosFa1aVDVQ5486Q/GSlpnnM4pikM31Y5clpBh26xRohQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use smp_mb__before_atomic() & smp_mb__after_atomic() in
atomic_sub_if_positive() rather than the equivalent
smp_mb__before_llsc() & smp_llsc_mb(). The former are more standard &
this preps us for avoiding redundant duplicate barriers on Loongson3 in
a later patch.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/atomic.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.=
h
index 841ff274ada6..24443ef29337 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -196,7 +196,7 @@ static __inline__ int atomic_sub_if_positive(int i, ato=
mic_t * v)
 {
 	int result;
=20
-	smp_mb__before_llsc();
+	smp_mb__before_atomic();
=20
 	if (kernel_uses_llsc) {
 		int temp;
@@ -237,7 +237,7 @@ static __inline__ int atomic_sub_if_positive(int i, ato=
mic_t * v)
 	 * another barrier here.
 	 */
 	if (!__SYNC_loongson3_war)
-		smp_llsc_mb();
+		smp_mb__after_atomic();
=20
 	return result;
 }
--=20
2.23.0

