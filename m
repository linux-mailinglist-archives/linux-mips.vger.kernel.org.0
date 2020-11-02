Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A672A2AD2
	for <lists+linux-mips@lfdr.de>; Mon,  2 Nov 2020 13:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgKBMjJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 07:39:09 -0500
Received: from relaygw1-19.mclink.it ([195.78.211.227]:58163 "EHLO
        relaygw1-19.mclink.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728520AbgKBMjJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Nov 2020 07:39:09 -0500
Received: from [172.24.30.45] (HELO cgp-esgout02-rm.mail.irds.it)
  by relaygw1-19.mclink.it (CommuniGate Pro SMTP 6.0.2)
  with ESMTPS id 193462105 for linux-mips@vger.kernel.org; Mon, 02 Nov 2020 13:39:06 +0100
X-Envelope-From: <mc5686@mclink.it>
Received: from [192.168.7.128] (host-87-16-231-187.retail.telecomitalia.it [87.16.231.187])
        (Authenticated sender: mc5686)
        by cgp-esgout02-rm.mail.irds.it (Postfix) with ESMTPA id DF8D241AEE;
        Mon,  2 Nov 2020 13:38:59 +0100 (CET)
Subject: Re: Kexec on MIPS32R2?
To:     Jinyang He <hejinyang@loongson.cn>, linux-mips@vger.kernel.org
References: <21a8d116-ed18-d1f1-9c72-019a619f7ebc@mclink.it>
 <b0332180-2dd8-8eed-8cf1-b34640a8e343@loongson.cn>
 <8d77b80e-99b1-75fe-c9b4-a6d23c1904b5@mclink.it>
 <2d5c63df-3589-774c-b636-169e6f3c6560@loongson.cn>
From:   Mauro Condarelli <mc5686@mclink.it>
Message-ID: <bbeb236a-0dd2-8579-5b4c-cacd0fd3056c@mclink.it>
Date:   Mon, 2 Nov 2020 13:38:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2d5c63df-3589-774c-b636-169e6f3c6560@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Irideos-Libra-ESVA-Information: Please contact Irideos for more information
X-Irideos-Libra-ESVA-ID: DF8D241AEE.A8D4B
X-Irideos-Libra-ESVA: No virus found
X-Irideos-Libra-ESVA-SpamScore: s
X-Irideos-Libra-ESVA-From: mc5686@mclink.it
X-Irideos-Libra-ESVA-Watermark: 1604925540.63062@1x/DNCJ+fQ7HvRTXucvIpA
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 11/2/20 12:32 PM, Jinyang He wrote:
> Hi, Mauro,
>
>
> On 11/02/2020 05:06 PM, Mauro Condarelli wrote:
>>
>> Hi Jinyang,
>>
>> On 11/2/20 3:04 AM, Jinyang He wrote:
>>> Hi,
>>>
>>> On 11/02/2020 08:01 AM, Mauro Condarelli wrote:
>>>> Can someone confirm (or disconfirm, of course) kexec is supposed to work on MIPS32R2?
>>>> My attempts to use it on a MT7628-based board result in a silent hang (watchdog cuts in)
>>>> right after:
>>>>
>>>> [  201.309836] kexec_core: Starting new kernel
>>>> [  201.318239] Will call new kernel at 004f0000
>>>> [  201.322581] Bye ...
>>>>
>>>> Apparently old kernel jumps to `do_kexec()` and just dies; new kernel does not give a peep.
>>>> This can be completely my fault, of course, but I would like a confirm this is supposed to work.
>>>>
>>>> Thanks in advance
>>>> Mauro Condarelli
>>> I'm not familiar with MIPSR2. I guess your platform (MT7628-based board)
>>> cannot use the common function. It may not give a machine specific function, too.
>> My SoC is single core, so I don't have CONFIG_SMP.
>> Apparently (if I read code correctly) `do_kexec()` is actually `relocate_new_kernel`
>> (arch/mips/kernel/relocate_kernel.S).
>> No specific provisions seem to be available for my CPU (I see just a
>> `#ifdef CONFIG_CPU_CAVIUM_OCTEON`, which is not my case).
>> Unfortunately my understanding of MIPS assembly is insufficient to accurately follow
>> this code.
>>
>>> How CPU0 do in do_kexec()? Maybe arch/mips/kernel/reloacate_kernel.S gives us
>>> some useful information. In this file CPU0 goes relocate_new_kernel() and other
>>> CPUs go kexec_smp_wait() if CONFIG_SMP is enabled. Normally CPU0 will enter the
>>> kernel_entry() of the new kernel. In my own understanding of the kexec process,
>>> I find it extremely difficult to pass parameters. Please make sure your platform
>>> passes the parameters necessary for startup. (See arch/mips/kernel/head.S, such as
>>> dtb, fw_args* or other necessary parameters, this is what I said "machine specific")
>> One possible cause  of mishap is my kernel (currently) does *not* have a .dtb appended
>> and I see no explicit option to reuse current DT.
>> In my mips `kexec` there's a `--dtb=<file>` option but passing the same .dtb I use with
>> u-Boot does not seem to work:
>>
>> # kexec -l /boot/vmlinuz --command-line="earlyprintk rootwait console=ttyS2,115200 mtdparts=spi0.0:312k(u-boot),4k(env),4k(factor
>> y),2368k(kernel),-(filesystem) root=/dev/mmcblk0p7 tryboot=B" --dtb=/boot/u-boot.dtb
>> # kexec -e
>> [ 2030.833119] mtk_soc_eth 10100000.ethernet eth0: Link is Down
>> [ 2030.848999] wlan0: deauthenticating from a0:04:60:9f:2f:f8 by local choice (Reason: 3=DEAUTH_LEAVING)
>> Received Deauthentication event, reason: 3, from_ap: false
>> Received error during CMD_TRIGGER_SCAN: Network is down (127)
>> [ 2030.894637] kexec_core: Starting new kernel
>> [ 2030.900005] Will call new kernel at 004f0000
>> [ 2030.904326] Bye ...
>>
>> <HANG!>
>> <watchdog reset>
>>
>> Any hint welcome as I'm completely out of my depth here.
>> TiA!
>> Mauro
>
> The DTB problem is not a serious problem at the moment. Make sure the parameters
> have been passed before the new kernel running. What "kexec -l" do in kernel code?
> We can do "kexec -l ... -d" to get some debug info. Normally there is a segment

