Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9832D22C47F
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jul 2020 13:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgGXLsG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 07:48:06 -0400
Received: from elvis.franken.de ([193.175.24.41]:47128 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726280AbgGXLsG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Jul 2020 07:48:06 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jywBI-0003GQ-02; Fri, 24 Jul 2020 13:48:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DD84BC09A9; Fri, 24 Jul 2020 13:15:55 +0200 (CEST)
Date:   Fri, 24 Jul 2020 13:15:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiri Slaby <jslaby@suse.cz>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: traps, add __init to parity_protection_init
Message-ID: <20200724111555.GC17183@alpha.franken.de>
References: <20200723094235.12706-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723094235.12706-1-jslaby@suse.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 23, 2020 at 11:42:35AM +0200, Jiri Slaby wrote:
> It references __initdata and is called only from an __init function:
> trap_init. This avoids section mismatches (which I am seeing with gcc
> 10).
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/kernel/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
