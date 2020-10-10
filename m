Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61F1F289F23
	for <lists+linux-mips@lfdr.de>; Sat, 10 Oct 2020 10:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbgJJIHc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Oct 2020 04:07:32 -0400
Received: from relay3.mymailcheap.com ([217.182.66.161]:47753 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729291AbgJJIGt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 10 Oct 2020 04:06:49 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 4206B3ECDF;
        Sat, 10 Oct 2020 10:06:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 86F3F2A3B8;
        Sat, 10 Oct 2020 04:06:19 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1602317179;
        bh=GdiYTUqqZv7ZOr279i3aQQCSyTaLX/zSk9ClwbPh8MU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GoTYIQU3ug+XHu8B0N5sDqRLBiOaSFN/JHLZwUnjN4/U2A2Dmx8tT+ZjHvjZZcfDE
         i42fNMyAAX10uQqxVOgD3tZ/eiq4Na3PAY3XsJThULgsux5oyFVpfogROOoap5d4rn
         Qk38bo4GOOXrNczKeMUABYcglXwzj3Aupyja0vtw=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id V8tKX6csObIP; Sat, 10 Oct 2020 04:06:17 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Sat, 10 Oct 2020 04:06:17 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id ECA8740BFB;
        Sat, 10 Oct 2020 08:06:15 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="iZXBGhax";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 69E2E40EAD;
        Sat, 10 Oct 2020 08:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1602317171;
        bh=GdiYTUqqZv7ZOr279i3aQQCSyTaLX/zSk9ClwbPh8MU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iZXBGhaxbyRUPEDXiqQbRQAWMai6HzDFzOI0xQeNsVxoHm7x/kQ6aDg2GXcWz2Clj
         FopDp1iHKf/ae4xiWr5e3XScJ6WkygFvnVdlDih1EjsZjauKVeqfUC7LRdvcGEyIv0
         4B8VQpaIHR19ELHHk5H69Z+1/cBeNJBhRDSNyzeQ=
Subject: Re: [PATCH 2/3] MIPS: Loongson64: Clean up numa.c
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
 <1602241050-24051-3-git-send-email-yangtiezhu@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <66aff11c-6b2b-f174-f174-f3b39e45de8d@flygoat.com>
Date:   Sat, 10 Oct 2020 16:06:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602241050-24051-3-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: ECA8740BFB
X-Spamd-Result: default: False [-0.10 / 10.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all:c];
         RCPT_COUNT_FIVE(0.00)[6];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/10/9 ÏÂÎç6:57, Tiezhu Yang Ð´µÀ:
> (1) Replace nid_to_addroffset() with nid_to_addrbase() and then remove the
> related useless code.
>
> (2) Since end_pfn = start_pfn + node_psize, use "node_psize" instead of
> "end_pfn - start_pfn" to avoid the redundant calculation.
>
> (3) After commit 6fbde6b492df ("MIPS: Loongson64: Move files to the
> top-level directory"), CONFIG_ZONE_DMA32 is always set for Loongson64
> due to MACH_LOONGSON64 selects ZONE_DMA32, so no need to use ifdef any
> more, just remove it.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   arch/mips/include/asm/mach-loongson64/mmzone.h |  6 +-----
>   arch/mips/loongson64/numa.c                    | 29 +++-----------------------
>   2 files changed, 4 insertions(+), 31 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson64/mmzone.h
> index 3a25dbd..c3f0f7a 100644
> --- a/arch/mips/include/asm/mach-loongson64/mmzone.h
> +++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
> @@ -11,13 +11,9 @@
>   
>   #include <boot_param.h>
>   #define NODE_ADDRSPACE_SHIFT 44
> -#define NODE0_ADDRSPACE_OFFSET 0x000000000000UL
> -#define NODE1_ADDRSPACE_OFFSET 0x100000000000UL
> -#define NODE2_ADDRSPACE_OFFSET 0x200000000000UL
> -#define NODE3_ADDRSPACE_OFFSET 0x300000000000UL
>   
>   #define pa_to_nid(addr)  (((addr) & 0xf00000000000) >> NODE_ADDRSPACE_SHIFT)
> -#define nid_to_addrbase(nid) ((nid) << NODE_ADDRSPACE_SHIFT)
> +#define nid_to_addrbase(nid) ((unsigned long)(nid) << NODE_ADDRSPACE_SHIFT)
>   
>   extern struct pglist_data *__node_data[];
>   
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index ea8bb1b..cf9459f 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -98,27 +98,6 @@ static void __init init_topology_matrix(void)
>   	}
>   }
>   
> -static unsigned long nid_to_addroffset(unsigned int nid)
> -{
> -	unsigned long result;
> -	switch (nid) {
> -	case 0:
> -	default:
> -		result = NODE0_ADDRSPACE_OFFSET;
> -		break;
> -	case 1:
> -		result = NODE1_ADDRSPACE_OFFSET;
> -		break;
> -	case 2:
> -		result = NODE2_ADDRSPACE_OFFSET;
> -		break;
> -	case 3:
> -		result = NODE3_ADDRSPACE_OFFSET;
> -		break;
> -	}
> -	return result;
> -}
> -
>   static void __init szmem(unsigned int node)
>   {
>   	u32 i, mem_type;
> @@ -146,7 +125,7 @@ static void __init szmem(unsigned int node)
>   			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
>   				start_pfn, end_pfn, num_physpages);
>   			memblock_add_node(PFN_PHYS(start_pfn),
> -				PFN_PHYS(end_pfn - start_pfn), node);
> +				PFN_PHYS(node_psize), node);
>   			break;
>   		case SYSTEM_RAM_HIGH:
>   			start_pfn = ((node_id << 44) + mem_start) >> PAGE_SHIFT;
> @@ -158,7 +137,7 @@ static void __init szmem(unsigned int node)
>   			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
>   				start_pfn, end_pfn, num_physpages);
>   			memblock_add_node(PFN_PHYS(start_pfn),
> -				PFN_PHYS(end_pfn - start_pfn), node);
> +				PFN_PHYS(node_psize), node);
>   			break;
>   		case SYSTEM_RAM_RESERVED:
>   			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
> @@ -175,7 +154,7 @@ static void __init node_mem_init(unsigned int node)
>   	unsigned long node_addrspace_offset;
>   	unsigned long start_pfn, end_pfn;
>   
> -	node_addrspace_offset = nid_to_addroffset(node);
> +	node_addrspace_offset = nid_to_addrbase(node);
>   	pr_info("Node%d's addrspace_offset is 0x%lx\n",
>   			node, node_addrspace_offset);
>   
> @@ -242,9 +221,7 @@ void __init paging_init(void)
>   	unsigned long zones_size[MAX_NR_ZONES] = {0, };
>   
>   	pagetable_init();
> -#ifdef CONFIG_ZONE_DMA32
>   	zones_size[ZONE_DMA32] = MAX_DMA32_PFN;
> -#endif
>   	zones_size[ZONE_NORMAL] = max_low_pfn;
>   	free_area_init(zones_size);
>   }
