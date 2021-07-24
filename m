Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57CE93D4756
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 13:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbhGXKgj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 24 Jul 2021 06:36:39 -0400
Received: from aposti.net ([89.234.176.197]:51530 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232233AbhGXKgi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 24 Jul 2021 06:36:38 -0400
Date:   Sat, 24 Jul 2021 12:16:59 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] cpuidle: JZ4780: Add Ingenic JZ4780 cpuidle driver.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     rjw@rjwysocki.net, daniel.lezcano@linaro.org,
        linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com, Alex Smith <alex.smith@imgtec.com>
Message-Id: <B0YQWQ.OWLDE6KM3L551@crapouillou.net>
In-Reply-To: <1627118399-125388-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627118399-125388-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam., juil. 24 2021 at 17:19:59 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> The JZ4780 has a high overhead to executing a MIPS wait on SMP, as a
> core must flush out dirty cache lines from its data cache before doing
> so. This is because the core clock is gated during a wait and if the
> other core tries to access a dirty line from the waiting core's cache,
> it will lock up.
> 
> To mitigate some of this impact, this driver provides a simple polling
> top level idle state, to try to avoid the cache flushing overhead when
> the wait will only be short. The second level state is implemented 
> with
> the MIPS wait instruction.
> 
> This patch first found in the github repository of CI20, the original
> author is Alex Smith. Because there is a chance to cause kernel hang
> scenarios which can occur within hours or even within days, so this
> patch was abandoned, but now it is determined that this is not the
> problem caused by this patch, but caused by the cache driver. With
> the new Ingenic specific cache driver, it has been working properly
> on CI20 v1 for more than one week.
> 
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  drivers/cpuidle/Kconfig.mips     |  8 +++++
>  drivers/cpuidle/Makefile         |  1 +
>  drivers/cpuidle/cpuidle-jz4780.c | 74 
> ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 83 insertions(+)
>  create mode 100644 drivers/cpuidle/cpuidle-jz4780.c
> 
> diff --git a/drivers/cpuidle/Kconfig.mips 
> b/drivers/cpuidle/Kconfig.mips
> index c3c011a..4a55d24 100644
> --- a/drivers/cpuidle/Kconfig.mips
> +++ b/drivers/cpuidle/Kconfig.mips
> @@ -16,3 +16,11 @@ config MIPS_CPS_CPUIDLE
>  	  Processing System (CPS) architecture. In order to make use of
>  	  the deepest idle states you will need to ensure that you are
>  	  also using the CONFIG_MIPS_CPS SMP implementation.
> +
> +config MIPS_JZ4780_CPUIDLE
> +	bool "CPU Idle driver for Ingenic JZ4780"
> +	depends on MACH_JZ4780 && SMP
> +	default y
> +	help
> +	  Select this option to enable CPU idle state management through
> +	  cpuidle for Ingenic JZ4780 platforms.
> diff --git a/drivers/cpuidle/Makefile b/drivers/cpuidle/Makefile
> index 26bbc5e..1dd372f 100644
> --- a/drivers/cpuidle/Makefile
> +++ b/drivers/cpuidle/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_ARM_QCOM_SPM_CPUIDLE)	+= 
> cpuidle-qcom-spm.o
>  
> ###############################################################################
>  # MIPS drivers
>  obj-$(CONFIG_MIPS_CPS_CPUIDLE)		+= cpuidle-cps.o
> +obj-$(CONFIG_MIPS_JZ4780_CPUIDLE)	+= cpuidle-jz4780.o
> 
>  
> ###############################################################################
>  # POWERPC drivers
> diff --git a/drivers/cpuidle/cpuidle-jz4780.c 
> b/drivers/cpuidle/cpuidle-jz4780.c
> new file mode 100644
> index 00000000..2025de4
> --- /dev/null
> +++ b/drivers/cpuidle/cpuidle-jz4780.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * JZ4780 CPU idle driver
> + * Copyright (C) 2015 Imagination Technologies
> + * Author: Alex Smith <alex.smith@imgtec.com>
> + * Copyright (c) 2020 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com>
> + */
> +
> +#include <linux/cpuidle.h>
> +#include <linux/init.h>
> +#include <linux/sched.h>
> +#include <linux/sched/idle.h>
> +
> +#include <asm/idle.h>
> +#include <asm/mipsregs.h>
> +
> +/*
> + * The JZ4780 has a high overhead to entering just the basic MIPS 
> wait on SMP,
> + * due to the requirement to flush out dirty lines from the dcache 
> before
> + * waiting. Therefore, we try to mitigate this overhead by using a 
> simple
> + * polling loop for short waits.
> + */
> +static int jz4780_cpuidle_poll_enter(struct cpuidle_device *dev,
> +				     struct cpuidle_driver *drv, int index)
> +{
> +	if (!current_set_polling_and_test())
> +		while (!need_resched() && !(read_c0_cause() & read_c0_status() & 
> CAUSEF_IP))
> +			cpu_relax();
> +
> +	current_clr_polling();
> +	local_irq_enable();
> +
> +	return index;
> +}
> +
> +static struct cpuidle_driver jz4780_cpuidle_driver = {
> +	.name = "jz4780_cpuidle",
> +	.owner = THIS_MODULE,
> +	.states = {
> +		{
> +			.enter = jz4780_cpuidle_poll_enter,
> +			.exit_latency = 1,
> +			.target_residency = 1,
> +			.power_usage = UINT_MAX,
> +			.name = "poll",
> +			.desc = "polling loop",
> +		},
> +		{
> +			.enter = mips_cpuidle_wait_enter,
> +			.exit_latency = 50,
> +			.target_residency = 300,
> +			.power_usage = UINT_MAX,
> +			.name = "wait",
> +			.desc = "MIPS wait",
> +		},
> +	},
> +	.state_count = 2,
> +};
> +
> +static int __init jz4780_cpuidle_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuidle_register(&jz4780_cpuidle_driver, NULL);

You're missing something here - you never check that the kernel is 
actually running on a JZ4780.

Cheers,
-Paul

> +	if (ret) {
> +		pr_err("Failed to register JZ4780 idle driver: %d\n", ret);
> +		return ret;
> +	}
> +
> +	pr_info("JZ4780 idle driver registered\n");
> +
> +	return 0;
> +}
> +device_initcall(jz4780_cpuidle_init);
> --
> 2.7.4
> 


