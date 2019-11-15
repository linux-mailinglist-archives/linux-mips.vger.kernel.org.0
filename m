Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46570FE8CA
	for <lists+linux-mips@lfdr.de>; Sat, 16 Nov 2019 00:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbfKOXor (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Nov 2019 18:44:47 -0500
Received: from mail-eopbgr680090.outbound.protection.outlook.com ([40.107.68.90]:43943
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727056AbfKOXor (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Nov 2019 18:44:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwmVs0WJESyW7y0jWRV51pjJnijf22l5ZWOgzqFKwwDNlsTUHM4nJ2s2seZHKj3+z6hZZmZ5FC+wMzHsvsBx/ARXrSNK4Ftdr/VkITkiqeQ8Ikr2P21DJHYh3syeEUqQTFNtLpa+P5zIh18WQlS3pcEYa4RmvYV5DWTp3fqrro8EkLsNlpkGHz/vHK06Xm3wZBAQvUf+g+L1HZf9Dm3BO8b/CR1+2jnLf3XdhKsZdU7YqE+8FJXQMG5XVv9VL/E/w/3iJ0KzRheuiqxFZ543NuIc4UzwEXX374VW7QiijwQHxGi0KZfwgSSsOpAfEekU+ASpyU6RFKxR/NlochqPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+kq1qE8Iim5iLfLQpIdZqggmg9YXxXtyGXJSI/LOzU=;
 b=U3YxMoqMUWMYz8XE12PoKWIsQnYLbRReffsHMn4WFM9X9/QPnjsrKtThffbWW2/pTy0SaEFQMjeIZfOPPD10of1wUSviFvsDWy/hb58K32edOkHUBSUFVnt9cecHvE0fKDxQhbMVwNv8S+QN5nHossDIcOI2xU15l6R4iEdFDNCr2G4hU0Ds7+ALllnr6xdTvEoXWLHOsGA4Az6RcWtl3TVBX8tUSxJNvFUfuCcGvwkYv71zZqvHuZr9p2fcYK2CRU6QD9yz5+vb4PbgZsbUkZ1Q6GnseToYv8cwJlTWu0A4T6PNvyn0cPUyu57np5ENbVJpOmgyFpujOiMfFbFaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=wavecomp.com;
 dkim=pass header.d=wavecomp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+kq1qE8Iim5iLfLQpIdZqggmg9YXxXtyGXJSI/LOzU=;
 b=Ua56cmJf2IPPKJ8j7JC6nhI1AxqaLjFNAD4bFqBBZyf97d1p1Z6rPfE7q8DeOfUnyhD2rF3XtIjKvspAlRpb38Ip2MzDO+XzP2UiYFue5RdQr7KPBbIqnh8pAkXXjY3TIHES24xjfsC0M+YEz6ycy/CnRLnjpDqxrQ+Q5d+2/zc=
Received: from CY4PR2201MB1349.namprd22.prod.outlook.com (10.171.209.23) by
 CY4PR2201MB1285.namprd22.prod.outlook.com (10.171.211.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Fri, 15 Nov 2019 23:44:42 +0000
Received: from CY4PR2201MB1349.namprd22.prod.outlook.com
 ([fe80::a909:cf85:c0fd:f6f1]) by CY4PR2201MB1349.namprd22.prod.outlook.com
 ([fe80::a909:cf85:c0fd:f6f1%10]) with mapi id 15.20.2451.027; Fri, 15 Nov
 2019 23:44:42 +0000
From:   Hassan Naveed <hnaveed@wavecomp.com>
CC:     "paulburton@kernel.org" <paulburton@kernel.org>,
        Hassan Naveed <hnaveed@wavecomp.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Yury Norov <ynorov@caviumnetworks.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Finn Thain <fthain@telegraphics.com.au>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: [PATCH v2 1/2] tracing: Use xarray for syscall trace events
Thread-Topic: [PATCH v2 1/2] tracing: Use xarray for syscall trace events
Thread-Index: AQHVnA6niJHExKb2H0KvUTkOEMdjZg==
Date:   Fri, 15 Nov 2019 23:44:42 +0000
Message-ID: <20191115234314.21599-1-hnaveed@wavecomp.com>
References: <20191022174551.2fcc85fd@gandalf.local.home>
In-Reply-To: <20191022174551.2fcc85fd@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0101.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::42) To CY4PR2201MB1349.namprd22.prod.outlook.com
 (2603:10b6:910:64::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hnaveed@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [4.15.122.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2aaa27c8-2b3f-4e90-0eba-08d76a25c99c
x-ms-traffictypediagnostic: CY4PR2201MB1285:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR2201MB1285EC4C178A3B6380A9B87CD4700@CY4PR2201MB1285.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 02229A4115
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(376002)(346002)(366004)(136003)(199004)(189003)(316002)(11346002)(14454004)(76176011)(256004)(1076003)(81156014)(6486002)(8936002)(8676002)(81166006)(386003)(26005)(99286004)(6506007)(6512007)(2906002)(6436002)(5660300002)(1671002)(102836004)(478600001)(86362001)(71200400001)(71190400001)(486006)(66946007)(66476007)(66556008)(64756008)(25786009)(3846002)(186003)(66066001)(66446008)(36756003)(6116002)(476003)(109986005)(7736002)(4326008)(50226002)(54906003)(7416002)(52116002)(446003)(305945005)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1285;H:CY4PR2201MB1349.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aadjg7ID5EcGBkYyFx5fBI2um2zlCOYh07xxBVTG6Y34AVy5+hIRjPYN36Bfmu7dsGigAhfAsE47cqXOzJkNhD4nSxQpEqq9EtNT5VcnGXZB5WvQL4ohWfFN+eRLqaommf7+Z0W/AlTNmIGKFpcsITQwg3gvqVX6yibrB1V1cKukwu7KFRLhw3oDkcWVa7zl1elPjPs166Z8FuKVY6eJgj21zuaAuhVc0nX1s89ejcVY7mGuY9Q41AK+mqawHGXFYAuUguY3bg9cqZvMeet4Ji8W8klx/BMHWO46Eo78LmZqHWpR6xJ88bgYSr5pTE9H9ZCaapOP6UQq2VCNP1yrJpmxL7Lbq4cJU+zB6AEb681ny1IObkcnEmRyjXQtbe7fiUu3DGC+8dTEAOn2MnwC13aP+nsIZeQMpw6QnB45Qsyun5SzYV2aoC40rVx4jf3d
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aaa27c8-2b3f-4e90-0eba-08d76a25c99c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2019 23:44:42.7045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T+MmnBv94PmxhLgQQ9WCXHWN2aOukqWWCxjKMBwda93x5J8XnXZUyrQB/L8BElbyUX9t8lIkCiqSGMRR/taw3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1285
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently, a lot of memory is wasted for architectures like MIPS when
init_ftrace_syscalls() allocates the array for syscalls using kcalloc.
This is because syscalls numbers start from 4000, 5000 or 6000 and
array elements up to that point are unused.
Fix this by using a data structure more suited to storing sparsely
populated arrays. The XARRAY data structure, implemented using radix
trees, is much more memory efficient for storing the syscalls in
question.

Signed-off-by: Hassan Naveed <hnaveed@wavecomp.com>
Reviewed-by: Paul Burton <paulburton@kernel.org>
---
Changes in v2:
 - New commit message
 - Added HAVE_SPARSE_SYSCALL_NR to arch/Kconfig for archs
   with sparse syscall arrays
 - Changes split up into two patches; one that provides
   xarray support and the second in which MIPS selects it
---
 arch/Kconfig                  |  8 ++++++++
 kernel/trace/trace_syscalls.c | 32 +++++++++++++++++++++++++-------
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 33687dddd86a..e3783d94f919 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -901,6 +901,14 @@ config HAVE_ARCH_PREL32_RELOCATIONS
 config ARCH_USE_MEMREMAP_PROT
 	bool
=20
+config HAVE_SPARSE_SYSCALL_NR
+       bool
+       help
+          An architecture should select this if its syscall numbering is s=
parse
+	  to save space. For example, MIPS architecture has a syscall array with
+	  entries at 4000, 5000 and 6000 locations. This option turns on syscall
+	  related optimizations for a given architecture.
+
 source "kernel/gcov/Kconfig"
=20
 source "scripts/gcc-plugins/Kconfig"
diff --git a/kernel/trace/trace_syscalls.c b/kernel/trace/trace_syscalls.c
index f93a56d2db27..ffff52399d97 100644
--- a/kernel/trace/trace_syscalls.c
+++ b/kernel/trace/trace_syscalls.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>	/* for MODULE_NAME_LEN via KSYM_SYMBOL_LEN */
 #include <linux/ftrace.h>
 #include <linux/perf_event.h>
+#include <linux/xarray.h>
 #include <asm/syscall.h>
=20
 #include "trace_output.h"
@@ -30,6 +31,7 @@ syscall_get_enter_fields(struct trace_event_call *call)
 extern struct syscall_metadata *__start_syscalls_metadata[];
 extern struct syscall_metadata *__stop_syscalls_metadata[];
=20
+static DEFINE_XARRAY(syscalls_metadata_sparse);
 static struct syscall_metadata **syscalls_metadata;
=20
 #ifndef ARCH_HAS_SYSCALL_MATCH_SYM_NAME
@@ -101,6 +103,9 @@ find_syscall_meta(unsigned long syscall)
=20
 static struct syscall_metadata *syscall_nr_to_meta(int nr)
 {
+	if (IS_ENABLED(CONFIG_HAVE_SPARSE_SYSCALL_NR))
+		return xa_load(&syscalls_metadata_sparse, (unsigned long)nr);
+
 	if (!syscalls_metadata || nr >=3D NR_syscalls || nr < 0)
 		return NULL;
=20
@@ -534,12 +539,16 @@ void __init init_ftrace_syscalls(void)
 	struct syscall_metadata *meta;
 	unsigned long addr;
 	int i;
-
-	syscalls_metadata =3D kcalloc(NR_syscalls, sizeof(*syscalls_metadata),
-				    GFP_KERNEL);
-	if (!syscalls_metadata) {
-		WARN_ON(1);
-		return;
+	void *ret;
+
+	if (!IS_ENABLED(CONFIG_HAVE_SPARSE_SYSCALL_NR)) {
+		syscalls_metadata =3D kcalloc(NR_syscalls,
+					sizeof(*syscalls_metadata),
+					GFP_KERNEL);
+		if (!syscalls_metadata) {
+			WARN_ON(1);
+			return;
+		}
 	}
=20
 	for (i =3D 0; i < NR_syscalls; i++) {
@@ -549,7 +558,16 @@ void __init init_ftrace_syscalls(void)
 			continue;
=20
 		meta->syscall_nr =3D i;
-		syscalls_metadata[i] =3D meta;
+
+		if (!IS_ENABLED(CONFIG_HAVE_SPARSE_SYSCALL_NR)) {
+			syscalls_metadata[i] =3D meta;
+		} else {
+			ret =3D xa_store(&syscalls_metadata_sparse, i, meta,
+					GFP_KERNEL);
+			WARN(xa_is_err(ret),
+				"Syscall memory allocation failed\n");
+		}
+
 	}
 }
=20
--=20
2.17.1

