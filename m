Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B47D3166099
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 16:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgBTPNE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 10:13:04 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17864 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728385AbgBTPNE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Feb 2020 10:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582211542;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=JRDtQsXpqUz7hsmkd0dK4lht0q0VWQmzqTzKRrMqjh0=;
        b=EiurU6QK7jrqxanpBh2gS4bNHic3BztEaU/5KGB0lhv34MlDO5zaLfXfp1PiZj5K
        oY/agn/b6K3fTACSKyRC7saahG3KzslxxSK4rOe4WEfcT9DBSlDCoLKtmVF4ac2OOlK
        TGcDsYxdHabxhFeBtPLUAig4WusYdUxW3I7sepgg=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 1582211539685705.7136605582543; Thu, 20 Feb 2020 23:12:19 +0800 (CST)
Date:   Thu, 20 Feb 2020 23:12:19 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "John Garry" <john.garry@huawei.com>
Cc:     "Wei Xu" <xuwei5@hisilicon.com>, "bhelgaas" <bhelgaas@google.com>,
        "andyshevchenko" <andy.shevchenko@gmail.com>,
        "Arnd Bergmann" <arnd@arndb.de>,
        "linux-kernel" <linux-kernel@vger.kernel.org>,
        "Linux Mips" <linux-mips@vger.kernel.org>
Message-ID: <170632822e1.12fede49a6919.5706082545515934736@flygoat.com>
In-Reply-To: <1ebf4461-eb37-ff58-1faf-dd24d83f85cf@huawei.com>
References: <1705dbe62ce.10ae800394772.9222265269135747883@flygoat.com>
 <5E4E55F7.70800@hisilicon.com>
 <e3ddd7de-54b2-bdba-2233-6ace40072430@huawei.com>
 <17062738bc0.c380503c6222.6801557833645076299@flygoat.com> <1ebf4461-eb37-ff58-1faf-dd24d83f85cf@huawei.com>
Subject: Re: Questions about logic_pio
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Priority: Medium
User-Agent: ZohoCN Mail
X-Mailer: ZohoCN Mail
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


 ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E5=9B=9B, 2020-02-20 22:23:57 John Garry=
 <john.garry@huawei.com> =E6=92=B0=E5=86=99 ----
 > > Also Cc MIPS list to check other's opinions.
 > >=20
 > > Hi John.
 > >=20
 >=20
 > Hi Jiaxun Yang,
 >=20
 > > Thanks for your kind explanation, however, I think this way is
 > > violating how I/O ports supposed to work, at least in MIPS world.
 >=20
 > For a bit more history, please understand that the core PCI code was=20
 > managing non-native IO port space in the same way before we added the=20
 > logic PIO framework. The only real functional change here was that we=20
 > introduced the indirect-io region within the IO port space, under=20
 > CONFIG_INDIRECT_PIO.

I'm going to do more investigation. Thanks.=20

 >=20
 > >=20
 > >   > >>
 > >   > >> After dig into logic pio logic, I found that logic pio is tryin=
g to "allocate" an io_start
 > >   > >> for MMIO ranges, the allocation starts from 0x0. And later the =
io_start is used to calculate
 > >   > >> cpu_address.  In my opinion, for direct MMIO access, logic_pio =
address should always
 > >   > >> equal to hw address,
 > >   >
 > >   > I'm not sure what you mean by simply the hw address.
 > >   >
 > >=20
 > > I meant  hw_start should always equal to io_start.
 > >=20
 > >=20
 > > MIPS have their own wrapped inl/outl functions,=20
 >=20
 > Can you please point me to these? I could not find them in arch/mips

They are built by __BUILD_IOPORT_PFX(bus, bwlq, type) macro.
Just using mips_io_port_base + offset to handle inl/outl, the same way PCI_=
IOBASE.

 >=20
 > I will also note that arch/mips/include/asm/io.h does not include=20
 > asm-generic io.h today

