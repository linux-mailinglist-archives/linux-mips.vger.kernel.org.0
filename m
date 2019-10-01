Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC214C4347
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbfJAVxN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:13 -0400
Received: from mail-eopbgr730120.outbound.protection.outlook.com ([40.107.73.120]:2512
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728009AbfJAVxM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWndTvRWe5nLMIb6lb3jh6G6dRQTu087WbnJAf6YGQqLAajloQwLbfk4PL2BzN79ItA46wDncSknfdyhJ1ZuwsUo1W26wIS6lyO/t/2Ep324IB+lL/Mxu6DQefMZEPw/Ve/1B/a7ce/QVuwFA+xR6IrQEHtmLU/tM/0i+92JHkNeKR+dM/jbs9NDDusj2uOl+orDzVfl45mlzE0BvkD1YxpYT9uPne7d4QC6q+V/e/+BitnQgGtvDDlQMWSmppOR8v47W65zRgeeviyFx9VHUgpfXiBptK9ov9W1w8kKXaAS+UamaWFAoAN0DwtUkntQH+hD87WBZgXtU98K6VG9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNUO8WeJjpFVl6pijXSPOS4DqYCVTGhmAbqOX/Q9qoM=;
 b=NdMM0kaq+bhJ8xDkXzuasf+eq871xcbvTuPz2FYRMhOaasrlGSTNU2L/oW4YyZ4WyGHGJW/QZrvKBwA+7wAB9wBBhbhG4mZXwLeVqdjEp8cx5eloTRI5y7jnYPsymoZApyZjZznJ8OteCjJB0EyjTrBPABAxyY+EO2CgoTItOezki1WMohzft+lWwv7HZ+p6GlQ1jQkWx8nmY2bsBXPm/3IieDb+bmuzafT1K4yajCoaypWXu7uv5tf8vN194C4mW2Rd3Inoqz58MsQM8z/YKOpoJioQOKPscmW4+1TXAxJhm6Ln1AU5jVmCptm7tueMrT3KTJIygvHoipuHwTqA/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNUO8WeJjpFVl6pijXSPOS4DqYCVTGhmAbqOX/Q9qoM=;
 b=ltRIJU7ghz2bXFNUWhVwp/+5BS96ydNkfVhcJazS/QlKHGwFUZ/S7Dqlehyo3E1aIXoyr3Sxa10FAXNKaHB9NfjnNi/e+Xd4de0RsFpA0KUXfwrmecUxPlAlQt59d/fCnZ6hW/x02zMZ5QhHpsa8eYWs/NaS7lvGSFOopSjiS4U=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1213.namprd22.prod.outlook.com (10.172.61.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:07 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:07 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 02/36] MIPS: Use compact branch for LL/SC loops on MIPSr6+
Thread-Topic: [PATCH v2 02/36] MIPS: Use compact branch for LL/SC loops on
 MIPSr6+
Thread-Index: AQHVeKKb9mKJgp21ekqbovI5ofLUZw==
Date:   Tue, 1 Oct 2019 21:53:06 +0000
Message-ID: <20191001215249.4157062-3-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 864ad0ae-5e78-49d9-52f4-08d746b9be09
x-ms-traffictypediagnostic: MWHPR2201MB1213:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB12136B685401CA676877870BC19D0@MWHPR2201MB1213.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(376002)(136003)(39840400004)(199004)(189003)(6512007)(5640700003)(54906003)(2501003)(4744005)(3846002)(6486002)(5660300002)(6436002)(66066001)(6116002)(1076003)(50226002)(2906002)(76176011)(52116002)(6506007)(107886003)(2351001)(4326008)(6916009)(102836004)(71190400001)(8936002)(386003)(25786009)(36756003)(44832011)(8676002)(71200400001)(81166006)(81156014)(186003)(256004)(11346002)(2616005)(7736002)(316002)(42882007)(305945005)(99286004)(66446008)(64756008)(66556008)(478600001)(66946007)(66476007)(486006)(446003)(476003)(14454004)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1213;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WxNXCvplV5lKm3I0atZNFXktHkQ6yyiy2NYXGJZI4o+TvkWFpsZwqrVr/iKeF4B7ItR0B/Bgx2YXNk56HH7CxN7CKbIXonUu5J+sfmEVoduRmrlZ2wQB9qDftIor1y+VimWKJP5QQA+K/TMD5BJf4oXwkSyD2xwOXaX78u7mfvNaECkprpQshWyu59ZajBzeO2SNZp8IOUVmJZSj2cIGbd1sMez/S2SBwTsF2MkhmJwOin86LZNTgfvlylhYAFl+aiaslkp2c/se5bMP20y6nP8gZvtEi9vHGqxUKP4SsvvETwsHaXKRBe+kJifR489tlR833MjjOhoFsQRT6nNxH4/q1jsSg8TfPkXb0ggWg7Rj/6OAsrU2XAL5xqAZteWMRr9ehEROU3XIXwjgtOvsNsDa26oUUMUT6kppG7+PyVY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864ad0ae-5e78-49d9-52f4-08d746b9be09
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:06.9079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ke5PqEn2hiVAAOymUP4pDXc9Xqddg46Ch+uFeQsoyvZunaT9LKcAUXyuCCCQbKMqF2op0RpOpWi20w4h4rkDow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1213
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When targeting MIPSr6 or higher make use of a compact branch in LL/SC
loops, preventing the insertion of a delay slot nop that only serves to
waste space.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/llsc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/llsc.h b/arch/mips/include/asm/llsc.h
index 9b19f38562ac..d240a4a2d1c4 100644
--- a/arch/mips/include/asm/llsc.h
+++ b/arch/mips/include/asm/llsc.h
@@ -9,6 +9,8 @@
 #ifndef __ASM_LLSC_H
 #define __ASM_LLSC_H
=20
+#include <asm/isa-rev.h>
+
 #if _MIPS_SZLONG =3D=3D 32
 #define SZLONG_LOG 5
 #define SZLONG_MASK 31UL
@@ -32,6 +34,8 @@
  */
 #if R10000_LLSC_WAR
 # define __SC_BEQZ "beqzl	"
+#elif MIPS_ISA_REV >=3D 6
+# define __SC_BEQZ "beqzc	"
 #else
 # define __SC_BEQZ "beqz	"
 #endif
--=20
2.23.0

