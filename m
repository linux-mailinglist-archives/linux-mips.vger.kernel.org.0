Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46E1312125
	for <lists+linux-mips@lfdr.de>; Sun,  7 Feb 2021 04:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhBGDT5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Feb 2021 22:19:57 -0500
Received: from mail.loongson.cn ([114.242.206.163]:51226 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229506AbhBGDT4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 6 Feb 2021 22:19:56 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX_MnXB9gP4sHAA--.9676S3;
        Sun, 07 Feb 2021 11:19:04 +0800 (CST)
Subject: Re: [PATCH] mips: kernel: setup: fix crash kernel resource allocation
To:     Ivan Khoronzhuk <ikhoronz@cisco.com>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org
References: <20210206125940.111766-1-ikhoronz@cisco.com>
Cc:     yangtiezhu@loongson.cn, rppt@kernel.org, ivan.khoronzhuk@gmail.com
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <01729c08-c5e3-e9c0-2ddb-a5289e536153@loongson.cn>
Date:   Sun, 7 Feb 2021 11:19:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210206125940.111766-1-ikhoronz@cisco.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxX_MnXB9gP4sHAA--.9676S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJF1DAFyrWFWUXw13Ar4fKrg_yoW5XrWrpr
        4xta1UtF4UZFs7Ga1rAr1xZFWfW3ZayFWfWr4ay3s3ua9xJr9Iyrn3WFW3uryUKrWFqF1Y
        qF4UXw1qga90vaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0EF7xvrVAajcxG14v26r1j6r4UMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67
        AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS
        5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r48MxAIw28IcxkI7V
        AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
        r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
        IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
        w20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
        kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnVyIUUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/06/2021 08:59 PM, Ivan Khoronzhuk wrote:

> In order to avoid crash kernel corruption, its memory is reserved
> early in memblock and as result, in time when resources are inited
> it's not present in memblock.memory, so crash kernel memory is out
> of ranges listed with for_each_mem_range(). To avoid it and still
> keep memory reserved lets reseve it out of loop by inserting it in
> iomem_resource.

Hi, Ivan,

I'm not familiar with memblock. If the following my ideas show my
ignorance, please forgive me.

First, not only the crash kernel is reserved early in memblock, but also
code, data, and bss are also reserved in bootmem_init():

     /* Reserve memory occupied by kernel. */
     memblock_reserve(__pa_symbol(&_text),
             __pa_symbol(&_end) - __pa_symbol(&_text));

(CONFIG_NUMA is not enabled. NUMA platform reserved them is earlier.)

If there is something unsuitable with the crash kernel, is there something
unsuitable with the kernel memory?


Then, for_each_mem_range() is normal memory. Although memblock_reserve()
has used before that, it just adds memory to memblock.reserved. That means
it will still appear in memblock.memory. Thus, here I have a question,
do we need to use replace for_each_mem_range with for_each_mem_range_rev?

Finally, thank you for the patch, it makes me think a lot.

Thanks,
Jinyang

> Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
> Signed-off-by: Ivan Khoronzhuk <ikhoronz@cisco.com>
> ---
> Based on linux-next/master
>
>   arch/mips/kernel/setup.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 3785c72bc3bc..25e376ef2f2a 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -473,14 +473,15 @@ static void __init mips_parse_crashkernel(void)
>   	crashk_res.end	 = crash_base + crash_size - 1;
>   }
>   
> -static void __init request_crashkernel(struct resource *res)
> +static void __init request_crashkernel(void)
>   {
>   	int ret;
>   
>   	if (crashk_res.start == crashk_res.end)
>   		return;
>   
> -	ret = request_resource(res, &crashk_res);
> +	/* The crashk resource shoud be located in normal mem */
> +	ret = insert_resource(&iomem_resource, &crashk_res);
>   	if (!ret)
>   		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
>   			(unsigned long)(resource_size(&crashk_res) >> 20),
> @@ -734,8 +735,9 @@ static void __init resource_init(void)
>   		request_resource(res, &code_resource);
>   		request_resource(res, &data_resource);
>   		request_resource(res, &bss_resource);
> -		request_crashkernel(res);
>   	}
> +
> +	request_crashkernel();
>   }
>   
>   #ifdef CONFIG_SMP

