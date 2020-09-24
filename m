Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF7A27735F
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 15:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgIXN7l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 09:59:41 -0400
Received: from elvis.franken.de ([193.175.24.41]:55143 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728189AbgIXN70 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Sep 2020 09:59:26 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kLRmK-0005vQ-03; Thu, 24 Sep 2020 15:59:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 69F41C101A; Thu, 24 Sep 2020 15:55:14 +0200 (CEST)
Date:   Thu, 24 Sep 2020 15:55:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wei Li <liwei391@huawei.com>
Cc:     Paul Burton <paulburton@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>,
        "Steven J. Hill" <Steven.Hill@imgtec.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        guohanjun@huawei.com
Subject: Re: [PATCH] MIPS: Add the missing 'CPU_1074K' into __get_cpu_type()
Message-ID: <20200924135514.GD13973@alpha.franken.de>
References: <20200923065312.44851-1-liwei391@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923065312.44851-1-liwei391@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 23, 2020 at 02:53:12PM +0800, Wei Li wrote:
> Commit 442e14a2c55e ("MIPS: Add 1074K CPU support explicitly.") split
> 1074K from the 74K as an unique CPU type, while it missed to add the
> 'CPU_1074K' in __get_cpu_type(). So let's add it back.
> 
> Fixes: 442e14a2c55e ("MIPS: Add 1074K CPU support explicitly.")
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---
>  arch/mips/include/asm/cpu-type.h | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
