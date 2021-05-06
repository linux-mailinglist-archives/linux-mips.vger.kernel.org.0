Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44AB7374D73
	for <lists+linux-mips@lfdr.de>; Thu,  6 May 2021 04:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhEFCWu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 22:22:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59352 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229872AbhEFCWu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 5 May 2021 22:22:50 -0400
Received: from [10.130.0.77] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxLcizUpNgEo0SAA--.7343S3;
        Thu, 06 May 2021 10:21:39 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson64: Fix build error 'secondary_kexec_args'
 undeclared under !SMP
To:     Youling Tang <tangyouling@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1620266570-21585-1-git-send-email-tangyouling@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <c3d635ee-2478-c786-59fe-f630e4980a77@loongson.cn>
Date:   Thu, 6 May 2021 10:21:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1620266570-21585-1-git-send-email-tangyouling@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxLcizUpNgEo0SAA--.7343S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJryDuw17Zw4UCw15Xr4DXFb_yoW8AFWkpa
        15C3W8tFWFgr42yr4fXry5Z34ru393JrW7JFW7C3s8K3srXr1UXF97tFnrXFykuw43KFWf
        XF4agr1DAFnrCrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
        zVAYIcxG8wCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUbpwZ7UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05/06/2021 10:02 AM, Youling Tang wrote:

> On the Loongson64 platform, if CONFIG_SMP is not set, the following build
> error will occur:
> arch/mips/loongson64/reset.c:133:2: error:'secondary_kexec_args' undeclared
>
> Because the definition and declaration of secondary_kexec_args are in the
> CONFIG_SMP, the secondary_kexec_args variable should be used in CONFIG_SMP.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>   arch/mips/loongson64/reset.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
> index c97bfdc..758d5d2 100644
> --- a/arch/mips/loongson64/reset.c
> +++ b/arch/mips/loongson64/reset.c
> @@ -126,11 +126,12 @@ static void loongson_kexec_shutdown(void)
>   	for_each_possible_cpu(cpu)
>   		if (!cpu_online(cpu))
>   			cpu_device_up(get_cpu_device(cpu));
> +
> +	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
>   #endif
>   	kexec_args[0] = kexec_argc;
>   	kexec_args[1] = fw_arg1;
>   	kexec_args[2] = fw_arg2;
> -	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
>   	memcpy((void *)fw_arg1, kexec_argv, KEXEC_ARGV_SIZE);
>   	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
>   }
> @@ -141,7 +142,9 @@ static void loongson_crash_shutdown(struct pt_regs *regs)
>   	kexec_args[0] = kdump_argc;
>   	kexec_args[1] = fw_arg1;
>   	kexec_args[2] = fw_arg2;
> +#ifdef CONFIG_SMP
>   	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
> +#endif
>   	memcpy((void *)fw_arg1, kdump_argv, KEXEC_ARGV_SIZE);
>   	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
>   }

Hi, Youling,

The earlier fix is here,
https://lkml.org/lkml/2021/4/30/874

Thanks.

