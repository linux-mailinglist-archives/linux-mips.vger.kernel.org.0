Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA57B2BBB94
	for <lists+linux-mips@lfdr.de>; Sat, 21 Nov 2020 02:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbgKUBcl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Nov 2020 20:32:41 -0500
Received: from mail.loongson.cn ([114.242.206.163]:60052 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728054AbgKUBcl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 20 Nov 2020 20:32:41 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9MwbrhfhyEUAA--.41443S3;
        Sat, 21 Nov 2020 09:32:32 +0800 (CST)
Subject: Re: [RFC PATCH] MIPS: Kconfig: Select ARCH_WANT_FRAME_POINTERS
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
References: <1605502980-31946-1-git-send-email-yangtiezhu@loongson.cn>
 <alpine.LFD.2.21.2011202202290.656242@eddie.linux-mips.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <e91a9885-78cc-b23a-d485-8f68fdfb0222@loongson.cn>
Date:   Sat, 21 Nov 2020 09:32:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2011202202290.656242@eddie.linux-mips.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxr9MwbrhfhyEUAA--.41443S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCF47Ww4xGrWDuw4kXw1DWrg_yoW5tw13pw
        4rKws0yr4DJa4xC3WkAw4Ig34fZws5G3yY9anxKryjyw15Wr1FgrWftrW3uas7Wr1kK3Wj
        v3s0gry0qw4qy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
        4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
        ZFpf9x0JUdb18UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/21/2020 06:37 AM, Maciej W. Rozycki wrote:
> On Mon, 16 Nov 2020, Tiezhu Yang wrote:
>
>> Select ARCH_WANT_FRAME_POINTERS to fix the following build error under
>> CONFIG_DEBUG_ATOMIC_SLEEP:
>>
>>    CC      arch/mips/kernel/signal.o
>> {standard input}: Assembler messages:
>> {standard input}:1775: Error: Unable to parse register name $fp
>> scripts/Makefile.build:283: recipe for target 'arch/mips/kernel/signal.o' failed
>> make[2]: *** [arch/mips/kernel/signal.o] Error 1
>> scripts/Makefile.build:500: recipe for target 'arch/mips/kernel' failed
>> make[1]: *** [arch/mips/kernel] Error 2
>> Makefile:1799: recipe for target 'arch/mips' failed
>> make: *** [arch/mips] Error 2
>   Your change description does not explain to me what is going on here I am
> afraid, and based on it I am unable to determine if it is fit for purpose.
>
>   It seems to me like your change papers over an issue by changing code
> generation somehow with the kernel configuration option selected so that
> invalid assembly is not produced anymore while invalid assembly should not
> happen in the first place regardless of the configuration.
>
>   In particular `$fp' is a standard assembly alias for `$30' aka `$s8' and
> it is expected to work where `$30' or indeed any general-purpose register
> would:
>
> #define SYMBOLIC_REGISTER_NAMES \
> [...]
>      {"$s8",	RTYPE_GP | 30}, \
>      {"$fp",	RTYPE_GP | 30}, \
>      {"$ra",	RTYPE_GP | 31}
>
> (from gas/config/tc-mips.c) so please show us what the assembly line GAS
> chokes on looks like in your case.
>
>> Documentation/dev-tools/kgdb.rst
>> This option inserts code to into the compiled executable which saves
>> the frame information in registers or on the stack at different points
>> which allows a debugger such as gdb to more accurately construct stack
>> back traces while debugging the kernel.
>   Hmm, this is what DWARF debug information is for in the context of GDB,
> and I certainly used to use GDB to debug standard MIPS/Linux kernels built
> without the use of a separate frame pointer register (which there wasn't a
> kernel configuration option for back then, though which you obviously
> still could try to enforce with the use of `-fno-omit-frame-pointer' via
> CFLAGS) using JTAG probes or simulation some 15 years ago.
>
>   And given the variable layout of the MIPS stack frame (unlike with some
> psABIs, e.g. Power) the use of `$fp' alone does not let you reconstruct a
> backtrace, because you cannot infer from the value of `$fp' where to
> retrieve the value of `$ra' from.  For that you need debug information.
>
>   So the information you quote seems misleading or missing the context.
>
>   NB hardly any MIPS software uses the frame pointer register and all is
> debuggable regardless; the only actual use for $fp is `alloca', VLAs or
> similar dynamic frame arrangements.
>
>   So what actual problem are you trying to solve, except for the assembly
> error, and what is your use case for `$fp' with MIPS kernel debugging?

Hi Maciej,

Thank you very much for your reply and detailed explanation.

The initial aim of this patch is to fix the build error.
I found this build error used with gcc 4.9.4.
I try it used with gcc 7.3.1 and it has no problem.
We can use new gcc version to avoid this build error.

The other commit message about config and kgdb seems no
related with the above build error, just give more info
to discuss.

As I see it now, this RFC patch is meaningless, so please
ignore it and thank you again.

Thanks,
Tiezhu

>
>    Maciej