# kexec -l /boot/vmlinuz --command-line="earlyprintk rootwait console=ttyS2,115200 mtdparts=spi0.0:312k(u-boot),4k(env),4k(factory),2368k(kernel),-(filesystem) root=/dev/mmcblk0p7 tryboot=B" --dtb=/boot/u-boot.dtb -d
Try gzip decompression.
Try LZMA decompression.
lzma_decompress_file: read on /boot/vmlinuz of 65536 bytes failed
kernel: 0x77a83008 kernel_size: 0x252f9c
kexec_load: entry = 0x4f0000 flags = 0x80000
nr_segments = 3
segment[0].buf   = 0x42b490
segment[0].bufsz = 0x200
segment[0].mem   = (nil)
segment[0].memsz = 0x1000
segment[1].buf   = 0x77a93008
segment[1].bufsz = 0x242600
segment[1].mem   = 0x4f0000
segment[1].memsz = 0x745000
segment[2].buf   = 0xef1d70
segment[2].bufsz = 0x1b8a
segment[2].mem   = 0xc35000
segment[2].memsz = 0x2000

> about COMMAND_LINE(cmdline). We should do something with the cmdline in kernel code.
> See arch/mips/kernel/machine_kexec.c: machine_kexec_prepare(). If CONFIG_UHI_BOOT was
> enabled, we would pass 2 args. "-2" and fdt? (I'm not sure here, the importance is
> that it provide a way to pass fdt for these platform which pass cmdline by fdt, I guess).
> Just a simple chat with CONFIG_UHI_BOOT, I really case that cmdline cannot be passed
> if your platform disabled CONFIG_UHI_BOOT and _machine_kexec_prepare is NULL.
> Because no parameters would be passed, include cmdline.
Apparently  is not selected (actually it doesn't appear at all in .config) because it depends on CONFIG_MIPS_GENERIC and I have in "Machine selection":
# CONFIG_MIPS_GENERIC is not set
CONFIG_RALINK=y
CONFIG_CLKEVT_RT3352=y
CONFIG_IRQ_INTC=y
CONFIG_SOC_MT7620=y
CONFIG_DTB_VOCORE2=y

Should I try adding `select UHI_BOOT` to my specific device (SOC_MT7620)?
I have only a foggy idea about what's needed for kexec :(
>
> Jinyang
>

