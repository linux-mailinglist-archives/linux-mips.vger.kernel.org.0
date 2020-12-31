Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC5F2E7D5E
	for <lists+linux-mips@lfdr.de>; Thu, 31 Dec 2020 01:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgLaA0a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Dec 2020 19:26:30 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:44857 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgLaA03 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Dec 2020 19:26:29 -0500
Received: by mail-io1-f44.google.com with SMTP id z5so16021730iob.11;
        Wed, 30 Dec 2020 16:26:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzT91tppKQB/Uyn3VLuWw+XosR8pFomzL/I34PTPY9E=;
        b=hyUPxqI1GEFtGObAVIThN0gmrL6fls8+iViSvC+zWKp5sZCimXFzZvCdTh9C8Le/TJ
         5vULOQN4DM6+CAiWgA0+RmwGa63aY/evxBUzoGuUsZNcL9FWdBXhXmQKUsfKsUAdaiTV
         BaHT/KS972wkCxGCdIiC1TicTSnYep9WAKvYxg8JOKNIVxGi9rLx0V1xs8ynRwcKvd50
         7VPWwcXyglA3TnC/aIgY7IGzwM+5meCFWi3OAfwHSw+hum3d1Jpje2Uk7FjJHNoBMYmx
         /ov7QaEJ93pvPXqfF7ogM1dK4sgPlrNTRnrB+ozs7npt1DkilSDxEYoqQUN2Vqz38nyD
         frTQ==
X-Gm-Message-State: AOAM531Gtm0syMohCU7X/BGSJvhR+11S6PbPu+wIoOLPzuiyzR/f3Dok
        o62cm6yzrB3D79sHHdf2I0pM+CfnnCBDHAAuT6HSXVzbMLI=
X-Google-Smtp-Source: ABdhPJwqBFO4XsR+VwJO9pz1zl3JmYFKrfYJ9A2cppFDNVaQmFOUq8eh6420wYXfcdqV6fb7+reAQ+fbUHqLbPue5vE=
X-Received: by 2002:a02:c042:: with SMTP id u2mr47854655jam.32.1609374348444;
 Wed, 30 Dec 2020 16:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20201230033950.13839-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20201230033950.13839-1-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 31 Dec 2020 08:25:36 +0800
Message-ID: <CAAhV-H6TLn1GwL3WZFPeX-m2ido_8SZ8v=ZwbV+DZod7EoVdew@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] MIPS: cacheinfo: Add missing VCache
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Wed, Dec 30, 2020 at 11:41 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Victim Cache is defined by Loongson as per-core unified
> private Cache.
> Add this into cacheinfo and make cache levels selfincrement
> instead of hardcode levels.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/kernel/cacheinfo.c | 34 ++++++++++++++++++++++++++--------
>  1 file changed, 26 insertions(+), 8 deletions(-)
>
> diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
> index 47312c529410..83548331ee94 100644
> --- a/arch/mips/kernel/cacheinfo.c
> +++ b/arch/mips/kernel/cacheinfo.c
> @@ -35,6 +35,11 @@ static int __init_cache_level(unsigned int cpu)
>
>         leaves += (c->icache.waysize) ? 2 : 1;
>
> +       if (c->vcache.waysize) {
> +               levels++;
> +               leaves++;
> +       }
> +
>         if (c->scache.waysize) {
>                 levels++;
>                 leaves++;
> @@ -74,25 +79,38 @@ static int __populate_cache_leaves(unsigned int cpu)
>         struct cpuinfo_mips *c = &current_cpu_data;
>         struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>         struct cacheinfo *this_leaf = this_cpu_ci->info_list;
> +       int level = 1;
>
>         if (c->icache.waysize) {
> -               /* L1 caches are per core */
> +               /* D/I caches are per core */
It seems "I/D caches" is better than "D/I caches", see
arch/mips/include/asm/cpu-info.h and search cache_desc.

Huacai
>                 fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
> -               populate_cache(dcache, this_leaf, 1, CACHE_TYPE_DATA);
> +               populate_cache(dcache, this_leaf, level, CACHE_TYPE_DATA);
>                 fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
> -               populate_cache(icache, this_leaf, 1, CACHE_TYPE_INST);
> +               populate_cache(icache, this_leaf, level, CACHE_TYPE_INST);
> +               level++;
>         } else {
> -               populate_cache(dcache, this_leaf, 1, CACHE_TYPE_UNIFIED);
> +               populate_cache(dcache, this_leaf, level, CACHE_TYPE_UNIFIED);
> +               level++;
> +       }
> +
> +       if (c->vcache.waysize) {
> +               /* Vcache is per core as well */
> +               fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
> +               populate_cache(vcache, this_leaf, level, CACHE_TYPE_UNIFIED);
> +               level++;
>         }
>
>         if (c->scache.waysize) {
> -               /* L2 cache is per cluster */
> +               /* Scache is per cluster */
>                 fill_cpumask_cluster(cpu, &this_leaf->shared_cpu_map);
> -               populate_cache(scache, this_leaf, 2, CACHE_TYPE_UNIFIED);
> +               populate_cache(scache, this_leaf, level, CACHE_TYPE_UNIFIED);
> +               level++;
>         }
>
> -       if (c->tcache.waysize)
> -               populate_cache(tcache, this_leaf, 3, CACHE_TYPE_UNIFIED);
> +       if (c->tcache.waysize) {
> +               populate_cache(tcache, this_leaf, level, CACHE_TYPE_UNIFIED);
> +               level++;
> +       }
>
>         this_cpu_ci->cpu_map_populated = true;
>
> --
> 2.30.0
>
