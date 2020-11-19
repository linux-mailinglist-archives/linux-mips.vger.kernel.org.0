Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4EC12B92EF
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 13:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgKSMzn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 07:55:43 -0500
Received: from elvis.franken.de ([193.175.24.41]:43170 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727298AbgKSMz3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Nov 2020 07:55:29 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kfjTD-00054t-04; Thu, 19 Nov 2020 13:55:27 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 71271C0259; Thu, 19 Nov 2020 13:54:40 +0100 (CET)
Date:   Thu, 19 Nov 2020 13:54:40 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] MIPS: mm: Clean up setup of protection map
Message-ID: <20201119125440.GE6314@alpha.franken.de>
References: <20201113110952.68086-1-tsbogend@alpha.franken.de>
 <20201113110952.68086-4-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113110952.68086-4-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 13, 2020 at 12:09:52PM +0100, Thomas Bogendoerfer wrote:
> Protection map difference between RIXI and non RIXI cpus is _PAGE_NO_EXEC
> and _PAGE_NO_READ usage. Both already take care of cpu_has_rixi while
> setting up the page bits. So we just need one setup of protection map
> and can drop the now unused (and broken for RIXI) PAGE_* defines.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/pgtable.h |  8 ------
>  arch/mips/mm/cache.c            | 55 ++++++++++++++---------------------------
>  2 files changed, 18 insertions(+), 45 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
