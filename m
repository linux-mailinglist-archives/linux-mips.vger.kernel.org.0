Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485EF2C625C
	for <lists+linux-mips@lfdr.de>; Fri, 27 Nov 2020 10:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728722AbgK0J5M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Nov 2020 04:57:12 -0500
Received: from elvis.franken.de ([193.175.24.41]:32819 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728177AbgK0J5M (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 27 Nov 2020 04:57:12 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kiaV3-000709-01; Fri, 27 Nov 2020 10:57:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9CC34C02A6; Fri, 27 Nov 2020 10:32:45 +0100 (CET)
Date:   Fri, 27 Nov 2020 10:32:45 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: No need to check CPU 0 in
 {loongson3,bmips,octeon}_cpu_disable()
Message-ID: <20201127093245.GB4859@alpha.franken.de>
References: <1606299090-14013-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606299090-14013-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 25, 2020 at 06:11:30PM +0800, Tiezhu Yang wrote:
> After commit 9cce844abf07 ("MIPS: CPU#0 is not hotpluggable"),
> c->hotpluggable is 0 for CPU 0 and it will not generate a control
> file in sysfs for this CPU:
> 
> [root@linux loongson]# cat /sys/devices/system/cpu/cpu0/online
> cat: /sys/devices/system/cpu/cpu0/online: No such file or directory
> [root@linux loongson]# echo 0 > /sys/devices/system/cpu/cpu0/online
> bash: /sys/devices/system/cpu/cpu0/online: Permission denied
> 
> So no need to check CPU 0 in {loongson3,bmips,octeon}_cpu_disable(),
> just remove them.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/cavium-octeon/smp.c | 3 ---
>  arch/mips/kernel/smp-bmips.c  | 3 ---
>  arch/mips/loongson64/smp.c    | 3 ---
>  3 files changed, 9 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
