Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A860324CFEB
	for <lists+linux-mips@lfdr.de>; Fri, 21 Aug 2020 09:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgHUHuN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 03:50:13 -0400
Received: from elvis.franken.de ([193.175.24.41]:54238 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgHUHuM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Aug 2020 03:50:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k91oP-00079q-03; Fri, 21 Aug 2020 09:50:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6E382C0D89; Fri, 21 Aug 2020 09:48:21 +0200 (CEST)
Date:   Fri, 21 Aug 2020 09:48:21 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     zhe.he@windriver.com
Cc:     rric@kernel.org, oprofile-list@lists.sf.net,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips/oprofile: Fix fallthrough placement
Message-ID: <20200821074821.GD8336@alpha.franken.de>
References: <20200820125440.350184-1-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820125440.350184-1-zhe.he@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 20, 2020 at 08:54:40PM +0800, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> We want neither
> "
> include/linux/compiler_attributes.h:201:41: warning: statement will never
> be executed [-Wswitch-unreachable]
>   201 | # define fallthrough __attribute__((__fallthrough__))
>       |                      ^~~~~~~~~~~~~
> "
> nor
> "
> include/linux/compiler_attributes.h:201:41: warning: attribute
> 'fallthrough' not preceding a case label or default label
>   201 | # define fallthrough __attribute__((__fallthrough__))
>       |                      ^~~~~~~~~~~~~
> "
> 
> It's not worth adding one more macro. Let's simply place the fallthrough
> in between the expansions.
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>

there is already another patch for the problem, which I've applied
to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
