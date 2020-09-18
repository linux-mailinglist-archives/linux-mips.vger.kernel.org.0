Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC1426F5CE
	for <lists+linux-mips@lfdr.de>; Fri, 18 Sep 2020 08:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgIRGQg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Sep 2020 02:16:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54438 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726022AbgIRGQg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Sep 2020 02:16:36 -0400
Received: from [10.130.0.60] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxGMWxUGRfRSoWAA--.6824S3;
        Fri, 18 Sep 2020 14:16:18 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson64: Add kexec/kdump support
To:     Zhou Yanjie <zhouyu@wanyeetech.com>,
        Huacai Chen <chenhc@lemote.com>
References: <1600175263-7872-1-git-send-email-hejinyang@loongson.cn>
 <376B4B91-0736-43FA-87EA-43E12FF24EF1@flygoat.com>
 <7b78c4d4-7ee3-cf57-71d1-95611713de2b@loongson.cn>
 <CAAhV-H5t3KWL1O+JKVp+T2qqGXuW7OiasjnnCLmV0+GE0Ns9xQ@mail.gmail.com>
 <647822a9-bc3b-5da1-95e7-c048a5a3b8fa@loongson.cn>
 <bd73b4da-94e2-c809-2422-4071792cd9d1@wanyeetech.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Youling Tang <tangyouling@loongson.cn>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, kexec@lists.infradead.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <270c1632-c9c4-186e-0ae5-a6f3d4c417d6@loongson.cn>
Date:   Fri, 18 Sep 2020 14:16:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <bd73b4da-94e2-c809-2422-4071792cd9d1@wanyeetech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxGMWxUGRfRSoWAA--.6824S3
X-Coremail-Antispam: 1UD129KBjvAXoWfJw4ktF47KFyDuw1UGrW7Arb_yoW8JryDZo
        Z7Jr17Xa18Kr18Ar1Du34DtFyqvayDWr15Jry8Zrs8Xr47tw1UAr15GryUJay5KFyUXw47
        Aa4UJryUCF47Xwn5n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYf7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
        JVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUjY0PDUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/17/2020 09:52 PM, Zhou Yanjie wrote:
