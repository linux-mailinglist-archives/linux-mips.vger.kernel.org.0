Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56BE66B5EDB
	for <lists+linux-mips@lfdr.de>; Sat, 11 Mar 2023 18:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjCKRce (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Mar 2023 12:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjCKRcd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 11 Mar 2023 12:32:33 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DF1E3A9;
        Sat, 11 Mar 2023 09:32:32 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id a2so8796783plm.4;
        Sat, 11 Mar 2023 09:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678555952;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=emS1LBwBoHuhYGFUci2z1irYt1S8GC/5X4q8lweHYJI=;
        b=P+hKKAXIcyIe53GDB0xlCrwkeDaJDa3twbFSsSrX21pMZCqffJiIAQvhtL/3mtxZYf
         L9BdM1mJ1S4CfHtmv8syUayzWENohFF97kGOE9WxHzAi+Ct5/U/5hN8ECu7GWTBMcY0y
         VfZKlIoz2jlnsoqWsrWwkZ2xufO1FvyNzSnRJoC7nJbuayo77Xg1f/Ywcoij3/XPYldC
         WZ9agXccFlbtQsKJtbIn4/4jHGR7ohr+pLGVIb31t0m0lJH66LP1ivSKxyj2nTi0JMTo
         9F9xefiEfR+W3beGhUsjHLLqCD3HVrIF4Vq2GFWsUdcpw5ohpCnK8fIJjPTGMeKwNMor
         0xyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678555952;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emS1LBwBoHuhYGFUci2z1irYt1S8GC/5X4q8lweHYJI=;
        b=RvylzrywtzOy2EonkL1g2b8dFnvu53vFXjJ36mKuvkuaoCOuaTb96O/WVuR6S/8jg6
         oc19jMTAAyHXl5gLFqVuN/3G6y23uixm3c3mC5/kFKP2paNEILENgmBgPvEr+kgINgKF
         +4Ul71WK5i42pjy2gWtkb4DkcWsjAdqxFaoJFy3+Iw049FqvN3qmPEd+jWC/+8CvBtAP
         Yg3fWZ2yAJsvohW2K5rcY1k3isFs0+gQkXvJzE283OokNuu/etwUdvFSwbnq0bujVYk1
         uS/1ixzLPpYiPczqvBtMzTMvGHew/JgJ64g9K9mLwMB+rGdzHlX+JafZXME1pjp1KY6v
         e2dQ==
X-Gm-Message-State: AO0yUKXuVR9WX+1Fc5XoKszzMUYARaA3DXcJzHvobK17u+bPw/bcKV9g
        Douw5uEIaT/nWRePmHhbtKBcU0e282s=
X-Google-Smtp-Source: AK7set/5QAZUKsPydgXzzd5BBUW5OfCHAN0N4qwYxg/rvQKVKdjGx0t+gDuFaqn30BWCekLUjVhg7w==
X-Received: by 2002:a05:6a20:4283:b0:c6:bb08:a7ab with SMTP id o3-20020a056a20428300b000c6bb08a7abmr6258912pzj.28.1678555951870;
        Sat, 11 Mar 2023 09:32:31 -0800 (PST)
Received: from [192.168.1.105] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id q26-20020a62ae1a000000b005d663989ccfsm1710846pff.200.2023.03.11.09.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 09:32:31 -0800 (PST)
Message-ID: <da5d150e-a2db-573d-e231-b4fd9fdaf63b@gmail.com>
Date:   Sat, 11 Mar 2023 09:32:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] mips: bmips: BCM6358: disable arch_sync_dma_for_cpu_all()
Content-Language: en-US
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230310121306.4632-1-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230310121306.4632-1-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 3/10/2023 4:13 AM, Álvaro Fernández Rojas wrote:
> arch_sync_dma_for_cpu_all() causes kernel panics on BCM6358 with EHCI/OHCI:
> [    3.881739] usb 1-1: new high-speed USB device number 2 using ehci-platform
> [    3.895011] Reserved instruction in kernel code[#1]:
> [    3.900113] CPU: 0 PID: 1 Comm: init Not tainted 5.10.16 #0
> [    3.905829] $ 0   : 00000000 10008700 00000000 77d94060
> [    3.911238] $ 4   : 7fd1f088 00000000 81431cac 81431ca0
> [    3.916641] $ 8   : 00000000 ffffefff 8075cd34 00000000
> [    3.922043] $12   : 806f8d40 f3e812b7 00000000 000d9aaa
> [    3.927446] $16   : 7fd1f068 7fd1f080 7ff559b8 81428470
> [    3.932848] $20   : 00000000 00000000 55590000 77d70000
> [    3.938251] $24   : 00000018 00000010
> [    3.943655] $28   : 81430000 81431e60 81431f28 800157fc
> [    3.949058] Hi    : 00000000
> [    3.952013] Lo    : 00000000
> [    3.955019] epc   : 80015808 setup_sigcontext+0x54/0x24c
> [    3.960464] ra    : 800157fc setup_sigcontext+0x48/0x24c
> [    3.965913] Status: 10008703	KERNEL EXL IE
> [    3.970216] Cause : 00800028 (ExcCode 0a)
> [    3.974340] PrId  : 0002a010 (Broadcom BMIPS4350)
> [    3.979170] Modules linked in: ohci_platform ohci_hcd fsl_mph_dr_of ehci_platform ehci_fsl ehci_hcd gpio_button_hotplug usbcore nls_base usb_common
> [    3.992907] Process init (pid: 1, threadinfo=(ptrval), task=(ptrval), tls=77e22ec8)
> [    4.000776] Stack : 81431ef4 7fd1f080 81431f28 81428470 7fd1f068 81431edc 7ff559b8 81428470
> [    4.009467]         81431f28 7fd1f080 55590000 77d70000 77d5498c 80015c70 806f0000 8063ae74
> [    4.018149]         08100002 81431f28 0000000a 08100002 81431f28 0000000a 77d6b418 00000003
> [    4.026831]         ffffffff 80016414 80080734 81431ecc 81431ecc 00000001 00000000 04000000
> [    4.035512]         77d54874 00000000 00000000 00000000 00000000 00000012 00000002 00000000
> [    4.044196]         ...
> [    4.046706] Call Trace:
> [    4.049238] [<80015808>] setup_sigcontext+0x54/0x24c
> [    4.054356] [<80015c70>] setup_frame+0xdc/0x124
> [    4.059015] [<80016414>] do_notify_resume+0x1dc/0x288
> [    4.064207] [<80011b50>] work_notifysig+0x10/0x18
> [    4.069036]
> [    4.070538] Code: 8fc300b4  00001025  26240008 <ac820000> ac830004  3c048063  0c0228aa  24846a00  26240010
> [    4.080686]
> [    4.082517] ---[ end trace 22a8edb41f5f983b ]---
> [    4.087374] Kernel panic - not syncing: Fatal exception
> [    4.092753] Rebooting in 1 seconds..

Did you pinpoint which specific instruction within 
arch_sync_dma_for_cpu_all() is causing the reserved instruction exception?

> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>   arch/mips/bmips/dma.c   | 5 +++++
>   arch/mips/bmips/setup.c | 5 +++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
> index 33788668cbdb..3769d5efdede 100644
> --- a/arch/mips/bmips/dma.c
> +++ b/arch/mips/bmips/dma.c
> @@ -5,11 +5,16 @@
>   #include <asm/bmips.h>
>   #include <asm/io.h>
>   
> +int bmips_dma_sync_enabled = 1;

bool bmips_dma_sync_disabled;

> +
>   void arch_sync_dma_for_cpu_all(void)
>   {
>   	void __iomem *cbr = BMIPS_GET_CBR();
>   	u32 cfg;
>   
> +	if (!bmips_dma_sync_enabled)
> +		return;

if (bmips_dma_sync_disabled)

> +
>   	if (boot_cpu_type() != CPU_BMIPS3300 &&
>   	    boot_cpu_type() != CPU_BMIPS4350 &&
>   	    boot_cpu_type() != CPU_BMIPS4380)
> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index e95b3f78e7cd..825e85e14010 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -35,6 +35,8 @@
>   #define REG_BCM6328_OTP		((void __iomem *)CKSEG1ADDR(0x1000062c))
>   #define BCM6328_TP1_DISABLED	BIT(9)
>   
> +extern int bmips_dma_sync_enabled;
> +
>   static const unsigned long kbase = VMLINUX_LOAD_ADDRESS & 0xfff00000;
>   
>   struct bmips_quirk {
> @@ -104,6 +106,9 @@ static void bcm6358_quirks(void)
>   	 * disable SMP for now
>   	 */
>   	bmips_smp_enabled = 0;
> +
> +	/* ARCH_HAS_SYNC_DMA_FOR_CPU_ALL causes kernel panics on BCM6358 */
> +	bmips_dma_sync_enabled = 0;

bmips_dma_sync_disabled = true;

>   }
>   
>   static void bcm6368_quirks(void)

-- 
Florian
