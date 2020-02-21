Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065C2167C82
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2020 12:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgBULtz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Feb 2020 06:49:55 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2454 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726934AbgBULtz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Feb 2020 06:49:55 -0500
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.108])
        by Forcepoint Email with ESMTP id 07C42219BF6427A28D49;
        Fri, 21 Feb 2020 11:49:53 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml709-cah.china.huawei.com (10.201.108.32) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 21 Feb 2020 11:49:52 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 21 Feb
 2020 11:49:51 +0000
From:   John Garry <john.garry@huawei.com>
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
 <e54a9936-5cf3-777d-3e91-58d2be96bf1c@huawei.com>
 <6c49e5e0-b6f2-fe23-caec-4742c3d1d3a0@huawei.com>
 <1706531b3a8.108e582396993.7792774458896054798@flygoat.com>
Message-ID: <65fffffa-2c74-aa09-7fdb-29a7200d7ac4@huawei.com>
Date:   Fri, 21 Feb 2020 11:49:45 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1706531b3a8.108e582396993.7792774458896054798@flygoat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml712-chm.china.huawei.com (10.201.108.63) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 21/02/2020 00:42, Jiaxun Yang wrote:
>   >
>   > I will add this may not cover your need, as you probably cannot deal
>   > with any logical PIO <-> ISA translation without modifying the device
>   > driver. For this, we may need to reserve the first 0x4000 in logical PIO
>   > space for this sort of legacy host.
> 
> Hi,
> 
> After thinking twice, I realized that the most convenient way for me is
> adding an option to get rid of the mess of logic PIO. MIPS system is emulating
> x86's behavior, while logic PIO isn't designed for such platform.

It was designed for archs which define PCI_IOBASE for PCI MMIO-based or 
IndirectIO-based IO port access.

> 
> Or probably I need a variation of Logic PIO, which leave MMIO space AS-IS
> (not try to reallocate it)

That does not work if add a PCI host with MMIO-based IO port regions 
into the mix.

It only so happens today that for mips you have a single MMIO-based IO 
port region, and you have IO port base for that region conveniently @ 
0x0. Then your drivers can have fixed IO port addresses.

For dealing with multiple MMIO-based IO ports regions - which is the 
case for PCI host bridges - then you need to map those MMIO-based IO 
port regions to different regions in IO port space.

> but still preserving higher 0x4000 for indirect access.

Then there is no space for PCI MMIO-based IO ports.

> 
> Thanks a lot!
>   >
>   > That would not be a bad thing - see
>   >https://lore.kernel.org/linux-pci/1560262374-67875-1-git-send-email-john.garry@huawei.com/
>   >
>   >
>   > >
>   > > This driver deals with legacy IO ports where we need to bitbang