> Hello,
>
> 在 2020/9/17 下午8:41, Jinyang He 写道:
>> Hi, Huacai,
>>
>>
>> On 09/16/2020 01:39 PM, Huacai Chen wrote:
>>> Hi, Jinyang,
>>>
>>> On Tue, Sep 15, 2020 at 10:17 PM Jinyang He <hejinyang@loongson.cn> 
>>> wrote:
>>>>
>>>>
>>>> On 09/16/2020 09:33 AM, Jiaxun Yang wrote:
>>>>> 于 2020年9月15日 GMT+08:00 下午9:07:43, Jinyang He 
>>>>> <hejinyang@loongson.cn> 写到:
>>>>>> Add loongson_kexec_prepare(), loongson_kexec_shutdown() and
>>>>>> loongson_kexec_crashdown() for passing the parameters of kexec_args.
>>>>>>
>>>>>> To start loongson64, CPU0 needs 3 parameters:
>>>>>> fw_arg0: the number of cmd.
>>>>>> fw_arg1: cmd structure which seems strange, the cmd array[index]'s
>>>>>>           value is cmd string's address, index >= 1.
>>>>>> fw_arg2: environment.
>>>>>>
>>>>>> Secondary CPUs do not need parameter at once. They query their
>>>>>> mailbox to get PC, SP and GP in a loop before CPU0 brings them up
>>>>>> and passes these parameters via mailbox.
>>>>>>
>>>>>> loongson_kexec_prepare(): Alloc new memory to save cmd for kexec.
>>>>>> Combine the kexec append option string as cmd structure, and the cmd
>>>>>> struct will be parsed in fw_init_cmdline() of 
>>>>>> arch/mips/fw/lib/cmdline.c.
>>>>>> image->control_code_page need pointing to a safe memory page. In 
>>>>>> order to
>>>>>> maintain compatibility for the old firmware the low 2MB is reserverd
>>>>>> and safe for Loongson. So let it points here.
>>>>>>
>>>>>> loongson_kexec_shutdown(): Wake up all present CPUs and let them go
>>>>>> to reboot_code_buffer. Pass the kexec parameters to kexec_args.
>>>>>>
>>>>>> loongson_crash_shutdown(): Pass the kdump parameters to kexec_args.
>>>>>>
>>>>>> The assembly part provide a way like BIOS doing to keep secondary
>>>>>> CPUs in a querying loop.
>>>>>>
>>>>>> This patch referenced [1][2][3].
>>>>>>
>>>>>> [1] arch/mips/cavium-octeon/setup.c
>>>>>> [2] https://patchwork.kernel.org/patch/10799217/
>>>>>> [3] 
>>>>>> https://gitee.com/loongsonlab/qemu/blob/master/hw/mips/loongson3a_rom.h 
>>>>>>
>>>>>>
>>>>>> Co-developed-by: Youling Tang <tangyouling@loongson.cn>
>>>>>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>>>>>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>>>>>> ---
>>>>>> arch/mips/kernel/relocate_kernel.S | 19 ++++++++
>>>>>> arch/mips/loongson64/reset.c       | 88 
>>>>>> ++++++++++++++++++++++++++++++++++++++
>>>>>> 2 files changed, 107 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/mips/kernel/relocate_kernel.S 
>>>>>> b/arch/mips/kernel/relocate_kernel.S
>>>>>> index ac87089..061cbfb 100644
>>>>>> --- a/arch/mips/kernel/relocate_kernel.S
>>>>>> +++ b/arch/mips/kernel/relocate_kernel.S
>>>>>> @@ -133,6 +133,25 @@ LEAF(kexec_smp_wait)
>>>>>> #else
>>>>>>       sync
>>>>>> #endif
>>>>>> +
>>>>>> +#ifdef CONFIG_CPU_LOONGSON64
>>>>>> +#define MAILBOX_BASE 0x900000003ff01000
>>>>> Please avoid hardcoded SMP information. You're breaking Loongson 
>>>>> 3B support.
>>>>>
>>>> Ok, I see. Since my machine is Loongson 3A. I'll send v2
>>>> after I test it in 3B.
>>> 1, My original version can work on both Loongson-3A and Loongson-3B,
>>> why you modify my patch and hadn't discuss with me?
>>>
>>> 2, With this single patch both kexec and kdump cannot work reliably,
>>> because kexec need this patch:
>>>     https://patchwork.kernel.org/patch/11695929/
>>>
>>>     and kdump need my first patch in my original version:
>>>     https://patchwork.kernel.org/patch/10799215/
>>>
>>>     You may argue that you have tested. Yes, I believe that, I'm not
>>> saying that you haven't test, and I'm not saying that your patch
>>> cannot work, I'm just saying that your patch is not robust.
>>>
>>> 3, I'm the original author and paying attention to kexec/kdump
>>> continuosly, I will send a new version once the above two patches be
>>> accepted. But you re-send my patch without any communication with me,
>>> why you so impatient?
>>>
>>> Huacai
>>>
>>
>> 1, Your original version:
>>    https://patchwork.kernel.org/patch/10799217/
>>
>> This patch can work on Loongson-3A, I tested it.
>>
>> But it works wrong after the follow behaviors,
>>    kexec -l vmlinux --append=cmdline_kexec
>>    kexec -p vmlinux --append=cmdline_kdump
>>    kexec -e
>>
>
> What 's wrong with you Loongson guys? Why do you always send patches 
> with the same functions as the original author withou any 
> communication with the original author? Especially the original author 
> of the patch is the maintainer of Loongson64 architecture.

Hi,

Just take it easy, try to keep calm and do not panic.

You do not understand the story, the background, what happened before,
and what happens next, so please let me express my opinion.

When I use the mainline kernel on the Loongson platform, I find kexec
can not work well and I feel depressed, so I analyse and debug the
related code, the initial aim of all my effort is to make it work well.

In order to create the positive environment of community participation,
I have two questions to discuss:
(1) If there exists a similar patch which is submitted more than one
year ago but has not been merged into the mainline tree, could the
newcomers do the similar work to support the same feature? I think the
answer is yes, right?
(2) When the newcomers submit the new patch to community, what should
be done to avoid an unhappy time? I think this is the nature of the
problem, add "Originally-by:" tag? What do you think of it?

I think we should consider what is the proper attitude to welcome and
encourage newcomers, however terrible or wrong things they did,
everyone needs to have a process of growth, right?

Positive and well-meant suggestions would be much more helpful and
useful to the community in the long run.


>
> In the past year, Loongson employees have been very active. This is a 
> happy thing, but at the same time, it is confusing that, in addition 
> to always sending patches that others have already sent, many patches 
> send by Loongson employees often with only a few lines (less than 10 
> lines). I don't think this is a normal phenomenon, is this caused by 
> any other factors? Such as KPIs? If the patches are submitted for this 
> purpose, it is not advisable, this behavior will harm the entire 
> Loongson.

