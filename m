Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 578F52DD1B3
	for <lists+linux-mips@lfdr.de>; Thu, 17 Dec 2020 13:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgLQMtq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Dec 2020 07:49:46 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57554 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726569AbgLQMtp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Dec 2020 07:49:45 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxFuCqU9tff5wBAA--.4512S3;
        Thu, 17 Dec 2020 20:48:43 +0800 (CST)
Subject: Re: [QUESTION] support perf record --call-graph dwarf for mips
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Ralf Baechle <ralf@linux-mips.org>
References: <97fb66bf-51f8-a491-9eb4-10b2314cf82f@loongson.cn>
 <90c7db1a-8e1a-e253-79ca-f93dbac014c2@flygoat.com>
 <20201216143047.GC294100@kernel.org> <20201216151605.GA297512@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Archer Yan <ayan@wavecomp.com>,
        David Daney <david.daney@cavium.com>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <7ac47226-c09c-cc84-824b-11dd9a47bb56@loongson.cn>
Date:   Thu, 17 Dec 2020 20:48:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201216151605.GA297512@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxFuCqU9tff5wBAA--.4512S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Wry3ArWUCF15WF1xCw17ZFb_yoWfGF13pF
        W7C3s7Jr4vqa42k3yruF4UuF1ayr12kF9a9rWSgrZrZr43t3WfXwn7trn0yw17Wr18Gw47
        uFZxWr4Ykw4ftw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUjsjjDUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/16/2020 11:16 PM, Arnaldo Carvalho de Melo wrote:
