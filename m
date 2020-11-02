Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91FB2A2696
	for <lists+linux-mips@lfdr.de>; Mon,  2 Nov 2020 10:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgKBJGu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 04:06:50 -0500
Received: from relaygw2-23.mclink.it ([195.78.211.237]:48622 "EHLO
        relaygw2-23.mclink.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727806AbgKBJGt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Nov 2020 04:06:49 -0500
Received: from cgp-esgout01-rm.mail.irds.it ([172.24.30.44] verified)
  by relaygw2-23.mclink.it (CommuniGate Pro SMTP 6.0.4)
  with ESMTPS id 182290151 for linux-mips@vger.kernel.org; Mon, 02 Nov 2020 10:06:46 +0100
X-Envelope-From: <mc5686@mclink.it>
Received: from [192.168.7.128] (host-87-16-231-187.retail.telecomitalia.it [87.16.231.187])
        (Authenticated sender: mc5686)
        by cgp-esgout01-rm.mail.irds.it (Postfix) with ESMTPA id 5FDCC41B0E;
        Mon,  2 Nov 2020 10:06:43 +0100 (CET)
Subject: Re: Kexec on MIPS32R2?
To:     Jinyang He <hejinyang@loongson.cn>, linux-mips@vger.kernel.org
References: <21a8d116-ed18-d1f1-9c72-019a619f7ebc@mclink.it>
 <b0332180-2dd8-8eed-8cf1-b34640a8e343@loongson.cn>
From:   Mauro Condarelli <mc5686@mclink.it>
Message-ID: <8d77b80e-99b1-75fe-c9b4-a6d23c1904b5@mclink.it>
Date:   Mon, 2 Nov 2020 10:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b0332180-2dd8-8eed-8cf1-b34640a8e343@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Irideos-Libra-ESVA-Information: Please contact Irideos for more information
X-Irideos-Libra-ESVA-ID: 5FDCC41B0E.A7F8E
X-Irideos-Libra-ESVA: No virus found
X-Irideos-Libra-ESVA-From: mc5686@mclink.it
X-Irideos-Libra-ESVA-Watermark: 1604912803.6326@GyOH1j2DM3yfchaPFj5f8g
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Hi Jinyang,

On 11/2/20 3:04 AM, Jinyang He wrote:
> Hi,
>
> On 11/02/2020 08:01 AM, Mauro Condarelli wrote:
>> Can someone confirm (or disconfirm, of course) kexec is supposed to work on MIPS32R2?
>> My attempts to use it on a MT7628-based board result in a silent hang (watchdog cuts in)
>> right after:
>>
>> [  201.309836] kexec_core: Starting new kernel
>> [  201.318239] Will call new kernel at 004f0000
>> [  201.322581] Bye ...
>>
>> Apparently old kernel jumps to `do_kexec()` and just dies; new kernel does not give a peep.
>> This can be completely my fault, of course, but I would like a confirm this is supposed to work.
>>
>> Thanks in advance
>> Mauro Condarelli
> I'm not familiar with MIPSR2. I guess your platform (MT7628-based board)
> cannot use the common function. It may not give a machine specific function, too.
My SoC is single core, so I don't have CONFIG_SMP.
Apparently (if I read code correctly) `do_kexec()` is actually `relocate_new_kernel`
(arch/mips/kernel/relocate_kernel.S).
No specific provisions seem to be available for my CPU (I see just a
`#ifdef CONFIG_CPU_CAVIUM_OCTEON`, which is not my case).
Unfortunately my understanding of MIPS assembly is insufficient to accurately follow
this code.

> How CPU0 do in do_kexec()? Maybe arch/mips/kernel/reloacate_kernel.S gives us
> some useful information. In this file CPU0 goes relocate_new_kernel() and other
> CPUs go kexec_smp_wait() if CONFIG_SMP is enabled. Normally CPU0 will enter the
> kernel_entry() of the new kernel. In my own understanding of the kexec process,
> I find it extremely difficult to pass parameters. Please make sure your platform
> passes the parameters necessary for startup. (See arch/mips/kernel/head.S, such as
> dtb, fw_args* or other necessary parameters, this is what I said "machine specific")
One possible cause  of mishap is my kernel (currently) does *not* have a .dtb appended
and I see no explicit option to reuse current DT.
In my mips `kexec` there's a `--dtb=<file>` option but passing the same .dtb I use with
u-Boot does not seem to work:

# kexec -l /boot/vmlinuz --command-line="earlyprintk rootwait console=ttyS2,115200 mtdparts=spi0.0:312k(u-boot),4k(env),4k(factor
y),2368k(kernel),-(filesystem) root=/dev/mmcblk0p7 tryboot=B" --dtb=/boot/u-boot.dtb
# kexec -e
[ 2030.833119] mtk_soc_eth 10100000.ethernet eth0: Link is Down
[ 2030.848999] wlan0: deauthenticating from a0:04:60:9f:2f:f8 by local choice (Reason: 3=DEAUTH_LEAVING)
Received Deauthentication event, reason: 3, from_ap: false
Received error during CMD_TRIGGER_SCAN: Network is down (127)
[ 2030.894637] kexec_core: Starting new kernel
[ 2030.900005] Will call new kernel at 004f0000
[ 2030.904326] Bye ...

<HANG!>
<watchdog reset>

Any hint welcome as I'm completely out of my depth here.
TiA!
Mauro
