Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC839B60E
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2019 20:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfHWSFw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Aug 2019 14:05:52 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36964 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404508AbfHWSFw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Aug 2019 14:05:52 -0400
Received: by mail-lj1-f195.google.com with SMTP id t14so9690152lji.4
        for <linux-mips@vger.kernel.org>; Fri, 23 Aug 2019 11:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=54HuLcXJRBmqmLj5M8KRhwZ0HialDx0iJt+LBWZjxns=;
        b=UUyF0nDXQ6XKk1yaAhF8QfXkeY+fEfwWr+MzdJW29tAurEYVLCCidU6PTXSjtwNIOp
         MQcjEJ9XfAZ4jqBp7lS2yvGUHryu/dfFHa+I2GbBr4ZmQYbuxG0v3FBubPg2cg3zbZLF
         7yCRJ15frsPOtjSRvTBETLFdD0IArr9pTl6niwZ3YeenT4fxeQrtwlKQ6Q30IZQqT3Y4
         ZiqIeIlWWURV3EZ31+jbTMQJJ8/aN9rRba2eLVMMsGKbCCyrN30Si9GTINDQ+d5jp3Wi
         dRFqH2WWZcAdnzyV5MxpRRRzhZLRNRS8Abhby6+hw65wew5zgtVSQtEr/Eq6lzpFXnF2
         ISJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=54HuLcXJRBmqmLj5M8KRhwZ0HialDx0iJt+LBWZjxns=;
        b=BQXzatIJPxpdaixfmtU5op5BO66VgWwHFcOXdSgys9epprmsx0v2UtPm7B/q34xU8r
         lsdzzbVrfjf84tYC0nMwxxX3l0nuUhFVsvPFtdTfk2ZE7ycvXx39XcfwCjdJT/DhioSq
         3O3IbP+6EvQoejDW5nX0FkDqqPujYwnuo7ANhJ0t4KHfrbkgCaj3y7rqGCD9Pc3Yopiq
         NP09JZrdQWyUyQoVKcDxxFwR1TXAC5y/3NczPHsPiw/D4rjmPjny1orSZStwSxFDWvCK
         eFMWTKEMcRpZpnOwap32HbpJ+0MNhxHfg0cQgSxPNq+YAj96j5Xs6cFlzcNUGVGxf++6
         wusA==
X-Gm-Message-State: APjAAAWVIQYquWviQo3NesAZpZFjGDZqM6qYDY18hAf5CBj8add48Obv
        tw5aaRtnTawI6+9UsYUymkc=
X-Google-Smtp-Source: APXvYqyeNYSz/PBF67Mjn6HVod+MTxkyMQZfYozcDAn1ucyWwoXjJmJc9YU2ifA+FuKEIZM1zmWS7Q==
X-Received: by 2002:a2e:9b02:: with SMTP id u2mr3729734lji.219.1566583549178;
        Fri, 23 Aug 2019 11:05:49 -0700 (PDT)
Received: from mobilestation ([5.166.200.232])
        by smtp.gmail.com with ESMTPSA id y10sm735566ljk.5.2019.08.23.11.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 11:05:48 -0700 (PDT)
Date:   Fri, 23 Aug 2019 21:05:46 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "yasha.che3@gmail.com" <yasha.che3@gmail.com>,
        "aurelien@aurel32.net" <aurelien@aurel32.net>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "matt.redfearn@mips.com" <matt.redfearn@mips.com>,
        "chenhc@lemote.com" <chenhc@lemote.com>
Subject: Re: [PATCH v1 0/8] MIPS: Drop boot_mem_map
Message-ID: <20190823180545.iypv4m2avuklsywu@mobilestation>
References: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
 <CY4PR2201MB1272B48BC8DCEACB50038F09C1A40@CY4PR2201MB1272.namprd22.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY4PR2201MB1272B48BC8DCEACB50038F09C1A40@CY4PR2201MB1272.namprd22.prod.outlook.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 23, 2019 at 02:45:08PM +0000, Paul Burton wrote:
> Hello,
> 
> Jiaxun Yang wrote:
> > v1: Reording patches, fixes according to Serge's suggestions,
> > fix maar section mismatch.
> > 
> > Jiaxun Yang (8):
> >   MIPS: OCTEON: Drop boot_mem_map
> >   MIPS: fw: Record prom memory
> >   MIPS: malta: Drop prom_free_prom_memory
> >   MIPS: msp: Record prom memory
> >   MIPS: ip22: Drop addr_is_ram
> >   MIPS: xlp: Drop boot_mem_map
> >   MIPS: mm: Drop boot_mem_map
> >   MIPS: init: Drop boot_mem_map
> > 
> >  arch/mips/cavium-octeon/dma-octeon.c |  17 +-
> >  arch/mips/cavium-octeon/setup.c      |   3 +-
> >  arch/mips/fw/arc/memory.c            |  24 +-
> >  arch/mips/include/asm/bootinfo.h     |  16 --
> >  arch/mips/include/asm/maar.h         |   8 +-
> 
> Series applied to mips-next.

it seems to me too late to set the tag...
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> > MIPS: OCTEON: Drop boot_mem_map
> >   commit 6cda3a5e002f
> >   https://git.kernel.org/mips/c/6cda3a5e002f
> >   
> >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> > 
> > MIPS: fw: Record prom memory
> >   commit 0df1007677d5
> >   https://git.kernel.org/mips/c/0df1007677d5
> >   
> >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> > 
> > MIPS: malta: Drop prom_free_prom_memory
> >   commit 79fd0fe44731
> >   https://git.kernel.org/mips/c/79fd0fe44731
> >   
> >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> > 
> > MIPS: msp: Record prom memory
> >   commit b3c948e2c00f
> >   https://git.kernel.org/mips/c/b3c948e2c00f
> >   
> >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> > 
> > MIPS: ip22: Drop addr_is_ram
> >   commit aa1edac13e5f
> >   https://git.kernel.org/mips/c/aa1edac13e5f
> >   
> >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> > 
> > MIPS: xlp: Drop boot_mem_map
> >   commit a121d6e0caf0
> >   https://git.kernel.org/mips/c/a121d6e0caf0
> >   
> >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> > 
> > MIPS: mm: Drop boot_mem_map
> >   commit a5718fe8f70f
> >   https://git.kernel.org/mips/c/a5718fe8f70f
> >   
> >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   [paul.burton@mips.com:
> >     - Fix bad MAAR address calculations.
> >     - Use ALIGN() & define maar_align to make it clearer what's going on
> >       with address manipulations.
> >     - Drop the new used field from struct maar_config.
> >     - Rework the RAM walk to avoid iterating over the cfg array needlessly
> >       to find the first unused entry, then count used entries at the end.
> >       Instead just keep the count as we go.]
> >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> > 
> > MIPS: init: Drop boot_mem_map
> >   commit a94e4f24ec83
> >   https://git.kernel.org/mips/c/a94e4f24ec83
> >   
> >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   [paul.burton@mips.com: Fix size calculation in check_kernel_sections_mem]
> >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> 
> Thanks,
>     Paul
> 
> [ This message was auto-generated; if you believe anything is incorrect
>   then please email paul.burton@mips.com to report it. ]
