Return-Path: <linux-mips+bounces-929-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FCF82D00A
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jan 2024 09:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A84A01C20C1D
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jan 2024 08:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7BE1FA5;
	Sun, 14 Jan 2024 08:53:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E51D1FA3
	for <linux-mips@vger.kernel.org>; Sun, 14 Jan 2024 08:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8BxVfEOoaNl6gAAAA--.71S3;
	Sun, 14 Jan 2024 16:53:34 +0800 (CST)
Received: from Board-3A3000 (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxb8_8oKNlUgoAAA--.6S2;
	Sun, 14 Jan 2024 16:53:33 +0800 (CST)
Date: Sun, 14 Jan 2024 16:53:16 +0800
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
Message-ID: <20240114085316.prb7ynh4gfytv2rb@Board-3A3000>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240113095509.178697-1-huangpei@loongson.cn>
 <20240113095509.178697-4-huangpei@loongson.cn>
 <2ce1affb-b39f-4de3-a57f-29f9580fc083@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ce1affb-b39f-4de3-a57f-29f9580fc083@flygoat.com>
X-CM-TRANSID:AQAAf8Bxb8_8oKNlUgoAAA--.6S2
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3GrW8Jr47GF13XF4UKFWDWrX_yoW7ZF13pr
	13AFyxKr4Yqr17G3yxtrn8GrW0ywn5A3yUCrZrZrnYqF1DCw1xJr18tr40q34DArWkJrn2
	qrZ0y3WUK3Wrt3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

On Sat, Jan 13, 2024 at 11:59:11AM +0000, Jiaxun Yang wrote:
> 
> 
> 在 2024/1/13 09:55, Huang Pei 写道:
> > This reverts commit 264927e3538169fe2973a5732f03ea01b0f9f9e8.
> > 
> > The SMBIOS memory reserved region(0xfffe000-0xfffe7ff) is not OWNED
> > by kenel, here OWNED means the region is within the physical memory
> > given to kernel by firmware as SYSTEM_RAM_{LOW,HIGH}.
> > 
> > Since commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()),
> > loongson64 booting failed with CONFIG_DEFERRED_STRUCT_PAGE_INIT like
> > this:
> > ----------------------------------------------------------------------
> >   Call Trace:
> >   [<ffffffff8235d088>] reserve_bootmem_region+0xa8/0x184
> >   [<ffffffff82333940>] memblock_free_all+0x104/0x2a8
> >   [<ffffffff8231d8e4>] mem_init+0x84/0x94
> >   [<ffffffff82330958>] mm_core_init+0xf8/0x308
> >   [<ffffffff82318c38>] start_kernel+0x43c/0x86c
> > 
> >   Code: 10400028  2402fff0  de420000 <dc432880> 0203182b 14600022
> >   64420070  00003025  24040003
> > 
> >   ---[ end trace 0000000000000000 ]---
> >   Kernel panic - not syncing: Attempted to kill the idle task!
> > ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> > ----------------------------------------------------------------------
> > 
> > This is another case of inappropriate usage of memblock_reserve
> 
> In my test system with kunlun firmware they are actually covered by SYSRAM
> type.
> IMO, better to add those memory to memblock as well in your case.
> 
My test machine is PMON-based 3B1500, the SMBIOS_TABLE located in
0xfffe000-0xfffe7ff, which is not included in SYSTEM_RAM_LOW(0x200000-
0xeffffff), I think we need a check like,
----------------------------------------------------------------------
	if(memblock_is_region_memory(addr, size))
		memblock_reserve(addr, size);
