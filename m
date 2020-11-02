Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9FA2A2995
	for <lists+linux-mips@lfdr.de>; Mon,  2 Nov 2020 12:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbgKBLdg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 06:33:36 -0500
Received: from mail.loongson.cn ([114.242.206.163]:48186 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728776AbgKBLda (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Nov 2020 06:33:30 -0500
Received: from [10.130.0.60] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxmtFf7p9fb_4DAA--.12429S3;
        Mon, 02 Nov 2020 19:32:47 +0800 (CST)
Subject: Re: Kexec on MIPS32R2?
To:     Mauro Condarelli <mc5686@mclink.it>, linux-mips@vger.kernel.org
References: <21a8d116-ed18-d1f1-9c72-019a619f7ebc@mclink.it>
 <b0332180-2dd8-8eed-8cf1-b34640a8e343@loongson.cn>
 <8d77b80e-99b1-75fe-c9b4-a6d23c1904b5@mclink.it>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <2d5c63df-3589-774c-b636-169e6f3c6560@loongson.cn>
Date:   Mon, 2 Nov 2020 19:32:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8d77b80e-99b1-75fe-c9b4-a6d23c1904b5@mclink.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxmtFf7p9fb_4DAA--.12429S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCF45Kr4xuFWxAFyxXw4fKrg_yoWrGFy8p3
        W3GF4Utw4kXFy0y3y8Zw1kurWFv3yYqFy3X3sYgr95ZFs0qrnrtF4Igr45ua4qqr1Fg3Wj
        qFWSvFySvw45A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE14v_Gw4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y
        6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x07bzlk3UUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Mauro,


On 11/02/2020 05:06 PM, Mauro Condarelli wrote:
>
> Hi Jinyang,
>
> On 11/2/20 3:04 AM, Jinyang He wrote:
>> Hi,
>>
>> On 11/02/2020 08:01 AM, Mauro Condarelli wrote:
>>> Can someone confirm (or disconfirm, of course) kexec is supposed to work on MIPS32R2?
>>> My attempts to use it on a MT7628-based board result in a silent hang (watchdog cuts in)
>>> right after:
>>>
>>> [  201.309836] kexec_core: Starting new kernel
>>> [  201.318239] Will call new kernel at 004f0000
>>> [  201.322581] Bye ...
>>>
>>> Apparently old kernel jumps to `do_kexec()` and just dies; new kernel does not give a peep.
>>> This can be completely my fault, of course, but I would like a confirm this is supposed to work.
>>>
>>> Thanks in advance
>>> Mauro Condarelli
>> I'm not familiar with MIPSR2. I guess your platform (MT7628-based board)
>> cannot use the common function. It may not give a machine specific function, too.
> My SoC is single core, so I don't have CONFIG_SMP.
> Apparently (if I read code correctly) `do_kexec()` is actually `relocate_new_kernel`
> (arch/mips/kernel/relocate_kernel.S).
> No specific provisions seem to be available for my CPU (I see just a
> `#ifdef CONFIG_CPU_CAVIUM_OCTEON`, which is not my case).
> Unfortunately my understanding of MIPS assembly is insufficient to accurately follow
> this code.
>
>> How CPU0 do in do_kexec()? Maybe arch/mips/kernel/reloacate_kernel.S gives us
>> some useful information. In this file CPU0 goes relocate_new_kernel() and other
>> CPUs go kexec_smp_wait() if CONFIG_SMP is enabled. Normally CPU0 will enter the
>> kernel_entry() of the new kernel. In my own understanding of the kexec process,
>> I find it extremely difficult to pass parameters. Please make sure your platform
>> passes the parameters necessary for startup. (See arch/mips/kernel/head.S, such as
>> dtb, fw_args* or other necessary parameters, this is what I said "machine specific")
> One possible cause  of mishap is my kernel (currently) does *not* have a .dtb appended
> and I see no explicit option to reuse current DT.
> In my mips `kexec` there's a `--dtb=<file>` option but passing the same .dtb I use with
> u-Boot does not seem to work:
>
> # kexec -l /boot/vmlinuz --command-line="earlyprintk rootwait console=ttyS2,115200 mtdparts=spi0.0:312k(u-boot),4k(env),4k(factor
> y),2368k(kernel),-(filesystem) root=/dev/mmcblk0p7 tryboot=B" --dtb=/boot/u-boot.dtb
> # kexec -e
> [ 2030.833119] mtk_soc_eth 10100000.ethernet eth0: Link is Down
> [ 2030.848999] wlan0: deauthenticating from a0:04:60:9f:2f:f8 by local choice (Reason: 3=DEAUTH_LEAVING)
> Received Deauthentication event, reason: 3, from_ap: false
> Received error during CMD_TRIGGER_SCAN: Network is down (127)
> [ 2030.894637] kexec_core: Starting new kernel
> [ 2030.900005] Will call new kernel at 004f0000
> [ 2030.904326] Bye ...
>
> <HANG!>
> <watchdog reset>
>
> Any hint welcome as I'm completely out of my depth here.
> TiA!
> Mauro

The DTB problem is not a serious problem at the moment. Make sure the 
parameters
have been passed before the new kernel running. What "kexec -l" do in 
kernel code?
We can do "kexec -l ... -d" to get some debug info. Normally there is a 
segment
about COMMAND_LINE(cmdline). We should do something with the cmdline in 
kernel code.
See arch/mips/kernel/machine_kexec.c: machine_kexec_prepare(). If 
CONFIG_UHI_BOOT was
enabled, we would pass 2 args. "-2" and fdt? (I'm not sure here, the 
importance is
that it provide a way to pass fdt for these platform which pass cmdline 
by fdt, I guess).
Just a simple chat with CONFIG_UHI_BOOT, I really case that cmdline 
cannot be passed
if your platform disabled CONFIG_UHI_BOOT and _machine_kexec_prepare is 
NULL.
Because no parameters would be passed, include cmdline.

Jinyang

