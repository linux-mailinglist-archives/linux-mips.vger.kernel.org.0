Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6AED2D9D1A
	for <lists+linux-mips@lfdr.de>; Mon, 14 Dec 2020 18:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440300AbgLNQ7p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Dec 2020 11:59:45 -0500
Received: from elvis.franken.de ([193.175.24.41]:40395 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440307AbgLNQ73 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Dec 2020 11:59:29 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1korBJ-0006zU-00; Mon, 14 Dec 2020 17:58:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 311E2C037B; Mon, 14 Dec 2020 16:32:55 +0100 (CET)
Date:   Mon, 14 Dec 2020 16:32:55 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] MIPS: mm: Clean up setup of protection map
Message-ID: <20201214153255.GA9983@alpha.franken.de>
References: <20201113110952.68086-1-tsbogend@alpha.franken.de>
 <20201113110952.68086-4-tsbogend@alpha.franken.de>
 <20201212160716.GA206510@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212160716.GA206510@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Dec 12, 2020 at 08:29:23AM -0800, Guenter Roeck wrote:
> On Fri, Nov 13, 2020 at 12:09:52PM +0100, Thomas Bogendoerfer wrote:
> > Protection map difference between RIXI and non RIXI cpus is _PAGE_NO_EXEC
> > and _PAGE_NO_READ usage. Both already take care of cpu_has_rixi while
> > setting up the page bits. So we just need one setup of protection map
> > and can drop the now unused (and broken for RIXI) PAGE_* defines.
> > 
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> 
> This patch results in:
> 
> drivers/video/fbdev/udlfb.c: In function 'dlfb_ops_mmap':
> drivers/video/fbdev/udlfb.c:343:52: error: 'PAGE_SHARED' undeclared (first use in this function)
>   343 |   if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
>       |                                                    ^~~~~~~~~~~
> 
> when building mips:allmodconfig.

thank you for the report, I've pushed a fix to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
