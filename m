Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4DE30A824
	for <lists+linux-mips@lfdr.de>; Mon,  1 Feb 2021 13:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbhBAM5P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Feb 2021 07:57:15 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59854 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231482AbhBAM5N (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Feb 2021 07:57:13 -0500
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz_Jm+hdgckIBAA--.1466S3;
        Mon, 01 Feb 2021 20:56:07 +0800 (CST)
Subject: Re: [PATCH 1/3] MIPS: kernel: Support extracting off-line stack
 traces from user-space with perf
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1609246561-5474-1-git-send-email-yangtiezhu@loongson.cn>
 <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
 <20210201104338.GA6484@alpha.franken.de>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        David Daney <david.daney@cavium.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Archer Yan <ayan@wavecomp.com>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <7c081c6f-bf47-353d-95c0-52e8640dc938@loongson.cn>
Date:   Mon, 1 Feb 2021 20:56:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210201104338.GA6484@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxz_Jm+hdgckIBAA--.1466S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr48Xr4kKFy8XF13tF1UWrg_yoW8CFy5pr
        y7Gry8J3savay3WrW5WFWUuw13tFy7JF9FgrWfCry7ZrWIyan5Xw1qgF13tw17Jr1xJwsr
        CFyDWrWUAF1UtrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
        c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrw
        CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
        14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
        IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
        x2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
        AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUID73UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/01/2021 06:43 PM, Thomas Bogendoerfer wrote:
> On Tue, Dec 29, 2020 at 08:55:59PM +0800, Tiezhu Yang wrote:
>> +++ b/arch/mips/include/uapi/asm/perf_regs.h
>> @@ -0,0 +1,42 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +#ifndef _ASM_MIPS_PERF_REGS_H
>> +#define _ASM_MIPS_PERF_REGS_H
>> +
>> +enum perf_event_mips_regs {
>> +	PERF_REG_MIPS_PC,
>> +	PERF_REG_MIPS_R1,
>> +	PERF_REG_MIPS_R2,
>> +	PERF_REG_MIPS_R3,
>> +	PERF_REG_MIPS_R4,
>> +	PERF_REG_MIPS_R5,
>> +	PERF_REG_MIPS_R6,
>> +	PERF_REG_MIPS_R7,
>> +	PERF_REG_MIPS_R8,
>> +	PERF_REG_MIPS_R9,
>> +	PERF_REG_MIPS_R10,
>> +	PERF_REG_MIPS_R11,
>> +	PERF_REG_MIPS_R12,
>> +	PERF_REG_MIPS_R13,
>> +	PERF_REG_MIPS_R14,
>> +	PERF_REG_MIPS_R15,
>> +	PERF_REG_MIPS_R16,
>> +	PERF_REG_MIPS_R17,
>> +	PERF_REG_MIPS_R18,
>> +	PERF_REG_MIPS_R19,
>> +	PERF_REG_MIPS_R20,
>> +	PERF_REG_MIPS_R21,
>> +	PERF_REG_MIPS_R22,
>> +	PERF_REG_MIPS_R23,
>> +	PERF_REG_MIPS_R24,
>> +	PERF_REG_MIPS_R25,
>> +	/*
>> +	 * 26 and 27 are k0 and k1, they are always clobbered thus not
>> +	 * stored.
>> +	 */
> haveing this hole here make all code more complicated. Does it hurt
> to have R26 and R27 in the list ?

I think there is no effect if have R26 and R27 in the list.

In the perf_reg_value(), PERF_REG_MIPS_R{26,27} are default case.

+u64 perf_reg_value(struct pt_regs *regs, int idx)
+{
+ long v;
+
+ switch (idx) {
+ case PERF_REG_MIPS_PC:
+ v = regs->cp0_epc;
+ break;
+ case PERF_REG_MIPS_R1 ... PERF_REG_MIPS_R25:
+ v = regs->regs[idx - PERF_REG_MIPS_R1 + 1];
+ break;
+ case PERF_REG_MIPS_R28 ... PERF_REG_MIPS_R31:
+ v = regs->regs[idx - PERF_REG_MIPS_R28 + 28];
+ break;
+
+ default:
+ WARN_ON_ONCE(1);
+ return 0;
+ }
+
+ return (s64)v; /* Sign extend if 32-bit. */
+} Should I modify enum perf_event_mips_regs to add R26 and R27,
and then send v2?

Thanks,
Tiezhu

>
> Thomas.
>

