Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10133287A69
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 18:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731424AbgJHQ4Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 12:56:24 -0400
Received: from [157.25.102.26] ([157.25.102.26]:55474 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731415AbgJHQ4V (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Oct 2020 12:56:21 -0400
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id A09E02BE086;
        Thu,  8 Oct 2020 17:56:18 +0100 (BST)
Date:   Thu, 8 Oct 2020 17:56:17 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Serge Semin <fancer.lancer@gmail.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] MIPS: replace add_memory_region with memblock
In-Reply-To: <20201008155454.kaal2bchjq7wusqr@mobilestation>
Message-ID: <alpine.LFD.2.21.2010081739240.866917@eddie.linux-mips.org>
References: <20201008084357.42780-1-tsbogend@alpha.franken.de> <20201008152006.4khkbzsxqmmz76rw@mobilestation> <alpine.LFD.2.21.2010081628100.866917@eddie.linux-mips.org> <20201008155454.kaal2bchjq7wusqr@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 8 Oct 2020, Serge Semin wrote:

> > > At least I don't see a decent reason to preserve them. The memory registration
> > > method does nearly the same sanity checks. The memory reservation function
> > > defers a bit in adding the being reserved memory first. That seems redundant,
> > > since the reserved memory won't be available for the system anyway. Do I miss
> > > something?
> > 
> 
> >  At the very least it serves informational purposes as it shows up in 
> > /proc/iomem.
> 
> I thought about that, but /proc/iomem prints the System RAM up. Adding the reserved
> memory regions to be just memory region first still seem redundant, since
> reserving a non-reflected in memory region most likely indicates an erroneous
> dts. I failed to find that, but do the kernel or DTC make sure that the reserved
> memory regions has actual memory behind? (At least in the framework of the
> memblock.memory vs memblock.reserved arrays or in the DT source file)

 Reserved regions need not be RAM or a memory-like device.  They could be 
floating bus even.  Here's an example from my x86 laptop where all kinds 
of stuff is marked reserved:

00000000-00000fff : Reserved
00001000-0009cfff : System RAM
0009d000-0009ffff : Reserved
000a0000-000bffff : PCI Bus 0000:00
000c0000-000cebff : Video ROM
000d0000-000d3fff : pnp 00:0b
000d8000-000dbfff : pnp 00:0b
000e0000-000fffff : Reserved
  000f0000-000fffff : System ROM
00100000-5f24afff : System RAM
5f24b000-5f24cfff : Reserved
5f24d000-5fee5fff : System RAM
5fee6000-5fee6fff : Reserved
5fee7000-6daecfff : System RAM
6daed000-729bafff : Reserved
729bb000-729bbfff : ACPI Non-volatile Storage
729bc000-7fefefff : Reserved
7feff000-7ff99fff : ACPI Non-volatile Storage
7ff9a000-7fffefff : ACPI Tables
7ffff000-87ffffff : Reserved
  80200000-85f7ffff : INT0E0C:00
88600000-89ffffff : Reserved
8a000000-efffffff : PCI Bus 0000:00
  c0000000-d1ffffff : PCI Bus 0000:01
    c0000000-cfffffff : 0000:01:00.0
    d0000000-d1ffffff : 0000:01:00.0
  d4000000-ea0fffff : PCI Bus 0000:05
  eb000000-ec0fffff : PCI Bus 0000:01
    eb000000-ebffffff : 0000:01:00.0
  ec100000-ecafffff : PCI Bus 0000:03
  ecb00000-ecbfffff : PCI Bus 0000:3f
    ecb00000-ecb00fff : 0000:3f:00.0
      ecb00000-ecb00fff : rtsx_pci
  ecc00000-eccfffff : PCI Bus 0000:3e
    ecc00000-ecc03fff : 0000:3e:00.0
      ecc00000-ecc03fff : nvme
  ecd00000-ecdfffff : PCI Bus 0000:04
    ecd00000-ecd01fff : 0000:04:00.0
      ecd00000-ecd01fff : iwlwifi
  ece00000-ed7fffff : PCI Bus 0000:03
  ed800000-ed8fffff : PCI Bus 0000:02
    ed800000-ed803fff : 0000:02:00.0
      ed800000-ed803fff : nvme
  ed900000-ed91ffff : 0000:00:1f.6
    ed900000-ed91ffff : e1000e
  ed920000-ed92ffff : 0000:00:14.0
    ed920000-ed92ffff : xhci-hcd
  ed930000-ed933fff : 0000:00:1f.2
  effe0000-efffffff : pnp 00:08
    effe0000-efffffff : pnp 00:0a
f0000000-f7ffffff : PCI MMCONFIG 0000 [bus 00-7f]
  f0000000-f7ffffff : Reserved
    f0000000-f7ffffff : pnp 00:08
      f0000000-f7ffffff : pnp 00:0a
fd000000-fe7fffff : Reserved
  fd000000-fe7fffff : PCI Bus 0000:00
    fd000000-fdabffff : pnp 00:00
    fdac0000-fdacffff : INT345D:00
      fdac0000-fdacffff : INT345D:00
    fdad0000-fdadffff : pnp 00:00
    fdae0000-fdaeffff : INT345D:00
      fdae0000-fdaeffff : INT345D:00
    fdaf0000-fdafffff : INT345D:00
      fdaf0000-fdafffff : INT345D:00
    fdb00000-fdffffff : pnp 00:00
      fdc6000c-fdc6000f : iTCO_wdt
        fdc6000c-fdc6000f : iTCO_wdt
    fe000000-fe01ffff : pnp 00:00
    fe036000-fe03bfff : pnp 00:00
    fe03d000-fe3fffff : pnp 00:00
    fe410000-fe7fffff : pnp 00:00
feb00000-febfffff : pnp 00:08
fec00000-fec00fff : Reserved
  fec00000-fec003ff : IOAPIC 0
fed00000-fed00fff : Reserved
  fed00000-fed003ff : HPET 0
    fed00000-fed003ff : PNP0103:00
fed10000-fed19fff : Reserved
  fed10000-fed13fff : pnp 00:08
  fed18000-fed18fff : pnp 00:08
    fed18000-fed18fff : pnp 00:0a
  fed19000-fed19fff : pnp 00:08
    fed19000-fed19fff : pnp 00:0a
fed20000-fed3ffff : pnp 00:08
  fed20000-fed3ffff : pnp 00:0a
fed84000-fed84fff : Reserved
fed90000-fed93fff : pnp 00:08
  fed90000-fed93fff : pnp 00:0a
fee00000-fee00fff : Local APIC
  fee00000-fee00fff : Reserved
ff000000-ffffffff : INT0800:00
  ff800000-ffffffff : Reserved
100000000-873ffffff : System RAM
  4bb200000-4bbc031d0 : Kernel code
  4bbc031d1-4bc334e7f : Kernel data
  4bc7b7000-4bc9fffff : Kernel bss
2000000000-2fffffffff : PCI Bus 0000:00
  2fd0000000-2ff1ffffff : PCI Bus 0000:05
  2ff2000000-2ff200ffff : 0000:00:1f.3
    2ff2000000-2ff200ffff : ICH HD audio
  2ff2010000-2ff2013fff : 0000:00:1f.3
    2ff2010000-2ff2013fff : ICH HD audio
  2ff2014000-2ff20140ff : 0000:00:1f.4
  2ff2015000-2ff2015fff : 0000:00:16.0
    2ff2015000-2ff2015fff : mei_me
  2ff2016000-2ff2016fff : 0000:00:15.0
    2ff2016000-2ff20161ff : lpss_dev
      2ff2016000-2ff20161ff : lpss_dev
    2ff2016200-2ff20162ff : lpss_priv
    2ff2016800-2ff2016fff : idma64.0
      2ff2016800-2ff2016fff : idma64.0
  2ff2017000-2ff2017fff : 0000:00:14.2
    2ff2017000-2ff2017fff : Intel PCH thermal driver
  2ff2018000-2ff2018fff : 0000:00:08.0

Actually another reason to mark regions reserved is to prevent them from 
being claimed by the wrong driver or, perhaps more importantly, used for 
assigning bus address ranges to hardware resources (BAR programming).

> I also don't see the other platforms doing that, since the MIPS arch only
> redefines these methods. So if a problem of adding a reserved memory with
> possible no real memory behind exist, it should be fixed in the cross-platform
> basis, don't you think?

 I think doing things in a generic way where possible is surely desired, 
however platforms have different ways to discover resources and I can't 
see offhand how this could be unified.  I haven't look at that code for a 
while now, so I can't be more specific offhand.

  Maciej
