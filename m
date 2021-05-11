Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD6637B041
	for <lists+linux-mips@lfdr.de>; Tue, 11 May 2021 22:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhEKUtX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 May 2021 16:49:23 -0400
Received: from elvis.franken.de ([193.175.24.41]:50409 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhEKUtV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 May 2021 16:49:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lgZIb-0003nj-00; Tue, 11 May 2021 22:48:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 20819C0E13; Tue, 11 May 2021 22:40:52 +0200 (CEST)
Date:   Tue, 11 May 2021 22:40:52 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [RFT PATCH] MIPS: Octeon: drop dependency on CONFIG_HOLES_IN_ZONE
Message-ID: <20210511204052.GA18185@alpha.franken.de>
References: <20210418093512.668-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210418093512.668-1-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 18, 2021 at 12:35:12PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> CAVIUM_OCTEON_SOC configuration selects HOLES_IN_ZONE option to cope with
> memory crashes that were happening in 2011.
> 
> This option effectively aliases pfn_valid_within() to pfn_valid() when
> enabled and hardwires it to 1 when disabled. The check for
> pfn_valid_within() is only relevant in case the memory map may have holes
> or undefined struct page instances inside MAX_ORDER chunks.
> 
> Since 2011 memory management initialization in general and memory map
> initialization particularly became much more robust so the check for
> pfn_valid_within() is not required on Octeon even despite its, hmm, unusual
> memory setup.
> 
> Remove the selection of HOLES_IN_ZONE by CAVIUM_OCTEON_SOC and drop the
> HOLES_IN_ZONE configuration option entirely as Octeon was the only MIPS
> platform to use it.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
> 
> Hi,
> 
> I've tried to find why Octeon needed CONFIG_HOLES_IN_ZONE in the first
> place, but there is nothing except the changelog in commit 465aaed0030b
> ("MIPS: Octeon: Select CONFIG_HOLES_IN_ZONE"):
> 
>   Current Octeon systems do in fact have holes in their memory zones.
>   We need to select HOLES_IN_ZONE. If we do not, some memory configurations
>   will result in crashes at boot time
> 
> Since then there were too many changes around memory management
> initialization both in the generic mm and on the MIPS side to track what
> exactly could case the crashes.
> 
> I'm pretty confident that HOLES_IN_ZONE is not required for Octeon systems
> anymore and can be removed.
> 
> I'd really appreciate if somebody with access to an Octeon system could
> test this patch.
> 
>  arch/mips/Kconfig | 4 ----
>  1 file changed, 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
