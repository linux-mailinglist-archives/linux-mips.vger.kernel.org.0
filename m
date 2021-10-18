Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BA44323A6
	for <lists+linux-mips@lfdr.de>; Mon, 18 Oct 2021 18:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbhJRQUx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Oct 2021 12:20:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:55141 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233200AbhJRQUw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Oct 2021 12:20:52 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mcVLT-0008Tz-01; Mon, 18 Oct 2021 18:18:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2C484C2616; Mon, 18 Oct 2021 18:17:26 +0200 (CEST)
Date:   Mon, 18 Oct 2021 18:17:26 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] bcm47xx: Get rid of redundant 'else'
Message-ID: <20211018161726.GB16375@alpha.franken.de>
References: <20211013134940.83295-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013134940.83295-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 13, 2021 at 04:49:39PM +0300, Andy Shevchenko wrote:
> In the snipped like
> 
> 	if (...)
> 		return ...;
> 	else
> 
> the 'else' is redundant. Get rid of it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/mips/pci/pci-bcm47xx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
