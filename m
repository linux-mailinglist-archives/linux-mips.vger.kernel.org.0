Return-Path: <linux-mips+bounces-1035-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D2835C79
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jan 2024 09:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BA491F27B0A
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jan 2024 08:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CF920DE0;
	Mon, 22 Jan 2024 08:21:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8FF20DE2
	for <linux-mips@vger.kernel.org>; Mon, 22 Jan 2024 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705911680; cv=none; b=C3ydue33W3a1/1GQ+X1m7K7+5fmUGAw65QCgwv+TZHkazMn7IHVKqzTqB4QswFG0o7d0tMghEPJITj/RzTPshOPLcNJXyT2TFi4lqvUc+baOC0pDzURuGyO88n9dbTyCwa9IT2ZHtK2/mfOChodmkYNtrDeB8iF+udTcF1YbIa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705911680; c=relaxed/simple;
	bh=LmzMSCuxVb7fcw3fNllbh4+ycvbOKFHF5K0Qb9aCOvE=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Y+vcRhTDd6UccoiL8GPZKSW2jLHhGknuHwOdHFwjzs4R9UHGQOxcti8HlnEtMWnwhrVnMhjrFPJsQhFwTrZ3VTqfSUHcRlLqX48zsJDfG5asjpk8MYIYJet8znDmLh5mooTCTimLxV9e6kuk1KbXOH395mG2FosoZR5uYIxEm60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.84.44) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 22 Jan
 2024 11:21:00 +0300
Subject: Re: [PATCH 2/2] MIPS: loongson64: set nid for reserved memblock
 region
To: Huang Pei <huangpei@loongson.cn>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>
CC: Bibo Mao <maobibo@loongson.cn>, <linux-mips@vger.kernel.org>, Jiaxun Yang
	<jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>, Li Xuefeng
	<lixuefeng@loongson.cn>, Yang Tiezhu <yangtiezhu@loongson.cn>, Gao Juxin
	<gaojuxin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240122080834.8251-1-huangpei@loongson.cn>
 <20240122080834.8251-3-huangpei@loongson.cn>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <9f28d7d6-7d8d-db8a-c3c3-793c3aaf0385@omp.ru>
Date: Mon, 22 Jan 2024 11:20:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240122080834.8251-3-huangpei@loongson.cn>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 01/22/2024 08:02:58
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 182809 [Jan 22 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.84.44 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.84.44 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	31.173.84.44:7.1.2;127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.84.44
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 01/22/2024 08:08:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/22/2024 7:19:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 1/22/24 11:08 AM, Huang Pei wrote:

> Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()) reveals

   You forgot a space before (" and " after reserve_bootmem_region(). :-)

> that reserved memblock regions have no valid node id set, just set it
> right since loongson64 firmware makes it clear in memory layout info.
> 
> This works around booting failure on 3A1000+ since commit 61167ad5fecd
> ("mm: pass nid to reserve_bootmem_region()) under

   Again, you forgot to close the quote...

> CONFIG_DEFERRED_STRUCT_PAGE_INIT.
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/loongson64/init.c | 2 ++
>  arch/mips/loongson64/numa.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index f25caa6aa9d3..000ba91c0886 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -103,6 +103,8 @@ void __init szmem(unsigned int node)
>  	if (loongson_sysconf.vgabios_addr)
>  		memblock_reserve(virt_to_phys((void *)loongson_sysconf.vgabios_addr),
>  				SZ_256K);
> +	/* set nid for reserved memory */
> +	memblock_set_node((u64)node << 44, (u64)(node+1) << 44, &memblock.reserved, node);

   Please add spaces around +, at least for consistency with <<. :-)

[...]
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index 8f61e93c0c5b..6345e096c532 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -132,6 +132,8 @@ static void __init node_mem_init(unsigned int node)
>  
>  		/* Reserve pfn range 0~node[0]->node_start_pfn */
>  		memblock_reserve(0, PAGE_SIZE * start_pfn);
> +		/* set nid for reserved memory on node 0 */
> +		memblock_set_node(0, (u64)1 << 44, &memblock.reserved, 1);

  Could use 1ULL instead of (u64)1...

[...]

MBR, Sergey

