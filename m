Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1C14389DD
	for <lists+linux-mips@lfdr.de>; Sun, 24 Oct 2021 17:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhJXPjq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Oct 2021 11:39:46 -0400
Received: from elvis.franken.de ([193.175.24.41]:37587 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229782AbhJXPjp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Oct 2021 11:39:45 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mefYp-0006bc-02; Sun, 24 Oct 2021 17:37:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 53A26C265F; Sun, 24 Oct 2021 17:27:10 +0200 (CEST)
Date:   Sun, 24 Oct 2021 17:27:10 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: octeon: Remove unused functions
Message-ID: <20211024152710.GC4721@alpha.franken.de>
References: <20211020153252.131281-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020153252.131281-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 20, 2021 at 05:32:51PM +0200, Thomas Bogendoerfer wrote:
> cvmx_helper_initialize_packet_io_local() is unused and after removing
> it cvmx_pko_initialize_local() is also unused.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/cavium-octeon/executive/cvmx-helper.c | 10 ----------
>  arch/mips/cavium-octeon/executive/cvmx-pko.c    | 14 --------------
>  arch/mips/include/asm/octeon/cvmx-helper.h      |  7 -------
>  arch/mips/include/asm/octeon/cvmx-pko.h         |  1 -
>  4 files changed, 32 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
