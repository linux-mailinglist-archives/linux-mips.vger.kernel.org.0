Return-Path: <linux-mips+bounces-928-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 335B182CC90
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jan 2024 12:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F8721C21218
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jan 2024 11:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E8220DF6;
	Sat, 13 Jan 2024 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="i/fL8CPs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f6YJ7z7J"
X-Original-To: linux-mips@vger.kernel.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C0379F3
	for <linux-mips@vger.kernel.org>; Sat, 13 Jan 2024 11:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 5CBAC3200B05;
	Sat, 13 Jan 2024 06:59:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 13 Jan 2024 06:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1705147155;
	 x=1705233555; bh=WARzC4/9oUorC4jOFO36EEcwArWYpA/luI4JDylu0h8=; b=
	i/fL8CPsYtQKW2vq6HnZ/RokbJIDkwGCcpK09WacAB5JeWrq2M8djFWNlu68fE0+
	pCLPE3p9UOhn618/SPLibTcXnS0GR8VtbQuZ8SO5ruVcrLIoNoGOKgLmQhz0Nl1T
	WCOCXb9LW4GmpmJvLHjw3Pt7OZYGlnO4xLxbH+frD62tAu0b3mMIlJEGe/opgr4r
	3QcDF3+/Pn7bnRDFUwKdfxCH3h1mMU7jh6T0gZLbNGybq8sQkM1md0q6gH5Ew/7E
	vPzNupPwzAJTIBcH1NItqsSUvnecOULgX4b+OOSJavD8Bw8IDEMq5nyDvFTO/6tl
	u9oE+GgAMHmBIeQ8ExNWuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1705147155; x=
	1705233555; bh=WARzC4/9oUorC4jOFO36EEcwArWYpA/luI4JDylu0h8=; b=f
	6YJ7z7JWD/Hb0uD9n2AOgP8qWhXLQO0GgyVoyLsK+UToHfp/7A74cfrMn1DQFp++
	eZDtMfcblMcoAbq/qQ/2+pqW7UP2NKNOf7hFB9B3GPW0TS2vtRurBe1ERhLXgx4a
	gzbmBmDksesy6aVoZJ9ZcZ9ZKp4+nFcwbBOCQO0Xz3MsWvbY0VV4kj7uIc+K0Paa
	2Y2SYsi1c5ogFKKc/XnTC43syHCWUmha1HpsRulxh310kX6M0eMJ+o+ZMBKGp07j
	wXoIcRuCSsbSJ2DawvRu/ayXZ2s1Pw2ACRjmRvhtDtT8eWopWQK4VTV4vysmgSfx
	5AlSfCVco79ihB9UrpDig==
X-ME-Sender: <xms:E3uiZb50vADz3ZJtLXZ25e44_QhoUIjhvJ5gMtZZ00lz-5xsgEoMlA>
    <xme:E3uiZQ6FPkzPPcrf6HFduFtD5XS9YPsJN1wSvyr_Z1KSjAkDG0uKQ6wN2RHSlnIbO
    sgSTbEaZAumtZcff6s>
X-ME-Received: <xmr:E3uiZSeTcWaC-g3PXeAH7TzWNYPo2CTfoyFKZz7egONsgtF7RACDy6S9GU3kOWZw3QL0nA4ECgGXkhf8c_odMUg-T5vqeU1yW-UxM9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeijedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepleeuffehheegleeuvdelgffhueekjeetueevuefhffdtgfeu
    hfeggfeukefffedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:E3uiZcIdaGdKzg1-azQVZPzksqa4IbjaCnf6z7zqgL2JlHMuLSEeGg>
    <xmx:E3uiZfK7LHmIXEoXbvM5Z5MLOEkiTayaNW_4SmQX7WClK9OR8PeB3A>
    <xmx:E3uiZVwO5mja4ZW-QSq1GGqBcHjnLYOzyoD3StOhFkzkXTjU9Vnm5g>
    <xmx:E3uiZcpuq1XhWJyfkLmm6wACX_1ryZvvAZriN4K3iQjMYEMXS3BrtA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jan 2024 06:59:12 -0500 (EST)
Message-ID: <2ce1affb-b39f-4de3-a57f-29f9580fc083@flygoat.com>
Date: Sat, 13 Jan 2024 11:59:11 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Revert "MIPS: Loongson64: Handle more memory types
 passed from firmware"
To: Huang Pei <huangpei@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Li Xuefeng <lixuefeng@loongson.cn>,
 Yang Tiezhu <yangtiezhu@loongson.cn>, Gao Juxin <gaojuxin@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240113095509.178697-1-huangpei@loongson.cn>
 <20240113095509.178697-4-huangpei@loongson.cn>
Content-Language: en-US
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Autocrypt: addr=jiaxun.yang@flygoat.com;
 keydata= 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
 HVO98ZmbMeg=
