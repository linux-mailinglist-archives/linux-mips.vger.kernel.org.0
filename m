Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A98B5C4344
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfJAVzX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:55:23 -0400
Received: from mail-eopbgr730127.outbound.protection.outlook.com ([40.107.73.127]:55809
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728033AbfJAVxP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SowhO0dinLJzxPD7NCevQwJHs87NN1cs58/YNOk7S3UJheI6Unm7CCaf/mMfndC2UjU1EorT3n6rIdRuVhZ6Z7ff3wiTvV1GsbM6yma3MK6vfRlwPzprBPCzK8H+U1XphfXUEUNIBarf6bg+mdPiOdFvYYK9xl9zFZyivZGRvzdzfVQuOudG+85EwWa8fVeYSFfmX6rwBegpdzq1qKeI7KO3VEOzmwYla0n/gKj6beXpv7nEeYCfGtAQH9peXL1rrVqPZ8Y5jVt0sMqHIMiWYJS4FcdHRiwk/mBfhDpYkbr22KSgbEc7Lnj/xIKnn8rrXRMNIrzjJoZf6irnEOTK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npxfvJbix+azbh5wI9YeQRTK16AogeGdIvvTh4ZSUuE=;
 b=AXzpY9bOEMMhQgoTBw5DY0B3OvxCJj3901n/hhHdh/wDXlGo6E3zCS6ditQkWOhSAO09t7X2G6XwrSn4XpuJQuYaztpryBCeIcqy5IQA/hrW7wSAVxyAnZrTBa2SUpdx2Idxu/2K95Zy748VGc0LLc1JFCNBlij4yLNOKJxhX+g/PNxl/qC5JrY7uUWjqJVz2BbnXM1tH0LWt6U91KTk5DAvBpncs1x83OPBGuXMLCO+SqDpOV+L8irTBNVkqNXjlxyS7KNG46VH4YH9yeHgmkLSmEQfLO9nYPDzkZYnVWSUaGlcyTuw4NM/YjOeE9BQkS9oT9dacIUeQ+PB4A4UAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npxfvJbix+azbh5wI9YeQRTK16AogeGdIvvTh4ZSUuE=;
 b=Kuc5VAuLygiqCZmb+XBqdE7Eia8Wn3uURYYX6dmsRGbku1R6LIF8f2LUu36Nfo6XfDIkru9Gi732k8mqW0hWXLS8edU4+EWmnDLnZ2gGHXpt6PW3X9tPEl5Iy2anKU8dISgRQeiPnqn//rcahTJTMG7ngAn8/xlwNUx8v916UdY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:13 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:13 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 07/36] MIPS: barrier: Clean up __sync() definition
Thread-Topic: [PATCH v2 07/36] MIPS: barrier: Clean up __sync() definition
Thread-Index: AQHVeKKfcgi1tDGHuEGmrvUl70AtLw==
Date:   Tue, 1 Oct 2019 21:53:13 +0000
Message-ID: <20191001215249.4157062-8-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: aff50c2e-5e22-4610-195f-08d746b9c1cb
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1439C8D6305E573D0237C2AFC19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(43544003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ihd+JeTVdMlc5S8OM7tq7GWLDo++5uSwu+UeTrHk8FQZuORS5qjelJaPbC6Rz3fFoQPE5qlqN2KhuYSnkjelo8WiRqFCDSG3YC94A+HZ4bywxegQTazyKdvVSyTHp6spuoWCExCL6pd63mOp8+59P5HY6JNUFeOTwiurU7Wo78TDFzsQb9AjnJ3Wt26+SWNdVLjsJ5dHvKavTdcgvpahJFHWltdH97WVI9l0BevcR2PPX2SFV+R+YM04+J5yCKvAQbm+WWbWy/71G3b8i8Di0q6duyfBo8M8Uh5eOW6NNbSAE5IWRVjMECcVxkpHTWxjZaOvIWzAJZf7KrxTBdoh8SScqyRSZu6dUBsLLA8IPHJ4CgcJLAvECyv7xPBBOUcKIX4d77LWCoVlaj0Xu37wN9je7LVUSC9aYyuD6Xdu4ps=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff50c2e-5e22-4610-195f-08d746b9c1cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:13.2130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OlH20ZiEk46gHlE5jOmgKg8OsUx+JQ3LBJL8aO5s/lxEWiNQd5FVwTh1RFGSTaeALY/o1xIjQ+HFr+/5ndL5vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
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

Changes in v2: None

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

