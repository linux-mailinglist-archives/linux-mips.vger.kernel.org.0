Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5574E30EB0E
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 04:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbhBDDhO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 22:37:14 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49920 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234596AbhBDDgc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 22:36:32 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9d9axtgvDEDAA--.4897S4;
        Thu, 04 Feb 2021 11:35:33 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        David Daney <david.daney@cavium.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Archer Yan <ayan@wavecomp.com>
Subject: [PATCH v2 2/3] perf tools: Support mips unwinding and dwarf-regs
Date:   Thu,  4 Feb 2021 11:35:23 +0800
Message-Id: <1612409724-3516-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxb9d9axtgvDEDAA--.4897S4
X-Coremail-Antispam: 1UD129KBjvJXoWfJF45Ww4rCw18XF4DAr4kXrb_yoWDXF45pF
        47C348Jw48Xa4ak3yrCFWUuF13Gan2vF9avryfKrZrZr47t3WrX392yrn09w1xXw48Gw4x
        Wr9Igr4UCw4fJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
        owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjfU85l1DUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Map perf APIs(perf_reg_name/get_arch_regstr/unwind__arch_reg_id)
with MIPS specific registers.

[ayan@wavecomp.com: repick this patch for unwinding userstack
backtrace by perf and libunwind on MIPS based CPU.]

[yangtiezhu@loongson.cn: Add sample_reg_masks[] to fix build
error, silence some checkpatch errors and warnings, and also
separate the original patches into two parts (MIPS kernel and
perf tools) to merge easily.]

The original patches:
https://lore.kernel.org/patchwork/patch/1126521/
https://lore.kernel.org/patchwork/patch/1126520/

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Archer Yan <ayan@wavecomp.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: no changes

 tools/perf/Makefile.config                      |  6 ++
 tools/perf/arch/mips/Makefile                   |  4 ++
 tools/perf/arch/mips/include/dwarf-regs-table.h | 31 +++++++++
 tools/perf/arch/mips/include/perf_regs.h        | 84 +++++++++++++++++++++++++
 tools/perf/arch/mips/util/Build                 |  3 +
 tools/perf/arch/mips/util/dwarf-regs.c          | 38 +++++++++++
 tools/perf/arch/mips/util/perf_regs.c           |  6 ++
 tools/perf/arch/mips/util/unwind-libunwind.c    | 22 +++++++
 tools/perf/util/dwarf-regs.c                    |  3 +
 9 files changed, 197 insertions(+)
 create mode 100644 tools/perf/arch/mips/Makefile
 create mode 100644 tools/perf/arch/mips/include/dwarf-regs-table.h
 create mode 100644 tools/perf/arch/mips/include/perf_regs.h
 create mode 100644 tools/perf/arch/mips/util/Build
 create mode 100644 tools/perf/arch/mips/util/dwarf-regs.c
 create mode 100644 tools/perf/arch/mips/util/perf_regs.c
 create mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index ce8516e..e378add 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -87,6 +87,12 @@ ifeq ($(ARCH),s390)
   CFLAGS += -fPIC -I$(OUTPUT)arch/s390/include/generated
 endif
 
+ifeq ($(ARCH),mips)
+  NO_PERF_REGS := 0
+  CFLAGS += -I../../arch/mips/include/uapi -I../../arch/mips/include/generated/uapi
+  LIBUNWIND_LIBS = -lunwind -lunwind-mips
+endif
+
 ifeq ($(NO_PERF_REGS),0)
   $(call detected,CONFIG_PERF_REGS)
 endif
