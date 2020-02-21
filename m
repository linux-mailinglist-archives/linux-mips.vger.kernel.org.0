Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6BDE166BE7
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2020 01:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729741AbgBUAm0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 19:42:26 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17809 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729739AbgBUAm0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Feb 2020 19:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582245723;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=nQkhWD0vzRMeJaAuRM8hbcXEG7NWeiBqW3cYe1zDt/w=;
        b=PIMCrVwciVoB4eQxbm/LMi18sPJJpckNt7uAQDGpBIY2EqG2FfJy/r6w/MVYm52N
        fPw4iV3F9T7unkNWUR4BOWi2Bgcm2+JNo31/AH4O0sOENpwog72Hlj99QuERzbdoeDA
        Uw6wUq96CL5jffIRphngF7jfBKG8HDenwW7gukVc=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 1582245721005355.3785947856163; Fri, 21 Feb 2020 08:42:01 +0800 (CST)
Date:   Fri, 21 Feb 2020 08:42:01 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "John Garry" <john.garry@huawei.com>
Cc:     "xuwei (O)" <xuwei5@huawei.com>, "bhelgaas" <bhelgaas@google.com>,
        "andyshevchenko" <andy.shevchenko@gmail.com>,
        "Arnd Bergmann" <arnd@arndb.de>,
        "linux-kernel" <linux-kernel@vger.kernel.org>,
        "Linux Mips" <linux-mips@vger.kernel.org>
Message-ID: <1706531b3a8.108e582396993.7792774458896054798@flygoat.com>
In-Reply-To: <6c49e5e0-b6f2-fe23-caec-4742c3d1d3a0@huawei.com>
References: <1705dbe62ce.10ae800394772.9222265269135747883@flygoat.com>
 <5E4E55F7.70800@hisilicon.com>
 <e3ddd7de-54b2-bdba-2233-6ace40072430@huawei.com>
 <17062738bc0.c380503c6222.6801557833645076299@flygoat.com>
 <1ebf4461-eb37-ff58-1faf-dd24d83f85cf@huawei.com>
 <170632822e1.12fede49a6919.5706082545515934736@flygoat.com>
 <e54a9936-5cf3-777d-3e91-58d2be96bf1c@huawei.com> <6c49e5e0-b6f2-fe23-caec-4742c3d1d3a0@huawei.com>
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

 ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E4=BA=94, 2020-02-21 02:32:39 John Garry=
 <john.garry@huawei.com> =E6=92=B0=E5=86=99 ----
 > On 20/02/2020 17:39, John Garry wrote:
 > > On 20/02/2020 15:12, Jiaxun Yang wrote:
 > >>
 > >>   ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E5=9B=9B, 2020-02-20 22:23:57 Joh=
n Garry=20
 > >> <john.garry@huawei.com> =E6=92=B0=E5=86=99 ----
 > >>   > > Also Cc MIPS list to check other's opinions.
 > >>   > >
 > >>   > > Hi John.
 > >>   > >
 > >>   >
 > >>   > Hi Jiaxun Yang,
 > >>   >
 > >>   > > Thanks for your kind explanation, however, I think this way is
 > >>   > > violating how I/O ports supposed to work, at least in MIPS worl=
d.
 > >>   >
 > >>   > For a bit more history, please understand that the core PCI code =
was
 > >>   > managing non-native IO port space in the same way before we added=
 the
 > >>   > logic PIO framework. The only real functional change here was tha=
t we
 > >>   > introduced the indirect-io region within the IO port space, under
 > >>   > CONFIG_INDIRECT_PIO.
 > >>
 > >> I'm going to do more investigation. Thanks.
 > >>
 > >>   >
 > >>   > >
 > >>   > >   > >>
 > >>   > >   > >> After dig into logic pio logic, I found that logic pio i=
s=20
 > >> trying to "allocate" an io_start
 > >>   > >   > >> for MMIO ranges, the allocation starts from 0x0. And=20
 > >> later the io_start is used to calculate
 > >>   > >   > >> cpu_address.  In my opinion, for direct MMIO access,=20
 > >> logic_pio address should always
 > >>   > >   > >> equal to hw address,
 > >>   > >   >
 > >>   > >   > I'm not sure what you mean by simply the hw address.
 > >>   > >   >
 > >>   > >
 > >>   > > I meant  hw_start should always equal to io_start.
 > >>   > >
 > >>   > >
 > >>   > > MIPS have their own wrapped inl/outl functions,
 > >>   >
 > >>   > Can you please point me to these? I could not find them in arch/m=
ips
 > >>
 > >> They are built by __BUILD_IOPORT_PFX(bus, bwlq, type) macro.
 > >> Just using mips_io_port_base + offset to handle inl/outl, the same wa=
y=20
 > >> PCI_IOBASE.
 > >=20
 > > Right, so I had a glance through the code and mips has it own manageme=
nt=20
 > > of this IO port space. And, like you say, mips_io_port_base is=20
 > > equivalent to PCI_IOBASE.
 > >=20
 > >>
 > >>   >
 > >>   > I will also note that arch/mips/include/asm/io.h does not include
 > >>   > asm-generic io.h today
 > >>
 > >> Yes, and I'm attempting to take advantage of asm-generic.
 > >=20
 > > I just don't think it's as simple as saying we want to take advantage =
of=20
 > > asm-generic. asm-generic io.h includes logic_pio.h, which uses logical=
=20
 > > PIO to manage IO port space and relies on PIO_IOBASE. This is=20
 > > incompatible with having some other framework - like mips_io_port_base=
 -=20
 > > managing IO port space at the same time.
 > >=20
 > > The core PCI code relies on logical PIO to manage IO port space for wh=
