Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEBF8C433E
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbfJAVzM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:55:12 -0400
Received: from mail-eopbgr730120.outbound.protection.outlook.com ([40.107.73.120]:2512
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728024AbfJAVxS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgV22Konmbnockrb4wPYzNOtOF8/VzN2Fq9Y7b5QfiUbyrCeyGCwIcJaLpuV1L90+jutn8nHvJXc58k6jupn7hCNgBJa9e/rysUdvTmoxcshbuc6JSJV3s4SMqKz91ZajYb/Uy3DB76r+fMZB2dHKVr1bcpYybpSZKqWj5CY26s/4o8yLZ4TfZ9wcD1JwMqBzPgJgISMYP0oLm7oxbj3V8bZl1Wyw2LYzv30BRDPBXZ2hU2vCWVInlMC/WlKrItLfa1yG8QMUdnZ0xKRqxxTAnuTFfvWpZmw3szDbI4MxPI+1ESBwLj07+fNQMSZ9fGYeXjvYTVK1DBqjo3wDqU9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HErJtKN+ZByZN+F9FXcEwN0O0QpNIL2oUDRyjUdVTrs=;
 b=Y/FQJ1yuLm4ZoLG5aZVQp3EQjGMRrQoV0zJ8DLY31vObjvf5wBlAchujWwG0PxRlcFEpwbjpYHJ+MSmlhCkq6e+5BTfddmzZm7Cn2XXmoqZAUfJ3cMvrmSJokN+isLkDkM5yoT08BnE+4paJmcyMMNjCkFvBxp+7rTie49B5Rf6AkNt3c4pz/sluy/4WVMK87n7qijbjGonq5VHD84g+pgyIB5lhhbpxEkzaMrzAWaCKAXgYeAHQfGlNbL0RB3S941WALvRsajdSNGbFcNYYIaCDHVZKx+MC9dmTbpMkvocY5yJInSIqoHy9O31rcr0HFwxhuVkUy+UHS/159Wg/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HErJtKN+ZByZN+F9FXcEwN0O0QpNIL2oUDRyjUdVTrs=;
 b=b4MOgLCx1lP5GctnId8KafRy925SDUN0qJDJ3gNkjlpo6ddRyf4Wf98EZzrgy+ajCbzmMSkMDj+YSJMuEUSoTfUApgdHn71weW6ixJu/oIPBKnbxWt9Fn5jTAPoaVJlSzXlcDCLBVLuz/pKibmKak10atT6aiDEdpPlMmxiP+OE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1213.namprd22.prod.outlook.com (10.172.61.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:10 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:10 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 05/36] MIPS: barrier: Clean up __smp_mb() definition
Thread-Topic: [PATCH v2 05/36] MIPS: barrier: Clean up __smp_mb() definition
Thread-Index: AQHVeKKdE9HQxFlerUGI5C03xj1djA==
Date:   Tue, 1 Oct 2019 21:53:10 +0000
Message-ID: <20191001215249.4157062-6-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: af156861-480a-4fd9-31bf-08d746b9bfec
x-ms-traffictypediagnostic: MWHPR2201MB1213:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB12133AAABA72439268A226B9C19D0@MWHPR2201MB1213.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(376002)(136003)(39840400004)(199004)(189003)(6512007)(5640700003)(54906003)(2501003)(3846002)(6486002)(5660300002)(6436002)(66066001)(6116002)(1076003)(50226002)(2906002)(76176011)(52116002)(6506007)(107886003)(2351001)(4326008)(6916009)(102836004)(71190400001)(8936002)(386003)(25786009)(36756003)(44832011)(8676002)(71200400001)(81166006)(81156014)(186003)(256004)(11346002)(14444005)(2616005)(7736002)(316002)(42882007)(305945005)(99286004)(66446008)(64756008)(66556008)(478600001)(66946007)(66476007)(486006)(446003)(476003)(14454004)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1213;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R/Ey45PSJ9zmvijFSRxzjFMvh064BGWOIpWbXci9/Sp7NEdzCnTGpvfRaiJ65uzVq46OqAUMdWSHSRuUXKQYf7DEBvE9PvKjCBWha7vuzp+K078CrHz67x1LezCm+kAMS8JITt5Em+5LSOvyC2q1XG2eX6PUc7ua8DaUFmi8LlvvzcgjTnxofaOlInsvgPkpuWEhrarRP+gNVNaxCxGsxHuJvHXsJrZDEuGURQN+rzMsF4Rhhkt+JnW90qjj6AvqrAewLySl+ZQ6Jda2ZjnMKF/C2JbQyl5/zmFN3lN0BpIP7flE7RvtjvtBBnH3c0QVvbs2iIF6JzxrmXcJHxS+8nzwz1ARDFdCS+F/UaPPyVBnwFf/2YaGMDxs5cDDqHm9/lUi2bxAPbOOKqVmkWf/0+OWneu+MiDFKISeyrt2I1M=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af156861-480a-4fd9-31bf-08d746b9bfec
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:10.0665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWnEJOUppU1cuO/DusSSdf+eMJsmSieBLvZP8wsV0wuUhne+GMSirmKGqXjp6GbNOHHITdwOKXRwfsFoDl1Wcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1213
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We #ifdef on Cavium Octeon CPUs, but emit the same sync instruction in
both cases. Remove the #ifdef & simply expand to the __sync() macro.

Whilst here indent the strong ordering case definitions to match the
indentation of the weak ordering ones, helping readability.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/barrier.h | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index f36cab87cfde..8a5abc1c85a6 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -89,17 +89,13 @@ static inline void wmb(void)
 #endif /* !CONFIG_CPU_HAS_WB */
=20
 #if defined(CONFIG_WEAK_ORDERING)
-# ifdef CONFIG_CPU_CAVIUM_OCTEON
-#  define __smp_mb()	__sync()
-# else
-#  define __smp_mb()	__asm__ __volatile__("sync" : : :"memory")
-# endif
+# define __smp_mb()	__sync()
 # define __smp_rmb()	rmb()
 # define __smp_wmb()	wmb()
 #else
-#define __smp_mb()	barrier()
-#define __smp_rmb()	barrier()
-#define __smp_wmb()	barrier()
+# define __smp_mb()	barrier()
+# define __smp_rmb()	barrier()
+# define __smp_wmb()	barrier()
 #endif
=20
 /*
--=20
2.23.0

