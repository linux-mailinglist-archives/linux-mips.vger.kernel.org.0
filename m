Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A612DC2EA
	for <lists+linux-mips@lfdr.de>; Wed, 16 Dec 2020 16:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbgLPPQf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Dec 2020 10:16:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:35454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725812AbgLPPQf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Dec 2020 10:16:35 -0500
Date:   Wed, 16 Dec 2020 12:16:05 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608131753;
        bh=WHJXa4tUefpynUWX4FwjUN1RDWe/oDz+W61Wx+LLppg=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=dJwjwKdROKDc3o7AdFbOw2a/Cu9qkviIeZf5QBtY39QmMDqjXgm7RcZ/ZiDlhTHv7
         BPbjaTPXC/kP4aqU5TOW+9SFuZAy+9NIysnCcIb0MP53L5YQVDS4zCGdFaw9eE7q9/
         1NuRmD9akUDd4eRfoLIyGtvhh1PV+BpiSBy5bkm0OFeg/Nze0oQBujolHXv9JtU+cm
         u81VsqAfM2MY4K1px14NiE7nmL9G5epxhtnZDZkerO7OTxMqpL9b8kJjkdzrRv+k2l
         iuaEWCVzW1NGZnCG9D283pOCWXwLF5y9W6bIE+w+rBXa0d1S3x4GZBv4E7UYr9lhKJ
         KqZEmIlyvCzOg==
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Ralf Baechle <ralf@linux-mips.org>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Archer Yan <ayan@wavecomp.com>,
        David Daney <david.daney@cavium.com>
Subject: Re: [QUESTION] support perf record --call-graph dwarf for mips
Message-ID: <20201216151605.GA297512@kernel.org>
References: <97fb66bf-51f8-a491-9eb4-10b2314cf82f@loongson.cn>
 <90c7db1a-8e1a-e253-79ca-f93dbac014c2@flygoat.com>
 <20201216143047.GC294100@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201216143047.GC294100@kernel.org>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Em Wed, Dec 16, 2020 at 11:30:47AM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Wed, Dec 16, 2020 at 07:14:02PM +0800, Jiaxun Yang escreveu:
> > 
> > 
> > 在 2020/12/16 下午6:05, Tiezhu Yang 写道:
> > > Hi,
> > > 
> > > In the current upstream mainline kernel, perf record --call-graph dwarf
> > > is not supported for architecture mips64. I find the following related
> > > patches about this feature by David Daney <david.daney@cavium.com> and
> > > Archer Yan <ayan@wavecomp.com> in Sep 2019.
>  
> > AFAIK ddaney left Cavium at 2018 and Wave Computing Shanghai is defuncted...
>  
> > Feel free to take over if you like, there is no licenses issue, just
> > remember to credit
> > others properly.
> 
> Ralf, can you take a look at the kernel part? The user space part seems
> ok.

I take that back, but made some progress in getting that old patch
closer to what we have now in tools/perf/, see below.

Someone with a mips system should try to refresh the kernel bits and
then see if the patch below works.

- Arnaldo


commit e59de40addb092d7167fa1dd7c6640d0fab41ede
Author: David Daney <david.daney@cavium.com>
Date:   Wed Sep 11 08:26:37 2019 +0000

    perf mips: Support mips unwinding and dwarf-regs.
    
    Map perf APIs(perf_reg_name/get_arch_regstr/unwind__arch_reg_id)
    with MIPS specific registers.
    
    [ayan@wavecomp.com: repick this patch for unwinding userstack
    backtrace by perf and libunwind on MIPS based CPU.]
    
    Committer notes:
    
    Some header fixups, replace CONFIG_LIBUNWIND with CONFIG_LOCAL_LIBUNWIND
    to cope with:
    
      9d8e14d306ef2f5d ("perf unwind: Separate local/remote libunwind config")
    
    Signed-off-by: David Daney <david.daney@cavium.com>
    Cc: Jiri Olsa <jolsa@redhat.com>
    Cc: linux-kernel@vger.kernel.org
    Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
    Cc: Paul Mackerras <paulus@samba.org>
    Cc: Ingo Molnar <mingo@redhat.com>
    Link: https://lore.kernel.org/r/20190911082548.31546-1-ayan@wavecomp.com
    Signed-off-by: Archer Yan <ayan@wavecomp.com>
    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

diff --git a/tools/perf/arch/mips/Makefile b/tools/perf/arch/mips/Makefile
new file mode 100644
index 0000000000000000..6e1106fab26e4015
--- /dev/null
+++ b/tools/perf/arch/mips/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+ifndef NO_DWARF
+PERF_HAVE_DWARF_REGS := 1
+endif
diff --git a/tools/perf/arch/mips/include/perf_regs.h b/tools/perf/arch/mips/include/perf_regs.h
new file mode 100644
index 0000000000000000..36a28bc1734787ce
--- /dev/null
+++ b/tools/perf/arch/mips/include/perf_regs.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef ARCH_PERF_REGS_H
+#define ARCH_PERF_REGS_H
+
+#include <stdlib.h>
+#include <linux/types.h>
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
+#endif /* ARCH_PERF_REGS_H */
diff --git a/tools/perf/arch/mips/util/Build b/tools/perf/arch/mips/util/Build
new file mode 100644
index 0000000000000000..7b0c0457154a22c5
--- /dev/null
+++ b/tools/perf/arch/mips/util/Build
@@ -0,0 +1,2 @@
+perf-$(CONFIG_DWARF) += dwarf-regs.o
+perf-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
diff --git a/tools/perf/arch/mips/util/dwarf-regs.c b/tools/perf/arch/mips/util/dwarf-regs.c
new file mode 100644
index 0000000000000000..165e0179ea11d9b2
--- /dev/null
+++ b/tools/perf/arch/mips/util/dwarf-regs.c
@@ -0,0 +1,37 @@
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
+#include <libio.h>
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
diff --git a/tools/perf/arch/mips/util/unwind-libunwind.c b/tools/perf/arch/mips/util/unwind-libunwind.c
new file mode 100644
index 0000000000000000..7af25427943f451a
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
