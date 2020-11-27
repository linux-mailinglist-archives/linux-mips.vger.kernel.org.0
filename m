Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B563F2C625D
	for <lists+linux-mips@lfdr.de>; Fri, 27 Nov 2020 10:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgK0J5M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Nov 2020 04:57:12 -0500
Received: from elvis.franken.de ([193.175.24.41]:32813 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728165AbgK0J5M (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 27 Nov 2020 04:57:12 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kiaV3-000709-02; Fri, 27 Nov 2020 10:57:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5CBD3C02A6; Fri, 27 Nov 2020 10:33:41 +0100 (CET)
Date:   Fri, 27 Nov 2020 10:33:41 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: cdmm: fix use-after-free in mips_cdmm_bus_discover
Message-ID: <20201127093341.GC4859@alpha.franken.de>
References: <20201120074847.31369-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120074847.31369-1-miaoqinglang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 20, 2020 at 03:48:47PM +0800, Qinglang Miao wrote:
> kfree(dev) has been called inside put_device so anther
> kfree would cause a use-after-free bug/
> 
> Fixes: 8286ae03308c ("MIPS: Add CDMM bus support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/bus/mips_cdmm.c | 1 -
>  1 file changed, 1 deletion(-)

applied with braces removal to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
