Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF7A30BE1B
	for <lists+linux-mips@lfdr.de>; Tue,  2 Feb 2021 13:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhBBMW5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Feb 2021 07:22:57 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54982 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229483AbhBBMW4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Feb 2021 07:22:56 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxLezcQxlgIfABAA--.3282S3;
        Tue, 02 Feb 2021 20:21:49 +0800 (CST)
Subject: Re: [PATCH 3/3] MIPS: ftrace: Add DYNAMIC_FTRACE_WITH_REGS support
To:     Steven Rostedt <rostedt@goodmis.org>
References: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn>
 <1612080878-5426-3-git-send-email-hejinyang@loongson.cn>
 <20210201095612.62e62544@gandalf.local.home>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ingo Molnar <mingo@redhat.com>,
        Wu Zhangjin <wuzhangjin@gmail.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <01a8f2e1-b549-b2ce-37fd-7cc4bb516107@loongson.cn>
Date:   Tue, 2 Feb 2021 20:21:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210201095612.62e62544@gandalf.local.home>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9BxLezcQxlgIfABAA--.3282S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1rCr48JryxKF43ZF13Arb_yoW8tFW7pr
        93Z3ZrCF4DZFs2k342gr1xZFs8Crs5JFW8Ar18G3Wak3s8WF12yFsrCa1DKryUJw409rW2
        vFyjyw17X3ZxZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUAR6wUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/01/2021 10:56 PM, Steven Rostedt wrote:

> On Sun, 31 Jan 2021 16:14:38 +0800
> Jinyang He <hejinyang@loongson.cn> wrote:
>
>> In the past, we have always used the address of _mcount as the address of
>> ftrace_caller. It reduces one ftrace_modify_code operation when do ftrace
>> on modules on 64Bit platform in this way. In order to provide
>> DYNAMIC_FTRACE_WITH_REGS, we have to take _mcount out of ftrace_caller and
>> add a new definition of _mcount. It is necessary to modify 2 instructions.
>> Also add the definition of ftrace_regs_caller. ftrace_regs_caller will
>> store and restore more registers. Of course, some functions in ftrace.c
>> also need to consider ftrace_regs_caller. Modify these functions and add
>> the related code of ftrace_regs_caller.
> Note, while you are making these changes, you may want to look at the new
> feature of ftrace that has HAVE_DYNAMIC_FTRACE_WITH_ARGS.
>
> I noticed that with x86 (and probably all other archs), you need to save
> the arguments before calling the ftrace callbacks in the ftrace trampoline.
> If done properly, this means that the callbacks should be able to access
> the function arguments. What happens then, it structures the arguments in a
> way that if the function was called with "WITH_REGS" set, its the full
> pt_regs structure. Otherwise, it's a partial structure called "ftrace_regs".
>
>
> See arch/x86/include/asm/ftrace.h for ftrace_regs.
>
> Then the ftrace_regs is passed to the callback instead of pt_regs (for all
> callbacks!).
>
> If a callback has the REGS flag set (ftrace_caller_regs), then to get the
> pt_regs, it needs to call:
>
> 	struct pt_regs *regs = arch_ftrace_get_regs(ftrace_regs);
>
> Where arch_ftrace_get_regs() returns the full pt_regs if the callback was
> called from a ftrace_caller_regs trampoline, otherwise it must return NULL.
>
> The reason to return NULL is that we don't want callbacks using pt_regs,
> thinking it's fully populated when it is not.
>
> But if HAVE_DYNAMIC_FTRACE_ARGS is set, then all ftrace callbacks
> (regardless of REGS flag being set) has access to the arguments from the
> ftrace_regs.
>
> -- Steve
Hi, Steve,

Thank you for your comment. It really helps a lot. It's time to learn more!


Thanks, :-)
Jinyang