> Em Wed, Dec 16, 2020 at 11:30:47AM -0300, Arnaldo Carvalho de Melo escreveu:
>> Em Wed, Dec 16, 2020 at 07:14:02PM +0800, Jiaxun Yang escreveu:
>>>
>>> 在 2020/12/16 下午6:05, Tiezhu Yang 写道:
>>>> Hi,
>>>>
>>>> In the current upstream mainline kernel, perf record --call-graph dwarf
>>>> is not supported for architecture mips64. I find the following related
>>>> patches about this feature by David Daney <david.daney@cavium.com> and
>>>> Archer Yan <ayan@wavecomp.com> in Sep 2019.
>>   
>>> AFAIK ddaney left Cavium at 2018 and Wave Computing Shanghai is defuncted...
>>   
>>> Feel free to take over if you like, there is no licenses issue, just
>>> remember to credit
>>> others properly.
>> Ralf, can you take a look at the kernel part? The user space part seems
>> ok.
> I take that back, but made some progress in getting that old patch
> closer to what we have now in tools/perf/, see below.
>
> Someone with a mips system should try to refresh the kernel bits and
> then see if the patch below works.
>
> - Arnaldo
>
>
> commit e59de40addb092d7167fa1dd7c6640d0fab41ede
> Author: David Daney <david.daney@cavium.com>
> Date:   Wed Sep 11 08:26:37 2019 +0000
>
>      perf mips: Support mips unwinding and dwarf-regs.
>      
>      Map perf APIs(perf_reg_name/get_arch_regstr/unwind__arch_reg_id)
>      with MIPS specific registers.
>      
>      [ayan@wavecomp.com: repick this patch for unwinding userstack
>      backtrace by perf and libunwind on MIPS based CPU.]
>      
>      Committer notes:
>      
>      Some header fixups, replace CONFIG_LIBUNWIND with CONFIG_LOCAL_LIBUNWIND
>      to cope with:
>      
>        9d8e14d306ef2f5d ("perf unwind: Separate local/remote libunwind config")
>      
>      Signed-off-by: David Daney <david.daney@cavium.com>
>      Cc: Jiri Olsa <jolsa@redhat.com>
>      Cc: linux-kernel@vger.kernel.org
>      Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
>      Cc: Paul Mackerras <paulus@samba.org>
>      Cc: Ingo Molnar <mingo@redhat.com>
>      Link: https://lore.kernel.org/r/20190911082548.31546-1-ayan@wavecomp.com
>      Signed-off-by: Archer Yan <ayan@wavecomp.com>
>      Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> diff --git a/tools/perf/arch/mips/Makefile b/tools/perf/arch/mips/Makefile
> new file mode 100644
> index 0000000000000000..6e1106fab26e4015
> --- /dev/null
> +++ b/tools/perf/arch/mips/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +ifndef NO_DWARF
> +PERF_HAVE_DWARF_REGS := 1
> +endif
> diff --git a/tools/perf/arch/mips/include/perf_regs.h b/tools/perf/arch/mips/include/perf_regs.h
> new file mode 100644
> index 0000000000000000..36a28bc1734787ce
> --- /dev/null
> +++ b/tools/perf/arch/mips/include/perf_regs.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef ARCH_PERF_REGS_H
> +#define ARCH_PERF_REGS_H
> +
> +#include <stdlib.h>
> +#include <linux/types.h>
> +#include <asm/perf_regs.h>
> +
> +#define PERF_REG_IP PERF_REG_MIPS_PC
> +#define PERF_REG_SP PERF_REG_MIPS_R29
> +
> +#define PERF_REGS_MASK ((1ULL << PERF_REG_MIPS_MAX) - 1)
> +
> +static inline const char *perf_reg_name(int id)
> +{
> +	switch (id) {
> +	case PERF_REG_MIPS_PC:
> +		return "PC";
> +	case PERF_REG_MIPS_R1:
> +		return "$1";
> +	case PERF_REG_MIPS_R2:
> +		return "$2";
> +	case PERF_REG_MIPS_R3:
> +		return "$3";
> +	case PERF_REG_MIPS_R4:
> +		return "$4";
> +	case PERF_REG_MIPS_R5:
> +		return "$5";
> +	case PERF_REG_MIPS_R6:
> +		return "$6";
> +	case PERF_REG_MIPS_R7:
> +		return "$7";
> +	case PERF_REG_MIPS_R8:
> +		return "$8";
> +	case PERF_REG_MIPS_R9:
> +		return "$9";
> +	case PERF_REG_MIPS_R10:
> +		return "$10";
> +	case PERF_REG_MIPS_R11:
> +		return "$11";
> +	case PERF_REG_MIPS_R12:
> +		return "$12";
> +	case PERF_REG_MIPS_R13:
> +		return "$13";
> +	case PERF_REG_MIPS_R14:
> +		return "$14";
> +	case PERF_REG_MIPS_R15:
> +		return "$15";
> +	case PERF_REG_MIPS_R16:
> +		return "$16";
> +	case PERF_REG_MIPS_R17:
> +		return "$17";
> +	case PERF_REG_MIPS_R18:
> +		return "$18";
> +	case PERF_REG_MIPS_R19:
> +		return "$19";
> +	case PERF_REG_MIPS_R20:
> +		return "$20";
> +	case PERF_REG_MIPS_R21:
> +		return "$21";
> +	case PERF_REG_MIPS_R22:
> +		return "$22";
> +	case PERF_REG_MIPS_R23:
> +		return "$23";
> +	case PERF_REG_MIPS_R24:
> +		return "$24";
> +	case PERF_REG_MIPS_R25:
> +		return "$25";
> +	case PERF_REG_MIPS_R28:
> +		return "$28";
> +	case PERF_REG_MIPS_R29:
> +		return "$29";
> +	case PERF_REG_MIPS_R30:
> +		return "$30";
> +	case PERF_REG_MIPS_R31:
> +		return "$31";
> +	default:
> +		break;
> +	}
> +	return NULL;
> +}
> +
> +#endif /* ARCH_PERF_REGS_H */
> diff --git a/tools/perf/arch/mips/util/Build b/tools/perf/arch/mips/util/Build
> new file mode 100644
> index 0000000000000000..7b0c0457154a22c5
> --- /dev/null
> +++ b/tools/perf/arch/mips/util/Build
> @@ -0,0 +1,2 @@
> +perf-$(CONFIG_DWARF) += dwarf-regs.o
> +perf-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
> diff --git a/tools/perf/arch/mips/util/dwarf-regs.c b/tools/perf/arch/mips/util/dwarf-regs.c
> new file mode 100644
> index 0000000000000000..165e0179ea11d9b2
> --- /dev/null
> +++ b/tools/perf/arch/mips/util/dwarf-regs.c
> @@ -0,0 +1,37 @@
> +/*
> + * dwarf-regs.c : Mapping of DWARF debug register numbers into register names.
> + *
> + * Copyright (C) 2013 Cavium, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <libio.h>
> +#include <dwarf-regs.h>
> +
> +static const char *mips_gpr_names[32] = {
> +	"$0", "$1", "$2", "$3", "$4", "$5", "$6", "$7", "$8", "$9",
> +	"$10", "$11", "$12", "$13", "$14", "$15", "$16", "$17", "$18", "$19",
> +	"$20", "$21", "$22", "$23", "$24", "$25", "$26", "$27", "$28", "$29",
> +	"$30", "$31"
> +};
> +
> +const char *get_arch_regstr(unsigned int n)
> +{
> +	if (n < 32)
> +		return mips_gpr_names[n];
> +	if (n == 64)
> +		return "hi";
> +	if (n == 65)
> +		return "lo";
> +	return NULL;
> +}
> diff --git a/tools/perf/arch/mips/util/unwind-libunwind.c b/tools/perf/arch/mips/util/unwind-libunwind.c
> new file mode 100644
> index 0000000000000000..7af25427943f451a
> --- /dev/null
> +++ b/tools/perf/arch/mips/util/unwind-libunwind.c
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <errno.h>
> +#include <libunwind.h>
> +#include "perf_regs.h"
> +#include "../../util/unwind.h"
> +
> +int unwind__arch_reg_id(int regnum)
> +{
> +	switch (regnum) {
> +	case UNW_MIPS_R1 ... UNW_MIPS_R25:
> +		return regnum - UNW_MIPS_R1 + PERF_REG_MIPS_R1;
> +	case UNW_MIPS_R28 ... UNW_MIPS_R31:
> +		return regnum - UNW_MIPS_R28 + PERF_REG_MIPS_R28;
> +	case UNW_MIPS_PC:
> +		return PERF_REG_MIPS_PC;
> +	default:
> +		pr_err("unwind: invalid reg id %d\n", regnum);
> +		return -EINVAL;
> +	}
> +}

(1)There exists build errors used with the above patch:

   LINK     perf
perf-in.o: In function `get_dwarf_regstr':
/home/loongson/linux-5.10-rc7/tools/perf/util/dwarf-regs.c:33: undefined 
reference to `get_arch_regstr'
/home/loongson/linux-5.10-rc7/tools/perf/util/dwarf-regs.c:35: undefined 
reference to `get_arch_regstr'
collect2: error: ld returned 1 exit status
Makefile.perf:659: recipe for target 'perf' failed
make[2]: *** [perf] Error 1
Makefile.perf:232: recipe for target 'sub-make' failed
make[1]: *** [sub-make] Error 2
Makefile:69: recipe for target 'all' failed
make: *** [all] Error 2

(2)We need to modify tools/perf/arch/mips/Build, then build successful.

diff --git a/tools/perf/arch/mips/Build b/tools/perf/arch/mips/Build
index 1bb8bf6d7fd4..54afe4a467e7 100644
--- a/tools/perf/arch/mips/Build
+++ b/tools/perf/arch/mips/Build
@@ -1 +1 @@
-# empty
+libperf-y += util/

(3)[loongson@linux perf]$ ./perf record --call-graph dwarf cd
Error:
The sys_perf_event_open() syscall returned with 89 (Function not 
implemented) for event (cycles:u).
/bin/dmesg | grep -i perf may provide additional information.

Call Trace:
record__open
   evsel__open()
     evsel__open_cpu()
       perf_event_open()
   evsel__open_strerror

Maybe we need tools/perf/arch/mips/entry/syscalls/syscall.tbl?