Each patch we submitted is to make the kernel code better and better,
even if it is a small cleanup patch.

>
>
>> It works but cmdline_kdump merged cmdline_kexec.
>>
>> And this patch memcpy from fw_arg2 to kexec_envp and later memcpy from
>> kexec_envp to fw_arg2 when fw_arg2 was not changed, it's redundant.
>>
>> However, I have not Loongson-3B now, and did not test it. For this 
>> patch,
>> does it work well on Loongson-3B3000/Loongson-3B4000?
>>
>> 2, I have known that problem before your patch:
>>    https://patchwork.kernel.org/patch/11695929/
>>
>> I also did efforts although I had't committed my patch. It's due to the
>> hardware issues, and I removed pcie_port_device_remove(). Kexec works
>> normally on GUI. But it works terriblely on CLI. After this discuss:
>>    https://lore.kernel.org/patchwork/patch/1304917/
>>
>> What Lukas said helped me. I removed
>>    drivers/pci/pci-driver.c: pci_device_shutdown(): pci_clear_master...
>> Kexec works well on CLI also.
>>
>> For another patch:
>>    https://patchwork.kernel.org/patch/10799215/
>>
>> I have not 2way or 4way machine, and I did not test it.
>>
>> 3, I try to fix Loongson64 kexec function since I joined the community.
>> I fell sorry to not do enough research on Loongson64 kexec. My first 
>> patch:
>>    https://patchwork.kernel.org/patch/11684849/
>>
>> It fixed problem about "Crash kernel" which can be traced back to 
>> linux-5.4.
>> At that time, I thought there is no developer work on Kexec. Thus, I 
>> did a
>> lot on Kexec. Are you really continuosly paying attention to 
>> kexec/kdump?
>> With the exploring and developing deep, I found your patch several 
>> days ago
>> after I did a draft patch witch referenced:
>>    arch/mips/cavium-octeon/setup.c
>> https://gitee.com/loongsonlab/qemu/blob/master/hw/mips/loongson3a_rom.h
>>
>> There is no doubt that your patch gives me confidence and suggestion 
>> while
>> it gives me worry. As a newcomer, I do not know if should communicate 
>> with
>> you since your patch was committed one year ago. And now it may be a 
>> good
>> chance to do some communication.
>>
>> Thanks,
>>
>> - Jinyang.
>>
>>>>>> +    mfc0  t1, CP0_EBASE
>>>>>> +    andi  t1, MIPS_EBASE_CPUNUM
>>>>>> +    dli   t0, MAILBOX_BASE
>>>>>> +    andi  t3, t1, 0x3
>>>>>> +    sll   t3, 8
>>>>>> +    or    t0, t0, t3        /* insert core id */
>>>>>> +    andi  t2, t1, 0xc
>>>>>> +    dsll  t2, 42
>>>>>> +    or    t0, t0, t2        /* insert node id */
>>>>>> +1:  ld    s1, 0x20(t0)      /* get PC via mailbox0 */
>>>>>> +    beqz  s1, 1b
>>>>>> +    ld    sp, 0x28(t0)      /* get SP via mailbox1 */
>>>>>> +    ld    gp, 0x30(t0)      /* get GP via mailbox2 */
>>>>>> +    ld    a1, 0x38(t0)
>>>>>> +    jr    s1
>>>>>> +#endif
>>>>>>       j               s1
>>>>>>       END(kexec_smp_wait)
>>>>>> #endif
>>>>>> diff --git a/arch/mips/loongson64/reset.c 
>>>>>> b/arch/mips/loongson64/reset.c
>>>>>> index 3bb8a1e..322c326 100644
>>>>>> --- a/arch/mips/loongson64/reset.c
>>>>>> +++ b/arch/mips/loongson64/reset.c
>>>>>> @@ -47,12 +47,100 @@ static void loongson_halt(void)
>>>>>>       }
>>>>>> }
>>>>>>
>>>>>> +#ifdef CONFIG_KEXEC
>>>>>> +#include <linux/cpu.h>
>>>>>> +#include <linux/kexec.h>
>>>>>> +
>>>>>> +#include <asm/bootinfo.h>
>>>>>> +
>>>>>> +#define CONTROL_CODE_PAGE    0xFFFFFFFF80000000UL
>>>>>> +static int kexec_argc;
>>>>>> +static int kdump_argc;
>>>>>> +static void *kexec_argv;
>>>>>> +static void *kdump_argv;
>>>>>> +
>>>>>> +static int loongson_kexec_prepare(struct kimage *image)
>>>>>> +{
>>>>>> +    int i, offt, argc = 0;
>>>>>> +    int *argv;
>>>>>> +    char *str, *ptr, *bootloader = "kexec";
>>>>>> +
>>>>>> +    argv = kmalloc(COMMAND_LINE_SIZE, GFP_KERNEL);
>>>>>> +    if (!argv)
>>>>>> +            return -ENOMEM;
>>>>>> +
>>>>>> +    for (i = 0; i < image->nr_segments; i++) {
>>>>>> +            if (!strncmp(bootloader, (char *)image->segment[i].buf,
>>>>>> +                            strlen(bootloader))) {
>>>>>> +                    argv[argc++] = fw_arg1 + COMMAND_LINE_SIZE/2;
>>>>>> +                    str = (char *)argv + COMMAND_LINE_SIZE/2;
>>>>>> +                    memcpy(str, image->segment[i].buf, 
>>>>>> COMMAND_LINE_SIZE/2);
>>>>>> +                    ptr = strchr(str, ' ');
>>>>>> +                    while (ptr) {
>>>>>> +                            *ptr = '\0';
>>>>>> +                            if (ptr[1] != ' ') {
>>>>>> +                                    offt = (int)(ptr - str + 1);
>>>>>> +                                    argv[argc++] = fw_arg1 + 
>>>>>> COMMAND_LINE_SIZE/2 + offt;
>>>>>> +                            }
>>>>>> +                            ptr = strchr(ptr + 1, ' ');
>>>>>> +                    }
>>>>>> +                    break;
>>>>>> +            }
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Kexec/kdump needs a safe page to save reboot_code_buffer. */
>>>>>> +    image->control_code_page = virt_to_page((void 
>>>>>> *)CONTROL_CODE_PAGE);
>>>>>> +
>>>>>> +    if (image->type == KEXEC_TYPE_CRASH) {
>>>>>> +            kfree(kdump_argv);
>>>>>> +            kdump_argc = argc;
>>>>>> +            kdump_argv = argv;
>>>>>> +    } else {
>>>>>> +            kfree(kexec_argv);
>>>>>> +            kexec_argc = argc;
>>>>>> +            kexec_argv = argv;
>>>>>> +    }
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static void loongson_kexec_shutdown(void)
>>>>>> +{
>>>>>> +#ifdef CONFIG_SMP
>>>>>> +    bringup_nonboot_cpus(loongson_sysconf.nr_cpus);
>>>>>> +#endif
>>>>>> +    fw_arg0 = kexec_argc;
>>>>>> +    memcpy((void *)fw_arg1, kexec_argv, COMMAND_LINE_SIZE);
>>>>>> +
>>>>>> +    kexec_args[0] = fw_arg0;
>>>>>> +    kexec_args[1] = fw_arg1;
>>>>>> +    kexec_args[2] = fw_arg2;
>>>>>> +}
>>>>>> +
>>>>>> +static void loongson_crash_shutdown(struct pt_regs *regs)
>>>>>> +{
>>>>>> +    default_machine_crash_shutdown(regs);
>>>>>> +    fw_arg0 = kdump_argc;
>>>>>> +    memcpy((void *)fw_arg1, kdump_argv, COMMAND_LINE_SIZE);
>>>>>> +
>>>>>> +    kexec_args[0] = fw_arg0;
>>>>>> +    kexec_args[1] = fw_arg1;
>>>>>> +    kexec_args[2] = fw_arg2;
>>>>>> +}
>>>>>> +#endif
>>>>>> +
>>>>>> static int __init mips_reboot_setup(void)
>>>>>> {
>>>>>>       _machine_restart = loongson_restart;
>>>>>>       _machine_halt = loongson_halt;
>>>>>>       pm_power_off = loongson_poweroff;
>>>>>>
>>>>>> +#ifdef CONFIG_KEXEC
>>>>>> +    _machine_kexec_prepare = loongson_kexec_prepare;
>>>>>> +    _machine_kexec_shutdown = loongson_kexec_shutdown;
>>>>>> +    _machine_crash_shutdown = loongson_crash_shutdown;
>>>>>> +#endif
>>>>>> +
>>>>>>       return 0;
>>>>>> }
>>>>>>

