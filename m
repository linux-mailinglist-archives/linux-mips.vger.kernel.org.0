Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47C8B1A2EB4
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 07:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgDIFHV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 01:07:21 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17863 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725271AbgDIFHV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 01:07:21 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586408795; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=axyfKa6+yKpn/MMbVGEDwvxVo+0Xr6DHv6ASYKuSKyqf9F2sOADNOphNhQh+3kJXGEXW02S1Z46vJseXV3QH+IKYduSNqP/ex9n13nPOk1Kx0F1wiqbNz+UQI4evjx6ZqhLwRQk9j4aqxUOuwC+kFRa4dku5TKo/kQWtvNpXP5I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586408795; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=oZguYgV4dt6GMip/bfTlUgHicwDP44JSTvTs02Kyom4=; 
        b=env2q6KeNYdV55Jy1oWWmf4NST8AWqg0c+z++ZShezUK6KIlSrZ/yXFcPOlfZI/Puij+TelHy/mjV0JGUewELfA2PRO0B200SwoPmbc11MCdB26VK7K9QLrP222BhDR7lqlSZNI3oQ07FNjvNFC2J+5e7xcbH6cPgCDTWMIcSOU=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586408795;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=oZguYgV4dt6GMip/bfTlUgHicwDP44JSTvTs02Kyom4=;
        b=KrcB7BQFuykNkEDk4Q17FFxcD5p9im+NmHklrjJgcdhUQwJ56DwSrKjOU8+bhI4V
        LPDlLQUJWYe8xurWhNLfPCi1zd1yFqF1xM97g1RsvvWgxpZ8kJN4QubL0auAlVet2eC
        Z4u//YB+e3BbY12XsmKE5TncKWgqQGq1hHANZvdA=
Received: from flygoat-x1e (122.235.212.87 [122.235.212.87]) by mx.zoho.com.cn
        with SMTPS id 1586408793441802.0844748222644; Thu, 9 Apr 2020 13:06:33 +0800 (CST)
Date:   Thu, 9 Apr 2020 13:06:31 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Hamish Martin" <Hamish.Martin@alliedtelesis.co.nz>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: Dealing with holes in CPU address space
Message-ID: <20200409130631.69413b76@flygoat-x1e>
In-Reply-To: <f5c7a3387dde5667be4fc462838edfaefae31e16.camel@alliedtelesis.co.nz>
References: <fcb8f2655452f60a7c734e2ce54ac4d47eec7e92.camel@alliedtelesis.co.nz>
        <20200408152922.14f90ff3@flygoat-x1e>
        <2e10a19b6608a6c3413b52180c69500aa255a701.camel@alliedtelesis.co.nz>
        <dd91aa7f-ed7d-44de-6887-ad25c7e4d4ff@gmail.com>
        <f5c7a3387dde5667be4fc462838edfaefae31e16.camel@alliedtelesis.co.nz>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 9 Apr 2020 04:50:23 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> On Wed, 2020-04-08 at 21:03 -0700, Florian Fainelli wrote:
> > 
> > On 4/8/2020 2:33 PM, Chris Packham wrote:  
> > > On Wed, 2020-04-08 at 15:29 +0800, Jiaxun Yang wrote:  
> > > > On Wed, 8 Apr 2020 05:14:22 +0000
> > > > Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
> > > >   
> > > > > Hi All,
> > > > > 
> > > > > I'm trying to port an old Broadcom MIPS CPU (BCM53003) to a
> > > > > shiny
> > > > > new
> > > > > kernel. I have some old historic source from a long forgotten
> > > > > Broadcom
> > > > > LDK but I'd prefer to do things the modern way with device-
> > > > > trees.
> > > > > 
> > > > > The problem I've been grappling with is trying to open up
> > > > > access to
> > > > > all of the RAM on the board. It has 512MB of DDR2. The CPU has
> > > > > two
> > > > > areas where this appears. The first 128MB is from 0 to
> > > > > 0x07ffffff
> > > > > the
> > > > > second area is from 0x88000000 to 0x9fffffff.
> > > > > 
> > > > > SoC peripherals are at 0x18000000 and there is an IO window
> > > > > for flash
> > > > > at 0x20000000.
> > > > > 
> > > > > The old code has some custom tlb initialisation to deal with
> > > > > this
> > > > > but
> > > > > I figured it should be possible with the following dts
> > > > > snippet.
> > > > > 
> > > > >         memory@0 {
> > > > >                 device_type = "memory";
> > > > >                 reg = <0x00000000 0x08000000
> > > > >                        0x88000000 0x18000000>;
> > > > >         };
> > > > > 
> > > > > I end up with only 128MB available. This appears to be
> > > > > because the default HIGHMEM_START of 0x20000000 stops the rest
> > > > > from
> > > > > being made available. If I add an override of HIGHMEM_START to
> > > > > 0xffffffff I seem to have the full 512MB avaiable but then I
> > > > > get a
> > > > > kernel panic  
> > > > 
> > > > Hi,
> > > > 
> > > > Have you tried to enable CONFIG_HIGHMEM?
> > > >   
> > > 
> > > I have but that didn't seem to help. As I understand it HIGHMEM is
> > > intended for situations when you have more physical RAM that can
> > > be addressed (e.g. >4GB on a 32-bit system).  
> > 
> > On MIPS you may have to enable HIGHMEM as soon as you run out of
> > virtual
> > kernel address space to map the entire amount of memory that is
> > populated AFAICT. The kernel has a little under 1GB of virtual
> > address
> > space that can be mapped via the TLB since the first 512MB are
> > occupied
> > by KSEG0/1.
> >   
> 
> My adventures thus far with HIGHMEM have got as far as
> 
>   This processor doesn't support highmem. 2490368k highmem ignored
> 
> Which I think has something to do with the max_low_pfn and highend_pfn
> being different.
> 

You might have cpu_has_dc_aliases defined.
HIGHMEM is unsafe on these systems due to Cache Alias issue.

Here is a comment in mips/kernel/cpu-probe.c:

/*
 * Early versions of the 74K do not update the cache tags on a
 * vtag miss/ptag hit which can occur in the case of KSEG0/KUSEG
 * aliases.  In this case it is better to treat the cache as always
 * having aliases.  Also disable the synonym tag update feature
 * where available.  In this case no opportunistic tag update will
 * happen where a load causes a virtual address miss but a physical
 * address hit during a D-cache look-up.
 */

Probably you system have this kind of issue?

You can determine waysize of D-Cache and set a larger pagesize.

--
Jiaxun Yang

