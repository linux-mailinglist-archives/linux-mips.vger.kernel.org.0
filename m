Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A731ACDEA
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 18:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgDPQld (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 12:41:33 -0400
Received: from elvis.franken.de ([193.175.24.41]:42192 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727843AbgDPQld (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 12:41:33 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jP7Zy-0001kl-02; Thu, 16 Apr 2020 18:41:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7804BC0144; Thu, 16 Apr 2020 18:36:09 +0200 (CEST)
Date:   Thu, 16 Apr 2020 18:36:09 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org
Subject: Re: [PATCH v2] MIPS: TXx9: Fix Kconfig warnings
Message-ID: <20200416163609.GC24743@alpha.franken.de>
References: <20200403094228.12304-1-yuehaibing@huawei.com>
 <20200403094904.37072-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403094904.37072-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 03, 2020 at 05:49:04PM +0800, YueHaibing wrote:
> If TTY and SND is not n, we got this warnings:
> 
> WARNING: unmet direct dependencies detected for HAS_TXX9_SERIAL
>   Depends on [n]: TTY [=n] && HAS_IOMEM [=y]
>   Selected by [y]:
>   - SOC_TX3927 [=y]
> 
> WARNING: unmet direct dependencies detected for HAS_TXX9_SERIAL
>   Depends on [n]: TTY [=n] && HAS_IOMEM [=y]
>   Selected by [y]:
>   - SOC_TX4938 [=y]
> 
> Only dependencies is enabled, they can be enabled, so
> use 'imply' instead of 'select' to fix this.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: fix patch title
> ---
>  arch/mips/txx9/Kconfig | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
