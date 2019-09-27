Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B353FC036D
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2019 12:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfI0Kba (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Sep 2019 06:31:30 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35701 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfI0Kba (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 Sep 2019 06:31:30 -0400
Received: by mail-io1-f65.google.com with SMTP id q10so15056494iop.2
        for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2019 03:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ECriue4BlXPrfTwdD5iJ91esc04F7WeNmP6JsoF7ESA=;
        b=i2HuP4vD/4pOg1BTUT6kJ2k42ikLoMtNgPSHaGYqNP4mPJVvrV3qzPv+kehNpl/4HU
         DF8/xdxFAKq8O8TPIt18XY9dVkz3GlOyyhRAuwFO6sod133JiNX5aZuLhT/L3XO9OZgi
         1D6kDzArDYWmVqCrMIy/Ps7Ku7fMUas2CTj3mmsxo6zYnArE73nzFpsBFghwEaCDa4zE
         NlGn+m2SzOvxmXeGmYNwHGZrU8Nz+K/S8n7/pEhemT5/TPmFo+KqeOWTccjkLDm9AP1X
         FdRgIsEQ03gyJI94YnweLLuj/gtJ4vB0dn+tB/x/F0Wug8yzzolp4hD7UYvE6bVBPnOU
         EG8Q==
X-Gm-Message-State: APjAAAUvjiefqF0e0bJPhC9oXCyTI9kSr/cdJUlnc2HTSNVeTdqiEAuL
        8eXUSoVkiqWuJ6yVeTauWMWOuNEALtzawWHfipmHith5knE=
X-Google-Smtp-Source: APXvYqxc7vJVSA9dWQzFTj+mXYhuH18+9JByBqbNJh49E4h/LXE/EGW9k50xDm2uqZm92n+iScz+mY0BOuGubtbQXPI=
X-Received: by 2002:a5d:814f:: with SMTP id f15mr7919829ioo.134.1569580289491;
 Fri, 27 Sep 2019 03:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190926140458.10367-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20190926140458.10367-1-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 27 Sep 2019 18:36:29 +0800
Message-ID: <CAAhV-H4H5dXZCL_P7+o+SR1dVGchbyvCAqvHyac9i4-7-esoCQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson64: Remove duplicated add_memory_region
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun and Paul,

This patch isn't a complete fix, please refer to
https://patchwork.kernel.org/patch/11164281/.

Huacai

On Thu, Sep 26, 2019 at 10:05 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> From a94e4f24ec83 ("MIPS: init: Drop boot_mem_map"), add_memory_region is
> handled by memblock_add directly. So they're totally duplicated with following
> memblock_add_node and leading to boot failure in some cases.
>
> Reported-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/loongson64/loongson-3/numa.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/mips/loongson64/loongson-3/numa.c b/arch/mips/loongson64/loongson-3/numa.c
> index 414e97de5dc0..dae7d7704e66 100644
> --- a/arch/mips/loongson64/loongson-3/numa.c
> +++ b/arch/mips/loongson64/loongson-3/numa.c
> @@ -142,8 +142,6 @@ static void __init szmem(unsigned int node)
>                                 (u32)node_id, mem_type, mem_start, mem_size);
>                         pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
>                                 start_pfn, end_pfn, num_physpages);
> -                       add_memory_region((node_id << 44) + mem_start,
> -                               (u64)mem_size << 20, BOOT_MEM_RAM);
>                         memblock_add_node(PFN_PHYS(start_pfn),
>                                 PFN_PHYS(end_pfn - start_pfn), node);
>                         break;
> @@ -156,16 +154,14 @@ static void __init szmem(unsigned int node)
>                                 (u32)node_id, mem_type, mem_start, mem_size);
>                         pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
>                                 start_pfn, end_pfn, num_physpages);
> -                       add_memory_region((node_id << 44) + mem_start,
> -                               (u64)mem_size << 20, BOOT_MEM_RAM);
>                         memblock_add_node(PFN_PHYS(start_pfn),
>                                 PFN_PHYS(end_pfn - start_pfn), node);
>                         break;
>                 case SYSTEM_RAM_RESERVED:
>                         pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
>                                 (u32)node_id, mem_type, mem_start, mem_size);
> -                       add_memory_region((node_id << 44) + mem_start,
> -                               (u64)mem_size << 20, BOOT_MEM_RESERVED);
> +                       memblock_add_node(PFN_PHYS(start_pfn),
> +                               PFN_PHYS(end_pfn - start_pfn), node);
>                         memblock_reserve(((node_id << 44) + mem_start),
>                                 mem_size << 20);
>                         break;
> --
> 2.23.0
>
