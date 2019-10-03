Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA9C6CB201
	for <lists+linux-mips@lfdr.de>; Fri,  4 Oct 2019 00:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730027AbfJCWq0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Oct 2019 18:46:26 -0400
Received: from mail-eopbgr760111.outbound.protection.outlook.com ([40.107.76.111]:41351
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726780AbfJCWq0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Oct 2019 18:46:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBO7+yW6d6+Z0nST5+k6uQi9BZdj3IY/GNEt+oqdtmmVwlLNlNUb4KL3hFUet7CtLGpmkFK9VdflJg67t3Y+r3OvcL/1rifmkt8eOo+F3TwKAaykX5j2eQdK08GfR2IAG+gLhnodJo9JUfsCDCfWsdZU1vNNp7fXrRedAcoEsXR7o1X9MTirIBzI67j6ax3/8Zm6pcWuzOe8t9dRoel8h9hGB/2VJs9b55EixfFDeO6k0YmZcr+0+ERbE9XJMpp3EOvxkr5KkA32lN1CnRcDDURgdsVWARh1yXfWJpkQ9ozEyYOfSyv+1fIK3Utndx0PDO0FIp6PxD0IhCY4x1Qr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfVc+jbGzAE+TqFm3iZCSaIwlB07TUO63K1xWaZoCbA=;
 b=hJykASo0mxWU2GU6LgD9lvLJEnKXEZ4os+opCb28h05vD07RTUca8+5knhBTM8jUXLOzzhm2jgfdMmzLzKfQKqGzZOvOQwyCyjDXvvAYbF3i93uOfN2MqswvGSeeycWz2U/lNx/2Gj6AZKpw4zSiiquR0LhSVO/04ffEcQwVCJAsjJdHaoMaAQy8XENR/cbH/ImdOnA/J/FW9FJijvII/J/XhkrbTL83smIHJRDfeT5OO6S9EP7Dii0rOhLFyT7p0RtU8aBjsR9mOH80xNzCHjdosSH23cXFE9yug3AhZdDp2VIepQ0xoIofMHL7KW75Dw7/bCZ0REz9E+U5ETjXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfVc+jbGzAE+TqFm3iZCSaIwlB07TUO63K1xWaZoCbA=;
 b=p0SBJJD1itEWIR8NLY3b1THpBZ/KRPU7gxdERHp5sZPLQjbToPL4VBtTLMIObpsFS5hFKmyWAAPRs7osp+4/3NJ0woL0tWRaxiGUcB6J9K9HXaaHwWPmMc/UHxCRFWqpzF42a5/lQU1zKTAI3uBG8XwZENuB6RSdBqON03RYzco=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1261.namprd22.prod.outlook.com (10.172.60.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 22:46:23 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 22:46:23 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] MIPS: pmcs-msp71xx: Add missing MAX_PROM_MEM definition
Thread-Topic: [PATCH 1/2] MIPS: pmcs-msp71xx: Add missing MAX_PROM_MEM
 definition
Thread-Index: AQHVejxhSn0E15lrLUudQM5ULwarYw==
Date:   Thu, 3 Oct 2019 22:46:23 +0000
Message-ID: <20191003224611.727276-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:180::27) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdbe82cf-3592-49ce-0560-08d748538401
x-ms-traffictypediagnostic: MWHPR2201MB1261:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1261DF0C885417D8994EF28CC19F0@MWHPR2201MB1261.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(366004)(376002)(396003)(346002)(136003)(189003)(199004)(42882007)(26005)(54906003)(316002)(66066001)(25786009)(36756003)(2501003)(186003)(81166006)(81156014)(8676002)(8936002)(6116002)(50226002)(99286004)(52116002)(2906002)(14444005)(6506007)(256004)(486006)(7736002)(305945005)(476003)(2616005)(71200400001)(3846002)(5640700003)(6916009)(71190400001)(44832011)(14454004)(5660300002)(64756008)(478600001)(66476007)(1076003)(2351001)(66556008)(4326008)(66446008)(102836004)(6512007)(6486002)(66946007)(386003)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1261;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bL2mHSVRmZjsp3vxxMbE3J+bUopu2ltyDWam+geymNJ1xwU8B+8Qbzdjk6cZEQkRFJTIujiqCK0ddFF+yD0vd/41oFBK1a9ah/LuSYXmRHV0pIAq2eKlX5xNsK6KRhzraRouWhh8yIvQLly9/rr8G4aerTAxDN8j6+HkyGQIi9mVOhnGbXnvzrdPgrJE7r5pUZzeHTBzzEmN1hiHeoyxf+ClfkKvMs2AUF6jzxtabbt7ktsdf2CFz5aXRMbiFaRbPzBxPTCEjNistYvTpZ0A4j6R1BEMrqk5/1Q4GLgT+F6MC4TWVSdxJaLBE8EFaVoiT9jOleLwT7j9wyrjywQvHBzgalWHNuSZ7TW4Bhe7uCdj6FHGlRu8XfyNe96bev6z2ubYNxna2MI9xj6FGa5P287qmLyTWh2PDoS4ZiVAepw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbe82cf-3592-49ce-0560-08d748538401
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 22:46:23.2408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPAtlbPw5SzH7wPXrp+BTzQfTDkc/HZBz5XmVe7G+L4InMadQx0Jix6qVGNErt/vQCRTjBAuGtIWAMnLa7PrRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1261
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit b3c948e2c00f ("MIPS: msp: Record prom memory") introduced use of
a MAX_PROM_MEM value but didn't define it. A bounds check in
prom_meminit() suggests its value was supposed to be 5, so define it as
such & adjust the bounds check to use the macro rather than a magic
number.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: b3c948e2c00f ("MIPS: msp: Record prom memory")
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
---

 arch/mips/pmcs-msp71xx/msp_prom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/pmcs-msp71xx/msp_prom.c b/arch/mips/pmcs-msp71xx/msp=
_prom.c
index dfb527961a27..f87c522a63e6 100644
--- a/arch/mips/pmcs-msp71xx/msp_prom.c
+++ b/arch/mips/pmcs-msp71xx/msp_prom.c
@@ -61,6 +61,7 @@ int init_debug =3D 1;
 /* memory blocks */
 struct prom_pmemblock mdesc[PROM_MAX_PMEMBLOCKS];
=20
+#define MAX_PROM_MEM 5
 static phys_addr_t prom_mem_base[MAX_PROM_MEM] __initdata;
 static phys_addr_t prom_mem_size[MAX_PROM_MEM] __initdata;
 static unsigned int nr_prom_mem __initdata;
@@ -358,7 +359,7 @@ void __init prom_meminit(void)
 		p++;
=20
 		if (type =3D=3D BOOT_MEM_ROM_DATA) {
-			if (nr_prom_mem >=3D 5) {
+			if (nr_prom_mem >=3D MAX_PROM_MEM) {
 				pr_err("Too many ROM DATA regions");
 				continue;
 			}
--=20
2.23.0

