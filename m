Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B06253C0E
	for <lists+linux-mips@lfdr.de>; Thu, 27 Aug 2020 05:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgH0DMb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Aug 2020 23:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgH0DMa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Aug 2020 23:12:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5700FC0612A3;
        Wed, 26 Aug 2020 20:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=xeNavqw5VrEUhK1uC5SznmQUTraq5Hr4BCCsMByRsaI=; b=YpT/6OF/Gpyyb1tY7UT8DwNc0I
        tFI/88DFWeXSQmA721mD00+5P8ucXGbX9dP60A+99p1JQPchNJh1Xq9kPw7LRbJwt3hiWzmTKz/KH
        dws/BCGIKixIhx17rIDQv0MWEbrxnbUXmyNZcDpw2eD/+78PYE2z0gp9K0mVRT5KUevIistUUAP0I
        6caaYXd9pcpPBoDi4/MQ+1mmaa8XYNMQw/MaXcYFKKOiW2K7xwTVECPjpqqxwOOngzrL5GEUT3GFr
        dGeIDdBreF/qwOahd84rmbAi6wqIaXQxvBGAzJbuKgiMdIfu8ahGG/eumx1Bvw3jDTBpxH0XSLrwe
        /mK/z8fQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kB8Km-0001jN-Il; Thu, 27 Aug 2020 03:12:16 +0000
Date:   Thu, 27 Aug 2020 04:12:16 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     hejinyang <hejinyang@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson: Fix complie errors without CONFIG_SMP
Message-ID: <20200827031216.GB14765@casper.infradead.org>
References: <1598446407-8845-1-git-send-email-hejinyang@loongson.cn>
 <20200826130122.GR17456@casper.infradead.org>
 <5394f030-104c-f191-e581-4f1ed23a85a6@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5394f030-104c-f191-e581-4f1ed23a85a6@loongson.cn>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 27, 2020 at 10:31:33AM +0800, hejinyang wrote:
> 
> 
> On 08/26/2020 09:01 PM, Matthew Wilcox wrote:
> > On Wed, Aug 26, 2020 at 08:53:27PM +0800, Jinyang He wrote:
> > > +++ b/arch/mips/include/asm/mach-loongson64/topology.h
> > > @@ -4,7 +4,11 @@
> > >   #ifdef CONFIG_NUMA
> > > +#ifdef CONFIG_SMP
> > >   #define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
> > > +#else
> > > +#define cpu_to_node(cpu)	0
> > > +#endif
> > Are you saying you've enabled NUMA without enabling SMP?  Does that make
> > sense?
> 
> NUMA option normally work with more than two nodes, though Loongson64 use it
> default after patch 6fbde6b492dfc761ad60a68fb2cb32b1eb05b786. Loongson64(3A)'s
> each node consists of 4 cpus while it only has 4 cpus. In other words, it has
> only one node while open NUMA. I'm confused it if NUMA deponds on SMP.
> 
> I'll try fix it with unabling NUMA and SMP later.

mips:
config NUMA
        bool "NUMA Support"
        depends on SYS_SUPPORTS_NUMA

x86:
config NUMA
        bool "NUMA Memory Allocation and Scheduler Support"
        depends on SMP

If you had a good reason for enabling NUMA without enabling SMP (CPU-less
memory nodes?), that'd be an interesting discussion to have.  Since your
hardware seems to have SMP by default, I'd suggest just adding the missing
'depends'.
