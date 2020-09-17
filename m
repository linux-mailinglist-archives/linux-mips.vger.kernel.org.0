Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D849F26DD57
	for <lists+linux-mips@lfdr.de>; Thu, 17 Sep 2020 15:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbgIQN64 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Sep 2020 09:58:56 -0400
Received: from elvis.franken.de ([193.175.24.41]:43209 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727242AbgIQN6q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Sep 2020 09:58:46 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kIuQi-0006iI-00; Thu, 17 Sep 2020 15:58:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8E28CC0FCF; Thu, 17 Sep 2020 15:55:15 +0200 (CEST)
Date:   Thu, 17 Sep 2020 15:55:15 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SNI: Fix spurious interrupts
Message-ID: <20200917135515.GA12790@alpha.franken.de>
References: <20200916135437.60572-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916135437.60572-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 16, 2020 at 03:54:37PM +0200, Thomas Bogendoerfer wrote:
> On A20R machines the interrupt pending bits in cause register need to be
> updated by requesting the chipset to do it. This needs to be done to
> find the interrupt cause and after interrupt service. In
> commit 0b888c7f3a03 ("MIPS: SNI: Convert to new irq_chip functions") the
> function to do after service update got lost, which caused spurious
> interrupts.
> 
> Fixes: 0b888c7f3a03 ("MIPS: SNI: Convert to new irq_chip functions")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/sni/a20r.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
