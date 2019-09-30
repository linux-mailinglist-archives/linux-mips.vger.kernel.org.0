Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3D9C2A9C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732301AbfI3XKc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:10:32 -0400
Received: from mail-eopbgr710108.outbound.protection.outlook.com ([40.107.71.108]:6114
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732384AbfI3XIX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mj42OKhRSbHW0bmsvQ/gWlVW7Z5eRq3YnJeNZqhNRmYMCRTjtxe4VlWssYOcKnTSlZ4EBYy/w6+MG2v761DOxUawzD9BT5gYP6WGYJqaViX+QWEyJbgKP+4WO+Vg6JqaJ9+R7lO2G8a/EWWiErrGlnWYn4hWvBoLO+WGQKw1XtKmiEoBZnO/Fzzo5aUJNNJcb9AZPG3BFf4VHtfy0JRSCFYgtIRaDGAvmxpgVvSf+p8jDBWaXxoOghW4ZFQFtLfH6CxuNC0HWI/IRdqz9xXkrR9lNDt59PBubXKRq5BUNYWTUHSAmIq3jM6V+w0F+rOUSMsg5IyJJb2Ptzhmha05+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sj0N9tgKe3Xgp9DvCFSq/7QXgi9lOry5y2YcyKp6Vu8=;
 b=OX8/q1FyRiNaqx1pYvmtjCOYimOyqs0RmfeydzP2oRJ1eIHpXdkH5gdd4gQHdp3mtN72IK8gzFOdXenTRUU/AXZR5tTL8OsPecSVzyfATKCNEzqZxvvQPxk/QGPdUu98DQ7AN0JHvmYHUbikRVPSCGOf002M3S0TdW+a4558oJR9p7xo/hCqZIYIsZNsSsy7aRZDhTqLg2ydf1LbN3hGZ12onQxpIyu5IoJZr/3s6bTEJil//XJOiq3yXP0VSMafXTlNgZnPqXHF5sG/463y0EPg+/REqaS58+wjs0WpYySqKFBO46jtsAB0wcaJzAFo82YU8mDMEnbXUqUwB0ZNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sj0N9tgKe3Xgp9DvCFSq/7QXgi9lOry5y2YcyKp6Vu8=;
 b=i5E8/C4fhCafDK+uNTEpu+OKzzx7ySKf+sO5oqQl+IQ7G88dLTpR43zsAS4IbWYztx4v93IlLNEuggK+6vNaqpAhWMyNNVkqEpqgQzF1CNpx3UkqSWBg4vA3vrtluUrm7+aZAuDKCfgho13JwfqhTrwLkP22496kilKhCtNA8LY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1709.namprd22.prod.outlook.com (10.164.206.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 23:08:21 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:21 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 07/37] MIPS: barrier: Clean up __sync() definition
Thread-Topic: [PATCH 07/37] MIPS: barrier: Clean up __sync() definition
Thread-Index: AQHVd+PzVVIdvKywjkGdJ87RMl/84A==
Date:   Mon, 30 Sep 2019 23:08:20 +0000
Message-ID: <20190930230806.2940505-8-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 0b152cfa-63df-4a53-06be-08d745fb15f6
x-ms-traffictypediagnostic: MWHPR2201MB1709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB170988DB7DC8C6CB1E8DAF1BC1820@MWHPR2201MB1709.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39840400004)(376002)(346002)(396003)(136003)(199004)(189003)(43544003)(2351001)(66476007)(66556008)(66946007)(64756008)(66446008)(107886003)(99286004)(6486002)(52116002)(5640700003)(6436002)(25786009)(478600001)(14454004)(76176011)(26005)(6512007)(5660300002)(71200400001)(71190400001)(1076003)(4326008)(186003)(42882007)(6506007)(11346002)(256004)(486006)(44832011)(476003)(2616005)(446003)(54906003)(316002)(7736002)(305945005)(6116002)(2906002)(3846002)(81156014)(81166006)(102836004)(50226002)(6916009)(386003)(36756003)(8676002)(8936002)(66066001)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1709;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lxCgdqeQV5jGYRdCVhit9T76cKJRFcPZRqwx//NUEHw0IcJmVQQITQK27YUzgtDND0/fsdy8hejizTl9yHe2fe/S2OgfgfPlzX58aWGSyw6xEzJmsjlI5E3Csocuk8uAIprMuRJhRN2VK0hhHNY4CLWqaVutXf5xp7V/Y+ul2TyZ7fIJDMtga5MLiNaKUxLtAMscXZrjIV1hi3ad95tO10tc1whCRK29mrRc+GyxtQSd44pDW4nVOiOKEsdz4nrgjd8tHOWp8MWKMR7chl6Gfp1FQAsqCLkGJ78cEkpmmJ9yX40rf6oYfKukXkZKGOvT3ccqcQlNENpJZS+0t7WDnu7WMFEhmwBQAKlzWB5F5j6/M3JjX5KIs+vPA8BQWX+5aQZdLs6cO5mzd1k5wFpT8WOZHqwNZrcbSnSbfwYrDdI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b152cfa-63df-4a53-06be-08d745fb15f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:20.6866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P9HDup82Bq4LPZrO5645n8/mDzOCmNhvsaL54kU+G5XyMDZxUNWKM2UKy+Fe8tbPQAS+RimC3lSqrzJAgPuB8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1709
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Implement __sync() using the new __SYNC() infrastructure, which will
take care of not emitting an instruction for old R3k CPUs that don't
support it. The only behavioral difference is that __sync() will now
provide a compiler barrier on these old CPUs, but that seems like
reasonable behavior anyway.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/barrier.h | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index 657ec01120a4..a117c6d95038 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -11,20 +11,10 @@
 #include <asm/addrspace.h>
 #include <asm/sync.h>
=20
-#ifdef CONFIG_CPU_HAS_SYNC
-#define __sync()				\
-	__asm__ __volatile__(			\
-		".set	push\n\t"		\
-		".set	noreorder\n\t"		\
-		".set	mips2\n\t"		\
-		"sync\n\t"			\
-		".set	pop"			\
-		: /* no output */		\
-		: /* no input */		\
-		: "memory")
-#else
-#define __sync()	do { } while(0)
-#endif
+static inline void __sync(void)
+{
+	asm volatile(__SYNC(full, always) ::: "memory");
+}
=20
 static inline void rmb(void)
 {
--=20
2.23.0

