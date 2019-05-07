Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13C4716D8A
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2019 00:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfEGWgO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 18:36:14 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45899 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfEGWgO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 May 2019 18:36:14 -0400
Received: by mail-lf1-f65.google.com with SMTP id n22so5494227lfe.12;
        Tue, 07 May 2019 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4R5ifsup3NykhfRTLDToqK948qspJ5mN7zRILNuTmJI=;
        b=JZlFoukSAz1HM3PmXPF5oBf51z0VlGSx/HjQHd3a4ZmMdBpmDhXnqv5naD5DGrXXXa
         wq8pg2+ARP3oN5zqiDGOiQmkr0visLyBmCt7Cu+ZFFD48vWcZWHcsWJtq8xKhDlV5QPf
         1TbbO70/jiMWtnMCPdOgvTse0Za9otU4wb1arqG+2yFZF8I8EvEknQbYKc4nYiz+LWOB
         TzX3hUaSmz8qfAhFfZ2n5gBzmF1JPeau/XDeI9PnpsVfsiCoz0/5k0exyqfxtFj1zoi5
         QBU/uUUj+3aBOjS/9p4xl80RRcTfcQl5CY9zpG0Q7XlrV2d16PUk4wl2QV1vdsGiHJlQ
         w9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4R5ifsup3NykhfRTLDToqK948qspJ5mN7zRILNuTmJI=;
        b=MVSWCPlYcydqxtubzMxoy8lVyzIKAzTx1HwCc/3XmqS24IEcLyViXeh2UfVy6ax3e7
         +CcwutzTn0jwYecPwGrR+rR8GymK98pkU2/JGGapdGO+N1ew5dpBWUv+iYGJQGt8HdCa
         l2+IPvtdNSHWk0S6i6shMppuCGv5XkF627QCAk4Kc930xa+0z1TlpwInFWa/7JUhTg9w
         cLcsqhJw/wj3dkX+mH7vwLMsNhD7W37fEn3qWBmyxpZCsA4edHnKK3dvIHw5TUOD7fMb
         WEQdBWd9sMVg895IqHZS6Cj5HZpn9IkZ7OvQsR4fmWnx5P9fz7Q/P6vXbLGPAeNx/cKT
         EdaA==
X-Gm-Message-State: APjAAAU0AKJy11gcOn6bn7bMgSc3235IhEQda4oCZAhiBV61CBug9b7m
        E9LYiEOKdsdhte+of0vRLcYRJUMmKJM=
X-Google-Smtp-Source: APXvYqxOhgMqhog8aPTzNg9obMq+Vt6l/VcrUdM7E4d++XZQODhcHDy4g/pG7AG51YePERzmQ0Z9/g==
X-Received: by 2002:ac2:5582:: with SMTP id v2mr17802681lfg.19.1557268571015;
        Tue, 07 May 2019 15:36:11 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id r21sm3442159ljg.51.2019.05.07.15.36.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 07 May 2019 15:36:10 -0700 (PDT)
Date:   Wed, 8 May 2019 01:36:07 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] mips: Print the kernel virtual mem layout on
 debugging
Message-ID: <20190507223603.ewuye6lutbb5wz2l@mobilestation>
References: <20190503175041.7949-1-fancer.lancer@gmail.com>
 <20190503175041.7949-4-fancer.lancer@gmail.com>
 <20190506191419.w3qtkgcjrjjuzwmu@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190506191419.w3qtkgcjrjjuzwmu@pburton-laptop>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Paul

On Mon, May 06, 2019 at 07:14:21PM +0000, Paul Burton wrote:
> Hi Serge,
> 
> On Fri, May 03, 2019 at 08:50:39PM +0300, Serge Semin wrote:
> > It is useful at least for debugging to have the kernel virtual
> > memory layout printed at boot time so to have the full information
> > about the booted kernel. Make the printing optional and available
> > only when DEBUG_KERNEL config is enabled so not to leak a sensitive
> > kernel information.
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > ---
> >  arch/mips/mm/init.c | 49 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> 
> FYI the rest of the series is in mips-next, but I left this one out
> because it gives me compile errors for 64r6el_defconfig:
> 
> In file included from ./include/linux/printk.h:7,
>                  from ./include/linux/kernel.h:15,
>                  from ./include/asm-generic/bug.h:18,
>                  from ./arch/mips/include/asm/bug.h:42,
>                  from ./include/linux/bug.h:5,
>                  from arch/mips/mm/init.c:11:
> arch/mips/mm/init.c: In function ‘mem_print_kmap_info’:
> ./include/linux/kern_levels.h:5:18: error: format ‘%ld’ expects argument of type ‘long int’, but argument 4 has type ‘long long unsigned int’ [-Werror=format=]
>  #define KERN_SOH "\001"  /* ASCII Start Of Header */
>                   ^~~~~~
> ./include/linux/kern_levels.h:13:21: note: in expansion of macro ‘KERN_SOH’
>  #define KERN_NOTICE KERN_SOH "5" /* normal but significant condition */
>                      ^~~~~~~~
> ./include/linux/printk.h:307:9: note: in expansion of macro ‘KERN_NOTICE’
>   printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
>          ^~~~~~~~~~~
> arch/mips/mm/init.c:69:2: note: in expansion of macro ‘pr_notice’
>   pr_notice("Kernel virtual memory layout:\n"
>   ^~~~~~~~~
> arch/mips/mm/init.c:70:39: note: format string is defined here
>      "    lowmem  : 0x%px - 0x%px  (%4ld MB)\n"
>                                     ~~~^
>                                     %4lld
> In file included from ./arch/mips/include/asm/bug.h:5,
>                  from ./include/linux/bug.h:5,
>                  from arch/mips/mm/init.c:11:
> In function ‘mem_print_kmap_info’,
>     inlined from ‘mem_init’ at arch/mips/mm/init.c:530:2:
> ./include/linux/compiler.h:344:38: error: call to ‘__compiletime_assert_99’ declared with attribute error: BUILD_BUG_ON failed: FIXADDR_TOP < PAGE_OFFSET
>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>                                       ^
> ./include/linux/compiler.h:325:4: note: in definition of macro ‘__compiletime_assert’
>     prefix ## suffix();    \
>     ^~~~~~
> ./include/linux/compiler.h:344:2: note: in expansion of macro ‘_compiletime_assert’
>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>   ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro ‘compiletime_assert’
>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                      ^~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:50:2: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
>   BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>   ^~~~~~~~~~~~~~~~
> arch/mips/mm/init.c:99:2: note: in expansion of macro ‘BUILD_BUG_ON’
>   BUILD_BUG_ON(FIXADDR_TOP < PAGE_OFFSET);
>   ^~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[3]: *** [scripts/Makefile.build:278: arch/mips/mm/init.o] Error 1
> make[2]: *** [scripts/Makefile.build:489: arch/mips/mm] Error 2
> 
> Thanks,
>     Paul

Thanks for the report regarding this issue. I actually thought I tested the patch
being buildable for 64bit systems. It turns out I didn't.(

Should I resend the fixed patch as a separate v3 one In-Reply-to this v2 patch
or resubmit the patchset with cover-letter and only the fixed patch being there?

Cheers,
-Sergey
