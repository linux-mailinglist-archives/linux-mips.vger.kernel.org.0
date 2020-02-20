Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D431A166512
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 18:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbgBTRj4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 12:39:56 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2452 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726959AbgBTRjz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Feb 2020 12:39:55 -0500
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.108])
        by Forcepoint Email with ESMTP id EFE1B51D0DBE5344DF09;
        Thu, 20 Feb 2020 17:39:52 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml702-cah.china.huawei.com (10.201.108.43) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 20 Feb 2020 17:39:52 +0000
Received: from [127.0.0.1] (10.210.167.243) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 20 Feb
 2020 17:39:51 +0000
Subject: Re: Questions about logic_pio
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     "xuwei (O)" <xuwei5@huawei.com>, bhelgaas <bhelgaas@google.com>,
        andyshevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Mips <linux-mips@vger.kernel.org>
References: <1705dbe62ce.10ae800394772.9222265269135747883@flygoat.com>
 <5E4E55F7.70800@hisilicon.com>
 <e3ddd7de-54b2-bdba-2233-6ace40072430@huawei.com>
 <17062738bc0.c380503c6222.6801557833645076299@flygoat.com>
 <1ebf4461-eb37-ff58-1faf-dd24d83f85cf@huawei.com>
 <170632822e1.12fede49a6919.5706082545515934736@flygoat.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <e54a9936-5cf3-777d-3e91-58d2be96bf1c@huawei.com>
Date:   Thu, 20 Feb 2020 17:39:50 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <170632822e1.12fede49a6919.5706082545515934736@flygoat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.210.167.243]
X-ClientProxiedBy: lhreml723-chm.china.huawei.com (10.201.108.74) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 20/02/2020 15:12, Jiaxun Yang wrote:
> 
>   ---- 在 星期四, 2020-02-20 22:23:57 John Garry <john.garry@huawei.com> 撰写 ----
>   > > Also Cc MIPS list to check other's opinions.
>   > >
>   > > Hi John.
>   > >
>   >
>   > Hi Jiaxun Yang,
>   >
>   > > Thanks for your kind explanation, however, I think this way is
>   > > violating how I/O ports supposed to work, at least in MIPS world.
>   >
>   > For a bit more history, please understand that the core PCI code was
>   > managing non-native IO port space in the same way before we added the
>   > logic PIO framework. The only real functional change here was that we
>   > introduced the indirect-io region within the IO port space, under
>   > CONFIG_INDIRECT_PIO.
> 
> I'm going to do more investigation. Thanks.
> 
>   >
>   > >
>   > >   > >>
>   > >   > >> After dig into logic pio logic, I found that logic pio is trying to "allocate" an io_start
>   > >   > >> for MMIO ranges, the allocation starts from 0x0. And later the io_start is used to calculate
>   > >   > >> cpu_address.  In my opinion, for direct MMIO access, logic_pio address should always
>   > >   > >> equal to hw address,
>   > >   >
>   > >   > I'm not sure what you mean by simply the hw address.
>   > >   >
>   > >
>   > > I meant  hw_start should always equal to io_start.
>   > >
>   > >
>   > > MIPS have their own wrapped inl/outl functions,
>   >
>   > Can you please point me to these? I could not find them in arch/mips
> 
> They are built by __BUILD_IOPORT_PFX(bus, bwlq, type) macro.
> Just using mips_io_port_base + offset to handle inl/outl, the same way PCI_IOBASE.

Right, so I had a glance through the code and mips has it own management 
of this IO port space. And, like you say, mips_io_port_base is 
equivalent to PCI_IOBASE.

> 
>   >
>   > I will also note that arch/mips/include/asm/io.h does not include
>   > asm-generic io.h today
> 
> Yes, and I'm attempting to take advantage of asm-generic.

I just don't think it's as simple as saying we want to take advantage of 
asm-generic. asm-generic io.h includes logic_pio.h, which uses logical 
PIO to manage IO port space and relies on PIO_IOBASE. This is 
incompatible with having some other framework - like mips_io_port_base - 
managing IO port space at the same time.

The core PCI code relies on logical PIO to manage IO port space for when 
PCI_IOBASE is defined.

