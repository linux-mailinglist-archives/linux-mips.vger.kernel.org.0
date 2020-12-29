Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758C42E70B7
	for <lists+linux-mips@lfdr.de>; Tue, 29 Dec 2020 13:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgL2M5P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 07:57:15 -0500
Received: from mail.loongson.cn ([114.242.206.163]:46450 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725979AbgL2M5O (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 07:57:14 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx3zZhJ+tfy00HAA--.27S2;
        Tue, 29 Dec 2020 20:56:02 +0800 (CST)
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
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 0/3] Add some perf support for mips 
Date:   Tue, 29 Dec 2020 20:55:58 +0800
Message-Id: <1609246561-5474-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx3zZhJ+tfy00HAA--.27S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4fuF45Jr1DtF1Dur17Jrb_yoW8Cr45pa
        1DC3s8Gw4UWryFy34fAF48XFWfGwn5XrWF934SqrW3ZrySqFyDJryfJFn8tF17Xw1UG3W8
        urn0gr45G3ySyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6ryUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1l
        IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
        C2KfnxnUUI43ZEXa7VUj_Ma5UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Tiezhu Yang (3):
  MIPS: kernel: Support extracting off-line stack traces from user-space
    with perf
  perf tools: Support mips unwinding and dwarf-regs
  perf tools: Generate mips syscalls_n64.c syscall table

 arch/mips/Kconfig                                  |   2 +
 arch/mips/include/uapi/asm/perf_regs.h             |  42 +++
 arch/mips/kernel/Makefile                          |   2 +-
 arch/mips/kernel/perf_regs.c                       |  68 ++++
 tools/perf/Makefile.config                         |   9 +-
 tools/perf/arch/mips/Makefile                      |  22 ++
 tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  32 ++
 .../perf/arch/mips/entry/syscalls/syscall_n64.tbl  | 358 +++++++++++++++++++++
 tools/perf/arch/mips/include/dwarf-regs-table.h    |  31 ++
 tools/perf/arch/mips/include/perf_regs.h           |  84 +++++
 tools/perf/arch/mips/util/Build                    |   3 +
 tools/perf/arch/mips/util/dwarf-regs.c             |  38 +++
 tools/perf/arch/mips/util/perf_regs.c              |   6 +
 tools/perf/arch/mips/util/unwind-libunwind.c       |  22 ++
 tools/perf/check-headers.sh                        |   1 +
 tools/perf/util/dwarf-regs.c                       |   3 +
 tools/perf/util/syscalltbl.c                       |   4 +
 17 files changed, 725 insertions(+), 2 deletions(-)
 create mode 100644 arch/mips/include/uapi/asm/perf_regs.h
 create mode 100644 arch/mips/kernel/perf_regs.c
 create mode 100644 tools/perf/arch/mips/Makefile
 create mode 100644 tools/perf/arch/mips/entry/syscalls/mksyscalltbl
 create mode 100644 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
 create mode 100644 tools/perf/arch/mips/include/dwarf-regs-table.h
 create mode 100644 tools/perf/arch/mips/include/perf_regs.h
 create mode 100644 tools/perf/arch/mips/util/Build
 create mode 100644 tools/perf/arch/mips/util/dwarf-regs.c
 create mode 100644 tools/perf/arch/mips/util/perf_regs.c
 create mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c

-- 
2.1.0