In-Reply-To: <20240113095509.178697-4-huangpei@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2024/1/13 09:55, Huang Pei 写道:
> This reverts commit 264927e3538169fe2973a5732f03ea01b0f9f9e8.
>
> The SMBIOS memory reserved region(0xfffe000-0xfffe7ff) is not OWNED
> by kenel, here OWNED means the region is within the physical memory
> given to kernel by firmware as SYSTEM_RAM_{LOW,HIGH}.
>
> Since commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()),
> loongson64 booting failed with CONFIG_DEFERRED_STRUCT_PAGE_INIT like
> this:
> ----------------------------------------------------------------------
>   Call Trace:
>   [<ffffffff8235d088>] reserve_bootmem_region+0xa8/0x184
>   [<ffffffff82333940>] memblock_free_all+0x104/0x2a8
>   [<ffffffff8231d8e4>] mem_init+0x84/0x94
>   [<ffffffff82330958>] mm_core_init+0xf8/0x308
>   [<ffffffff82318c38>] start_kernel+0x43c/0x86c
>
>   Code: 10400028  2402fff0  de420000 <dc432880> 0203182b 14600022
>   64420070  00003025  24040003
>
>   ---[ end trace 0000000000000000 ]---
>   Kernel panic - not syncing: Attempted to kill the idle task!
> ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> ----------------------------------------------------------------------
>
> This is another case of inappropriate usage of memblock_reserve

In my test system with kunlun firmware they are actually covered by 
SYSRAM type.
IMO, better to add those memory to memblock as well in your case.

Thanks
- Jiaxun
> ---
>   .../include/asm/mach-loongson64/boot_param.h  |  6 +--
>   arch/mips/loongson64/init.c                   | 42 +++++++------------
>   2 files changed, 17 insertions(+), 31 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> index e007edd6b60a..c454ef734c45 100644
> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> @@ -14,11 +14,7 @@
>   #define ADAPTER_ROM		8
>   #define ACPI_TABLE		9
>   #define SMBIOS_TABLE		10
> -#define UMA_VIDEO_RAM		11
> -#define VUMA_VIDEO_RAM		12
> -#define MAX_MEMORY_TYPE		13
> -
> -#define MEM_SIZE_IS_IN_BYTES	(1 << 31)
> +#define MAX_MEMORY_TYPE		11
>   
>   #define LOONGSON3_BOOT_MEM_MAP_MAX 128
>   struct efi_memory_map_loongson {
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index f25caa6aa9d3..d62262f93069 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -49,7 +49,8 @@ void virtual_early_config(void)
>   void __init szmem(unsigned int node)
>   {
>   	u32 i, mem_type;
> -	phys_addr_t node_id, mem_start, mem_size;
> +	static unsigned long num_physpages;
> +	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
>   
>   	/* Otherwise come from DTB */
>   	if (loongson_sysconf.fw_interface != LOONGSON_LEFI)
> @@ -63,38 +64,27 @@ void __init szmem(unsigned int node)
>   
>   		mem_type = loongson_memmap->map[i].mem_type;
>   		mem_size = loongson_memmap->map[i].mem_size;
> -
> -		/* Memory size comes in MB if MEM_SIZE_IS_IN_BYTES not set */
> -		if (mem_size & MEM_SIZE_IS_IN_BYTES)
> -			mem_size &= ~MEM_SIZE_IS_IN_BYTES;
> -		else
> -			mem_size = mem_size << 20;
> -
> -		mem_start = (node_id << 44) | loongson_memmap->map[i].mem_start;
> +		mem_start = loongson_memmap->map[i].mem_start;
>   
>   		switch (mem_type) {
>   		case SYSTEM_RAM_LOW:
>   		case SYSTEM_RAM_HIGH:
> -		case UMA_VIDEO_RAM:
> -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes usable\n",
> -				(u32)node_id, mem_type, &mem_start, &mem_size);
> -			memblock_add_node(mem_start, mem_size, node,
> +			start_pfn = ((node_id << 44) + mem_start) >> PAGE_SHIFT;
> +			node_psize = (mem_size << 20) >> PAGE_SHIFT;
> +			end_pfn  = start_pfn + node_psize;
> +			num_physpages += node_psize;
> +			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
> +				(u32)node_id, mem_type, mem_start, mem_size);
> +			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
> +				start_pfn, end_pfn, num_physpages);
> +			memblock_add_node(PFN_PHYS(start_pfn),
> +					  PFN_PHYS(node_psize), node,
>   					  MEMBLOCK_NONE);
>   			break;
>   		case SYSTEM_RAM_RESERVED:
> -		case VIDEO_ROM:
> -		case ADAPTER_ROM:
> -		case ACPI_TABLE:
> -		case SMBIOS_TABLE:
> -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes reserved\n",
> -				(u32)node_id, mem_type, &mem_start, &mem_size);
> -			memblock_reserve(mem_start, mem_size);
> -			break;
> -		/* We should not reserve VUMA_VIDEO_RAM as it overlaps with MMIO */
> -		case VUMA_VIDEO_RAM:
> -		default:
> -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes unhandled\n",
> -				(u32)node_id, mem_type, &mem_start, &mem_size);
> +			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
> +				(u32)node_id, mem_type, mem_start, mem_size);
> +			memblock_reserve(((node_id << 44) + mem_start), mem_size << 20);
>   			break;
>   		}
>   	}

-- 
---
Jiaxun Yang


