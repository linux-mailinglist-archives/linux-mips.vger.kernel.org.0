Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128E82756B1
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 12:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgIWK4t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 06:56:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37214 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726422AbgIWK4t (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 23 Sep 2020 06:56:49 -0400
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP9zeKWtfCXgXAA--.2403S2;
        Wed, 23 Sep 2020 18:56:30 +0800 (CST)
From:   Peng Fan <fanpeng@loongson.cn>
To:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Dengcheng Zhu <dzhu@wavecomp.com>,
        Paul Burton <paulburton@kernel.org>,
        Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
        Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH] perf annotate mips: Add perf arch instructions annotate handlers
Date:   Wed, 23 Sep 2020 18:56:24 +0800
Message-Id: <1600858584-6161-1-git-send-email-fanpeng@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxP9zeKWtfCXgXAA--.2403S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4DKr1Dtry7ur1DZryUtrb_yoWrWF13pa
        9rCws5Kr18Xr4rKas3AF4rZrW3KFs5ArZ8Gryrt398AF42qrn7JFnayrs8t3WxWrZ3ur4a
        9F1Yqr1kG3W5CaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
        wI1lc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
        IFyTuYvjxU4F4EDUUUU
X-CM-SenderInfo: xidq1vtqj6z05rqj20fqof0/1tbiAQAIEl3QvMTtRgAAsF
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Dengcheng Zhu <dzhu@wavecomp.com>

Support the MIPS architecture using the ins_ops association
method. With this patch, perf-annotate can work well on MIPS.

Testing it with a perf.data file collected on a mips machine:
$./perf annotate -i perf.data

         :           Disassembly of section .text:
         :
         :           00000000000be6a0 <get_next_seq>:
         :           get_next_seq():
    0.00 :   be6a0:       lw      v0,0(a0)
    0.00 :   be6a4:       daddiu  sp,sp,-128
    0.00 :   be6a8:       ld      a7,72(a0)
    0.00 :   be6ac:       gssq    s5,s4,80(sp)
    0.00 :   be6b0:       gssq    s1,s0,48(sp)
    0.00 :   be6b4:       gssq    s8,gp,112(sp)
    0.00 :   be6b8:       gssq    s7,s6,96(sp)
    0.00 :   be6bc:       gssq    s3,s2,64(sp)
    0.00 :   be6c0:       sd      a3,0(sp)
    0.00 :   be6c4:       move    s0,a0
    0.00 :   be6c8:       sd      v0,32(sp)
    0.00 :   be6cc:       sd      a5,8(sp)
    0.00 :   be6d0:       sd      zero,8(a0)
    0.00 :   be6d4:       sd      a6,16(sp)
    0.00 :   be6d8:       ld      s2,48(a0)
    8.53 :   be6dc:       ld      s1,40(a0)
    9.42 :   be6e0:       ld      v1,32(a0)
    0.00 :   be6e4:       nop
    0.00 :   be6e8:       ld      s4,24(a0)
    0.00 :   be6ec:       ld      s5,16(a0)
    0.00 :   be6f0:       sd      a7,40(sp)
   10.11 :   be6f4:       ld      s6,64(a0)
...

The original patch link is:
https://lore.kernel.org/patchwork/patch/1180480/

Signed-off-by: Dengcheng Zhu <dzhu@wavecomp.com>
Signed-off-by: Peng Fan <fanpeng@loongson.cn>
---

Add "bgtzl", "bltzl", "bgezl", "blezl", "beql"
and "bnel", remove "bgtzal", "blezal", "beqzal",
"bnezal" and "jialc". Because these five can not
be found in the instruction manual.

 tools/perf/arch/mips/Build                   |  2 +-
 tools/perf/arch/mips/annotate/instructions.c | 41 ++++++++++++++++++++++++++++
 tools/perf/util/annotate.c                   |  8 ++++++
 3 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/arch/mips/annotate/instructions.c

diff --git a/tools/perf/arch/mips/Build b/tools/perf/arch/mips/Build
index 1bb8bf6..e4e5f33 100644
--- a/tools/perf/arch/mips/Build
+++ b/tools/perf/arch/mips/Build
@@ -1 +1 @@
-# empty
+perf-y += util/
diff --git a/tools/perf/arch/mips/annotate/instructions.c b/tools/perf/arch/mips/annotate/instructions.c
new file mode 100644
index 0000000..8fae8a1
--- /dev/null
+++ b/tools/perf/arch/mips/annotate/instructions.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+
+static
+struct ins_ops *mips__associate_ins_ops(struct arch *arch, const char *name)
+{
+	struct ins_ops *ops = NULL;
+
+	if (!strncmp(name, "bal", 3) ||
+	    !strncmp(name, "bgezal", 6) ||
+	    !strncmp(name, "bltzal", 6) ||
+	    !strncmp(name, "bgtzl", 5) ||
+	    !strncmp(name, "bltzl", 5) ||
+	    !strncmp(name, "bgezl", 5) ||
+	    !strncmp(name, "blezl", 5) ||
+	    !strncmp(name, "beql", 4) ||
+	    !strncmp(name, "bnel", 4) ||
+	    !strncmp(name, "jal", 3))
+		ops = &call_ops;
+	else if (!strncmp(name, "jr", 2))
+		ops = &ret_ops;
+	else if (name[0] == 'j' || name[0] == 'b')
+		ops = &jump_ops;
+	else
+		return NULL;
+
+	arch__associate_ins_ops(arch, name, ops);
+
+	return ops;
+}
+
+static
+int mips__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
+{
+	if (!arch->initialized) {
+		arch->associate_instruction_ops = mips__associate_ins_ops;
+		arch->initialized = true;
+		arch->objdump.comment_char = '#';
+	}
+
+	return 0;
+}
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 0a1fcf7..80a4a3d 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -152,6 +152,7 @@ static int arch__associate_ins_ops(struct arch* arch, const char *name, struct i
 #include "arch/arm/annotate/instructions.c"
 #include "arch/arm64/annotate/instructions.c"
 #include "arch/csky/annotate/instructions.c"
+#include "arch/mips/annotate/instructions.c"
 #include "arch/x86/annotate/instructions.c"
 #include "arch/powerpc/annotate/instructions.c"
 #include "arch/s390/annotate/instructions.c"
@@ -175,6 +176,13 @@ static struct arch architectures[] = {
 		.init = csky__annotate_init,
 	},
 	{
+		.name = "mips",
+		.init = mips__annotate_init,
+		.objdump = {
+			.comment_char = '#',
+		},
+	},
+	{
 		.name = "x86",
 		.init = x86__annotate_init,
 		.instructions = x86__instructions,
-- 
2.1.0

