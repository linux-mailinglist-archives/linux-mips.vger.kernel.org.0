Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE0AAF7E0
	for <lists+linux-mips@lfdr.de>; Wed, 11 Sep 2019 10:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbfIKI1Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Sep 2019 04:27:25 -0400
Received: from mail-eopbgr770130.outbound.protection.outlook.com ([40.107.77.130]:40420
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726735AbfIKI1Z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Sep 2019 04:27:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UogkYfGpIceOQWm4dF6UCxGxjW4pIKxdGunxYJKDMx71IHENw+o8LoVDlF9kCxUA2quaQrbKrBS5MxHuBEM41QO2MUMY4FQDtRcVNppV0bP7ZcVCiamTmV7BGPldymrSB8Tq5UhuxHRhHJyJS3ngAV5dWaJI7dGJKMgZcqY47wut4kIEeUa4frSZ5l1wkG47jT+pcJIb+50yj8zSsvWWZXdspr82IvHikeTm2deJm+hLVwMFtjKVCOyG7cOLsQzG0hbelfFXDUtJhz+drEi5TfZEpFAWIUAIY/SrpgmmWcLNICgeFKQ/ZNVx+sGwco0a+p+v8byHkcsGJ8Ku4yKwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWcxQO0VaxkMlhXX6FI78/V1+k+l9toKVz+JAcdBj3Y=;
 b=eqf5FWp73s6YSqhNDvGy0WS5Pvt+sklTRq6xLI+dgilvqfVcKx2tIvc4zrfqazjEjdKFZd0apKqqAZvq9SVXb8SCYqVJZWWWz03mV7hbGUEX5OFlqH45JfGsr74JMGOo4eMJTU1tX1ma+10Mkat4ywvLZ7is20Tp0Z4074UlX8so85r+52xwsq7Lz+d6gYsNL1Wq1X8UYUmvyTOhVBl8jB4o987eGY5hcH23fhh+BZVOKsKYKXCNTSB+BTnZTn+fLaBiZgoWwrKdd4A9xhvClXiI2AJShO4gbLsaRF4PecSJ1wAlG5GbpUtEZPA1QRGpNgzJjXA/EZnB1VhuCQRaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=wavecomp.com;
 dkim=pass header.d=wavecomp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWcxQO0VaxkMlhXX6FI78/V1+k+l9toKVz+JAcdBj3Y=;
 b=ZECVBM5aopDsXXWu2PYgnhooFNFdvAJNDZfr8fT5JYXOOwlOTMozqju6hGN7OF0HGFpsbYQ1+wQjZrotenCrsWZTglDCrDNk2N9He6NG4H1V8SDF5rVaNpIki5caJR7ti9u6jTrFOlD1ay6kCsO4vunbWKJu7Y2rc1u24jJ+Iew=
Received: from MWHPR2201MB1534.namprd22.prod.outlook.com (10.174.170.159) by
 MWHPR2201MB1247.namprd22.prod.outlook.com (10.174.162.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:26:48 +0000
Received: from MWHPR2201MB1534.namprd22.prod.outlook.com
 ([fe80::c9df:89ab:dcf6:2a86]) by MWHPR2201MB1534.namprd22.prod.outlook.com
 ([fe80::c9df:89ab:dcf6:2a86%4]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 08:26:48 +0000
From:   Archer Yan <ayan@wavecomp.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Archer Yan <ayan@wavecomp.com>,
        David Daney <david.daney@cavium.com>,
        "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <a.p.zijlstra@chello.nl>,
        Paul Mackerras <paulus@samba.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@ghostprotocols.net>,
        Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 2/2] Support extracting off-line stack traces from user-space
 with perf.
Thread-Topic: [PATCH 2/2] Support extracting off-line stack traces from
 user-space with perf.
Thread-Index: AQHVaHqnNstQioZOyE2BiD4e+77nEQ==
Date:   Wed, 11 Sep 2019 08:26:48 +0000
Message-ID: <20190911082548.31546-2-ayan@wavecomp.com>
References: <20190911082548.31546-1-ayan@wavecomp.com>
In-Reply-To: <20190911082548.31546-1-ayan@wavecomp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::21) To MWHPR2201MB1534.namprd22.prod.outlook.com
 (2603:10b6:301:35::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ayan@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [218.108.86.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e48cf5f7-4d98-4c30-6c6e-08d73691ca07
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1247;
x-ms-traffictypediagnostic: MWHPR2201MB1247:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1247594716473D9E0CFF5F10B6B10@MWHPR2201MB1247.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(39850400004)(396003)(136003)(366004)(189003)(199004)(2906002)(256004)(6486002)(478600001)(3846002)(6116002)(446003)(11346002)(2616005)(8676002)(25786009)(186003)(486006)(8936002)(66066001)(81166006)(50226002)(71200400001)(71190400001)(81156014)(476003)(30864003)(1076003)(7736002)(66476007)(66556008)(64756008)(66446008)(26005)(305945005)(102836004)(2351001)(6506007)(5660300002)(386003)(66946007)(316002)(6916009)(99286004)(54906003)(14454004)(4326008)(2501003)(6436002)(36756003)(6512007)(5640700003)(53936002)(86362001)(52116002)(76176011)(14444005)(2004002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1247;H:MWHPR2201MB1534.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9vU+giatP+tQJKqqGcrpNBssXQM09OYQtsl/lD5DCd+hKxgVn+F/uDGmu6BHKhJgmNFBhNgBVWngP410ywAdgwV5CSH5WPVB3f4/HPg0INwIC7p8WBZ2G5eH44tf8X1J+AZ0dmd8pLxouInMFthBvX+xBtGjKmLrGBgb2GZ6Nku/KrTcnen0kXSqIcj+xFoh8vkDmbzfj9qUF20QCOIoyHPrObHLPhgh30zKm376jWg3nnBnChPABg0Sb8ICv4OM0RSSw1RaCZ6gqsBj+pl77DHVi+TKm4hCV8pnbAM9qXaM7uuKvElnHuc5PNGZW00maCm/jSeLaALFrw/VptzoUn5MyxBReAkz+5CigjGPGr5i/1uMyXIPXDi/NQdLNVSRmJIx3FstTR+XNFUhvmrkzZaB2+wXrzHOXThe1gd7ns4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48cf5f7-4d98-4c30-6c6e-08d73691ca07
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:26:48.7604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8HKvkR6C3htizqDaY9YJzTQEWHUFTLjkPsn6lcry0fbU3ktIjCdOhGdHNnjlY9XlRk7HTNsKfNNPRB2usY1cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1247
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1. Add perf_event_mips_regs/perf_reg_value/perf_reg_validate to support
   features HAVE_PERF_REGS/HAVE_PERF_USER_STACK_DUMP in kernel;
2. Add dwarf reg table in perf tool for dwarf unwinding.

[ayan@wavecomp.com: Repick this patch for unwinding userstack backtrace
 by perf and libunwind on MIPS based CPU.]

[ralf@linux-mips.org: Add perf_get_regs_user() which is required after
'commit 88a7c26af8da ("perf: Move task_pt_regs sampling into arch code")'.]

Signed-off-by: David Daney <david.daney@cavium.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

Signed-off-by: Archer Yan <ayan@wavecomp.com>
---
 arch/mips/Kconfig                             |  2 +
 arch/mips/include/uapi/asm/perf_regs.h        | 42 ++++++++++++
 arch/mips/kernel/Makefile                     |  2 +-
 arch/mips/kernel/perf_regs.c                  | 67 +++++++++++++++++++
 tools/perf/Makefile.config                    |  6 ++
 tools/perf/arch/mips/Build                    |  2 +-
 tools/perf/arch/mips/Makefile                 |  4 --
 .../perf/arch/mips/include/dwarf-regs-table.h | 31 +++++++++
 tools/perf/arch/mips/include/perf_regs.h      |  2 +-
 tools/perf/arch/mips/util/Build               |  4 +-
 tools/perf/arch/mips/util/dwarf-regs.c        |  3 +-
 tools/perf/arch/mips/util/unwind-libunwind.c  |  3 +-
 tools/perf/util/dwarf-regs.c                  |  3 +
 13 files changed, 159 insertions(+), 12 deletions(-)
 create mode 100644 arch/mips/include/uapi/asm/perf_regs.h
 create mode 100644 arch/mips/kernel/perf_regs.c
 create mode 100644 tools/perf/arch/mips/include/dwarf-regs-table.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd7bf3a..4b68beb285b5 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -69,6 +69,8 @@ config MIPS
 	select HAVE_NMI
 	select HAVE_OPROFILE
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_REGS
+	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
diff --git a/arch/mips/include/uapi/asm/perf_regs.h b/arch/mips/include/uap=
i/asm/perf_regs.h
new file mode 100644
index 000000000000..f3cef08b97c9
--- /dev/null
+++ b/arch/mips/include/uapi/asm/perf_regs.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _ASM_MIPS_PERF_REGS_H
+#define _ASM_MIPS_PERF_REGS_H
+
+enum perf_event_mips_regs {
+	PERF_REG_MIPS_PC,
+	PERF_REG_MIPS_R1,
+	PERF_REG_MIPS_R2,
+	PERF_REG_MIPS_R3,
+	PERF_REG_MIPS_R4,
+	PERF_REG_MIPS_R5,
+	PERF_REG_MIPS_R6,
+	PERF_REG_MIPS_R7,
+	PERF_REG_MIPS_R8,
+	PERF_REG_MIPS_R9,
+	PERF_REG_MIPS_R10,
+	PERF_REG_MIPS_R11,
+	PERF_REG_MIPS_R12,
+	PERF_REG_MIPS_R13,
+	PERF_REG_MIPS_R14,
+	PERF_REG_MIPS_R15,
+	PERF_REG_MIPS_R16,
+	PERF_REG_MIPS_R17,
+	PERF_REG_MIPS_R18,
+	PERF_REG_MIPS_R19,
+	PERF_REG_MIPS_R20,
+	PERF_REG_MIPS_R21,
+	PERF_REG_MIPS_R22,
+	PERF_REG_MIPS_R23,
+	PERF_REG_MIPS_R24,
+	PERF_REG_MIPS_R25,
+	/*
+	 * 26 and 27 are k0 and k1, they are always clobbered thus not
+	 * stored.
+	 */
+	PERF_REG_MIPS_R28,
+	PERF_REG_MIPS_R29,
+	PERF_REG_MIPS_R30,
+	PERF_REG_MIPS_R31,
+	PERF_REG_MIPS_MAX =3D PERF_REG_MIPS_R31 + 1,
+};
+#endif /* _ASM_MIPS_PERF_REGS_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 89b07ea8d249..d8fb04540505 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -100,7 +100,7 @@ CFLAGS_cpu-bugs64.o	=3D $(shell if $(CC) $(KBUILD_CFLAG=
S) -Wa,-mdaddi -c -o /dev/n
=20
 obj-$(CONFIG_HAVE_STD_PC_SERIAL_PORT)	+=3D 8250-platform.o
=20
-obj-$(CONFIG_PERF_EVENTS)	+=3D perf_event.o
+obj-$(CONFIG_PERF_EVENTS)	+=3D perf_event.o perf_regs.o
 obj-$(CONFIG_HW_PERF_EVENTS)	+=3D perf_event_mipsxx.o
=20
 obj-$(CONFIG_JUMP_LABEL)	+=3D jump_label.o
diff --git a/arch/mips/kernel/perf_regs.c b/arch/mips/kernel/perf_regs.c
new file mode 100644
index 000000000000..11f93836c240
--- /dev/null
+++ b/arch/mips/kernel/perf_regs.c
@@ -0,0 +1,67 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Pub=
lic
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Some parts derived from x86 version of this file.
+ *
+ * Copyright (C) 2013 Cavium, Inc.
+ */
+
+#include <linux/perf_event.h>
+
+#include <asm/ptrace.h>
+
+#ifdef CONFIG_32BIT
+u64 perf_reg_abi(struct task_struct *tsk)
+{
+	return PERF_SAMPLE_REGS_ABI_32;
+}
+#else /* Must be CONFIG_64BIT */
+u64 perf_reg_abi(struct task_struct *tsk)
+{
+	if (test_tsk_thread_flag(tsk, TIF_32BIT_REGS))
+		return PERF_SAMPLE_REGS_ABI_32;
+	else
+		return PERF_SAMPLE_REGS_ABI_64;
+}
+#endif /* CONFIG_32BIT */
+
+int perf_reg_validate(u64 mask)
+{
+	if (!mask)
+		return -EINVAL;
+	if (mask & ~((1ull << PERF_REG_MIPS_MAX) - 1))
+		return -EINVAL;
+	return 0;
+}
+
+u64 perf_reg_value(struct pt_regs *regs, int idx)
+{
+	long v;
+
+	switch (idx) {
+	case PERF_REG_MIPS_PC:
+		v =3D regs->cp0_epc;
+		break;
+	case PERF_REG_MIPS_R1 ... PERF_REG_MIPS_R25:
+		v =3D regs->regs[idx - PERF_REG_MIPS_R1 + 1];
+		break;
+	case PERF_REG_MIPS_R28 ... PERF_REG_MIPS_R31:
+		v =3D regs->regs[idx - PERF_REG_MIPS_R28 + 28];
+		break;
+
+	default:
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+
+	return (s64)v; /* Sign extend if 32-bit. */
+}
+
+void perf_get_regs_user(struct perf_regs *regs_user,
+		struct pt_regs *regs, struct pt_regs *regs_user_copy)
+{
+	regs_user->regs =3D task_pt_regs(current);
+	regs_user->abi =3D perf_reg_abi(current);
+}
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 89ac5a1f1550..f382c282fb8e 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -74,6 +74,12 @@ ifeq ($(NO_PERF_REGS),0)
   $(call detected,CONFIG_PERF_REGS)
 endif
=20
+ifeq ($(ARCH),mips)
+  NO_PERF_REGS :=3D 0
+  CFLAGS +=3D -I../../arch/mips/include/uapi -I../../arch/mips/include/gen=
erated/uapi
+  LIBUNWIND_LIBS =3D -lunwind -lunwind-mips
+endif
+
 ifneq ($(NO_SYSCALL_TABLE),1)
   CFLAGS +=3D -DHAVE_SYSCALL_TABLE_SUPPORT
 endif
diff --git a/tools/perf/arch/mips/Build b/tools/perf/arch/mips/Build
index 54afe4a467e7..e4e5f33c84d8 100644
--- a/tools/perf/arch/mips/Build
+++ b/tools/perf/arch/mips/Build
@@ -1 +1 @@
-libperf-y +=3D util/
+perf-y +=3D util/
diff --git a/tools/perf/arch/mips/Makefile b/tools/perf/arch/mips/Makefile
index fe9b61e322a5..7fbca175099e 100644
--- a/tools/perf/arch/mips/Makefile
+++ b/tools/perf/arch/mips/Makefile
@@ -1,7 +1,3 @@
 ifndef NO_DWARF
 PERF_HAVE_DWARF_REGS :=3D 1
-LIB_OBJS +=3D $(OUTPUT)arch/$(ARCH)/util/dwarf-regs.o
-endif
-ifndef NO_LIBUNWIND
-LIB_OBJS +=3D $(OUTPUT)arch/$(ARCH)/util/unwind.o
 endif
diff --git a/tools/perf/arch/mips/include/dwarf-regs-table.h b/tools/perf/a=
rch/mips/include/dwarf-regs-table.h
new file mode 100644
index 000000000000..169a3f9679d5
--- /dev/null
+++ b/tools/perf/arch/mips/include/dwarf-regs-table.h
@@ -0,0 +1,31 @@
+/*
+ * dwarf-regs-table.h : Mapping of DWARF debug register numbers into
+ * register names.
+ *
+ * Copyright (C) 2013 Cavium, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifdef DEFINE_DWARF_REGSTR_TABLE
+#undef REG_DWARFNUM_NAME
+#define REG_DWARFNUM_NAME(reg, idx)	([idx] =3D "$" #reg)
+static const char *mips_regstr_tbl[] =3D {
+	"$0", "$1", "$2", "$3", "$4", "$5", "$6", "$7", "$8", "$9",
+	"$10", "$11", "$12", "$13", "$14", "$15", "$16", "$17", "$18", "$19",
+	"$20", "$21", "$22", "$23", "$24", "$25", "$26", "$27", "$28", "$29",
+	"$30", "$31",
+	REG_DWARFNUM_NAME(hi,   64),
+	REG_DWARFNUM_NAME(lo,   65),
+
+};
+#endif
diff --git a/tools/perf/arch/mips/include/perf_regs.h b/tools/perf/arch/mip=
s/include/perf_regs.h
index bc47b25d95dd..871bc6febe22 100644
--- a/tools/perf/arch/mips/include/perf_regs.h
+++ b/tools/perf/arch/mips/include/perf_regs.h
@@ -3,9 +3,9 @@
 #define ARCH_PERF_REGS_H
=20
 #include <stdlib.h>
-#include "../../util/types.h"
 #include <asm/perf_regs.h>
=20
+#define PERF_REGS_MAX PERF_REG_MIPS_MAX
 #define PERF_REG_IP PERF_REG_MIPS_PC
 #define PERF_REG_SP PERF_REG_MIPS_R29
=20
diff --git a/tools/perf/arch/mips/util/Build b/tools/perf/arch/mips/util/Bu=
ild
index 7da83b5ebc4c..678a68830ceb 100644
--- a/tools/perf/arch/mips/util/Build
+++ b/tools/perf/arch/mips/util/Build
@@ -1,2 +1,2 @@
-libperf-$(CONFIG_DWARF)                +=3D dwarf-regs.o
-libperf-$(CONFIG_LIBUNWIND)    +=3D unwind-libunwind.o
+perf-$(CONFIG_DWARF)                +=3D dwarf-regs.o
+perf-$(CONFIG_LIBUNWIND)    +=3D unwind-libunwind.o
diff --git a/tools/perf/arch/mips/util/dwarf-regs.c b/tools/perf/arch/mips/=
util/dwarf-regs.c
index 165e0179ea11..423abf158c99 100644
--- a/tools/perf/arch/mips/util/dwarf-regs.c
+++ b/tools/perf/arch/mips/util/dwarf-regs.c
@@ -14,8 +14,7 @@
  * GNU General Public License for more details.
  *
  */
-
-#include <libio.h>
+#include <stdio.h>
 #include <dwarf-regs.h>
=20
 static const char *mips_gpr_names[32] =3D {
diff --git a/tools/perf/arch/mips/util/unwind-libunwind.c b/tools/perf/arch=
/mips/util/unwind-libunwind.c
index 7af25427943f..0d8c99c29da6 100644
--- a/tools/perf/arch/mips/util/unwind-libunwind.c
+++ b/tools/perf/arch/mips/util/unwind-libunwind.c
@@ -4,8 +4,9 @@
 #include <libunwind.h>
 #include "perf_regs.h"
 #include "../../util/unwind.h"
+#include "util/debug.h"
=20
-int unwind__arch_reg_id(int regnum)
+int libunwind__arch_reg_id(int regnum)
 {
 	switch (regnum) {
 	case UNW_MIPS_R1 ... UNW_MIPS_R25:
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index db55eddce8cd..0bf60e6d28b5 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -25,6 +25,7 @@
 #include "../arch/s390/include/dwarf-regs-table.h"
 #include "../arch/sparc/include/dwarf-regs-table.h"
 #include "../arch/xtensa/include/dwarf-regs-table.h"
+#include "../arch/mips/include/dwarf-regs-table.h"
=20
 #define __get_dwarf_regstr(tbl, n) (((n) < ARRAY_SIZE(tbl)) ? (tbl)[(n)] :=
 NULL)
=20
@@ -54,6 +55,8 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int=
 machine)
 		return __get_dwarf_regstr(sparc_regstr_tbl, n);
 	case EM_XTENSA:
 		return __get_dwarf_regstr(xtensa_regstr_tbl, n);
+	case EM_MIPS:
+		return __get_dwarf_regstr(mips_regstr_tbl, n);
 	default:
 		pr_err("ELF MACHINE %x is not supported.\n", machine);
 	}
--=20
2.17.1

