Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98FDF165CFE
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 12:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgBTLzi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 06:55:38 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17801 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726921AbgBTLzi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Feb 2020 06:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582199706;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=7ddhxQbyEwQ7HhvLbQ42ZoP2jYQ44LLoMYHI95WK4Mw=;
        b=EfW2bgLgvBeZfS8AKWm+ZYKWizWq9m6B3QEBfBRuGCRL/ioeX2Gzb0i9jL0oW+YF
        WL/mE4w+sck4cGrjXa8MU8WOprRiOGys//FV1XvHlwjyDlfKF0UjNJiS+MsaLBhpbvv
        PfOKvKalTljIx3djiRNx8WdDR0E+ahXqbZiEhXI4=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 1582199704516305.15577623524825; Thu, 20 Feb 2020 19:55:04 +0800 (CST)
Date:   Thu, 20 Feb 2020 19:55:04 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "John Garry" <john.garry@huawei.com>
Cc:     "Wei Xu" <xuwei5@hisilicon.com>, "bhelgaas" <bhelgaas@google.com>,
        "andyshevchenko" <andy.shevchenko@gmail.com>,
        "Arnd Bergmann" <arnd@arndb.de>,
        "linux-kernel" <linux-kernel@vger.kernel.org>,
        "Linux Mips" <linux-mips@vger.kernel.org>
Message-ID: <17062738bc0.c380503c6222.6801557833645076299@flygoat.com>
In-Reply-To: <e3ddd7de-54b2-bdba-2233-6ace40072430@huawei.com>
References: <1705dbe62ce.10ae800394772.9222265269135747883@flygoat.com>
 <5E4E55F7.70800@hisilicon.com> <e3ddd7de-54b2-bdba-2233-6ace40072430@huawei.com>
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




 ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E5=9B=9B, 2020-02-20 18:52:38 John Garry=
 <john.garry@huawei.com> =E6=92=B0=E5=86=99 ----
Also Cc MIPS list to check other's opinions.

Hi John.

Thanks for your kind explanation, however, I think this way is
violating how I/O ports supposed to work, at least in MIPS world.

 > >>
 > >> After dig into logic pio logic, I found that logic pio is trying to "=
allocate" an io_start
 > >> for MMIO ranges, the allocation starts from 0x0. And later the io_sta=
rt is used to calculate
 > >> cpu_address.  In my opinion, for direct MMIO access, logic_pio addres=
s should always
 > >> equal to hw address,
 >=20
 > I'm not sure what you mean by simply the hw address.
 >=20

I meant  hw_start should always equal to io_start.


MIPS have their own wrapped inl/outl functions, doing the samething with
PCI_IOBASE enabled one. I was just trying to use PCI_IOBASE instead.

Originally, the I/O ports layout seems like this:

00000020-00000021 : pic1
00000060-0000006f : i8042
00000070-00000077 : rtc0
000000a0-000000a1 : pic2
00000170-00000177 : pata_atiixp
000001f0-000001f7 : pata_atiixp
00000376-00000376 : pata_atiixp
000003f6-000003f6 : pata_atiixp
00000800-000008ff : acpi
00001000-00001008 : piix4_smbus
00004000-0003ffff : pci io space
  00004000-00004fff : PCI Bus 0000:01
    00004000-000040ff : 0000:01:05.0
  00005000-00005fff : PCI Bus 0000:03
    00005000-0000501f : 0000:03:00.0

But with PCI_IOBASE defined, I got this:

host bridge /bus@10000000/pci@10000000 ranges:
      MEM 0x0040000000..0x007fffffff -> 0x0040000000
       IO 0x0000004000..0x0000007fff -> 0x0000004000
resource collision: [io  0x0000-0x3fff] conflicts with pic1 [io  0x0020-0x0=
021]

Because io_start was allocated to 0x0 by Logic PIO.

There are a lot of devices that have fixed ioports thanks to x86's legacy.
For example, in my hardware, ioports for RTC, PIC, I8042 are unmoveable,
and they can't be managed by logic pio subsystem.
Also, the PCI Hostbridge got implied by DeviceTree that it's I/O range
started from 0x4000 in bus side, but then, Logic PIO remapped to PCI_IOBASE=
 + 0x0.
The real address should be PCI_IOBASE + 0x4000,
hardware never got correctly informed about that. And there is still no way=
 to
transform to correct address as it's inside the MMIO_LIMIT.

So the question comes to why we're allocating io_start for MMIO PCI_IOBASE
rather than just check the range provided doesn't overlap each other or exc=
eed
the MMIO_LIMIT.

Thanks.

--
Jiaxun Yang
