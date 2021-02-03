Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C870830DAC2
	for <lists+linux-mips@lfdr.de>; Wed,  3 Feb 2021 14:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhBCNNf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 08:13:35 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54220 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229979AbhBCNNd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 08:13:33 -0500
Received: from [192.168.68.104] (unknown [111.18.92.2])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf_MzoRpglroCAA--.3368S3;
        Wed, 03 Feb 2021 21:12:21 +0800 (CST)
Subject: Re: [PATCH 1/3] MIPS: kernel: Support extracting off-line stack
 traces from user-space with perf
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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
References: <1609246561-5474-1-git-send-email-yangtiezhu@loongson.cn>
 <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
 <20210201104338.GA6484@alpha.franken.de>
 <7c081c6f-bf47-353d-95c0-52e8640dc938@loongson.cn>
 <20210203104009.GE7586@alpha.franken.de>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1ba8402b-77a0-a524-b9f0-55e91841cc20@loongson.cn>
Date:   Wed, 3 Feb 2021 21:12:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20210203104009.GE7586@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxf_MzoRpglroCAA--.3368S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXryDCFy5CF4UJr13Cw13twb_yoW5Gw1fpr
        W7Kay8Jws0qay3urWY9ayUur9xtF13JFW3urWfArW7Zr4jy3Z3Xw1kKFyaqwn7Xr18Ja1U
        urWDKFW8AF1YyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
        c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrw
        CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
        14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
        IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
        x2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
        AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSJP_UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/3/21 6:40 PM, Thomas Bogendoerfer wrote:
> On Mon, Feb 01, 2021 at 08:56:06PM +0800, Tiezhu Yang wrote:
>> On 02/01/2021 06:43 PM, Thomas Bogendoerfer wrote:
>>> On Tue, Dec 29, 2020 at 08:55:59PM +0800, Tiezhu Yang wrote:
>>>> +++ b/arch/mips/include/uapi/asm/perf_regs.h
>>>> @@ -0,0 +1,42 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>>>> +#ifndef _ASM_MIPS_PERF_REGS_H
>>>> +#define _ASM_MIPS_PERF_REGS_H
>>>> +
>>>> +enum perf_event_mips_regs {
>>>> +	PERF_REG_MIPS_PC,
>>>> +	PERF_REG_MIPS_R1,
>>>> +	PERF_REG_MIPS_R2,
>>>> +	PERF_REG_MIPS_R3,
>>>> +	PERF_REG_MIPS_R4,
>>>> +	PERF_REG_MIPS_R5,
>>>> +	PERF_REG_MIPS_R6,
>>>> +	PERF_REG_MIPS_R7,
>>>> +	PERF_REG_MIPS_R8,
>>>> +	PERF_REG_MIPS_R9,
>>>> +	PERF_REG_MIPS_R10,
>>>> +	PERF_REG_MIPS_R11,
>>>> +	PERF_REG_MIPS_R12,
>>>> +	PERF_REG_MIPS_R13,
>>>> +	PERF_REG_MIPS_R14,
>>>> +	PERF_REG_MIPS_R15,
>>>> +	PERF_REG_MIPS_R16,
>>>> +	PERF_REG_MIPS_R17,
>>>> +	PERF_REG_MIPS_R18,
>>>> +	PERF_REG_MIPS_R19,
>>>> +	PERF_REG_MIPS_R20,
>>>> +	PERF_REG_MIPS_R21,
>>>> +	PERF_REG_MIPS_R22,
>>>> +	PERF_REG_MIPS_R23,
>>>> +	PERF_REG_MIPS_R24,
>>>> +	PERF_REG_MIPS_R25,
>>>> +	/*
>>>> +	 * 26 and 27 are k0 and k1, they are always clobbered thus not
>>>> +	 * stored.
>>>> +	 */
>>> haveing this hole here make all code more complicated. Does it hurt
>>> to have R26 and R27 in the list ?
>> I think there is no effect if have R26 and R27 in the list.
>>
>> In the perf_reg_value(), PERF_REG_MIPS_R{26,27} are default case.
> why make them special ? After all they are real registers and are only
> defined special by current ABIs.


By convention, $26 and $27 are k registers which are reserved for use
by the OS kernel.

Here is an explanation [1]:

"An interrupt handler must save any general - purpose registers that
it is going to use (to be restored at return). But to do so requires
you to modify at least one register first (something like sw $t0, saved_t0
expands to two machine instructions using $at).

This situation is resolved by forbidding user programs from using
two general - purpose registers, $k0 and $k1 (The k stands for kernel,
which an exception handler is part of). The interrupt handler is allowed
to use $k0 and $k1 without having to save or restore their values.
This allows just enough leeway to start saving registers, as well as
making returning from the interrupt handler possible."

[1] 
https://stackoverflow.com/questions/27922315/how-to-use-mips-k0-and-k1-registers


>
>> Should I modify enum perf_event_mips_regs to add R26 and R27,
>> and then send v2?
> yes please.
>
> Thomas.
>

