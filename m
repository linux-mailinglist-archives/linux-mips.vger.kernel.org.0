Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9075836B3B5
	for <lists+linux-mips@lfdr.de>; Mon, 26 Apr 2021 15:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbhDZNCT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Apr 2021 09:02:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:43655 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233593AbhDZNCT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 26 Apr 2021 09:02:19 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lb0rm-0001U1-00; Mon, 26 Apr 2021 15:01:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DF10CC0BBF; Mon, 26 Apr 2021 15:00:05 +0200 (CEST)
Date:   Mon, 26 Apr 2021 15:00:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     zhouchuangao <zhouchuangao@vivo.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM63XX: Use BUG_ON instead of condition followed
 by BUG.
Message-ID: <20210426130005.GA9176@alpha.franken.de>
References: <1619279992-81335-1-git-send-email-zhouchuangao@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619279992-81335-1-git-send-email-zhouchuangao@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 24, 2021 at 08:59:50AM -0700, zhouchuangao wrote:
> BUG_ON uses unlikely in if(), it can be optimized at compile time.
> 
> Usually, the condition in if() is not satisfied. In my opinion,
> this can improve the efficiency of the multi-stage pipeline.
> 
> Signed-off-by: zhouchuangao <zhouchuangao@vivo.com>
> ---
>  arch/mips/bcm63xx/gpio.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
