Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81472287DE1
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 23:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgJHVUs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 17:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725982AbgJHVUs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Oct 2020 17:20:48 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB9BC0613D2;
        Thu,  8 Oct 2020 14:20:48 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 184so8255532lfd.6;
        Thu, 08 Oct 2020 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YswObbWMgxkd2Es/EpjzmF8G0H6kB02USSUo8S+y6kY=;
        b=GhWLLKljFnCD9BsvCGQFfVvg9nN1pKAj+gmsHPpP1J5jQ6ndC0cMBTf566pqTwupUB
         KSPGUBbivmFnAI9WHviqhsHWKN8jsTUQts5YFgygnS5vwhBUIZDY128ZSlWHLlq1ACvg
         6HfALY01xCVJdlaJL3PRMXqLmBcYJu3flOu6/+cjMGKD7TVtlMJnwRp0S/c9hTFJdWnA
         zL2tXN/acalFvjLMmf0b0hjPPrexNiyuhQ4GnQVR/LIwTtaMFDzrWco2FkbT4DwVZ5Ao
         wCgrVzgDr0q76HUMPFUARREEmBWNPcK4fM6Fr6+ugBYBy8na7Oyo6htR/XcEJUpN1O2R
         Nh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YswObbWMgxkd2Es/EpjzmF8G0H6kB02USSUo8S+y6kY=;
        b=GpftzZ6mrFPOaG1z1lKqlHEerFinkXRPjN0X7I5swn4YKNqS0gNjMkWEdSPfy6v04a
         YB5IHkweKvooIL/BPCesmhBft4XVI2cyoGbyQY44lVS1kcrZHRUt1HB4ZNUTWrU5MoJG
         26BW4CGiPey4ur34eVH567g9wfsP/uvIWn+yQwN7dioB1MOOtl0WGtqx5EgaCkt5os8D
         6DVxBhL7xlCwC+0PhnQaFr29A+mxx9FLz6oQLB5Vn+M/2+fIyU+Wg48PEsfd+Zl2PqiY
         PzakWEbDd6b57Lnqbcxmzi3CoKt5yAomy0eiZ5pndJHU6rhJrvzQWj36ddx6zWuA9PG0
         pY6Q==
X-Gm-Message-State: AOAM53332bqKDHdhhuTDHyz7Ozck6yzRen1xxPQdJmWp+wC8bZ4G0X7j
        Gna5jhbGzwle/Q/KfURi8u8=
X-Google-Smtp-Source: ABdhPJwHl1H1UEj/AqlDCq7iMbPC8W4sohfIJ8YHEtsM2uph7672HBW7Wfr3Tlad05F0BxMgi3q33w==
X-Received: by 2002:ac2:58d2:: with SMTP id u18mr2050429lfo.390.1602192046634;
        Thu, 08 Oct 2020 14:20:46 -0700 (PDT)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id i11sm1155977ljn.119.2020.10.08.14.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 14:20:45 -0700 (PDT)
Date:   Fri, 9 Oct 2020 00:20:43 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] MIPS: replace add_memory_region with memblock
Message-ID: <20201008212043.uolf4orh6ctr6ihz@mobilestation>
References: <20201008084357.42780-1-tsbogend@alpha.franken.de>
 <20201008152006.4khkbzsxqmmz76rw@mobilestation>
 <alpine.LFD.2.21.2010081628100.866917@eddie.linux-mips.org>
 <20201008155454.kaal2bchjq7wusqr@mobilestation>
 <91e52fa1-ecf9-7acc-62f6-16fccfae927c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91e52fa1-ecf9-7acc-62f6-16fccfae927c@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 08, 2020 at 09:49:46AM -0700, Florian Fainelli wrote:
> 
> 
> On 10/8/2020 8:54 AM, Serge Semin wrote:
> > On Thu, Oct 08, 2020 at 04:30:35PM +0100, Maciej W. Rozycki wrote:
> > > On Thu, 8 Oct 2020, Serge Semin wrote:
> > > 
> > > > At least I don't see a decent reason to preserve them. The memory registration
> > > > method does nearly the same sanity checks. The memory reservation function
> > > > defers a bit in adding the being reserved memory first. That seems redundant,
> > > > since the reserved memory won't be available for the system anyway. Do I miss
> > > > something?
> > > 
> > 
> > >   At the very least it serves informational purposes as it shows up in
> > > /proc/iomem.
> > 
> > I thought about that, but /proc/iomem prints the System RAM up. Adding the reserved
> > memory regions to be just memory region first still seem redundant, since
> > reserving a non-reflected in memory region most likely indicates an erroneous
> > dts. I failed to find that, but do the kernel or DTC make sure that the reserved
> > memory regions has actual memory behind? (At least in the framework of the
> > memblock.memory vs memblock.reserved arrays or in the DT source file)
> 
> AFAICT DTC does not do any validation that regions you declare in
> /memreserve or /reserved-memory are within the 'reg' property defined for
> the /memory node.

> Not that it could not but that goes a little beyond is
> compiler job.

You are probably right, but it does the #{address,size}-cells validations
against the subnode' "reg" properties. It even does I2C controllers subnodes
"reg" validation so they wouldn't be greater than 7 or 10 bits wide. It also
does some magic checks of SPI controllers subnodes. See scripts/dtc/checks.c for
details. So I thought DTC might do some memory/reserved-memory validations too.
Apparently it doesn't. On the other hand it would probably be pointless, since a
system bootloader may change the "memory" node' "reg" value anyway if a platform
has a variable memory layout. So any validation being passed at the DTS compile
time wouldn't surely mean the memory/reserved-memory nodes coherency at the
system boot time.

> 
> The kernel ought to be able to do that validation through memblock but there
> could be valid use cases behind declaring a reserved memory region that is
> not backed by a corresponding DRAM region. For instance if you hotplugged
> memory through the sysfs probe interface, and that memory was not initially
> declared in the Device Tree, but there were reserved regions within that
> hot-plugged range that you would have to be aware of, then this would break.

Yeah, it seems to me all hot-pluggable regions are also marked as reserved. So
hot-plugging a memory device behind the manually reserved regions (reserved by
means of the DT reserved-memory/memreserve nodes) will unreserve them, which
most likely isn't what has been originally wanted.

Alas I don't have any hardware with hot-pluggable memory device to check out the
problem availability.

> 
> > 
> > I also don't see the other platforms doing that, since the MIPS arch only
> > redefines these methods. So if a problem of adding a reserved memory with
> > possible no real memory behind exist, it should be fixed in the cross-platform
> > basis, don't you think?
> 

> Would we be breaking any use case if we stopped allowing reserved region
> that are not part of DRAM being declared?

Hm, good question. I don't really know. But AFAICS from the reserved-memory node
DT bindings the reserved regions can be used to declare both normal RAM and some
vendor-specific regions. The later one theoretically can be some resource, bus or
memory-mapped device thing especially if it's marked with "no-map" boolean
property.

---

Getting back to the topic. In the MIPS-specific early_init_dt_reserve_memory_arch()
method (which is called for every region declared in reserved-memory/memreserve nodes)
we currently consider the reserved region as DRAM if 'no-map' property isn't specified.
The main question here is whether it is correct...

-Sergey

> -- 
> Florian
