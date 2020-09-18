Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7EAF26FF40
	for <lists+linux-mips@lfdr.de>; Fri, 18 Sep 2020 15:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgIRN5e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Sep 2020 09:57:34 -0400
Received: from elvis.franken.de ([193.175.24.41]:44582 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgIRN5d (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Sep 2020 09:57:33 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kJGtG-0002UB-00; Fri, 18 Sep 2020 15:57:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 011EAC0FDD; Fri, 18 Sep 2020 15:48:42 +0200 (CEST)
Date:   Fri, 18 Sep 2020 15:48:42 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: OCTEON: use devm_platform_ioremap_resource
Message-ID: <20200918134842.GA19202@alpha.franken.de>
References: <20200916062127.190774-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916062127.190774-1-miaoqinglang@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 16, 2020 at 02:21:27PM +0800, Qinglang Miao wrote:
> Note that error handling on the result of a call to platform_get_resource()
> is unneeded when the value is passed to devm_ioremap_resource(), so remove
> it. Then use the helper function that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  arch/mips/cavium-octeon/octeon-usb.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