Yes, and I'm attempting to take advantage of asm-generic.

 >=20
 > doing the samething with
 > > PCI_IOBASE enabled one. I was just trying to use PCI_IOBASE instead.
 > >=20
 > > Originally, the I/O ports layout seems like this:
 > >=20
 > > 00000020-00000021 : pic1
 > > 00000060-0000006f : i8042
 > > 00000070-00000077 : rtc0
 > > 000000a0-000000a1 : pic2
 > > 00000170-00000177 : pata_atiixp
 > > 000001f0-000001f7 : pata_atiixp
 > > 00000376-00000376 : pata_atiixp
 > > 000003f6-000003f6 : pata_atiixp
 > > 00000800-000008ff : acpi
 > > 00001000-00001008 : piix4_smbus
 > > 00004000-0003ffff : pci io space
 > >    00004000-00004fff : PCI Bus 0000:01
 > >      00004000-000040ff : 0000:01:05.0
 > >    00005000-00005fff : PCI Bus 0000:03
 > >      00005000-0000501f : 0000:03:00.0
 > >=20
 > > But with PCI_IOBASE defined, I got this:
 > >=20
 > > host bridge /bus@10000000/pci@10000000 ranges:
 > >        MEM 0x0040000000..0x007fffffff -> 0x0040000000
 > >         IO 0x0000004000..0x0000007fff -> 0x0000004000
 > > resource collision: [io  0x0000-0x3fff] conflicts with pic1 [io  0x002=
0-0x0021]
 > >=20
 > > Because io_start was allocated to 0x0 by Logic PIO.
 > >=20
 > > There are a lot of devices that have fixed ioports thanks to x86's leg=
acy.
 >=20
 > Well, yes, I'm not so surprised.
 >=20
 > So if MIPS does not have native IO port access, then surely you need=20
 > some host bridge to translate host CPU MMIO accesses to port I/O=20
 > accesses, right? Where are these CPU addresses defined?

It is defined by the variable mips_io_port_base.

 >=20
 > > For example, in my hardware, ioports for RTC, PIC, I8042 are unmoveabl=
e,
 > > and they can't be managed by logic pio subsystem. > Also, the PCI Host=
bridge got implied by DeviceTree that it's I/O range
 > > started from 0x4000 in bus side
 >=20
 > which bus is this?

They're all located under "ISA Range".  Just an MMIO range that will resend
the request to ISA I/O. --ioports for both PCI and some legacy devices.

In that range, base + 0x0000 to 0x4000 is preserved for PIO devices (e.g.) =
I8259
and base + 0x4000 to MMIO_LIMIT are for PCI devices under host bridge.
For the host bridge, ioports it can decode starts from 0x4000.

My intentional behavior is that when I'm specifying in dts that the IO Rang=
e of PCI host
bridge is 0x4000 to 0x7fff, it would request the IO_RESOURCE start from 0x4=
000
to 0x7fff, also tell the host driver to decode  0x4000 to 0x7fff in IO BAR,=
 And let the drivers
access 0x4000 to 0x7fff via inl/outl, rather than allocate from PIO 0x0 to =
0x3fff.

 >=20
 > , but then, Logic PIO remapped to PCI_IOBASE + 0x0.
 > > The real address should be PCI_IOBASE + 0x4000,
 >=20
 > You seem to be using two methods to manage IO port space, and they seem=
=20
 > to be conflicting.

So... Are there any way to handle these unmoveable devices in logic pio wor=
ld?

 >=20
 > > hardware never got correctly informed about that. And there is still n=
o way to
 > > transform to correct address as it's inside the MMIO_LIMIT.
 > >=20
 > > So the question comes to why we're allocating io_start for MMIO PCI_IO=
BASE
 > > rather than just check the range provided doesn't overlap each other o=
r exceed
 > > the MMIO_LIMIT.
 >=20
 > When PCI_IOBASE is defined, we work on the basis that any IO port range=
=20
 > in the system is registered for a logical PIO region, which manages the=
=20
 > actual IO port addresses - see logic_pio_trans_cpuaddr().

The port is not the actual port.. It makes me confusing about what it's act=
ually doing..
Sorry but probably I'm still thinking in a vintage way -- need some hints a=
bout how to
deal with these legacy cases in a modern way.

Thanks.

 >=20
 > Thanks,
 > John
 >
