Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3FDD24DC58
	for <lists+linux-mips@lfdr.de>; Fri, 21 Aug 2020 19:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgHUQ7s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 12:59:48 -0400
Received: from elvis.franken.de ([193.175.24.41]:54990 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728220AbgHUQ5m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Aug 2020 12:57:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k9AME-0003dt-00; Fri, 21 Aug 2020 18:57:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 79A5CC0D8F; Fri, 21 Aug 2020 18:55:39 +0200 (CEST)
Date:   Fri, 21 Aug 2020 18:55:39 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] MIPS: cacheinfo: Add missing VCache
Message-ID: <20200821165539.GA15948@alpha.franken.de>
References: <20200820004253.3418-1-jiaxun.yang@flygoat.com>
 <20200820004253.3418-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820004253.3418-2-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 20, 2020 at 08:42:49AM +0800, Jiaxun Yang wrote:
> Victim Cache is defined by Loongson as per-core unified
> private Cache.
> Add this into cacheinfo and make cache levels selfincrement
> instead of hardcode levels.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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
>  	leaves += (c->icache.waysize) ? 2 : 1;
>  
> +	if (c->vcache.waysize) {
> +		levels++;
> +		leaves++;
> +	}
> +
>  	if (c->scache.waysize) {
>  		levels++;
>  		leaves++;
> @@ -74,25 +79,38 @@ static int __populate_cache_leaves(unsigned int cpu)
>  	struct cpuinfo_mips *c = &current_cpu_data;
>  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>  	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
> +	int level = 1;
>  
>  	if (c->icache.waysize) {
> -		/* L1 caches are per core */
> +		/* D/I caches are per core */
>  		fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
> -		populate_cache(dcache, this_leaf, 1, CACHE_TYPE_DATA);
> +		populate_cache(dcache, this_leaf, level, CACHE_TYPE_DATA);
>  		fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
> -		populate_cache(icache, this_leaf, 1, CACHE_TYPE_INST);
> +		populate_cache(icache, this_leaf, level, CACHE_TYPE_INST);
> +		level++;
>  	} else {
> -		populate_cache(dcache, this_leaf, 1, CACHE_TYPE_UNIFIED);
> +		populate_cache(dcache, this_leaf, level, CACHE_TYPE_UNIFIED);
> +		level++;
> +	}
> +
> +	if (c->vcache.waysize) {

why can't we insert vcache as level 4 and leave the rest of the file
alone ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
