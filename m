Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17A63083E6
	for <lists+linux-mips@lfdr.de>; Fri, 29 Jan 2021 03:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbhA2CuL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 21:50:11 -0500
Received: from mail.loongson.cn ([114.242.206.163]:41500 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229757AbhA2CuL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 Jan 2021 21:50:11 -0500
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxCL6UdxNgWBgPAA--.22932S3;
        Fri, 29 Jan 2021 10:48:54 +0800 (CST)
Subject: Re: [PATCH 1/3] MIPS: kernel: Support extracting off-line stack
 traces from user-space with perf
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>
References: <1609246561-5474-1-git-send-email-yangtiezhu@loongson.cn>
 <1609246561-5474-2-git-send-email-yangtiezhu@loongson.cn>
 <20210104105904.GK3021@hirez.programming.kicks-ass.net>
 <0712b131-715a-a83a-bc9e-61405824ff0e@flygoat.com>
 <20210105101806.GG3040@hirez.programming.kicks-ass.net>
 <20210127211506.GA21163@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        David Daney <david.daney@cavium.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Archer Yan <ayan@wavecomp.com>, x86@kernel.org
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <d2035b91-bcb9-bde4-8009-d81d177b2317@loongson.cn>
Date:   Fri, 29 Jan 2021 10:48:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210127211506.GA21163@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxCL6UdxNgWBgPAA--.22932S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy5Ar17JF45GrykGF1kAFb_yoW8CFW3pa
        yvva1jkF4qqryj9F1Ivwn5Zasayr48Kw4FgFn8tFWIq3yq9F1ftF48t3Wj9as3Zr1fG3W2
        vr4UXr9rZFn3ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwI
        xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
        6cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbU3ktUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 01/28/2021 05:15 AM, Thomas Bogendoerfer wrote:
> On Tue, Jan 05, 2021 at 11:18:06AM +0100, Peter Zijlstra wrote:
>> On Tue, Jan 05, 2021 at 11:45:37AM +0800, Jiaxun Yang wrote:
>>> 在 2021/1/4 下午6:59, Peter Zijlstra 写道:
>>>> On Tue, Dec 29, 2020 at 08:55:59PM +0800, Tiezhu Yang wrote:
>>>>> +u64 perf_reg_abi(struct task_struct *tsk)
>>>>> +{
>>>>> +	if (test_tsk_thread_flag(tsk, TIF_32BIT_REGS))
>>>>> +		return PERF_SAMPLE_REGS_ABI_32;
>>>>> +	else
>>>>> +		return PERF_SAMPLE_REGS_ABI_64;
>>>>> +}
>>>> So we recently changed this on x86 to not rely on TIF flags. IIRC the
>>>> problem is that on x86 you can change the mode of a task without the
>>>> kernel being aware of it. Is something like that possible on MIPS as
>>>> well?
>>> Hi all,
>>>
>>> In MIPS world it's impossible to raise a thread to 64bit without kernel
>>> aware.
>>> Without STATUS.UX set it will trigger reserved instruction exception when
>>> trying
>>> to run 64bit instructions.
>> The other way around is the case on x86, a 64bit program can create and
>> execute 32bit code sections without the kernel being aware. But if
>> clearing STATUS.UX has the same issue as setting it, that should not be
>> a problem for you.
>>
>>> However it may be possible to run with 32bit ABI without
>>> TIF_32BIT_REGS if user program didn't get ELF ABI right. I think
>>> that's out of our current consideration.
>> Fair enough.
>>
>>>> The thing x86 does today is look at it's pt_regs state to determine the
>>>> actual state.
>>> It is possible to look at pt_regs Status.UX bit on MIPS. But it seems
>>> unnecessary
>>> as user can't change it.
>> Ok, good. Then no objection, proceed! :-)
> this patch aims more to mips-next, while patch 2 and 3 are targeting
> tools/perf. Should I take them into mips-next, too ?

If it is possible, I prefer to merge this three patches together
through mips-next tree.

Thanks,
Tiezhu

>
> Thomas.
>

