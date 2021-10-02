Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBF641FA69
	for <lists+linux-mips@lfdr.de>; Sat,  2 Oct 2021 10:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbhJBIeC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 Oct 2021 04:34:02 -0400
Received: from elvis.franken.de ([193.175.24.41]:54800 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232547AbhJBIeC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 2 Oct 2021 04:34:02 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mWaRJ-0002NQ-00; Sat, 02 Oct 2021 10:32:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D7B5EC1D25; Sat,  2 Oct 2021 10:25:31 +0200 (CEST)
Date:   Sat, 2 Oct 2021 10:25:31 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Greg Ungerer <gerg@kernel.org>,
        Strontium <strntydog@gmail.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] MIPS: Revert "add support for buggy MT7621S core
 detection"
Message-ID: <20211002082531.GA4254@alpha.franken.de>
References: <20210930165741.9662-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930165741.9662-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 30, 2021 at 09:57:41AM -0700, Ilya Lipnitskiy wrote:
> This reverts commit 6decd1aad15f56b169217789630a0098b496de0e. CPULAUNCH
> register is not set properly by some bootloaders, causing a regression
> until a bootloader change is made, which is hard if not impossible on
> some embedded devices. Revert the change until a more robust core
> detection mechanism that works on MT7621S routers such as Netgear R6220
> as well as platforms like Digi EX15 can be made.
> 
> Link: https://lore.kernel.org/lkml/4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org
> Fixes: 6decd1aad15f ("MIPS: add support for buggy MT7621S core detection")
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/include/asm/mips-cps.h | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
