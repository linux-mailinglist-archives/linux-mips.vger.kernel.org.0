Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34CC5168402
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2020 17:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbgBUQsp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Feb 2020 11:48:45 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17811 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726387AbgBUQso (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Feb 2020 11:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582303665;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=+5iSFkto5lD3XI8WPHwTtnFf14s4AHqOXFojmaY+UCs=;
        b=IStQf0pTzFKTmnXGIQfMKQurB4UDBwnC8ONX0+EZ5e3n59UCQZPEkCbp+f+jdnXY
        yxjgFGLFDFCs1Hb2d3bR0Rx2pB7wP/OLYaiwuc9N1iNp9VzSErv5UdaAA48ZjJ5YMgO
        /aqspSqhdUMpwO5t4dwcWCVzgz/Lwt4IuNWzV9RE=
Received: from [26.26.26.1] (183.156.46.156 [183.156.46.156]) by mx.zoho.com.cn
        with SMTPS id 1582303661935135.86216680534437; Sat, 22 Feb 2020 00:47:41 +0800 (CST)
Date:   Sat, 22 Feb 2020 00:47:39 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <65fffffa-2c74-aa09-7fdb-29a7200d7ac4@huawei.com>
References: <1705dbe62ce.10ae800394772.9222265269135747883@flygoat.com> <5E4E55F7.70800@hisilicon.com> <e3ddd7de-54b2-bdba-2233-6ace40072430@huawei.com> <17062738bc0.c380503c6222.6801557833645076299@flygoat.com> <1ebf4461-eb37-ff58-1faf-dd24d83f85cf@huawei.com> <170632822e1.12fede49a6919.5706082545515934736@flygoat.com> <e54a9936-5cf3-777d-3e91-58d2be96bf1c@huawei.com> <6c49e5e0-b6f2-fe23-caec-4742c3d1d3a0@huawei.com> <1706531b3a8.108e582396993.7792774458896054798@flygoat.com> <65fffffa-2c74-aa09-7fdb-29a7200d7ac4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Questions about logic_pio
To:     John Garry <john.garry@huawei.com>
CC:     "xuwei (O)" <xuwei5@huawei.com>, bhelgaas <bhelgaas@google.com>,
        andyshevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Mips <linux-mips@vger.kernel.org>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <A9B4BEC2-546B-4524-A107-E6049A08BBE0@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B42=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=887=
:49:45, John Garry <john=2Egarry@huawei=2Ecom> =E5=86=99=E5=88=B0:
>On 21/02/2020 00:42, Jiaxun Yang wrote:
>>   >
>>   > I will add this may not cover your need, as you probably cannot
>deal
>>   > with any logical PIO <-> ISA translation without modifying the
>device
>>   > driver=2E For this, we may need to reserve the first 0x4000 in
>logical PIO
>>   > space for this sort of legacy host=2E
>>=20
>> Hi,
>>=20
>> After thinking twice, I realized that the most convenient way for me
>is
>> adding an option to get rid of the mess of logic PIO=2E MIPS system is
>emulating
>> x86's behavior, while logic PIO isn't designed for such platform=2E
>
>It was designed for archs which define PCI_IOBASE for PCI MMIO-based or
>
>IndirectIO-based IO port access=2E
>
>>=20
>> Or probably I need a variation of Logic PIO, which leave MMIO space
>AS-IS
>> (not try to reallocate it)
>
>That does not work if add a PCI host with MMIO-based IO port regions=20
>into the mix=2E
>
>It only so happens today that for mips you have a single MMIO-based IO=20
>port region, and you have IO port base for that region conveniently @=20
>0x0=2E Then your drivers can have fixed IO port addresses=2E

In MIPS, PCI Host Bridge share PIO region with legacy devices=2E

Probably the better solution is to add a kind of logic pio region called F=
IXED_MMIO,
so we can occupy some low ioports for these fixed devices at boot time=2E

A ISA bridge node in DeviceTree can be used
to express this region=2E

I'm going to work on this and try to make a RFC patch later=2E

Thanks for your help again!
>
>For dealing with multiple MMIO-based IO ports regions - which is the=20
>case for PCI host bridges - then you need to map those MMIO-based IO=20
>port regions to different regions in IO port space=2E
>
>> but still preserving higher 0x4000 for indirect access=2E
>
>Then there is no space for PCI MMIO-based IO ports=2E

Well, it can be higher or lower, whatever=2E

>
>>=20
>> Thanks a lot!
>>   >
>>   > That would not be a bad thing - see
>> =20
>>https://lore=2Ekernel=2Eorg/linux-pci/1560262374-67875-1-git-send-email-=
john=2Egarry@huawei=2Ecom/
>>   >
>>   >
>>   > >
>>   > > This driver deals with legacy IO ports where we need to bitbang

--=20
Jiaxun Yang
