Return-Path: <linux-mips+bounces-930-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858EA82D071
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jan 2024 12:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AFF128236B
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jan 2024 11:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F871FDA;
	Sun, 14 Jan 2024 11:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="hyWAC7PB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UuLWZThI"
X-Original-To: linux-mips@vger.kernel.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814351FC4
	for <linux-mips@vger.kernel.org>; Sun, 14 Jan 2024 11:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id C5C273200A6C;
	Sun, 14 Jan 2024 06:58:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 14 Jan 2024 06:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1705233509;
	 x=1705319909; bh=CngvKDFaWcmSGL96XQs6Yit3NtSnst9HBVnQQKNrJ9c=; b=
	hyWAC7PBToSmJQT6p149N+6EytubqhsKkKPj9gXFNshwUWf25vudxEaFUXuybkfp
	YJyBemQyeNAMmPka6g/SSkWtdpevbMFo5BDq+kB8SCUEZBtYfkIyWk6n5+8kqg9q
	0WPIwPNk52Ix8mcFwJNyciK58lQTdwHL6LQJ+vbtY3Sgz7diLUFzPAW691tDLbJV
	8i5STtfR89AxAiu0nyG+E58RwwLJ0CCMFhZpIHLyP1O5TYLkYt8ARUjNlMkn4aHg
	l8LCL/ji2iMOF4igQ44rVYCNlnl6cnEH/ixPB+nvDxQue0murIacTQWiRtudjF4J
	2c/q3QgobMzHV2oQGXlLFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1705233509; x=
	1705319909; bh=CngvKDFaWcmSGL96XQs6Yit3NtSnst9HBVnQQKNrJ9c=; b=U
	uLWZThI6R63n/nHxNWJN2ve1DyRtQ4O+H5hZJx3Q8mjGdtSNyPz9Jmf8X+p8PwPR
	Lu1pC2St71YuKcNOf/Xqq4NtAeGOypTEisYcOpu1GcJxGu0LJxafH2ovLVKLu0oz
	7ME1cpdO6AcifEpBdGWf7Mml5838Sznyxm9OySKG0+YdC+nsa/jWyazic3OALf5V
	qBT+YN7hMvDb7Ers0Xv+gI7jl2vx5XwsXRcPEN0YzXZD4FC7uuHSXmbTsBQZlkxY
	cq+TvlrLzxdKeu7iWp2AK/0yehOY/NgRYCcZR5PrAxwkkaIb7rZGtRlImhEQhMqy
	SuFDDcsARmR3XNwXJ3b4g==
X-ME-Sender: <xms:ZMyjZf05YLqE8lzlLeZJXeU8Z8Ic8UN4HPU33BSTPyUVzPkg2IYG4w>
    <xme:ZMyjZeEaRPLrAQgzuDZc0jgzenvkY7SjH8wzmqMiwwl3UycpsT8JEUt6AKA4K_gPg
    10O-10eCXXHtSqlt3E>
X-ME-Received: <xmr:ZMyjZf7v8TNg4iFo17IX0jBjIMeInwnO2e18Sep1uJHHkA_-wW9nyXvULSGBf2COU6pF3P-fWjDfc3Fjk5dVHmbUZ0BxdPnwy7pfLcM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeiledgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepleeuffehheegleeuvdelgffhueekjeetueevuefhffdtgfeu
    hfeggfeukefffedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:ZMyjZU3PrEJNAVg3tXY6ML88tzbo3Wasr4A3YfRs238ebYz_BeKhtw>
    <xmx:ZMyjZSE2E8MFPebuxsmMmAsnOUmZtCCOAd_NsTjUp5f0oLKUc4a9ww>
    <xmx:ZMyjZV9OIlfJcGFdlRtbiBtJhtshscNF-cPd1SXSGmYGDkbz0cudaA>
    <xmx:ZcyjZV0f3ounDH1lNFl4IzlTcnf4KXuG5Q0bkiQG6GNN5p6bluCPJw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Jan 2024 06:58:26 -0500 (EST)
Message-ID: <7d4fe00c-259d-4e19-90a1-272bc2adcc7e@flygoat.com>
Date: Sun, 14 Jan 2024 11:58:25 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Revert "MIPS: Loongson64: Handle more memory types
 passed from firmware"
To: Huang Pei <huangpei@loongson.cn>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Li Xuefeng <lixuefeng@loongson.cn>,
 Yang Tiezhu <yangtiezhu@loongson.cn>, Gao Juxin <gaojuxin@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240113095509.178697-1-huangpei@loongson.cn>
 <20240113095509.178697-4-huangpei@loongson.cn>
 <2ce1affb-b39f-4de3-a57f-29f9580fc083@flygoat.com>
 <20240114085316.prb7ynh4gfytv2rb@Board-3A3000>
Content-Language: en-US
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Autocrypt: addr=jiaxun.yang@flygoat.com;
 keydata= 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
 HVO98ZmbMeg=
