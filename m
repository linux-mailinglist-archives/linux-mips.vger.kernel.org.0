Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F9C2E6B9C
	for <lists+linux-mips@lfdr.de>; Tue, 29 Dec 2020 00:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730793AbgL1Wzy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Dec 2020 17:55:54 -0500
Received: from elvis.franken.de ([193.175.24.41]:43919 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729595AbgL1V6G (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Dec 2020 16:58:06 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ku0W4-0005wv-03; Mon, 28 Dec 2020 22:57:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CBCC8C05C4; Mon, 28 Dec 2020 22:40:35 +0100 (CET)
Date:   Mon, 28 Dec 2020 22:40:35 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wei Li <liwei391@huawei.com>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: No need to check CPU 0 in cps_cpu_disable()
Message-ID: <20201228214035.GD24617@alpha.franken.de>
References: <1608008846-27206-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608008846-27206-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 15, 2020 at 01:07:26PM +0800, Tiezhu Yang wrote:
> After commit 9cce844abf07 ("MIPS: CPU#0 is not hotpluggable"),
> c->hotpluggable is 0 for CPU 0 and it will not generate a control
> file in sysfs for this CPU:
> 
> [root@linux loongson]# cat /sys/devices/system/cpu/cpu0/online
> cat: /sys/devices/system/cpu/cpu0/online: No such file or directory
> [root@linux loongson]# echo 0 > /sys/devices/system/cpu/cpu0/online
> bash: /sys/devices/system/cpu/cpu0/online: Permission denied
> 
> So no need to check CPU 0 in cps_cpu_disable(), just remove it.
> 
> Reported-by: liwei (GF) <liwei391@huawei.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> cps_cpu_disable() is not done in the early similar patch,
> sorry for that.
> 
>  arch/mips/kernel/smp-cps.c | 3 ---
>  1 file changed, 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
