Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43C54AF7E9
	for <lists+linux-mips@lfdr.de>; Wed, 11 Sep 2019 10:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbfIKI2U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Sep 2019 04:28:20 -0400
Received: from mail-eopbgr720118.outbound.protection.outlook.com ([40.107.72.118]:17624
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726696AbfIKI2U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Sep 2019 04:28:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0rZopdgeJOQsF4PvXdq65ofQI5NuEIoA3DVQwK/ltlCMJNnklZssfQ0Ucu0xF9yRegybdAwNiUJWVc6/sgervn+/6uiuuC+B+fMVwaxj96Rcge/eYXs4V+Iss81mftGFQK54D4258cJ/qeQzy2U7CjfkJr/fi75j1LaN70x7h1gsNcZPkMgJl74CwC1VWf2zvPOpoayr/5bIQGjqTpxXmLeKX5DYMiVmv9MZuoafZ3APOAnoJML37sUjxa6uCH7FWyyqzJrwhqFB8XzvHYui4NKwjG/FBafRFmsj6CXmcclERsQqK+2AwckyzSjVAaN6HBJg4w+fRtFaF5YDYB6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=871Z+TCdFWQh+HU81ZyoG1NzejB/p16nFg6NLHPuRdo=;
 b=brEjOBCxVBHN3u5OvKO2gIw+S/NRPLOGcY3BM+IP0pgIvq0IMqtFSfOnoAwdzJEpHvetOLltYKKjxqm4dgy2EwOr64GtTyJMhNNt3TvcNcU9anxWJaChh7qzpIgd3xGrCXz1BZFk1pYOrl+57RdHzHZJZaZ/U0ieQHMqIuRBdv60r05B1Hp4H0SU+1/DktMJooJIle7dBEpeS1IdLsWbs3wB9ycHyBMGzbqkkhGEYe35r+/TP5E2fV6ubaK32jNRuCuvob99n7tbDOsOyCVxQIvVFMK9GPNNYvKGVNb1Wu+sQfMO+kRkhv4Z6akt+tUpbj6EaXK86Fh6zdCV9jdzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=wavecomp.com;
 dkim=pass header.d=wavecomp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=871Z+TCdFWQh+HU81ZyoG1NzejB/p16nFg6NLHPuRdo=;
 b=JCOcOHuKycWPmBbV37JtjVL8/w++GYzTH3VKqv9SAB4f7J/Jg3wH6BKzzBJgz86yF4JU6joQJY7L1s5XDoZEnIWPVQhuq01lNFgj6K9DXK+noQARThJ/3mMm1srHi6TLgujA9XGQIKA4nWh5rXYZFGxcSAlcQzpML6SkTfnZ2RI=
Received: from MWHPR2201MB1534.namprd22.prod.outlook.com (10.174.170.159) by
 MWHPR2201MB1247.namprd22.prod.outlook.com (10.174.162.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:26:38 +0000
Received: from MWHPR2201MB1534.namprd22.prod.outlook.com
 ([fe80::c9df:89ab:dcf6:2a86]) by MWHPR2201MB1534.namprd22.prod.outlook.com
 ([fe80::c9df:89ab:dcf6:2a86%4]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 08:26:38 +0000
From:   Archer Yan <ayan@wavecomp.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     David Daney <david.daney@cavium.com>,
        "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        Jiri Olsa <jolsa@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <a.p.zijlstra@chello.nl>,
        Paul Mackerras <paulus@samba.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@ghostprotocols.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Archer Yan <ayan@wavecomp.com>
Subject: [PATCH 1/2] Support mips unwinding and dwarf-regs.
Thread-Topic: [PATCH 1/2] Support mips unwinding and dwarf-regs.
Thread-Index: AQHVaHqhtfvUDrS4kkew3iwPTmr1iA==
Date:   Wed, 11 Sep 2019 08:26:37 +0000
Message-ID: <20190911082548.31546-1-ayan@wavecomp.com>
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
x-ms-office365-filtering-correlation-id: fb0ee303-d728-4399-e365-08d73691c39e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1247;
x-ms-traffictypediagnostic: MWHPR2201MB1247:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1247C246D747EEF9916BD4CEB6B10@MWHPR2201MB1247.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(39850400004)(396003)(136003)(366004)(189003)(199004)(2906002)(256004)(6486002)(478600001)(3846002)(6116002)(2616005)(8676002)(25786009)(186003)(486006)(8936002)(66066001)(81166006)(50226002)(71200400001)(71190400001)(81156014)(476003)(1076003)(7736002)(66476007)(66556008)(64756008)(66446008)(26005)(305945005)(102836004)(2351001)(6506007)(7416002)(5660300002)(386003)(66946007)(316002)(6916009)(99286004)(54906003)(14454004)(4326008)(2501003)(6436002)(36756003)(6512007)(107886003)(5640700003)(53936002)(86362001)(52116002)(14444005)(2004002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1247;H:MWHPR2201MB1534.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7mqP2+z96dbbT9q/6UbnQ0MGP3WC6IldZgZw4Twc49oT56NEdRxUJBfD2rBym6VxQcqLBHod8xxLX9Twn1J9RU1JF3n5CcxBe2QsF6Zn4L7g0PhpuXjiCApu1ZlaR3bmje9vHAbAhSvDcmMQXNaLf99Dl+7Rxjz52aDVRZPGfrQTh7TqjGxMjsU89wtw8s4TZE8Q09ytDgLEjk3ApN4Ibb1BMbgeRad3CYfNsJ5CNu9OUYpne7ZUa+2+XtPxLDcXMvv/juCXbTw6P74aFH2b4b8pP1AtT2D7a4N8hsEWGO3UuQb5NCps1kr1t4Ejb5p+TYwK3N/Q7d01NKsGgxgybMWY087iuVYy8+QZ13WalBvY0zZmeHeLO5aI5HEStGNXRrQnLlzrsoh3JmgkkmwmzDFE6TmlgGjXHHfkYxumfwI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0ee303-d728-4399-e365-08d73691c39e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:26:37.9820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iwBkvLTQsGcW6UW0wbBvvTJTwIpTYt8NMkFcnW50c6OJjV/pxWnczmt96o2IAYsuXtJywyeSedymPqXwRj0HQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1247
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: David Daney <david.daney@cavium.com>

Map perf APIs(perf_reg_name/get_arch_regstr/unwind__arch_reg_id)
with MIPS specific registers.

[ayan@wavecomp.com: repick this patch for unwinding userstack
backtrace by perf and libunwind on MIPS based CPU.]

Signed-off-by: David Daney <david.daney@cavium.com>
Cc: linux-mips@linux-mips.org
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Archer Yan <ayan@wavecomp.com>
---
 tools/perf/arch/mips/Build                   |  2 +-
 tools/perf/arch/mips/Makefile                |  7 ++
 tools/perf/arch/mips/include/perf_regs.h     | 84 ++++++++++++++++++++
 tools/perf/arch/mips/util/Build              |  2 +
 tools/perf/arch/mips/util/dwarf-regs.c       | 37 +++++++++
 tools/perf/arch/mips/util/unwind-libunwind.c | 21 +++++
 6 files changed, 152 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/arch/mips/Makefile
 create mode 100644 tools/perf/arch/mips/include/perf_regs.h
 create mode 100644 tools/perf/arch/mips/util/Build
 create mode 100644 tools/perf/arch/mips/util/dwarf-regs.c
 create mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c

diff --git a/tools/perf/arch/mips/Build b/tools/perf/arch/mips/Build
index 1bb8bf6d7fd4..54afe4a467e7 100644
--- a/tools/perf/arch/mips/Build
+++ b/tools/perf/arch/mips/Build
@@ -1 +1 @@
-# empty
+libperf-y +=3D util/
diff --git a/tools/perf/arch/mips/Makefile b/tools/perf/arch/mips/Makefile
new file mode 100644
index 000000000000..fe9b61e322a5
--- /dev/null
+++ b/tools/perf/arch/mips/Makefile
@@ -0,0 +1,7 @@
+ifndef NO_DWARF
+PERF_HAVE_DWARF_REGS :=3D 1
+LIB_OBJS +=3D $(OUTPUT)arch/$(ARCH)/util/dwarf-regs.o
+endif
+ifndef NO_LIBUNWIND
+LIB_OBJS +=3D $(OUTPUT)arch/$(ARCH)/util/unwind.o
+endif
diff --git a/tools/perf/arch/mips/include/perf_regs.h b/tools/perf/arch/mip=
s/include/perf_regs.h
new file mode 100644
index 000000000000..bc47b25d95dd
--- /dev/null
+++ b/tools/perf/arch/mips/include/perf_regs.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ARCH_PERF_REGS_H
+#define ARCH_PERF_REGS_H
+
+#include <stdlib.h>
+#include "../../util/types.h"
+#include <asm/perf_regs.h>
+
+#define PERF_REG_IP PERF_REG_MIPS_PC
+#define PERF_REG_SP PERF_REG_MIPS_R29
+
+#define PERF_REGS_MASK ((1ULL << PERF_REG_MIPS_MAX) - 1)
+
+static inline const char *perf_reg_name(int id)
+{
+	switch (id) {
+	case PERF_REG_MIPS_PC:
+		return "PC";
+	case PERF_REG_MIPS_R1:
+		return "$1";
+	case PERF_REG_MIPS_R2:
+		return "$2";
+	case PERF_REG_MIPS_R3:
+		return "$3";
+	case PERF_REG_MIPS_R4:
+		return "$4";
+	case PERF_REG_MIPS_R5:
+		return "$5";
+	case PERF_REG_MIPS_R6:
+		return "$6";
+	case PERF_REG_MIPS_R7:
+		return "$7";
+	case PERF_REG_MIPS_R8:
+		return "$8";
+	case PERF_REG_MIPS_R9:
+		return "$9";
+	case PERF_REG_MIPS_R10:
+		return "$10";
+	case PERF_REG_MIPS_R11:
+		return "$11";
+	case PERF_REG_MIPS_R12:
+		return "$12";
+	case PERF_REG_MIPS_R13:
+		return "$13";
+	case PERF_REG_MIPS_R14:
+		return "$14";
+	case PERF_REG_MIPS_R15:
+		return "$15";
+	case PERF_REG_MIPS_R16:
+		return "$16";
+	case PERF_REG_MIPS_R17:
+		return "$17";
+	case PERF_REG_MIPS_R18:
+		return "$18";
+	case PERF_REG_MIPS_R19:
+		return "$19";
+	case PERF_REG_MIPS_R20:
+		return "$20";
+	case PERF_REG_MIPS_R21:
+		return "$21";
+	case PERF_REG_MIPS_R22:
+		return "$22";
+	case PERF_REG_MIPS_R23:
+		return "$23";
+	case PERF_REG_MIPS_R24:
+		return "$24";
+	case PERF_REG_MIPS_R25:
+		return "$25";
+	case PERF_REG_MIPS_R28:
+		return "$28";
+	case PERF_REG_MIPS_R29:
+		return "$29";
+	case PERF_REG_MIPS_R30:
+		return "$30";
+	case PERF_REG_MIPS_R31:
+		return "$31";
+	default:
+		break;
+	}
+	return NULL;
+}
+
+
+#endif /* ARCH_PERF_REGS_H */
diff --git a/tools/perf/arch/mips/util/Build b/tools/perf/arch/mips/util/Bu=
ild
new file mode 100644
index 000000000000..7da83b5ebc4c
--- /dev/null
+++ b/tools/perf/arch/mips/util/Build
@@ -0,0 +1,2 @@
+libperf-$(CONFIG_DWARF)                +=3D dwarf-regs.o
+libperf-$(CONFIG_LIBUNWIND)    +=3D unwind-libunwind.o
diff --git a/tools/perf/arch/mips/util/dwarf-regs.c b/tools/perf/arch/mips/=
util/dwarf-regs.c
new file mode 100644
index 000000000000..165e0179ea11
--- /dev/null
+++ b/tools/perf/arch/mips/util/dwarf-regs.c
@@ -0,0 +1,37 @@
+/*
+ * dwarf-regs.c : Mapping of DWARF debug register numbers into register na=
mes.
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
+#include <libio.h>
+#include <dwarf-regs.h>
+
+static const char *mips_gpr_names[32] =3D {
+	"$0", "$1", "$2", "$3", "$4", "$5", "$6", "$7", "$8", "$9",
+	"$10", "$11", "$12", "$13", "$14", "$15", "$16", "$17", "$18", "$19",
+	"$20", "$21", "$22", "$23", "$24", "$25", "$26", "$27", "$28", "$29",
+	"$30", "$31"
+};
+
+const char *get_arch_regstr(unsigned int n)
+{
+	if (n < 32)
+		return mips_gpr_names[n];
+	if (n =3D=3D 64)
+		return "hi";
+	if (n =3D=3D 65)
+		return "lo";
+	return NULL;
+}
diff --git a/tools/perf/arch/mips/util/unwind-libunwind.c b/tools/perf/arch=
/mips/util/unwind-libunwind.c
new file mode 100644
index 000000000000..7af25427943f
--- /dev/null
+++ b/tools/perf/arch/mips/util/unwind-libunwind.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <errno.h>
+#include <libunwind.h>
+#include "perf_regs.h"
+#include "../../util/unwind.h"
+
+int unwind__arch_reg_id(int regnum)
+{
+	switch (regnum) {
+	case UNW_MIPS_R1 ... UNW_MIPS_R25:
+		return regnum - UNW_MIPS_R1 + PERF_REG_MIPS_R1;
+	case UNW_MIPS_R28 ... UNW_MIPS_R31:
+		return regnum - UNW_MIPS_R28 + PERF_REG_MIPS_R28;
+	case UNW_MIPS_PC:
+		return PERF_REG_MIPS_PC;
+	default:
+		pr_err("unwind: invalid reg id %d\n", regnum);
+		return -EINVAL;
+	}
+}
--=20
2.17.1

