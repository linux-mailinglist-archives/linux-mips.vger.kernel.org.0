Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEECCC1E3
	for <lists+linux-mips@lfdr.de>; Fri,  4 Oct 2019 19:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388222AbfJDRlG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Oct 2019 13:41:06 -0400
Received: from mail-eopbgr730100.outbound.protection.outlook.com ([40.107.73.100]:26256
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387428AbfJDRlF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Oct 2019 13:41:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ti2H7lWvJDanMy/xB+tWYhumbeAUvfMUgfAloGXtNMRYnjyMw1mPA7DpFULfCllBHZLnPlUJneQi1lmVJOmd/rvqSoj8EQ3E4u6p6JQgaHUs6LOzOdnzoMcGlRGLWHzgRnk9RFMJt1culbqSkb5PAKO8+IC7w6+d7SLcbtcxDQJmR+Hae8sRxTkiqh5UoIRUUu6e8bzydPeb1MvkTOIurLaJbKPJiiZ+e0khKXzluATjMIVrDe9sOcKL0JsJ4EOtHtHYhGxIZATYSGWnPYDknk3/1bsKxTOvkwwyZaqe4VKpLyM7Pu6eAgmvHWSs6nvyapIG6xc8ERsgBa6pqDDTQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkyCPPxON+1jG0nz+nomCZFzyZAufuMe2VKr7t/C/6U=;
 b=oVcsxr7DwR7QquEniLAB9bZQ1t2JsAzWd11TNChPCvsFGUi22SrXAiQ9L1DZp65e13Smy2mKVVx8sXRFO0UrZloZpnFN9v9JKNENpAqKSCMHAZEFtr2NfPAMwnyWULclCZ24E4PR9QrwW/boXjkxV8Dhb4snI74pDHzLdwfN9vShLCmQqmW0ivek/ig6L23R1XrOhr2XOniuBaFT/vTfDzK7CpWKKao2eHXei0keYnE55GArUkuBJUiGc3HAcH2ogXV2COtADwKA6Ok1TpUO50OxmpgLq0l6Y/VByNLYamrcaw8p1OaGMJrR2EjLlCTsDV9PDVDNE8vpW/AeYO6Srw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkyCPPxON+1jG0nz+nomCZFzyZAufuMe2VKr7t/C/6U=;
 b=C+bB9BFKnOzBWKKQMwFJpPtIB6iu72OL4p7kL6lFhzyHK91sde9tWE/kuBoH0hzGfjhxNGxTvqwita8S5mih5gE3zzOJxApsHUnFVvDInNGw2HQU+3IliFZXlWGpGjyKu+Tw4zyGalU1ZLv7lFjOeibr3ohkP4tqYo9PddbOyVE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1262.namprd22.prod.outlook.com (10.174.162.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 17:41:02 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.023; Fri, 4 Oct 2019
 17:41:02 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: fw/arc: Remove unused addr variable
Thread-Topic: [PATCH] MIPS: fw/arc: Remove unused addr variable
Thread-Index: AQHVetrklvZj5AKU1kGTjJcxK1g0hg==
Date:   Fri, 4 Oct 2019 17:41:02 +0000
Message-ID: <20191004174055.747288-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e15a51a-7ed0-4957-c2d1-08d748f2067d
x-ms-traffictypediagnostic: MWHPR2201MB1262:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB126282F93358E38EAD8B9DD2C19E0@MWHPR2201MB1262.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:381;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(396003)(376002)(39840400004)(346002)(189003)(199004)(4326008)(66556008)(305945005)(1076003)(6916009)(36756003)(4744005)(7736002)(2501003)(66476007)(5660300002)(66446008)(42882007)(26005)(186003)(44832011)(486006)(2351001)(2616005)(476003)(386003)(99286004)(6506007)(102836004)(52116002)(6486002)(54906003)(71190400001)(25786009)(316002)(71200400001)(6512007)(66946007)(5640700003)(81156014)(478600001)(64756008)(14444005)(256004)(2906002)(66066001)(6116002)(3846002)(50226002)(14454004)(81166006)(8676002)(8936002)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1262;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vc89nSQ+qkpyyX+IWBUv1E+9LcM/ygbI26Y7g9imZaFsyDRIyotDfvB2ovmucKngQwqaQeDPvWTPUHrJcIs954XS/r9izxMEybO91JHBZboMwXVa8Ya6AWdmmvm9esvMpNyS4yDnJN2s0OdBtrE8i03kZzAgkvUIwW4502HQxMd5str7bpsvdyGVeZH3EBas8PHDQyrJUYv2CodNfQL/hQO55cV9VkB5b0pfodwKFo/o4+B4eDIcs+NklexhbSIKSNyA8ZF3c4S2p5buquQ2StfQhifYpF3Bo/S1mvkkirbqIQ52+laDQwoi91y8ML95lx15wHhwRHS5M8LLM8JJ6iclb4V4c53Rw6EyKUNNU+wLqTHyFrLeZWoqiCIpIGy4jyQZEgvRMgaDGo7PRSv/4AiyELBiGxsuZSvToSfOJWM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e15a51a-7ed0-4957-c2d1-08d748f2067d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 17:41:02.6494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U1hxjmpaBmswA9kO6RHQYq9ZeknmcJ0PS5OHcUGsfjQfgQIt0loYPY7tzcI5scpbvXKBelpkDrWayDmX2oJ7Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1262
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The addr variable in prom_free_prom_memory() has been unused since
commit 0df1007677d5 ("MIPS: fw: Record prom memory"), leading to a
compiler warning:

  arch/mips/fw/arc/memory.c:163:16:
    warning: unused variable 'addr' [-Wunused-variable]

Fix this by removing the unused variable.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: 0df1007677d5 ("MIPS: fw: Record prom memory")
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
---

 arch/mips/fw/arc/memory.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
index af44b35d79a1..b4328b3b5288 100644
--- a/arch/mips/fw/arc/memory.c
+++ b/arch/mips/fw/arc/memory.c
@@ -160,7 +160,6 @@ void __init prom_meminit(void)
=20
 void __init prom_free_prom_memory(void)
 {
-	unsigned long addr;
 	int i;
=20
 	if (prom_flags & PROM_FLAG_DONT_FREE_TEMP)
--=20
2.23.0

