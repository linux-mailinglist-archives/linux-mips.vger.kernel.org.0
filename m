Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C18817364F
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 12:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgB1LqV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 06:46:21 -0500
Received: from elvis.franken.de ([193.175.24.41]:42085 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgB1LqV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 Feb 2020 06:46:21 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1j7e5y-0008UT-01; Fri, 28 Feb 2020 12:46:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 94C2AC0EC3; Fri, 28 Feb 2020 12:46:08 +0100 (CET)
Date:   Fri, 28 Feb 2020 12:46:08 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v1] MIPS: reduce print level for cache information
Message-ID: <20200228114608.GB10905@alpha.franken.de>
References: <20200228055238.11140-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228055238.11140-1-o.rempel@pengutronix.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 28, 2020 at 06:52:38AM +0100, Oleksij Rempel wrote:
> Default printk log level is KERN_WARNING. This makes automatic log
> parsing problematic, since we get false positive alarms on not critical
> information.
> 
> Set all not critical cache related information to KERN_INFO, the same level
> as used on most kernel drivers.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/mips/mm/c-octeon.c | 18 +++++++++---------
>  arch/mips/mm/c-r3k.c    |  4 ++--
>  arch/mips/mm/c-r4k.c    | 20 ++++++++++----------
>  arch/mips/mm/c-tx39.c   |  4 ++--
>  4 files changed, 23 insertions(+), 23 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
