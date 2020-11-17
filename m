Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18EE2B5E97
	for <lists+linux-mips@lfdr.de>; Tue, 17 Nov 2020 12:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgKQLsG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Nov 2020 06:48:06 -0500
Received: from elvis.franken.de ([193.175.24.41]:38091 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbgKQLsG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Nov 2020 06:48:06 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kezSu-00020u-00; Tue, 17 Nov 2020 12:48:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A39BDC0216; Tue, 17 Nov 2020 12:47:31 +0100 (CET)
Date:   Tue, 17 Nov 2020 12:47:31 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: Fix for_each_memblock conversion
Message-ID: <20201117114731.GA9498@alpha.franken.de>
References: <20201116174516.144243-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116174516.144243-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 16, 2020 at 06:45:15PM +0100, Thomas Bogendoerfer wrote:
> The loop over all memblocks works with PFN numbers and not physical
> addresses, so we need for_each_mem_pfn_range().
> 
> Fixes: b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/setup.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