en=20
 > > PCI_IOBASE is defined.
 > >=20
 > >>
 > >>   >
 > >>   > doing the samething with
 > >>   > > PCI_IOBASE enabled one. I was just trying to use PCI_IOBASE=20
 > >> instead.
 > >>   > >
 > >>   > > Originally, the I/O ports layout seems like this:
 > >>   > >
 > >>   > > 00000020-00000021 : pic1
 > >>   > > 00000060-0000006f : i8042
 > >>   > > 00000070-00000077 : rtc0
 > >>   > > 000000a0-000000a1 : pic2
 > >>   > > 00000170-00000177 : pata_atiixp
 > >>   > > 000001f0-000001f7 : pata_atiixp
 > >>   > > 00000376-00000376 : pata_atiixp
 > >>   > > 000003f6-000003f6 : pata_atiixp
 > >>   > > 00000800-000008ff : acpi
 > >>   > > 00001000-00001008 : piix4_smbus
 > >>   > > 00004000-0003ffff : pci io space
 > >>   > >    00004000-00004fff : PCI Bus 0000:01
 > >>   > >      00004000-000040ff : 0000:01:05.0
 > >>   > >    00005000-00005fff : PCI Bus 0000:03
 > >>   > >      00005000-0000501f : 0000:03:00.0
 > >>   > >
 > >>   > > But with PCI_IOBASE defined, I got this:
 > >>   > >
 > >>   > > host bridge /bus@10000000/pci@10000000 ranges:
 > >>   > >        MEM 0x0040000000..0x007fffffff -> 0x0040000000
 > >>   > >         IO 0x0000004000..0x0000007fff -> 0x0000004000
 > >>   > > resource collision: [io  0x0000-0x3fff] conflicts with pic1 [io=
 =20
 > >> 0x0020-0x0021]
 > >>   > >
 > >>   > > Because io_start was allocated to 0x0 by Logic PIO.
 > >>   > >
 > >>   > > There are a lot of devices that have fixed ioports thanks to=20
 > >> x86's legacy.
 > >>   >
 > >>   > Well, yes, I'm not so surprised.
 > >>   >
 > >>   > So if MIPS does not have native IO port access, then surely you n=
eed
 > >>   > some host bridge to translate host CPU MMIO accesses to port I/O
 > >>   > accesses, right? Where are these CPU addresses defined?
 > >>
 > >> It is defined by the variable mips_io_port_base.
 > >>
 > >>   >
 > >>   > > For example, in my hardware, ioports for RTC, PIC, I8042 are=20
 > >> unmoveable,
 > >>   > > and they can't be managed by logic pio subsystem. > Also, the=
=20
 > >> PCI Hostbridge got implied by DeviceTree that it's I/O range
 > >>   > > started from 0x4000 in bus side
 > >>   >
 > >>   > which bus is this?
 > >>
 > >> They're all located under "ISA Range".  Just an MMIO range that will=
=20
 > >> resend
 > >> the request to ISA I/O. --ioports for both PCI and some legacy device=
s.
 > >>
 > >> In that range, base + 0x0000 to 0x4000 is preserved for PIO devices=
=20
 > >> (e.g.) I8259
 > >> and base + 0x4000 to MMIO_LIMIT are for PCI devices under host bridge=
.
 > >> For the host bridge, ioports it can decode starts from 0x4000.
 > >>
 > >> My intentional behavior is that when I'm specifying in dts that the I=
O=20
 > >> Range of PCI host
 > >> bridge is 0x4000 to 0x7fff, it would request the IO_RESOURCE start=20
 > >> from 0x4000
 > >> to 0x7fff, also tell the host driver to decode  0x4000 to 0x7fff in I=
O=20
 > >> BAR, And let the drivers
 > >> access 0x4000 to 0x7fff via inl/outl, rather than allocate from PIO=
=20
 > >> 0x0 to 0x3fff.
 > >>
 > >>   >
 > >>   > , but then, Logic PIO remapped to PCI_IOBASE + 0x0.
 > >>   > > The real address should be PCI_IOBASE + 0x4000,
 > >>   >
 > >>   > You seem to be using two methods to manage IO port space, and the=
y=20
 > >> seem
 > >>   > to be conflicting.
 > >>
 > >> So... Are there any way to handle these unmoveable devices in logic=
=20
 > >> pio world?
 > >=20
 > > When you say that they are unmovable, they are at a fixed address on=
=20
 > > this "ISA Range", right? If so, yes, you should be able to handle it i=
n=20
 > > logical PIO. You just need to deal with translating logical PIO=20
 > > addresses to ISA bus addresses. We do this very thing in our LPC drive=
r=20
 > > - see drivers/bus/hisi_lpc.c
 >=20
 > I will add this may not cover your need, as you probably cannot deal=20
 > with any logical PIO <-> ISA translation without modifying the device=20
 > driver. For this, we may need to reserve the first 0x4000 in logical PIO=
=20
 > space for this sort of legacy host.

Hi,

After thinking twice, I realized that the most convenient way for me is
adding an option to get rid of the mess of logic PIO. MIPS system is emulat=
ing
x86's behavior, while logic PIO isn't designed for such platform.

Or probably I need a variation of Logic PIO, which leave MMIO space AS-IS
(not try to reallocate it) but still preserving higher 0x4000 for indirect =
access.

Thanks a lot!
 >=20
 > That would not be a bad thing - see=20
 > https://lore.kernel.org/linux-pci/1560262374-67875-1-git-send-email-john=
.garry@huawei.com/
 >=20
 >=20
 > >=20
 > > This driver deals with legacy IO ports where we need to bitbang=20
 > > accesses, i.e. we don't support MMIO for this.
 > >>
 >=20