> 
>   >
>   > doing the samething with
>   > > PCI_IOBASE enabled one. I was just trying to use PCI_IOBASE instead.
>   > >
>   > > Originally, the I/O ports layout seems like this:
>   > >
>   > > 00000020-00000021 : pic1
>   > > 00000060-0000006f : i8042
>   > > 00000070-00000077 : rtc0
>   > > 000000a0-000000a1 : pic2
>   > > 00000170-00000177 : pata_atiixp
>   > > 000001f0-000001f7 : pata_atiixp
>   > > 00000376-00000376 : pata_atiixp
>   > > 000003f6-000003f6 : pata_atiixp
>   > > 00000800-000008ff : acpi
>   > > 00001000-00001008 : piix4_smbus
>   > > 00004000-0003ffff : pci io space
>   > >    00004000-00004fff : PCI Bus 0000:01
>   > >      00004000-000040ff : 0000:01:05.0
>   > >    00005000-00005fff : PCI Bus 0000:03
>   > >      00005000-0000501f : 0000:03:00.0
>   > >
>   > > But with PCI_IOBASE defined, I got this:
>   > >
>   > > host bridge /bus@10000000/pci@10000000 ranges:
>   > >        MEM 0x0040000000..0x007fffffff -> 0x0040000000
>   > >         IO 0x0000004000..0x0000007fff -> 0x0000004000
>   > > resource collision: [io  0x0000-0x3fff] conflicts with pic1 [io  0x0020-0x0021]
>   > >
>   > > Because io_start was allocated to 0x0 by Logic PIO.
>   > >
>   > > There are a lot of devices that have fixed ioports thanks to x86's legacy.
>   >
>   > Well, yes, I'm not so surprised.
>   >
>   > So if MIPS does not have native IO port access, then surely you need
>   > some host bridge to translate host CPU MMIO accesses to port I/O
>   > accesses, right? Where are these CPU addresses defined?
> 
> It is defined by the variable mips_io_port_base.
> 
>   >
>   > > For example, in my hardware, ioports for RTC, PIC, I8042 are unmoveable,
>   > > and they can't be managed by logic pio subsystem. > Also, the PCI Hostbridge got implied by DeviceTree that it's I/O range
>   > > started from 0x4000 in bus side
>   >
>   > which bus is this?
> 
> They're all located under "ISA Range".  Just an MMIO range that will resend
> the request to ISA I/O. --ioports for both PCI and some legacy devices.
> 
> In that range, base + 0x0000 to 0x4000 is preserved for PIO devices (e.g.) I8259
> and base + 0x4000 to MMIO_LIMIT are for PCI devices under host bridge.
> For the host bridge, ioports it can decode starts from 0x4000.
> 
> My intentional behavior is that when I'm specifying in dts that the IO Range of PCI host
> bridge is 0x4000 to 0x7fff, it would request the IO_RESOURCE start from 0x4000
> to 0x7fff, also tell the host driver to decode  0x4000 to 0x7fff in IO BAR, And let the drivers
> access 0x4000 to 0x7fff via inl/outl, rather than allocate from PIO 0x0 to 0x3fff.
> 
>   >
>   > , but then, Logic PIO remapped to PCI_IOBASE + 0x0.
>   > > The real address should be PCI_IOBASE + 0x4000,
>   >
>   > You seem to be using two methods to manage IO port space, and they seem
>   > to be conflicting.
> 
> So... Are there any way to handle these unmoveable devices in logic pio world?

When you say that they are unmovable, they are at a fixed address on 
this "ISA Range", right? If so, yes, you should be able to handle it in 
logical PIO. You just need to deal with translating logical PIO 
addresses to ISA bus addresses. We do this very thing in our LPC driver 
- see drivers/bus/hisi_lpc.c

This driver deals with legacy IO ports where we need to bitbang 
accesses, i.e. we don't support MMIO for this.
> 
>   >
>   > > hardware never got correctly informed about that. And there is still no way to
>   > > transform to correct address as it's inside the MMIO_LIMIT.
>   > >
>   > > So the question comes to why we're allocating io_start for MMIO PCI_IOBASE
>   > > rather than just check the range provided doesn't overlap each other or exceed
>   > > the MMIO_LIMIT.
>   >
>   > When PCI_IOBASE is defined, we work on the basis that any IO port range
>   > in the system is registered for a logical PIO region, which manages the
>   > actual IO port addresses - see logic_pio_trans_cpuaddr().
> 
> The port is not the actual port.. It makes me confusing about what it's actually doing..
> Sorry but probably I'm still thinking in a vintage way -- need some hints about how to
> deal with these legacy cases in a modern way.
> 
> Thanks.
> 
>   >
>   > Thanks,
>   > John
>   >
> 


