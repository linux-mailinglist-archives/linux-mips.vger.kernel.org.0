Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBA323C7EB
	for <lists+linux-mips@lfdr.de>; Wed,  5 Aug 2020 10:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgHEIif (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Aug 2020 04:38:35 -0400
Received: from elvis.franken.de ([193.175.24.41]:35123 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbgHEIie (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 5 Aug 2020 04:38:34 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k3EwR-0008Mh-00; Wed, 05 Aug 2020 10:38:31 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 50BAFC0BDA; Wed,  5 Aug 2020 10:37:20 +0200 (CEST)
Date:   Wed, 5 Aug 2020 10:37:20 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Subject: Re: arch/mips/include/asm/mach-ip27/topology.h:19:7: error: implicit
 declaration of function 'hub_data'
Message-ID: <20200805083720.GA7297@alpha.franken.de>
References: <202008040108.xTarUIe8%lkp@intel.com>
 <20200803194910.GC72435@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803194910.GC72435@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 03, 2020 at 10:49:10PM +0300, Mike Rapoport wrote:
> On Tue, Aug 04, 2020 at 01:39:14AM +0800, kernel test robot wrote:
> [...]
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from arch/mips/include/asm/topology.h:11,
> >                     from include/linux/topology.h:36,
> >                     from include/linux/gfp.h:9,
> >                     from include/linux/slab.h:15,
> >                     from include/linux/crypto.h:19,
> >                     from include/crypto/hash.h:11,
> >                     from include/linux/uio.h:10,
> >                     from include/linux/socket.h:8,
> >                     from include/linux/compat.h:15,
> >                     from arch/mips/kernel/asm-offsets.c:12:
> >    arch/mips/include/asm/mach-ip27/topology.h:25:39: error: 'MAX_COMPACT_NODES' undeclared here (not in a function)
> >       25 | extern unsigned char __node_distances[MAX_COMPACT_NODES][MAX_COMPACT_NODES];
> >          |                                       ^~~~~~~~~~~~~~~~~
> >    include/linux/topology.h: In function 'numa_node_id':
> > >> arch/mips/include/asm/mach-ip27/topology.h:16:27: error: implicit declaration of function 'cputonasid' [-Werror=implicit-function-declaration]
> >       16 | #define cpu_to_node(cpu) (cputonasid(cpu))
> >          |                           ^~~~~~~~~~
> 
> This happens when randconfig disables NUMA and has SGI_IP27 enabled.
> Before switch from discontigmem to sparsemem, there always was
> CONFIG_NEED_MULTIPLE_NODES=y because it was selected by DISCONTIGMEM.
> Without DISCONTIGMEM it is possible to have SPARSEMEM without NUMA for
> SGI_IP27 and as many things there rely on custom node definition, the
> build breaks.
> 
> I don't remember small Origin or Onyx systems so I think it would be
> reasonable to make SGI_IP27 to select NUMA.

IMHO there are right now too many places in IP27 code, which assumes NUMA
enabled, so your patch makes sense. And if someone wants to get it
supported without NUMA enabled, I'm taking that patch as well.

> If the below patch makes sense I'll resend it formally.

yes please.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