In-Reply-To: <20240114085316.prb7ynh4gfytv2rb@Board-3A3000>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2024/1/14 08:53, Huang Pei 写道:
> On Sat, Jan 13, 2024 at 11:59:11AM +0000, Jiaxun Yang wrote:
[...]
>
> In my test system with kunlun firmware they are actually covered by SYSRAM
> type.
> IMO, better to add those memory to memblock as well in your case.
>
> My test machine is PMON-based 3B1500, the SMBIOS_TABLE located in
> 0xfffe000-0xfffe7ff, which is not included in SYSTEM_RAM_LOW(0x200000-
> 0xeffffff), I think we need a check like,
> ----------------------------------------------------------------------
> 	if(memblock_is_region_memory(addr, size))
> 		memblock_reserve(addr, size);
> ----------------------------------------------------------------------
> to support both cases;

Then we are running into ordering issue. memblock_add of SYSRAM may 
later then reservation.
What about unconditionally add those ranges to memblock? As it's certain 
that those regions will
be RAM.

Thanks
- Jiaxun

>> Thanks
>> - Jiaxun
>>> ---
>>>    .../include/asm/mach-loongson64/boot_param.h  |  6 +--
>>>    arch/mips/loongson64/init.c                   | 42 +++++++------------
>>>    2 files changed, 17 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
>>> index e007edd6b60a..c454ef734c45 100644
>>> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
>>> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
>>> @@ -14,11 +14,7 @@
>>>    #define ADAPTER_ROM		8
>>>    #define ACPI_TABLE		9
>>>    #define SMBIOS_TABLE		10
>>> -#define UMA_VIDEO_RAM		11
>>> -#define VUMA_VIDEO_RAM		12
>>> -#define MAX_MEMORY_TYPE		13
>>> -
>>> -#define MEM_SIZE_IS_IN_BYTES	(1 << 31)
>>> +#define MAX_MEMORY_TYPE		11
>>>    #define LOONGSON3_BOOT_MEM_MAP_MAX 128
>>>    struct efi_memory_map_loongson {
>>> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
>>> index f25caa6aa9d3..d62262f93069 100644
>>> --- a/arch/mips/loongson64/init.c
>>> +++ b/arch/mips/loongson64/init.c
>>> @@ -49,7 +49,8 @@ void virtual_early_config(void)
>>>    void __init szmem(unsigned int node)
>>>    {
>>>    	u32 i, mem_type;
>>> -	phys_addr_t node_id, mem_start, mem_size;
>>> +	static unsigned long num_physpages;
>>> +	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
>>>    	/* Otherwise come from DTB */
>>>    	if (loongson_sysconf.fw_interface != LOONGSON_LEFI)
>>> @@ -63,38 +64,27 @@ void __init szmem(unsigned int node)
>>>    		mem_type = loongson_memmap->map[i].mem_type;
>>>    		mem_size = loongson_memmap->map[i].mem_size;
>>> -
>>> -		/* Memory size comes in MB if MEM_SIZE_IS_IN_BYTES not set */
>>> -		if (mem_size & MEM_SIZE_IS_IN_BYTES)
>>> -			mem_size &= ~MEM_SIZE_IS_IN_BYTES;
>>> -		else
>>> -			mem_size = mem_size << 20;
>>> -
>>> -		mem_start = (node_id << 44) | loongson_memmap->map[i].mem_start;
>>> +		mem_start = loongson_memmap->map[i].mem_start;
>>>    		switch (mem_type) {
>>>    		case SYSTEM_RAM_LOW:
>>>    		case SYSTEM_RAM_HIGH:
>>> -		case UMA_VIDEO_RAM:
>>> -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes usable\n",
>>> -				(u32)node_id, mem_type, &mem_start, &mem_size);
>>> -			memblock_add_node(mem_start, mem_size, node,
>>> +			start_pfn = ((node_id << 44) + mem_start) >> PAGE_SHIFT;
>>> +			node_psize = (mem_size << 20) >> PAGE_SHIFT;
>>> +			end_pfn  = start_pfn + node_psize;
>>> +			num_physpages += node_psize;
>>> +			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
>>> +				(u32)node_id, mem_type, mem_start, mem_size);
>>> +			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
>>> +				start_pfn, end_pfn, num_physpages);
>>> +			memblock_add_node(PFN_PHYS(start_pfn),
>>> +					  PFN_PHYS(node_psize), node,
>>>    					  MEMBLOCK_NONE);
>>>    			break;
>>>    		case SYSTEM_RAM_RESERVED:
>>> -		case VIDEO_ROM:
>>> -		case ADAPTER_ROM:
>>> -		case ACPI_TABLE:
>>> -		case SMBIOS_TABLE:
>>> -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes reserved\n",
>>> -				(u32)node_id, mem_type, &mem_start, &mem_size);
>>> -			memblock_reserve(mem_start, mem_size);
>>> -			break;
>>> -		/* We should not reserve VUMA_VIDEO_RAM as it overlaps with MMIO */
>>> -		case VUMA_VIDEO_RAM:
>>> -		default:
>>> -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes unhandled\n",
>>> -				(u32)node_id, mem_type, &mem_start, &mem_size);
>>> +			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
>>> +				(u32)node_id, mem_type, mem_start, mem_size);
>>> +			memblock_reserve(((node_id << 44) + mem_start), mem_size << 20);
>>>    			break;
>>>    		}
>>>    	}
>> -- 
>> ---
>> Jiaxun Yang
>

-- 
---
Jiaxun Yang


