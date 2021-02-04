Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3526B30EB0C
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 04:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234598AbhBDDgf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 22:36:35 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49856 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234583AbhBDDgX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 22:36:23 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9d9axtgvDEDAA--.4897S2;
        Thu, 04 Feb 2021 11:35:25 +0800 (CST)
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
        Juxin Gao <gaojuxin@loongson.cn>
Subject: [PATCH v2 0/3] Add some perf support for mips
Date:   Thu,  4 Feb 2021 11:35:21 +0800
Message-Id: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxb9d9axtgvDEDAA--.4897S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4fuF45Jry7uFyUuF4xXrb_yoW8CFyxpa
        1DCas8Gw4UWrySy34fAF48XFyfGwn5XrWF934Sq3y3ZrySqFyDJryfJFn8tF17Xw1UG3W8
        urn0gr45G3ySyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
        628vn2kIc2xKxwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
        v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
        1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
        AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyU
        JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
        nIWIevJa73UjIFyTuYvjfU8gAwDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v2: add R26 and R27 to the enum perf_event_mips_regs in patch #1

Tiezhu Yang (3):
  MIPS: kernel: Support extracting off-line stack traces from user-space
    with perf
  perf tools: Support mips unwinding and dwarf-regs
  perf tools: Generate mips syscalls_n64.c syscall table

 arch/mips/Kconfig                                  |   2 +
 arch/mips/include/uapi/asm/perf_regs.h             |  40 +++
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
 17 files changed, 723 insertions(+), 2 deletions(-)
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

