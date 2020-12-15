Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2432DA6C7
	for <lists+linux-mips@lfdr.de>; Tue, 15 Dec 2020 04:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgLOD17 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Dec 2020 22:27:59 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9177 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgLOD1v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Dec 2020 22:27:51 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cw3ZW6Y26z15dbZ;
        Tue, 15 Dec 2020 11:26:27 +0800 (CST)
Received: from [10.174.178.63] (10.174.178.63) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 11:27:01 +0800
Subject: Re: [PATCH] MIPS: No need to check CPU 0 in
 {loongson3,bmips,octeon}_cpu_disable()
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Florian Fainelli <f.fainelli@gmail.com>
CC:     <linux-mips@vger.kernel.org>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linux-kernel@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>
References: <1606299090-14013-1-git-send-email-yangtiezhu@loongson.cn>
From:   "liwei (GF)" <liwei391@huawei.com>
Message-ID: <0aafd8a7-a9ec-524e-7279-d40dbf246375@huawei.com>
Date:   Tue, 15 Dec 2020 11:26:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
MIME-Version: 1.0
In-Reply-To: <1606299090-14013-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.63]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 2020/11/25 18:11, Tiezhu Yang wrote:
> After commit 9cce844abf07 ("MIPS: CPU#0 is not hotpluggable"),

Why CPU#0 is not hotpluggable on MIPS? Does that unrealizable?

> c->hotpluggable is 0 for CPU 0 and it will not generate a control
> file in sysfs for this CPU:
> 
> [root@linux loongson]# cat /sys/devices/system/cpu/cpu0/online
> cat: /sys/devices/system/cpu/cpu0/online: No such file or directory
> [root@linux loongson]# echo 0 > /sys/devices/system/cpu/cpu0/online
> bash: /sys/devices/system/cpu/cpu0/online: Permission denied
> 
> So no need to check CPU 0 in {loongson3,bmips,octeon}_cpu_disable(),

missing cps_cpu_disable()?

Thanks,
Wei

> just remove them.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/cavium-octeon/smp.c | 3 ---
>  arch/mips/kernel/smp-bmips.c  | 3 ---
>  arch/mips/loongson64/smp.c    | 3 ---
>  3 files changed, 9 deletions(-)
> 
> diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
> index 076db9a..66ce552 100644
> --- a/arch/mips/cavium-octeon/smp.c
> +++ b/arch/mips/cavium-octeon/smp.c
> @@ -290,9 +290,6 @@ static int octeon_cpu_disable(void)
>  {
>  	unsigned int cpu = smp_processor_id();
>  
> -	if (cpu == 0)
> -		return -EBUSY;
> -
>  	if (!octeon_bootloader_entry_addr)
>  		return -ENOTSUPP;
>  
> diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
> index 1dbfb5a..359b176 100644
> --- a/arch/mips/kernel/smp-bmips.c
> +++ b/arch/mips/kernel/smp-bmips.c
> @@ -362,9 +362,6 @@ static int bmips_cpu_disable(void)
>  {
>  	unsigned int cpu = smp_processor_id();
>  
> -	if (cpu == 0)
> -		return -EBUSY;
> -
>  	pr_info("SMP: CPU%d is offline\n", cpu);
>  
>  	set_cpu_online(cpu, false);
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index aa0cd72..b8c1fc3 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -544,9 +544,6 @@ static int loongson3_cpu_disable(void)
>  	unsigned long flags;
>  	unsigned int cpu = smp_processor_id();
>  
> -	if (cpu == 0)
> -		return -EBUSY;
> -
>  	set_cpu_online(cpu, false);
>  	calculate_cpu_foreign_map();
>  	local_irq_save(flags);
> 