diff --git a/tools/perf/arch/mips/Makefile b/tools/perf/arch/mips/Makefile
new file mode 100644
index 0000000..6e1106f
--- /dev/null
+++ b/tools/perf/arch/mips/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+ifndef NO_DWARF
+PERF_HAVE_DWARF_REGS := 1
+endif
diff --git a/tools/perf/arch/mips/include/dwarf-regs-table.h b/tools/perf/arch/mips/include/dwarf-regs-table.h
new file mode 100644
index 0000000..5badbcd
--- /dev/null
+++ b/tools/perf/arch/mips/include/dwarf-regs-table.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+#define REG_DWARFNUM_NAME(reg, idx)	[idx] = "$" #reg
+static const char * const mips_regstr_tbl[] = {
+	"$0", "$1", "$2", "$3", "$4", "$5", "$6", "$7", "$8", "$9",
+	"$10", "$11", "$12", "$13", "$14", "$15", "$16", "$17", "$18", "$19",
+	"$20", "$21", "$22", "$23", "$24", "$25", "$26", "$27", "$28", "%29",
+	"$30", "$31",
+	REG_DWARFNUM_NAME(hi, 64),
+	REG_DWARFNUM_NAME(lo, 65),
+};
+#endif
diff --git a/tools/perf/arch/mips/include/perf_regs.h b/tools/perf/arch/mips/include/perf_regs.h
new file mode 100644
index 0000000..7a7908b
--- /dev/null
+++ b/tools/perf/arch/mips/include/perf_regs.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ARCH_PERF_REGS_H
+#define ARCH_PERF_REGS_H
+
+#include <stdlib.h>
+#include <linux/types.h>
+#include <asm/perf_regs.h>
+
+#define PERF_REGS_MAX PERF_REG_MIPS_MAX
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
+#endif /* ARCH_PERF_REGS_H */
diff --git a/tools/perf/arch/mips/util/Build b/tools/perf/arch/mips/util/Build
new file mode 100644
index 0000000..51c8900
--- /dev/null
+++ b/tools/perf/arch/mips/util/Build
@@ -0,0 +1,3 @@
+perf-y += perf_regs.o
+perf-$(CONFIG_DWARF) += dwarf-regs.o
+perf-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
diff --git a/tools/perf/arch/mips/util/dwarf-regs.c b/tools/perf/arch/mips/util/dwarf-regs.c
new file mode 100644
index 0000000..25c13a9
--- /dev/null
+++ b/tools/perf/arch/mips/util/dwarf-regs.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dwarf-regs.c : Mapping of DWARF debug register numbers into register names.
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
+#include <stdio.h>
+#include <dwarf-regs.h>
+
+static const char *mips_gpr_names[32] = {
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
+	if (n == 64)
+		return "hi";
+	if (n == 65)
+		return "lo";
+	return NULL;
+}
diff --git a/tools/perf/arch/mips/util/perf_regs.c b/tools/perf/arch/mips/util/perf_regs.c
new file mode 100644
index 0000000..2864e2e
--- /dev/null
+++ b/tools/perf/arch/mips/util/perf_regs.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "../../util/perf_regs.h"
+
+const struct sample_reg sample_reg_masks[] = {
+	SMPL_REG_END
+};
diff --git a/tools/perf/arch/mips/util/unwind-libunwind.c b/tools/perf/arch/mips/util/unwind-libunwind.c
new file mode 100644
index 0000000..0d8c99c
--- /dev/null
+++ b/tools/perf/arch/mips/util/unwind-libunwind.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <errno.h>
+#include <libunwind.h>
+#include "perf_regs.h"
+#include "../../util/unwind.h"
+#include "util/debug.h"
+
+int libunwind__arch_reg_id(int regnum)
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
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 1b49ece..3fa4486 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -24,6 +24,7 @@
 #include "../arch/s390/include/dwarf-regs-table.h"
 #include "../arch/sparc/include/dwarf-regs-table.h"
 #include "../arch/xtensa/include/dwarf-regs-table.h"
+#include "../arch/mips/include/dwarf-regs-table.h"
 
 #define __get_dwarf_regstr(tbl, n) (((n) < ARRAY_SIZE(tbl)) ? (tbl)[(n)] : NULL)
 
@@ -53,6 +54,8 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine)
 		return __get_dwarf_regstr(sparc_regstr_tbl, n);
 	case EM_XTENSA:
 		return __get_dwarf_regstr(xtensa_regstr_tbl, n);
+	case EM_MIPS:
+		return __get_dwarf_regstr(mips_regstr_tbl, n);
 	default:
 		pr_err("ELF MACHINE %x is not supported.\n", machine);
 	}
-- 
2.1.0

