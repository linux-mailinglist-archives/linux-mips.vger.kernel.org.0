Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6306287ECF
	for <lists+linux-mips@lfdr.de>; Fri,  9 Oct 2020 00:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbgJHWvm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 18:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbgJHWvm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Oct 2020 18:51:42 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1912FC0613D2;
        Thu,  8 Oct 2020 15:51:42 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id c141so1928954lfg.5;
        Thu, 08 Oct 2020 15:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+VlAI1YSrsYI6fzVFb3g9FcKulcdSQODpndVq6tk5uk=;
        b=IpMzov0XwVz6y2DN9VpJrCf8gcG44HJ6YkUwVt3g2DMHLVTYxKt4HkK+Ocj9EKaif0
         z6bqK6aXY9KloOilUcrWnUrIpZLfVq6/UAO7bypcCeAQiUaCyGuRxNsp2dO2Zu9IvG17
         UTK7/ut3eg0UIkCZyCIqTE1WEfWj61xVyJmkTlLI4E4+xaQi4qILEtSREaSFhg7YckZX
         Oqenk5GPhrTvjX87AUQoEFJ1XhcU15D+FuFNJJOfP6bfs5GozlVznCNV+o4RmipZD9UJ
         yiEwgw0ccGWNCj+Wu7qcf3Di6OHpgJPQiUyLvlYXt9/T97HcsSabAPp2Wi4ljcKdIZ7h
         xzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+VlAI1YSrsYI6fzVFb3g9FcKulcdSQODpndVq6tk5uk=;
        b=YOAs+WGzGHtoYdmzmEGrUa7Cab/UG23UaqwTXPrhPNJ5Zoy8JRvO/n0oXlpJLtMUE3
         6vcOqxJeceFb8Yjh2p02vIgUiLmX7lUCJaG1JtbQJOh5vG7RzMVKa8uudUKclpHP2sAJ
         tGcgYauZnD9/aM4dPZi7V2sS9YedfO3U4WKoqrJ7H9HnF9eKm0k2Xi0uU57AhzL5gL7Y
         85hXlvEEhARZZ82axUDp/+so3c1wneO6cY1lLhdJzTMonPLXE6q+YMpFAYMBOYNMtF27
         H8GcbRXgUQoUkZppel1lEmNc5JcDbutbRGfoL5TOUnKQTUPKFsgX2DCwuqx8wApG3Ygc
         MbeA==
X-Gm-Message-State: AOAM532gSWyZPW8oOKDCUBkVBT85P6XiWw364Nz7J3zC9S7zEtbP7e2L
        fY/jS4hYasXl2BVn268onW4=
X-Google-Smtp-Source: ABdhPJz8peLdBnw2a3w8E0KNLkKDaDyZrhi00t6H64Vw12F6R9mSo/sp2NbTJj+KC9Ql17fdfHdCbg==
X-Received: by 2002:a19:ca1e:: with SMTP id a30mr3180759lfg.575.1602197500497;
        Thu, 08 Oct 2020 15:51:40 -0700 (PDT)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id z19sm662792lfr.46.2020.10.08.15.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 15:51:39 -0700 (PDT)
Date:   Fri, 9 Oct 2020 01:51:37 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] MIPS: replace add_memory_region with memblock
Message-ID: <20201008225137.rbb7b6rogv3bbvi7@mobilestation>
References: <20201008084357.42780-1-tsbogend@alpha.franken.de>
 <20201008152006.4khkbzsxqmmz76rw@mobilestation>
 <alpine.LFD.2.21.2010081628100.866917@eddie.linux-mips.org>
 <20201008155454.kaal2bchjq7wusqr@mobilestation>
 <alpine.LFD.2.21.2010081739240.866917@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2010081739240.866917@eddie.linux-mips.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 08, 2020 at 05:56:17PM +0100, Maciej W. Rozycki wrote:
> On Thu, 8 Oct 2020, Serge Semin wrote:
> 
> > > > At least I don't see a decent reason to preserve them. The memory registration
> > > > method does nearly the same sanity checks. The memory reservation function
> > > > defers a bit in adding the being reserved memory first. That seems redundant,
> > > > since the reserved memory won't be available for the system anyway. Do I miss
> > > > something?
> > > 
> > 
> > >  At the very least it serves informational purposes as it shows up in 
> > > /proc/iomem.
> > 
> > I thought about that, but /proc/iomem prints the System RAM up. Adding the reserved
> > memory regions to be just memory region first still seem redundant, since
> > reserving a non-reflected in memory region most likely indicates an erroneous
> > dts. I failed to find that, but do the kernel or DTC make sure that the reserved
> > memory regions has actual memory behind? (At least in the framework of the
> > memblock.memory vs memblock.reserved arrays or in the DT source file)
> 
>  Reserved regions need not be RAM or a memory-like device.  

Agree. My statement about considering as error the situation when the
reserved-memory is declared with no backed DRAM region was most likely
wrong. But in this case what we currently do and what Thomas suggest to keep
doing in the framework of the MIPS-specific early_init_dt_reserve_memory_arch()
is probably incorrect, since the method makes sure that any added reserved
memory region is actually backed with DRAM (called both memblock_add() and
memblock_reserve() for such regions). None of the other platforms is noticed to
execute the same pattern.

> They could be 
> floating bus even.  Here's an example from my x86 laptop where all kinds 
> of stuff is marked reserved:
> 
> 00000000-00000fff : Reserved
> 00001000-0009cfff : System RAM
> 0009d000-0009ffff : Reserved

AFAICS from the ./arch/x86/kernel/e820.c code, the regions marked as "Reserved"
aren't mem-mapped by the kernel, since they are skipped in the method
e820__memblock_setup(), which is responsible for the x86-specific memory mapping
data conversion to the memblock. So the system doesn't consider them as a RAM
resource. Note each normal memory is supposed to be added to the memblock, so to
be then used by the buddy allocator for normal memory allocations.

Basically the x86-specific "Reserved" regions are similar to the regions added
by means of the "reserved-memory" DT sub-node with "no-map" property specified.
The problem in the topic is whether we must or must not make sure that each
reserved-memory region with no "no-map" property considered as normal memory
region backed with DRAM. The rest of the platforms currently just register the
"reserved-memory" regions in memblock.reserved with no checking whether they are
backed with corresponding DRAM region and with no adding them to the
memblock.memory pool. So most likely we ought to do the same in MIPS.

> ...
>
> 

> Actually another reason to mark regions reserved is to prevent them from 
> being claimed by the wrong driver or, perhaps more importantly, used for 
> assigning bus address ranges to hardware resources (BAR programming).

Right, AFAICS that's what the "reserved-memory" DT node has been introduced for.
By using it we can create a DMA/CMA memory pool fully dedicated for a particular
device, or just completely remove a memory region from the kernel virtual
mapping framework if instead of providing an access to the System RAM a region
is remapped to IO to/from some hardware resource.

-Sergey

> 
> > I also don't see the other platforms doing that, since the MIPS arch only
> > redefines these methods. So if a problem of adding a reserved memory with
> > possible no real memory behind exist, it should be fixed in the cross-platform
> > basis, don't you think?
> 
>  I think doing things in a generic way where possible is surely desired, 
> however platforms have different ways to discover resources and I can't 
> see offhand how this could be unified.  I haven't look at that code for a 
> while now, so I can't be more specific offhand.
> 
>   Maciej
> 
