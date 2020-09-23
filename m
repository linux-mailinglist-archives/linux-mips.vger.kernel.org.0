Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7EE1274F57
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 05:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgIWDCh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 23:02:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34484 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726448AbgIWDCh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Sep 2020 23:02:37 -0400
Received: from [10.130.0.60] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxOMS9umpfOlIXAA--.2271S3;
        Wed, 23 Sep 2020 11:02:21 +0800 (CST)
Subject: Re: [PATCH 1/3] MIPS: Crash kernel should be able to see old memories
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, kexec@lists.infradead.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <e91c0c4d-ff35-1eee-22c5-e2e258e618ec@loongson.cn>
Date:   Wed, 23 Sep 2020 11:02:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxOMS9umpfOlIXAA--.2271S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4fJr4kGF18Jw4kuFWUtwb_yoW8AFW3pw
        4UCwsYyr4UGF1Ika4fCw1rurWrXw1rAry5WanrWr15AFn7Xr1Ik3y0ganrZry0qryxKFW2
        qF4YqFy0qan2v3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Gb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
        xwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
        W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0OzV5UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/23/2020 10:30 AM, Huacai Chen wrote:
> Kexec-tools use mem=X@Y to pass usable memories to crash kernel, but in
> commit a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map") all
> BIOS passed memories are removed by early_parse_mem(). I think this is
> reasonable for a normal kernel but not for a crash kernel, because a
> crash kernel should be able to see all old memories, even though it is
> not supposed to use them.
>
> Fixes: a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map")
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>   arch/mips/kernel/setup.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 4c04a86..e2804a2 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -392,8 +392,10 @@ static int __init early_parse_mem(char *p)
>   	 */
>   	if (usermem == 0) {
>   		usermem = 1;
> +#ifndef CONFIG_CRASH_DUMP
>   		memblock_remove(memblock_start_of_DRAM(),
>   			memblock_end_of_DRAM() - memblock_start_of_DRAM());
> +#endif

Hi, Huacai,

For this patch, I knew something what had happened. "mem=" parsing
works wrong for Loongson64. You can referenced the follow patch:
https://patchwork.kernel.org/patch/11789555/

memblock_add() calls memblock_add_range(,,, MAX_NUMNODES,)
For Loongson64 enabling NUMA, we need memblock_add_node(). (Or
using memblock_set_node() after memblock_add())

Besides, "mem=" may be useless for kdump. Youling had submitted a patch
about removing "mem="  serveral days ago.

For Loongson64 platform, you can try crashkernel=SIZE@38M after fixed 
"mem=".
38M means 40M - 2M, 2M is needed because old firmware compatibility.

Thanks,
- Jinyang.

>   	}
>   	start = 0;
>   	size = memparse(p, &p);

