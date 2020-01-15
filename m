Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFBC13CF82
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2020 22:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729203AbgAOVyq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Jan 2020 16:54:46 -0500
Received: from mail-dm6nam10on2128.outbound.protection.outlook.com ([40.107.93.128]:58784
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729022AbgAOVyq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Jan 2020 16:54:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfkSRvuHLWXaOVom0xklkB6OdFhDz6yb3hPQpEes5YDO6TCUrUYatJEUclJcAEBNUeK2PeaW5NE41dFeEiHsYI6SftDJV9Bh7mX4vK8nqklX+G8+ddFg9rJ8vmFwLCqeOAr14XqdIY7warzsL3iV/Ndom2TNEuf5NnoSqyNi85SEtSmWLsMeTDB3GYAFVnElC8QY4z7KaDjBTOHIBkwtQ1fNVbwIEQt4ZSRE0nSO+cpMb3ojJqm2XVsFg6Vq/QYXIevMQ+cs9sJQejH1nFRkRzPX0BNQhKhw6N/9FF7KGZ072TuWwKHELJFI/FetLvLR8uKUN/k43PLTBSwM2nF4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8udPcLBXiunmK6SOppCXzlbEzP0DZmdKkhxSfNW0CDU=;
 b=H93AA+ROTB1w15NpupfZgQIqyZ/FS4aQXnWFmLI6888+3qQvRn1iJlSmXkAeaKgBVk2S+qulnATpogW+yZEoZ7nP19H1cAgiaFDH9TscoQj/tmBL+3Hco1yUG3L7wm6mwmvBv4ZcCsDUfNf5gbnsl8FbA0ILMsZHR5plkGRL4+KfF+7QpVH5/Jb19NPUmiYPKsZUO2Pqn4+wRxuQwjt9AxfeLzN6OulrSnHA/u7CaqTJygr+pqbaZFRd/PxXhJRCcAYGTGtecNR70aboXE0YGis4AQ/55jRl1EYDaJPtXIdI97AY33wM2pn8D6rJ24QiGtmKvDmwMHZgtS8FnNghmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=wavecomp.com;
 dkim=pass header.d=wavecomp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8udPcLBXiunmK6SOppCXzlbEzP0DZmdKkhxSfNW0CDU=;
 b=G3gFc2OKx2YY9EQQbzwXQBNswNSmK8+sZotlZqp52HFAcwcEnCi31wRw4z9gxIB2g4UOyEUUNdZqasOw00OMHw6+5BwuoXyAtsC5WtCMIbC99fA1tmGDpqzgaSEyRzGxQS830cIY+yl3GuE9o9dqKP0p5Wn8xKt31QLZr0L2Afs=
Received: from CY4PR2201MB1719.namprd22.prod.outlook.com (10.171.253.148) by
 CY4PR2201MB1366.namprd22.prod.outlook.com (10.171.217.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Wed, 15 Jan 2020 21:54:43 +0000
Received: from CY4PR2201MB1719.namprd22.prod.outlook.com
 ([fe80::b995:dc3f:42c6:c87b]) by CY4PR2201MB1719.namprd22.prod.outlook.com
 ([fe80::b995:dc3f:42c6:c87b%3]) with mapi id 15.20.2623.017; Wed, 15 Jan 2020
 21:54:42 +0000
Received: from box.mipstec.com (4.15.122.74) by BY5PR20CA0027.namprd20.prod.outlook.com (2603:10b6:a03:1f4::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.11 via Frontend Transport; Wed, 15 Jan 2020 21:54:42 +0000
From:   Dengcheng Zhu <dzhu@wavecomp.com>
To:     "peterz@infradead.org" <peterz@infradead.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "acme@kernel.org" <acme@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "alexander.shishkin@linux.intel.com" 
        <alexander.shishkin@linux.intel.com>,
        "jolsa@redhat.com" <jolsa@redhat.com>,
        "namhyung@kernel.org" <namhyung@kernel.org>,
        "paulburton@kernel.org" <paulburton@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Dengcheng Zhu <dzhu@wavecomp.com>
Subject: [PATCH v2] MIPS: perf: Initial annotation support
Thread-Topic: [PATCH v2] MIPS: perf: Initial annotation support
Thread-Index: AQHVy+5kn0rAmE0BZUyn6DEHkZ6YDA==
Date:   Wed, 15 Jan 2020 21:54:42 +0000
Message-ID: <20200115215433.12793-1-dzhu@wavecomp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::40) To CY4PR2201MB1719.namprd22.prod.outlook.com
 (2603:10b6:910:77::20)
x-originating-ip: [4.15.122.74]
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dzhu@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 530e49f2-9b6a-4c10-905f-08d79a0586fc
x-ms-traffictypediagnostic: CY4PR2201MB1366:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR2201MB13668D3FF9F007425B4C721CA2370@CY4PR2201MB1366.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(376002)(346002)(136003)(199004)(189003)(6486002)(66946007)(36756003)(316002)(6512007)(5660300002)(2906002)(7416002)(54906003)(110136005)(2616005)(52116002)(956004)(6506007)(1076003)(26005)(16526019)(186003)(508600001)(71200400001)(66476007)(81156014)(8676002)(81166006)(8936002)(86362001)(4326008)(66556008)(107886003)(64756008)(66446008);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1366;H:CY4PR2201MB1719.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zuUGeZB78gHmyAXYQItaPvvH7sJtjy7wfkByQWKEwkcEKQ8GZNcgV96fAox6aS41Ep8VvgP9Z4biNeHr2UmU0ninij/UZynuLRxh9+kN477vO6jA9qEFEJOJbblJYhti3BglygpFS2FHRY5J4xWVKDQ1jt3lt2gqmjrxphuLyhZ5sC5iq420VpHbYeiDiz7JxSXaU4vFa1EfzLc4YegCUdaiSdodUZaLZo+fN9MLwcEVIYwsJHgB9iqMjjMu84CuntEfVbnQZCjuFgQ9AA5V0OZBWV/L11Lfz8pemR4ybUdCmOVTO5qxH1Un2rLMdYd+C9cWCUILOvSVrlC2BEgxbfg5SP9AjCzBkBi3NNQFRlCvdAhS1xTRUIF9cWledhGUEkpfvlr6+fZtPdZa1v9tHEm+L2siDy0ubd2AZrvOEEbIizUxqqyylwbX2gxxOiuX
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530e49f2-9b6a-4c10-905f-08d79a0586fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 21:54:42.7856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c2VV5/0X7I3zo6o3UXtGQx/xF0943cbvLiWKaxIfwOPgBxMAuxrUQUcFzvcP2oUOqMicPsqbfX5d1YvY/8Xt/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1366
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for perf annotate on MIPS.

Example of `ls /bin` annotation:

 Percent |      Source code & Disassembly of libc-2.24.so for cycles (46 sa=
mples, percent: local period)
---------------------------------------------------------------------------=
-----------------------------
         :
         :
         :
         :           Disassembly of section .text:
         :
         :           00000000000a53a0 <strlen@@GLIBC_2.0>:
    4.22 :   a53a0:  andi    v0,a0,0x7
    0.00 :   a53a4:  beqzc   v0,a54c4 <strlen@@GLIBC_2.0+0x124>
    0.00 :   a53a8:  lb      v0,0(a0)
    0.00 :   a53ac:  beqzc   v0,a54cc <strlen@@GLIBC_2.0+0x12c>
    0.00 :   a53b0:  move    v0,a0
    0.00 :   a53b4:  bc      a53c0 <strlen@@GLIBC_2.0+0x20>
    2.16 :   a53b8:  lb      v1,0(v0)
    9.07 :   a53bc:  beqzc   v1,a5468 <strlen@@GLIBC_2.0+0xc8>
    0.00 :   a53c0:  daddiu  v0,v0,1
...

Reviewed-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Dengcheng Zhu <dzhu@wavecomp.com>
---
Changes:

v2 - v1:
 * Adding compact version and branch-likely version instructions.
 * Adding jalx and jr.hb instructions.

 tools/perf/arch/mips/Build                   |  2 +-
 tools/perf/arch/mips/annotate/instructions.c | 41 ++++++++++++++++++++
 tools/perf/util/annotate.c                   |  8 ++++
 3 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/arch/mips/annotate/instructions.c

diff --git a/tools/perf/arch/mips/Build b/tools/perf/arch/mips/Build
index 1bb8bf6d7fd4..e4e5f33c84d8 100644
--- a/tools/perf/arch/mips/Build
+++ b/tools/perf/arch/mips/Build
@@ -1 +1 @@
-# empty
+perf-y +=3D util/
diff --git a/tools/perf/arch/mips/annotate/instructions.c b/tools/perf/arch=
/mips/annotate/instructions.c
new file mode 100644
index 000000000000..c479b458dc10
--- /dev/null
+++ b/tools/perf/arch/mips/annotate/instructions.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+
+static struct ins_ops *mips__associate_instruction_ops(struct arch *arch, =
const char *name)
+{
+	struct ins_ops *ops;
+
+	/*
+	 * Including compact version (beqzalc) and branch-likely
+	 * (e.g. bgezall) versions
+	 */
+	if (!strncmp(name, "bal", 3) ||
+	    !strncmp(name, "bgezal", 6) ||
+	    !strncmp(name, "bltzal", 6) ||
+	    !strncmp(name, "bgtzal", 6) ||
+	    !strncmp(name, "blezal", 6) ||
+	    !strncmp(name, "beqzal", 6) ||
+	    !strncmp(name, "bnezal", 6) ||
+	    !strncmp(name, "jal", 3) || /* jal[rx]? */
+	    !strcmp(name, "jialc"))
+		ops =3D &call_ops;
+	else if (!strncmp(name, "jr", 2)) /* jr(\.hb)? */
+		ops =3D &ret_ops;
+	else if (name[0] =3D=3D 'j' || name[0] =3D=3D 'b')
+		ops =3D &jump_ops;
+	else
+		return NULL;
+
+	arch__associate_ins_ops(arch, name, ops);
+
+	return ops;
+}
+
+static int mips__annotate_init(struct arch *arch, char *cpuid __maybe_unus=
ed)
+{
+	if (!arch->initialized) {
+		arch->associate_instruction_ops =3D mips__associate_instruction_ops;
+		arch->initialized =3D true;
+	}
+
+	return 0;
+}
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index f5e77ed237e8..aeae04a3ff0d 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -153,6 +153,7 @@ static int arch__associate_ins_ops(struct arch* arch, c=
onst char *name, struct i
 #include "arch/arm/annotate/instructions.c"
 #include "arch/arm64/annotate/instructions.c"
 #include "arch/csky/annotate/instructions.c"
+#include "arch/mips/annotate/instructions.c"
 #include "arch/x86/annotate/instructions.c"
 #include "arch/powerpc/annotate/instructions.c"
 #include "arch/s390/annotate/instructions.c"
@@ -175,6 +176,13 @@ static struct arch architectures[] =3D {
 		.name =3D "csky",
 		.init =3D csky__annotate_init,
 	},
+	{
+		.name =3D "mips",
+		.init =3D mips__annotate_init,
+		.objdump =3D {
+			.comment_char =3D '#',
+		},
+	},
 	{
 		.name =3D "x86",
 		.init =3D x86__annotate_init,
--=20
2.17.1

