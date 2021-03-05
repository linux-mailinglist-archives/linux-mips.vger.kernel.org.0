Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE90032DFAC
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 03:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhCECc3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 21:32:29 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49299 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229436AbhCECc2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 21:32:28 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 429295C0090;
        Thu,  4 Mar 2021 21:32:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 04 Mar 2021 21:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=2
        QNp4OpQLXERnU8dx6pfTTwRPpu1inmB16nTSSryH1g=; b=1EfHKcnZu6/BPP8bd
        wRDAk/iRLvrwnsNq3O3A2SzVcNsM+hGDgk2q9QbQDeNcsyCJ3zohEDtbLPzTgnXg
        cCP18Nh+ebXZFTqYP+AeV5arSx3mTtTuEd21W1VmzcpiUn/ZkeOPWJmaDn+E/+AN
        H12a5H2yxjg3/5ssrG8hbfPmFkVUnaPvbz/M9nCmYdYe2M/5r5ZS0d9mFerfeHZx
        KauKKpAdfJD5LpgB0Lo9Cb9sfsdoNe/QdD5sSG2qImXHJ3OUPLuqxU6Ghmjce7C0
        ea9ZREukF2S1yb0YQi4Q/ri9NM6q4sQ9Gh/Az9bA4G2VZu5C67AQxsaXn31V1N8Z
        L7ctQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=2QNp4OpQLXERnU8dx6pfTTwRPpu1inmB16nTSSryH
        1g=; b=B848dzN5YzOG4O9sRkcf4+K4mFkgzgfocOCloB1rTs5G/jeiJTzpNg63y
        CaVL+6CCSDYE8djt3lBfiVWYm6Uq0U9GmfatK/vF3V5hhgEP/EmVEEtkeBVHZej9
        apLfhevgNhwJRCO0K4XMrDo0tQpDCpYQtRBoKREnSy/GWJz/tzYyHIRxnPjk9zFt
        bUKVYDaHbKHxfjE2ftBVfsJSdUa4APCplG7dyReScHSV3/5vZjtEnykllSvVEEGp
        ndH6n1O0JwFPfI3/R7QLVXBxTcKb62cCpnS+l5WlUA/sUm4ynDhGkvhzyrWFmmET
        Ce3833+tcLYyIKUi3OBHWjBiay4LA==
X-ME-Sender: <xms:OphBYF5rE3mGmwkRzNVQ5YbxrrK5de0zSz6uiL6TmWPNKPQf1-NvBA>
    <xme:OphBYC5HWcZmNMQKmUz2DUntzRu5TGVzom1JhmEMyZnE2gmwJhQG8DMFZEyu8Xiwt
    FzJrNrODUFzJ0b7zcU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddthedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:OphBYMf6viMAV0PX99FCEQ-pH2_hGlcbNTCMc-9SugFT7S9r73vLOg>
    <xmx:OphBYOL89tNNY4G3hKWbiQozmSigrdWzVKeQYV4y4BmOWOxA7Qp-SQ>
    <xmx:OphBYJJ8-H-SWFWUPK6jJVlxKZVzgS5SK_UdGanSGSn-NQ9EqARNvQ>
    <xmx:PJhBYGEf2j7uzKqHxTSqksBuo49CYEaMb7GGPnElaL8y0W-a-wyO5A>
Received: from [127.0.0.1] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 746C624005B;
        Thu,  4 Mar 2021 21:32:24 -0500 (EST)
Subject: Re: [PATCH 1/2] MIPS: Loongson64: Remove unused sysconf members
To:     Qing Zhang <zhangqing@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210304110057.22144-1-zhangqing@loongson.cn>
 <20210304110057.22144-2-zhangqing@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <67d0389d-9df4-066d-2c8d-2eda967fb2fc@flygoat.com>
Date:   Fri, 5 Mar 2021 10:32:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304110057.22144-2-zhangqing@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/3/4 ÏÂÎç7:00, Qing Zhang Ð´µÀ:
> We don't need them anymore, They are uniform on all Loongson64 systems
> and have been fixed in DeviceTree.loongson3_platform_init is replaced
> with DTS + driver.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Hmm, why it comes with my sign-off?
I assue it's my patch somewhere off the tree?

Thanks.

- Jiaxun

