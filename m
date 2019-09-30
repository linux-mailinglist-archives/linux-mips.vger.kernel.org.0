Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE775C2A7F
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732790AbfI3XJZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:25 -0400
Received: from mail-eopbgr820129.outbound.protection.outlook.com ([40.107.82.129]:60959
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732782AbfI3XJZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:09:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLTkSPlp7aWJiNBGE0zegV+h93v5qsgKibWC2A7paMHa2YNgWYDq2GrTex0jjFSw0SsquR/rl80yQ5AwaxN/Vp2eCVcWXa5wJk/tTm2N6mMkiLqX438xFxhwYDOKKzP49O+hzpDiOzNzHpjYnggJAoRaHul3jyU7ot2kBv0M7/LBjwaEsVVPrjI1u2wm7+naH2EKk7pQwAWS1t0NCNmpt5S7M+yUiiRs0ycINQlYan4T7y0q77/B+wAJdqh+vDmqH72iYOD80PsHvk6YyYOlCaQGCNBfKN2U6vgVJM/GcUYESngbwnqSZbcenfsl3egsqRuJtze/ioo6nDTanKdZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDvKslP4waykgwOT3pICa4cjuCwk8SfOxtgfBgmSfb4=;
 b=Q3UDbVA0rEdmAZrDkXGJrt0Z3KAOsBc4kfwRhvNsmbEto+KAlkyIGbesTIawlRfOSYkYCBp2P0N4txOlUqgb8JyfkGieOxUFjKsLiMRp5Dv0C/DEMXRVtffcgER6KNjtMwM0IVi7ToK+8VaB6xkcW8g3FtCTBs82wmDJs3jfdEa+xhVNzs4gIp2Xtb3o0noqdmQrrEVUDsmendrMhmS6QYwa0PkS7/gamq0rMoygs1ifS6Q5RTX/8AE6qfGILco9+j1nU6sDCRAzuk+SGU7RrAncPSbznS6KjwRp0VD1jSDClrVdWyy0sWTmP77jlBD70SDDecmtNCpF3WqiKcsoIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDvKslP4waykgwOT3pICa4cjuCwk8SfOxtgfBgmSfb4=;
 b=nSgy2I47NpVbqKLnZUKbt+fEnDHWiAqV7B2UfGdvDw5zFspvOm0nRqQXbZW5FPiIRm2ewU+KbzxhD7IaVjx31DoTj5sOlQXs2lG1s56luZrKuTMizsIDKcL0PvWFwNJP9AjtgZjnbZmDBrQLG9InjS//KMqFICQrX/9SLLydueQ=
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
Subject: [PATCH 35/37] MIPS: genex: Add Loongson3 LL/SC workaround to
 ejtag_debug_handler
Thread-Topic: [PATCH 35/37] MIPS: genex: Add Loongson3 LL/SC workaround to
 ejtag_debug_handler
Thread-Index: AQHVd+QCU5ec8BbikU2GQVtPG2qJTQ==
Date:   Mon, 30 Sep 2019 23:08:44 +0000
Message-ID: <20190930230806.2940505-36-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: da36d510-1352-4f04-31c7-08d745fb2484
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022F1479ABEFD78ABC27F8EC1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(6666004)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(4744005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fg3lXp9ROyZFwTBZx5bigvhv6cZCaVI0aZj8FHtzOMGLbu/qasszOZ7EI6gbc7mzeXiXTjSaPxLvvGFvvFv2h31o0P0xFwOqzNH/iel9+N0cPld4t8AWqbuYIDvPxQp076Fvm/BHMKwXPtDx1/EDs8Qd7yDD7upv05Q/QA7xjwWopW51TWIKDo+DZuoVeGtesXK5xbdqlMacmBFmSnqxOw11Pg6d1KXeslSkYG5YQG3duLrKrRj9qFwkrDG+eEYeJc4NVPkiOKiK/Rfh0jlxQ3ws60zLTpNs2lMfvoK9zQ+hr/Nn14Om3qQDYQQE6wvHfr6oXCtUFedvPuiZ796UOi1PgQUFQXsw3H7IctAX7Py/JinL7IKu6YxAtaADtrBy9CI3brVmKYUUiP4/da4ITiD+jxE7U3DWupJQk/LsO1Q=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da36d510-1352-4f04-31c7-08d745fb2484
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:45.0424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WuqNcb7PxeJ6duo0UuuFpaFjyRqqmAdPxi+MIlvn/IVa1lW0E2SNyzAav1d0s3kYSedisv12vvsRVBEOdUp82A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In ejtag_debug_handler we use LL & SC instructions to acquire & release
an open-coded spinlock. For Loongson3 systems affected by LL/SC errata
this requires that we insert a sync instruction prior to the LL in order
to ensure correct behavior of the LL/SC loop.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/kernel/genex.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index efde27c99414..ac4f2b835165 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -18,6 +18,7 @@
 #include <asm/fpregdef.h>
 #include <asm/mipsregs.h>
 #include <asm/stackframe.h>
+#include <asm/sync.h>
 #include <asm/war.h>
 #include <asm/thread_info.h>
=20
@@ -353,6 +354,7 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
=20
 #ifdef CONFIG_SMP
 1:	PTR_LA	k0, ejtag_debug_buffer_spinlock
+	__SYNC(full, loongson3_war)
 	ll	k0, 0(k0)
 	bnez	k0, 1b
 	PTR_LA	k0, ejtag_debug_buffer_spinlock
--=20
2.23.0

