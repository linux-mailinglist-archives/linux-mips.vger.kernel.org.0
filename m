Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91CB27736D
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 15:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgIXN7k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 09:59:40 -0400
Received: from elvis.franken.de ([193.175.24.41]:55138 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728185AbgIXN70 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Sep 2020 09:59:26 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kLRmK-0005vQ-04; Thu, 24 Sep 2020 15:59:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id AF736C101A; Thu, 24 Sep 2020 15:55:30 +0200 (CEST)
Date:   Thu, 24 Sep 2020 15:55:30 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wei Li <liwei391@huawei.com>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>,
        "Steven J. Hill" <Steven.Hill@imgtec.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        guohanjun@huawei.com
Subject: Re: [PATCH] MIPS: BCM47XX: Remove the needless check with the 1074K
Message-ID: <20200924135530.GE13973@alpha.franken.de>
References: <20200923065326.44898-1-liwei391@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923065326.44898-1-liwei391@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 23, 2020 at 02:53:26PM +0800, Wei Li wrote:
> As there is no known soc powered by mips 1074K in bcm47xx series,
> the check with 1074K is needless. So just remove it.
> 
> Link: https://wireless.wiki.kernel.org/en/users/Drivers/b43/soc
> Fixes: 442e14a2c55e ("MIPS: Add 1074K CPU support explicitly.")
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---
>  arch/mips/bcm47xx/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
