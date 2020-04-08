Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A65DB1A1CA3
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 09:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgDHHaI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 03:30:08 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17696 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726689AbgDHHaI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 03:30:08 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586330965; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=Iycq5DlQ6SOtacyxA7XZxR+thyTuiVVtzIWJLfYi9XnYxwGhquS9MqjNxszhk68P93h2x/7dxVpMgRXoSCcAPgARjQvIXh82P7GdTOu2BxTJaN9dQPyYMjoI92rEi+vW0A/kuUXFpUSKL9VoqJDCNboJlMyN+qX7Hb+L5Xzt08I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586330965; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=GNVZm3rqhhIk0ti5k0VINiyIi16Ulbzcehh+RXhWBNo=; 
        b=kFOW50PX46xQnCjo1S9w/CKkkNsmhmFe6T8h68JG7hifzrhUmnQvqDakglihp1+bYTRwUETIsyKh0IoxOxRWGKLlnYOyPig8mUMxpam7t2+657NH+DRAlq90Vc7inTHzN9n2KfFTY5r4Pj61ddypTKfEq2Eoa7D4zAAw3KsyIU8=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586330965;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=GNVZm3rqhhIk0ti5k0VINiyIi16Ulbzcehh+RXhWBNo=;
        b=f3B2OdmvXKAck7Mb/q3crvtDKQsn3TqdDLfCWY1ykXQUh20aHjtdXwLV1za0TCiZ
        Z0CaBXE+JD68vRly4w2Edx3HMUCpG+d2NiopxKxm91CoVqdsSG8UcENlN3iqq4pGn53
        zi7KH3G50PelkIl4AWUKhk8gHzg/fJ+KNV4oQbhA=
Received: from flygoat-x1e (183.156.33.240 [183.156.33.240]) by mx.zoho.com.cn
        with SMTPS id 1586330963417478.574454780491; Wed, 8 Apr 2020 15:29:23 +0800 (CST)
Date:   Wed, 8 Apr 2020 15:29:22 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Hamish Martin" <Hamish.Martin@alliedtelesis.co.nz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: Dealing with holes in CPU address space
Message-ID: <20200408152922.14f90ff3@flygoat-x1e>
In-Reply-To: <fcb8f2655452f60a7c734e2ce54ac4d47eec7e92.camel@alliedtelesis.co.nz>
References: <fcb8f2655452f60a7c734e2ce54ac4d47eec7e92.camel@alliedtelesis.co.nz>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 8 Apr 2020 05:14:22 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi All,
> 
> I'm trying to port an old Broadcom MIPS CPU (BCM53003) to a shiny new
> kernel. I have some old historic source from a long forgotten Broadcom
> LDK but I'd prefer to do things the modern way with device-trees.
> 
> The problem I've been grappling with is trying to open up access to
> all of the RAM on the board. It has 512MB of DDR2. The CPU has two
> areas where this appears. The first 128MB is from 0 to 0x07ffffff the
> second area is from 0x88000000 to 0x9fffffff.
> 
> SoC peripherals are at 0x18000000 and there is an IO window for flash
> at 0x20000000.
> 
> The old code has some custom tlb initialisation to deal with this but
> I figured it should be possible with the following dts snippet.
> 
>         memory@0 {
>                 device_type = "memory";
>                 reg = <0x00000000 0x08000000
>                        0x88000000 0x18000000>;
>         };
> 
> I end up with only 128MB available. This appears to be
> because the default HIGHMEM_START of 0x20000000 stops the rest from
> being made available. If I add an override of HIGHMEM_START to
> 0xffffffff I seem to have the full 512MB avaiable but then I get a
> kernel panic

Hi,

Have you tried to enable CONFIG_HIGHMEM?

> 
>   CPU 0 Unable to handle kernel paging request at virtual address
> 1fc00000, epc == 800167b8, ra == 800e2860
> 
> 0x1fc00000 is in the range where the SoC peripherals are so I'm
> thinking that is the problem. But then again that is a virtual address
> so maybe it's just a co-incidence.

0x1fc00000 should be the Boot ROM's physical address. Probably you
forgot to convert it into virtual address in your platform code?

Check the EPC of exception in vmlinux with addr2line may help. (Don't
forget to compile your kernel with debuginfo). 

> 
> Anyway I'd really appreciate any guidance that anyone could provide on
> this. Even if it's just "go look at this SoC".
> 
> Thanks,
> Chris
> 
> 

--
Jiaxun Yang
