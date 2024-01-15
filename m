Return-Path: <linux-mips+bounces-940-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C782E97C
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jan 2024 07:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1D8EB20B3B
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jan 2024 06:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C67810A05;
	Tue, 16 Jan 2024 06:23:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDD010A01
	for <linux-mips@vger.kernel.org>; Tue, 16 Jan 2024 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8BxefB8iaRlCjAAAA--.1101S3;
	Mon, 15 Jan 2024 09:25:16 +0800 (CST)
Received: from Board-3A3000 (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxzM54iaRlwUMBAA--.187S2;
	Mon, 15 Jan 2024 09:25:14 +0800 (CST)
Date: Mon, 15 Jan 2024 09:25:12 +0800
From: Huang Pei <huangpei@loongson.cn>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 3/3] Revert "MIPS: Loongson64: Handle more memory types
 passed from firmware"
Message-ID: <20240115012512.y2ujt3xmks3regel@Board-3A3000>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240113095509.178697-1-huangpei@loongson.cn>
 <20240113095509.178697-4-huangpei@loongson.cn>
 <2ce1affb-b39f-4de3-a57f-29f9580fc083@flygoat.com>
 <20240114085316.prb7ynh4gfytv2rb@Board-3A3000>
 <7d4fe00c-259d-4e19-90a1-272bc2adcc7e@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d4fe00c-259d-4e19-90a1-272bc2adcc7e@flygoat.com>
X-CM-TRANSID:AQAAf8DxzM54iaRlwUMBAA--.187S2
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3GF4ftw4UXw4UKrykZr13GFX_yoW7GrWUpr
	13Aa4xCr45Xr17Kr4Iqwn8GrZ2vws5Kr48Jr4qvr1vqFyqy3WxXF18tr40934vvrWkJF1v
	vrW5tayag3WFy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=
X-Gw-Check: 100e95e1ea4d306c

On Sun, Jan 14, 2024 at 11:58:25AM +0000, Jiaxun Yang wrote:
> 
> 
> 在 2024/1/14 08:53, Huang Pei 写道:
> > On Sat, Jan 13, 2024 at 11:59:11AM +0000, Jiaxun Yang wrote:
> [...]
> > 
> > In my test system with kunlun firmware they are actually covered by SYSRAM
> > type.
> > IMO, better to add those memory to memblock as well in your case.
> > 
> > My test machine is PMON-based 3B1500, the SMBIOS_TABLE located in
> > 0xfffe000-0xfffe7ff, which is not included in SYSTEM_RAM_LOW(0x200000-
> > 0xeffffff), I think we need a check like,
> > ----------------------------------------------------------------------
> > 	if(memblock_is_region_memory(addr, size))
> > 		memblock_reserve(addr, size);
> > ----------------------------------------------------------------------
> > to support both cases;
> 
> Then we are running into ordering issue. memblock_add of SYSRAM may later
> then reservation.
> What about unconditionally add those ranges to memblock? As it's certain
> that those regions will
> be RAM.
> 
I think we can do szmem twice, one for memblock.memory, the other for
memblock_reserve.

