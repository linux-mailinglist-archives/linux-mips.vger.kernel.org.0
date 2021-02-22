Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C7D3210FE
	for <lists+linux-mips@lfdr.de>; Mon, 22 Feb 2021 07:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhBVGo6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Feb 2021 01:44:58 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55788 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230063AbhBVGoy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Feb 2021 01:44:54 -0500
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxudSbUjNg5zUNAA--.16978S3;
        Mon, 22 Feb 2021 14:43:39 +0800 (CST)
Subject: Re: [PATCH v2 0/3] Add some perf support for mips
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1d3c4abd-4b14-90e3-6528-457a8248cb52@loongson.cn>
Date:   Mon, 22 Feb 2021 14:43:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxudSbUjNg5zUNAA--.16978S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uw18GFWftw4UCF1xuF4rZrb_yoW8KFWfpa
        1DC3s5Gw45WrySy34fAF48ZFyfWwn5ZrWF934Iq3y3Zr1SqFnrJr1fGF98tF17Xw1UGa10
        9rn0gr1UGw4SyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
        c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrw
        CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
        14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
        IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
        x2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
        AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUEAp5UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/04/2021 11:35 AM, Tiezhu Yang wrote:
> v2: add R26 and R27 to the enum perf_event_mips_regs in patch #1
>
> Tiezhu Yang (3):
>    MIPS: kernel: Support extracting off-line stack traces from user-space
>      with perf
>    perf tools: Support mips unwinding and dwarf-regs
>    perf tools: Generate mips syscalls_n64.c syscall table

Hi Arnaldo,

The kernel part patch #1 has been merged.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ddc96bd42da

Could the perf tool patches #2 and #3 have a chance to be merged before 
5.12-rc1?
If yes, we can use this feature in 5.12-rc1.

https://lore.kernel.org/patchwork/patch/1375476/
https://lore.kernel.org/patchwork/patch/1375475/


Thanks,
Tiezhu

>
>   arch/mips/Kconfig                                  |   2 +
>   arch/mips/include/uapi/asm/perf_regs.h             |  40 +++
>   arch/mips/kernel/Makefile                          |   2 +-
>   arch/mips/kernel/perf_regs.c                       |  68 ++++
>   tools/perf/Makefile.config                         |   9 +-
>   tools/perf/arch/mips/Makefile                      |  22 ++
>   tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  32 ++
>   .../perf/arch/mips/entry/syscalls/syscall_n64.tbl  | 358 +++++++++++++++++++++
>   tools/perf/arch/mips/include/dwarf-regs-table.h    |  31 ++
>   tools/perf/arch/mips/include/perf_regs.h           |  84 +++++
>   tools/perf/arch/mips/util/Build                    |   3 +
>   tools/perf/arch/mips/util/dwarf-regs.c             |  38 +++
>   tools/perf/arch/mips/util/perf_regs.c              |   6 +
>   tools/perf/arch/mips/util/unwind-libunwind.c       |  22 ++
>   tools/perf/check-headers.sh                        |   1 +
>   tools/perf/util/dwarf-regs.c                       |   3 +
>   tools/perf/util/syscalltbl.c                       |   4 +
>   17 files changed, 723 insertions(+), 2 deletions(-)
>   create mode 100644 arch/mips/include/uapi/asm/perf_regs.h
>   create mode 100644 arch/mips/kernel/perf_regs.c
>   create mode 100644 tools/perf/arch/mips/Makefile
>   create mode 100644 tools/perf/arch/mips/entry/syscalls/mksyscalltbl
>   create mode 100644 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
>   create mode 100644 tools/perf/arch/mips/include/dwarf-regs-table.h
>   create mode 100644 tools/perf/arch/mips/include/perf_regs.h
>   create mode 100644 tools/perf/arch/mips/util/Build
>   create mode 100644 tools/perf/arch/mips/util/dwarf-regs.c
>   create mode 100644 tools/perf/arch/mips/util/perf_regs.c
>   create mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
>