----------------------------------------------------------------------
to support both cases;
> Thanks
> - Jiaxun
> > ---
> >   .../include/asm/mach-loongson64/boot_param.h  |  6 +--
> >   arch/mips/loongson64/init.c                   | 42 +++++++------------
> >   2 files changed, 17 insertions(+), 31 deletions(-)
> > 
> > diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> > index e007edd6b60a..c454ef734c45 100644
> > --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> > +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> > @@ -14,11 +14,7 @@
> >   #define ADAPTER_ROM		8
> >   #define ACPI_TABLE		9
> >   #define SMBIOS_TABLE		10
> > -#define UMA_VIDEO_RAM		11
> > -#define VUMA_VIDEO_RAM		12
> > -#define MAX_MEMORY_TYPE		13
> > -
> > -#define MEM_SIZE_IS_IN_BYTES	(1 << 31)
> > +#define MAX_MEMORY_TYPE		11
> >   #define LOONGSON3_BOOT_MEM_MAP_MAX 128
> >   struct efi_memory_map_loongson {
> > diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> > index f25caa6aa9d3..d62262f93069 100644
> > --- a/arch/mips/loongson64/init.c
> > +++ b/arch/mips/loongson64/init.c
> > @@ -49,7 +49,8 @@ void virtual_early_config(void)
> >   void __init szmem(unsigned int node)
> >   {
> >   	u32 i, mem_type;
> > -	phys_addr_t node_id, mem_start, mem_size;
> > +	static unsigned long num_physpages;
> > +	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
> >   	/* Otherwise come from DTB */
> >   	if (loongson_sysconf.fw_interface != LOONGSON_LEFI)
> > @@ -63,38 +64,27 @@ void __init szmem(unsigned int node)
> >   		mem_type = loongson_memmap->map[i].mem_type;
> >   		mem_size = loongson_memmap->map[i].mem_size;
> > -
> > -		/* Memory size comes in MB if MEM_SIZE_IS_IN_BYTES not set */
> > -		if (mem_size & MEM_SIZE_IS_IN_BYTES)
> > -			mem_size &= ~MEM_SIZE_IS_IN_BYTES;
> > -		else
> > -			mem_size = mem_size << 20;
> > -
> > -		mem_start = (node_id << 44) | loongson_memmap->map[i].mem_start;
> > +		mem_start = loongson_memmap->map[i].mem_start;
> >   		switch (mem_type) {
> >   		case SYSTEM_RAM_LOW:
> >   		case SYSTEM_RAM_HIGH:
> > -		case UMA_VIDEO_RAM:
> > -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes usable\n",
> > -				(u32)node_id, mem_type, &mem_start, &mem_size);
> > -			memblock_add_node(mem_start, mem_size, node,
> > +			start_pfn = ((node_id << 44) + mem_start) >> PAGE_SHIFT;
> > +			node_psize = (mem_size << 20) >> PAGE_SHIFT;
> > +			end_pfn  = start_pfn + node_psize;
> > +			num_physpages += node_psize;
> > +			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
> > +				(u32)node_id, mem_type, mem_start, mem_size);
> > +			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
> > +				start_pfn, end_pfn, num_physpages);
> > +			memblock_add_node(PFN_PHYS(start_pfn),
> > +					  PFN_PHYS(node_psize), node,
> >   					  MEMBLOCK_NONE);
> >   			break;
> >   		case SYSTEM_RAM_RESERVED:
> > -		case VIDEO_ROM:
> > -		case ADAPTER_ROM:
> > -		case ACPI_TABLE:
> > -		case SMBIOS_TABLE:
> > -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes reserved\n",
> > -				(u32)node_id, mem_type, &mem_start, &mem_size);
> > -			memblock_reserve(mem_start, mem_size);
> > -			break;
> > -		/* We should not reserve VUMA_VIDEO_RAM as it overlaps with MMIO */
> > -		case VUMA_VIDEO_RAM:
> > -		default:
> > -			pr_info("Node %d, mem_type:%d\t[%pa], %pa bytes unhandled\n",
> > -				(u32)node_id, mem_type, &mem_start, &mem_size);
> > +			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
> > +				(u32)node_id, mem_type, mem_start, mem_size);
> > +			memblock_reserve(((node_id << 44) + mem_start), mem_size << 20);
> >   			break;
> >   		}
> >   	}
> 
> -- 
> ---
> Jiaxun Yang


