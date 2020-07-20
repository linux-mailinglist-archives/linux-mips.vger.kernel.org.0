Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEF9225DFF
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 13:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgGTL7h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jul 2020 07:59:37 -0400
Received: from relay4.mymailcheap.com ([137.74.80.156]:40714 "EHLO
        relay4.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbgGTL7g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 07:59:36 -0400
X-Greylist: delayed 25244 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Jul 2020 07:59:33 EDT
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id D5C373F1D0;
        Mon, 20 Jul 2020 13:59:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id A53262A90A;
        Mon, 20 Jul 2020 13:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1595246371;
        bh=iiMb1dNkuRH47jIYfqu9aJEBw5MXaI6Uz/9YyVB8MSk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MpIbPEgApra8C07OrTFlggwMem48YThKzrSuOZDS/4SiVVYgy9Q84UTmAcMgMvLnl
         7UmKJ/3WIKltOc+g598rD7y4cKFdvSxCN2HC+h/0EgV7qt6o2NBu6vOlzNmlepqxla
         lRhAnw5obwfAxHUiKGQns8KGWVeBiuHlk3XeOd5Q=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0lP2py1UGOuj; Mon, 20 Jul 2020 13:59:30 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Mon, 20 Jul 2020 13:59:30 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id CFB664084B;
        Mon, 20 Jul 2020 11:59:27 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="godCSkoi";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1733-105.members.linode.com [172.104.123.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 960FD40856;
        Mon, 20 Jul 2020 11:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1595246343;
        bh=iiMb1dNkuRH47jIYfqu9aJEBw5MXaI6Uz/9YyVB8MSk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=godCSkoiPfXWRLTwZI+TzW89ElZs/phlYn8L1jMzyQ9FSxGms2xQfmxyuP/HnnDBA
         Ob1j4adaEc5Mds2mOQ6DcRT9/u17b1XJos42J+3Per0stWQ69sgHXVIZeHKJQaSbY5
         MzPJNNktZLXJ8aFOADYrVv5FSkY+l5o5k4EjmdeI=
Subject: Re: [PATCH 2/5] MIPS: Loongson64: Process ISA Node in DeviceTree
To:     Huacai Chen <chenhc@lemote.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com>
 <20200720074249.596364-3-jiaxun.yang@flygoat.com>
 <CAAhV-H52=2-Hij0AFBGuZWhQ4kWqEwLsvzXPR-ZndQKtkjnMbw@mail.gmail.com>
 <618053d0-57ea-8675-99ee-2f0b93faa334@flygoat.com>
 <CAAhV-H7n3Uy-X6ePgTsC6VfV0HbV22SM-BV9Q0i6BS=oxw__yA@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <bc7f1901-5d1a-8358-f597-fb5d60349d11@flygoat.com>
Date:   Mon, 20 Jul 2020 19:58:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7n3Uy-X6ePgTsC6VfV0HbV22SM-BV9Q0i6BS=oxw__yA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: CFB664084B
X-Spamd-Result: default: False [4.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[172.104.123.105:received];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         ARC_NA(0.00)[];
         R_SPF_SOFTFAIL(0.00)[~all];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[10];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,alpha.franken.de,gmail.com,google.com];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/7/20 下午7:44, Huacai Chen 写道:
> Hi, Jiaxun,
>
> On Mon, Jul 20, 2020 at 6:20 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>>
>>
>> 在 2020/7/20 下午6:01, Huacai Chen 写道:
>>> Hi, Jiaxun,
>>>
>>> On Mon, Jul 20, 2020 at 3:44 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>>>> Previously, we're hardcoding resserved ISA I/O Space in code, now
>>>> we're processing reverved I/O via DeviceTree directly. Using the ranges
>>>> property to determine the size and address of reserved I/O space.
>>> Maybe it is better to reserve a default legacy io range if there is no
>>> "isa" node in the .dts file?
>> As currently all dts is built-in in Kernel, I don't think it's necessary.
>>
>> Also the only ISA driver remaining that can't be probed by dts is i8042.
>> We can convert it to DeviceTree based, and then we'll always be safe.
>>
> If you don't reserve a default legacy io range, then I should define
> an "isa" node for KVM guests even if the VM doesn't have i8042 and
> i8259. Because some pci devices still have legacy i/o ports, such as
> qxl. I have tested your patches and found that KVM guests with qxl
> cannot work without an "isa" node.

Oops, I forgot stdvga. piix4_smbus may face the same situation too.

But I'd still think adding a isa node for QEMU virt target can be better.
My universal target is to kill boot_param and reach full-DT boot, thus I 
don't
want to introduce such regression.


Thanks
- Jiaxun

>
> Huacai
>> Thanks.
>>
>> - Jiaxun
>>
>>> Huacai
>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>> ---
>>>>    arch/mips/loongson64/init.c | 85 ++++++++++++++++++++++++++-----------
>>>>    1 file changed, 60 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
>>>> index 59ddadace83f..028d7b324ec2 100644
>>>> --- a/arch/mips/loongson64/init.c
>>>> +++ b/arch/mips/loongson64/init.c
>>>> @@ -7,6 +7,8 @@
>>>>    #include <linux/irqchip.h>
>>>>    #include <linux/logic_pio.h>
>>>>    #include <linux/memblock.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/of_address.h>
>>>>    #include <asm/bootinfo.h>
>>>>    #include <asm/traps.h>
>>>>    #include <asm/smp-ops.h>
>>>> @@ -63,41 +65,74 @@ void __init prom_free_prom_memory(void)
>>>>    {
>>>>    }
>>>>
>>>> -static __init void reserve_pio_range(void)
>>>> +static int __init add_legacy_isa_io(struct fwnode_handle *fwnode, phys_addr_t addr,
>>>> +                            resource_size_t    size)
>>>>    {
>>>> +       int ret = 0;
>>>>           struct logic_pio_hwaddr *range;
>>>> +       unsigned long vaddr;
>>>>
>>>>           range = kzalloc(sizeof(*range), GFP_ATOMIC);
>>>>           if (!range)
>>>> -               return;
>>>> +               return -ENOMEM;
>>>>
>>>> -       range->fwnode = &of_root->fwnode;
>>>> -       range->size = MMIO_LOWER_RESERVED;
>>>> -       range->hw_start = LOONGSON_PCIIO_BASE;
>>>> +       range->fwnode = fwnode;
>>>> +       range->size = size;
>>>> +       range->hw_start = addr;
>>>>           range->flags = LOGIC_PIO_CPU_MMIO;
>>>>
>>>> -       if (logic_pio_register_range(range)) {
>>>> -               pr_err("Failed to reserve PIO range for legacy ISA\n");
>>>> -               goto free_range;
>>>> +       ret = logic_pio_register_range(range);
>>>> +       if (ret) {
>>>> +               kfree(range);
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       /* Legacy ISA must placed at the start of PCI_IOBASE */
>>>> +       if (range->io_start != 0) {
>>>> +               logic_pio_unregister_range(range);
>>>> +               kfree(range);
>>>> +               return -EINVAL;
>>>>           }
>>>>
>>>> -       if (WARN(range->io_start != 0,
>>>> -                       "Reserved PIO range does not start from 0\n"))
>>>> -               goto unregister;
>>>> -
>>>> -       /*
>>>> -        * i8259 would access I/O space, so mapping must be done here.
>>>> -        * Please remove it when all drivers can be managed by logic_pio.
>>>> -        */
>>>> -       ioremap_page_range(PCI_IOBASE, PCI_IOBASE + MMIO_LOWER_RESERVED,
>>>> -                               LOONGSON_PCIIO_BASE,
>>>> -                               pgprot_device(PAGE_KERNEL));
>>>> -
>>>> -       return;
>>>> -unregister:
>>>> -       logic_pio_unregister_range(range);
>>>> -free_range:
>>>> -       kfree(range);
>>>> +       vaddr = PCI_IOBASE + range->io_start;
>>>> +
>>>> +       ioremap_page_range(vaddr, vaddr + size, addr, pgprot_device(PAGE_KERNEL));
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static __init void reserve_pio_range(void)
>>>> +{
>>>> +       struct device_node *np;
>>>> +
>>>> +       for_each_node_by_name(np, "isa") {
>>>> +               struct of_pci_range range;
>>>> +               struct of_pci_range_parser parser;
>>>> +
>>>> +               pr_info("ISA Bridge: %pOF\n", np);
>>>> +
>>>> +               if (of_pci_range_parser_init(&parser, np)) {
>>>> +                       pr_info("Failed to parse resources.\n");
>>>> +                       break;
>>>> +               }
>>>> +
>>>> +               for_each_of_pci_range(&parser, &range) {
>>>> +                       switch (range.flags & IORESOURCE_TYPE_BITS) {
>>>> +                       case IORESOURCE_IO:
>>>> +                               pr_info(" IO 0x%016llx..0x%016llx\n",
>>>> +                                       range.cpu_addr,
>>>> +                                       range.cpu_addr + range.size - 1);
>>>> +                               if (add_legacy_isa_io(&np->fwnode, range.cpu_addr, range.size))
>>>> +                                       pr_warn("Failed to reserve legacy IO in Logic PIO\n");
>>>> +                               break;
>>>> +                       case IORESOURCE_MEM:
>>>> +                               pr_info(" MEM 0x%016llx..0x%016llx\n",
>>>> +                                       range.cpu_addr,
>>>> +                                       range.cpu_addr + range.size - 1);
>>>> +                               break;
>>>> +                       }
>>>> +               }
>>>> +       }
>>>>    }
>>>>
>>>>    void __init arch_init_irq(void)
>>>> --
>>>> 2.28.0.rc1
>>>>