> ---
>   .../include/asm/mach-loongson64/boot_param.h  |  9 ----
>   arch/mips/loongson64/Makefile                 |  2 +-
>   arch/mips/loongson64/env.c                    | 20 ---------
>   arch/mips/loongson64/platform.c               | 42 -------------------
>   4 files changed, 1 insertion(+), 72 deletions(-)
>   delete mode 100644 arch/mips/loongson64/platform.c
> 
> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> index 4592841b6b0c..1c1cdf57137e 100644
> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> @@ -207,20 +207,11 @@ struct loongson_system_configuration {
>   	u16 reserved_cpus_mask;
>   	enum loongson_cpu_type cputype;
>   	enum loongson_bridge_type bridgetype;
> -	u64 ht_control_base;
> -	u64 pci_mem_start_addr;
> -	u64 pci_mem_end_addr;
> -	u64 pci_io_base;
>   	u64 restart_addr;
>   	u64 poweroff_addr;
>   	u64 suspend_addr;
>   	u64 vgabios_addr;
>   	u32 dma_mask_bits;
> -	char ecname[32];
> -	u32 nr_uarts;
> -	struct uart_device uarts[MAX_UARTS];
> -	u32 nr_sensors;
> -	struct sensor_device sensors[MAX_SENSORS];
>   	u64 workarounds;
>   	void (*early_config)(void);
>   };
> diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
> index cc76944b1a9d..e806280bbb85 100644
> --- a/arch/mips/loongson64/Makefile
> +++ b/arch/mips/loongson64/Makefile
> @@ -2,7 +2,7 @@
>   #
>   # Makefile for Loongson-3 family machines
>   #
> -obj-$(CONFIG_MACH_LOONGSON64) += cop2-ex.o platform.o dma.o \
> +obj-$(CONFIG_MACH_LOONGSON64) += cop2-ex.o dma.o \
>   				setup.o init.o env.o time.o reset.o \
>   
>   obj-$(CONFIG_SMP)	+= smp.o
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index 51a5d050a94c..1821d461b606 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -95,7 +95,6 @@ void __init prom_init_env(void)
>   		loongson_freqctrl[1] = 0x900010001fe001d0;
>   		loongson_freqctrl[2] = 0x900020001fe001d0;
>   		loongson_freqctrl[3] = 0x900030001fe001d0;
> -		loongson_sysconf.ht_control_base = 0x90000EFDFB000000;
>   		loongson_sysconf.workarounds = WORKAROUND_CPUFREQ;
>   		break;
>   	case Legacy_3B:
> @@ -118,7 +117,6 @@ void __init prom_init_env(void)
>   		loongson_freqctrl[1] = 0x900020001fe001d0;
>   		loongson_freqctrl[2] = 0x900040001fe001d0;
>   		loongson_freqctrl[3] = 0x900060001fe001d0;
> -		loongson_sysconf.ht_control_base = 0x90001EFDFB000000;
>   		loongson_sysconf.workarounds = WORKAROUND_CPUHOTPLUG;
>   		break;
>   	default:
> @@ -136,9 +134,6 @@ void __init prom_init_env(void)
>   		loongson_sysconf.cores_per_node - 1) /
>   		loongson_sysconf.cores_per_node;
>   
> -	loongson_sysconf.pci_mem_start_addr = eirq_source->pci_mem_start_addr;
> -	loongson_sysconf.pci_mem_end_addr = eirq_source->pci_mem_end_addr;
> -	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
>   	loongson_sysconf.dma_mask_bits = eirq_source->dma_mask_bits;
>   	if (loongson_sysconf.dma_mask_bits < 32 ||
>   		loongson_sysconf.dma_mask_bits > 64)
> @@ -153,23 +148,8 @@ void __init prom_init_env(void)
>   		loongson_sysconf.poweroff_addr, loongson_sysconf.restart_addr,
>   		loongson_sysconf.vgabios_addr);
>   
> -	memset(loongson_sysconf.ecname, 0, 32);
> -	if (esys->has_ec)
> -		memcpy(loongson_sysconf.ecname, esys->ec_name, 32);
>   	loongson_sysconf.workarounds |= esys->workarounds;
>   
> -	loongson_sysconf.nr_uarts = esys->nr_uarts;
> -	if (esys->nr_uarts < 1 || esys->nr_uarts > MAX_UARTS)
> -		loongson_sysconf.nr_uarts = 1;
> -	memcpy(loongson_sysconf.uarts, esys->uarts,
> -		sizeof(struct uart_device) * loongson_sysconf.nr_uarts);
> -
> -	loongson_sysconf.nr_sensors = esys->nr_sensors;
> -	if (loongson_sysconf.nr_sensors > MAX_SENSORS)
> -		loongson_sysconf.nr_sensors = 0;
> -	if (loongson_sysconf.nr_sensors)
> -		memcpy(loongson_sysconf.sensors, esys->sensors,
> -			sizeof(struct sensor_device) * loongson_sysconf.nr_sensors);
>   	pr_info("CpuClock = %u\n", cpu_clock_freq);
>   
>   	/* Read the ID of PCI host bridge to detect bridge type */
> diff --git a/arch/mips/loongson64/platform.c b/arch/mips/loongson64/platform.c
> deleted file mode 100644
> index 9674ae1361a8..000000000000
> --- a/arch/mips/loongson64/platform.c
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * Copyright (C) 2009 Lemote Inc.
> - * Author: Wu Zhangjin, wuzhangjin@gmail.com
> - *         Xiang Yu, xiangy@lemote.com
> - *         Chen Huacai, chenhc@lemote.com
> - */
> -
> -#include <linux/err.h>
> -#include <linux/slab.h>
> -#include <linux/platform_device.h>
> -#include <asm/bootinfo.h>
> -#include <boot_param.h>
> -#include <loongson_hwmon.h>
> -#include <workarounds.h>
> -
> -static int __init loongson3_platform_init(void)
> -{
> -	int i;
> -	struct platform_device *pdev;
> -
> -	if (loongson_sysconf.ecname[0] != '\0')
> -		platform_device_register_simple(loongson_sysconf.ecname, -1, NULL, 0);
> -
> -	for (i = 0; i < loongson_sysconf.nr_sensors; i++) {
> -		if (loongson_sysconf.sensors[i].type > SENSOR_FAN)
> -			continue;
> -
> -		pdev = kzalloc(sizeof(struct platform_device), GFP_KERNEL);
> -		if (!pdev)
> -			return -ENOMEM;
> -
> -		pdev->name = loongson_sysconf.sensors[i].name;
> -		pdev->id = loongson_sysconf.sensors[i].id;
> -		pdev->dev.platform_data = &loongson_sysconf.sensors[i];
> -		platform_device_register(pdev);
> -	}
> -
> -	return 0;
> -}
> -
> -arch_initcall(loongson3_platform_init);
> 
