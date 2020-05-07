Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BAB1C8555
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 11:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgEGJFj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 05:05:39 -0400
Received: from elvis.franken.de ([193.175.24.41]:43337 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgEGJFi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 05:05:38 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jWcTI-0006gt-00; Thu, 07 May 2020 11:05:36 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 816B2C03A8; Thu,  7 May 2020 10:40:58 +0200 (CEST)
Date:   Thu, 7 May 2020 10:40:58 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] MIPS: ingenic: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
Message-ID: <20200507084058.GA9624@alpha.franken.de>
References: <20200506090452.1290-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506090452.1290-1-geert+renesas@glider.be>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 06, 2020 at 11:04:52AM +0200, Geert Uytterhoeven wrote:
> The JZ4740 setup code is not a clock provider, and just needs to call
> of_clk_init().
> 
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
> 
> Fixes: f932449c11dabb4b ("MIPS: ingenic: Drop obsolete code, merge the rest in setup.c")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/mips/jz4740/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Does this need to go via mips-fixes ? Or is mips-next good enough ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
