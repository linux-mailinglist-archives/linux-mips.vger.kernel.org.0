Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021642F9CF5
	for <lists+linux-mips@lfdr.de>; Mon, 18 Jan 2021 11:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388423AbhARKjn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Jan 2021 05:39:43 -0500
Received: from elvis.franken.de ([193.175.24.41]:33126 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388503AbhARJSQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Jan 2021 04:18:16 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l1Qf1-0004jQ-00; Mon, 18 Jan 2021 10:17:19 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 831F1C0584; Mon, 18 Jan 2021 09:40:02 +0100 (CET)
Date:   Mon, 18 Jan 2021 09:40:02 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     jiaxun.yang@flygoat.com, yangtiezhu@loongson.cn,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: cacheinfo: Remove unnecessary increment of level
Message-ID: <20210118084002.GA5637@alpha.franken.de>
References: <1610786400-3629-1-git-send-email-jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610786400-3629-1-git-send-email-jrdr.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jan 16, 2021 at 02:10:00PM +0530, Souptick Joarder wrote:
> kernel test robot throws below warning ->
> 
> arch/mips/kernel/cacheinfo.c:112:3: warning: Variable 'level' is
> modified but its new value is never used. [unreadVariable]
> 
> Remove unnecessary increment of level at the end.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>  arch/mips/kernel/cacheinfo.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
> index 5f9d0eb..c858ae3 100644
> --- a/arch/mips/kernel/cacheinfo.c
> +++ b/arch/mips/kernel/cacheinfo.c
> @@ -109,7 +109,6 @@ static int __populate_cache_leaves(unsigned int cpu)
>  
>  	if (c->tcache.waysize) {
>  		populate_cache(tcache, this_leaf, level, CACHE_TYPE_UNIFIED);
> -		level++;

please remove the no longer needed braces, too.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
