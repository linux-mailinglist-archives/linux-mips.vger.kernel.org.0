Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFAEC26D838
	for <lists+linux-mips@lfdr.de>; Thu, 17 Sep 2020 11:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgIQJ70 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Sep 2020 05:59:26 -0400
Received: from elvis.franken.de ([193.175.24.41]:42924 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbgIQJ7Z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Sep 2020 05:59:25 -0400
X-Greylist: delayed 1028 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 05:59:24 EDT
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kIqQh-0004Ws-00; Thu, 17 Sep 2020 11:42:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 41142C0FCD; Thu, 17 Sep 2020 11:41:26 +0200 (CEST)
Date:   Thu, 17 Sep 2020 11:41:26 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <florian@openwrt.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SNI: Fix MIPS_L1_CACHE_SHIFT
Message-ID: <20200917094126.GA8484@alpha.franken.de>
References: <20200914160500.21356-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914160500.21356-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 14, 2020 at 06:05:00PM +0200, Thomas Bogendoerfer wrote:
> Commit 930beb5ac09a ("MIPS: introduce MIPS_L1_CACHE_SHIFT_<N>") forgot
> to select the correct MIPS_L1_CACHE_SHIFT for SNI RM. This breaks non
> coherent DMA because of a wrong allocation alignment.
> 
> Fixes: 930beb5ac09a ("MIPS: introduce MIPS_L1_CACHE_SHIFT_<N>")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