> Thanks
> - Jiaxun
> 
> > > Thanks
> > > - Jiaxun
> > > > ---
> > > >    .../include/asm/mach-loongson64/boot_param.h  |  6 +--
> > > >    arch/mips/loongson64/init.c                   | 42 +++++++------------
> > > >    2 files changed, 17 insertions(+), 31 deletions(-)
> > > > 
> > > > diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> > > > index e007edd6b60a..c454ef734c45 100644
> > > > --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> > > > +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> > > > @@ -14,11 +14,7 @@
> > > >    #define ADAPTER_ROM		8
> > > >    #define ACPI_TABLE		9
> > > >    #define SMBIOS_TABLE		10
> > > > -#define UMA_VIDEO_RAM		11
> > > > -#define VUMA_VIDEO_RAM		12
> > > > -#define MAX_MEMORY_TYPE		13
> > > > -
> > > > -#define MEM_SIZE_IS_IN_BYTES	(1 << 31)
> > > > +#define MAX_MEMORY_TYPE		11
> > > >    #define LOONGSON3_BOOT_MEM_MAP_MAX 128
> > > >    struct efi_memory_map_loongson {
> > > > diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> > > > index f25caa6aa9d3..d62262f93069 100644
> > > > --- a/arch/mips/loongson64/init.c
> > > > +++ b/arch/mips/loongson64/init.c
> > > > @@ -49,7 +49,8 @@ void virtual_early_config(void)
> > > >    void __init szmem(unsigned int node)
> > > >    {
> > > >    	u32 i, mem_type;
> > > > -	phys_addr_t node_id, mem_start, mem_size;
> > > > +	static unsigned long num_physpages;
> > > > +	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
> > > >    	/* Otherwise come from DTB */
> > > >    	if (loongson_sysconf.fw_interface != LOONGSON_LEFI)
> > > > @@ -63,38 +64,27 @@ void __init szmem(unsigned int node)
> > > >    		mem_type = loongson_memmap->map[i].mem_type;
> > > >    		mem_size = loongson_memmap->map[i].mem_size;
> > > > -
> > > > -		/* Memory size comes in MB if MEM_SIZE_IS_IN_BYTES not set */
> > > > -		if (mem_size & MEM_SIZE_IS_IN_BYTES)
> > > > -			mem_size &= ~MEM_SIZE_IS_IN_BYTES;
> > > > -		else
> > > > -			mem_size = mem_size << 20;
> > > > -
> > > > -		mem_start = (node_id << 44) | loongson_memmap->map[i].mem_start;
> > > > +		mem_start = loongson_memmap->map[i].mem_start;
> > > >    		switch (mem_type) {
> > > >    		case SYSTEM_RAM_LOW:
> > > >    		case SYSTEM_RAM_HIGH:
> > > > -		case UMA_VIDEO_RAM:
> > > > -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes usable\n",
> > > > -				(u32)node_id, mem_type, &mem_start, &mem_size);
> > > > -			memblock_add_node(mem_start, mem_size, node,
> > > > +			start_pfn = ((node_id << 44) + mem_start) >> PAGE_SHIFT;
> > > > +			node_psize = (mem_size << 20) >> PAGE_SHIFT;
> > > > +			end_pfn  = start_pfn + node_psize;
> > > > +			num_physpages += node_psize;
> > > > +			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
> > > > +				(u32)node_id, mem_type, mem_start, mem_size);
> > > > +			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
> > > > +				start_pfn, end_pfn, num_physpages);
> > > > +			memblock_add_node(PFN_PHYS(start_pfn),
> > > > +					  PFN_PHYS(node_psize), node,
> > > >    					  MEMBLOCK_NONE);
> > > >    			break;
> > > >    		case SYSTEM_RAM_RESERVED:
> > > > -		case VIDEO_ROM:
> > > > -		case ADAPTER_ROM:
> > > > -		case ACPI_TABLE:
> > > > -		case SMBIOS_TABLE:
> > > > -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes reserved\n",
> > > > -				(u32)node_id, mem_type, &mem_start, &mem_size);
> > > > -			memblock_reserve(mem_start, mem_size);
> > > > -			break;
> > > > -		/* We should not reserve VUMA_VIDEO_RAM as it overlaps with MMIO */
> > > > -		case VUMA_VIDEO_RAM:
> > > > -		default:
> > > > -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes unhandled\n",
> > > > -				(u32)node_id, mem_type, &mem_start, &mem_size);
> > > > +			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
> > > > +				(u32)node_id, mem_type, mem_start, mem_size);
> > > > +			memblock_reserve(((node_id << 44) + mem_start), mem_size << 20);
> > > >    			break;
> > > >    		}
> > > >    	}
> > > -- 
> > > ---
> > > Jiaxun Yang
> > 
> 
> -- 
> ---
> Jiaxun Yang


