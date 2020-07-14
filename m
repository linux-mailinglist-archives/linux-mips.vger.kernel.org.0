Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C72C21EA06
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 09:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgGNH1U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 03:27:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45146 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725306AbgGNH1U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jul 2020 03:27:20 -0400
Received: from [10.130.0.75] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxbx5RXg1f9kkEAA--.791S3;
        Tue, 14 Jul 2020 15:27:14 +0800 (CST)
Subject: Re: [PATCH 3/4] MIPS: Loongson64: Load LS7A dtbs
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
 <1594294424-26218-3-git-send-email-chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <e7deff57-dda5-3939-af0b-1ef84088f4dd@loongson.cn>
Date:   Tue, 14 Jul 2020 15:27:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1594294424-26218-3-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxbx5RXg1f9kkEAA--.791S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZryrKr18Ww1rZw1ktF1UZFb_yoW5AF17pr
        ZxZa90gF4Fqr1akrnxJrW09r15Aa45JFsxZF42qF48uF97twn8Kw15W3WSyF47AF1UWa1x
        urWv9rs2kFWktrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JV
        WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
        8wCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv
        67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
        uYvjxUcvPfDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/09/2020 07:33 PM, Huacai Chen wrote:
> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Load correct devicetree according to PRID and PCH type.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

> ---
>   arch/mips/loongson64/env.c | 56 ++++++++++++++++++++++++++++------------------
>   1 file changed, 34 insertions(+), 22 deletions(-)
>
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index 3e7caba..2cb9573 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -126,28 +126,6 @@ void __init prom_init_env(void)
>   		loongson_sysconf.cores_per_node - 1) /
>   		loongson_sysconf.cores_per_node;
>   
> -	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64C) {
> -		switch (read_c0_prid() & PRID_REV_MASK) {
> -		case PRID_REV_LOONGSON3A_R1:
> -		case PRID_REV_LOONGSON3A_R2_0:
> -		case PRID_REV_LOONGSON3A_R2_1:
> -		case PRID_REV_LOONGSON3A_R3_0:
> -		case PRID_REV_LOONGSON3A_R3_1:
> -			loongson_fdt_blob = __dtb_loongson64c_4core_rs780e_begin;
> -			break;
> -		case PRID_REV_LOONGSON3B_R1:
> -		case PRID_REV_LOONGSON3B_R2:
> -			loongson_fdt_blob = __dtb_loongson64c_8core_rs780e_begin;
> -			break;
> -		default:
> -			break;
> -		}
> -	}
> -
> -
> -	if (!loongson_fdt_blob)
> -		pr_err("Failed to determine built-in Loongson64 dtb\n");
> -
>   	loongson_sysconf.pci_mem_start_addr = eirq_source->pci_mem_start_addr;
>   	loongson_sysconf.pci_mem_end_addr = eirq_source->pci_mem_end_addr;
>   	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
> @@ -198,4 +176,38 @@ void __init prom_init_env(void)
>   		loongson_sysconf.bridgetype = RS780E;
>   		loongson_sysconf.early_config = rs780e_early_config;
>   	}
> +
> +	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64C) {
> +		switch (read_c0_prid() & PRID_REV_MASK) {
> +		case PRID_REV_LOONGSON3A_R1:
> +		case PRID_REV_LOONGSON3A_R2_0:
> +		case PRID_REV_LOONGSON3A_R2_1:
> +		case PRID_REV_LOONGSON3A_R3_0:
> +		case PRID_REV_LOONGSON3A_R3_1:
> +			switch (loongson_sysconf.bridgetype) {
> +			case LS7A:
> +				loongson_fdt_blob = __dtb_loongson64c_4core_ls7a_begin;
> +				break;
> +			case RS780E:
> +				loongson_fdt_blob = __dtb_loongson64c_4core_rs780e_begin;
> +				break;
> +			default:
> +				break;
> +			}
> +			break;
> +		case PRID_REV_LOONGSON3B_R1:
> +		case PRID_REV_LOONGSON3B_R2:
> +			if (loongson_sysconf.bridgetype == RS780E)
> +				loongson_fdt_blob = __dtb_loongson64c_8core_rs780e_begin;
> +			break;
> +		default:
> +			break;
> +		}
> +	} else if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64G) {
> +		if (loongson_sysconf.bridgetype == LS7A)
> +			loongson_fdt_blob = __dtb_loongson64g_4core_ls7a_begin;
> +	}
> +
> +	if (!loongson_fdt_blob)
> +		pr_err("Failed to determine built-in Loongson64 dtb\n");
>   }

