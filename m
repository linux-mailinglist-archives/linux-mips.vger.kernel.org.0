Return-Path: <linux-mips+bounces-1027-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5204F83542D
	for <lists+linux-mips@lfdr.de>; Sun, 21 Jan 2024 03:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E763A1F21632
	for <lists+linux-mips@lfdr.de>; Sun, 21 Jan 2024 02:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014443610A;
	Sun, 21 Jan 2024 02:14:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E33A12E5F
	for <linux-mips@vger.kernel.org>; Sun, 21 Jan 2024 02:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705803265; cv=none; b=Y+eMlmbfkH1vI/c6LoGCdETdU39Ev5BWp9J8euorZ+DYJ7WillncwUZqVYqCH91UgBNeqQJVaGYR7c5y5n7COON4AHBaX9iwWWGvIyamHcujLsk7XSawaqdqLpWD++JgZxDMppcVyzWa2LyS+Zj+ZbB+nm54JyZMhTZNLbvxzGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705803265; c=relaxed/simple;
	bh=NmKhwVjXDdzHC7DadE1KIF1v9x4HacmQH4mENxispeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bg2wSiY0SGp3eRKrUEEEMJvVSgeGT8e+5DIyIPT03T3JQrzuteYchoE8mPNvFXHeYMSagezKVGQk2tA5OsWIpHu0E+bza7EWY79FJ+lmKJLrwWGjvKR6FwpZnaCiVRHSh9P6NdOrsjYovso6xkFpWZptgvpv3YQY7WRl49VyqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Axz+v3faxlvr4CAA--.11965S3;
	Sun, 21 Jan 2024 10:14:15 +0800 (CST)
Received: from Board-3A3000 (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axhcz0faxliQkOAA--.2683S2;
	Sun, 21 Jan 2024 10:14:14 +0800 (CST)
Date: Sun, 21 Jan 2024 10:14:12 +0800
From: Huang Pei <huangpei@loongson.cn>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 2/2] MIPS: loongson64: set nid for reserved memblock
 region
Message-ID: <20240121021412.obdprwuqcqnc4qfq@Board-3A3000>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240119040240.392442-1-huangpei@loongson.cn>
 <20240119040240.392442-3-huangpei@loongson.cn>
 <4f1fc736-6e44-4313-acdc-d1c88cda15f6@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f1fc736-6e44-4313-acdc-d1c88cda15f6@flygoat.com>
X-CM-TRANSID:AQAAf8Axhcz0faxliQkOAA--.2683S2
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFy8JrWDtF4UXw4fJr1kZwc_yoW8Kw4kpr
	WxA3WDCaykWr4Iga93t345uryxZasxtrsavr47ZryUua9xu34aqr4xJrs0gFWjvr48W3W0
	qrnYgw1UZFn7Z3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==

On Fri, Jan 19, 2024 at 10:05:39AM +0000, Jiaxun Yang wrote:
> 
> 
> 在 2024/1/19 04:02, Huang Pei 写道:
> > Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()) reveals
> > that reserved memblock regions have no valid node id set, just set it
> > right since loongson64 firmware makes it clear in memory layout info.
> > 
> > This works around booting failure on 3A1000+ since commit 61167ad5fecd
> > ("mm: pass nid to reserve_bootmem_region()) under
> > CONFIG_DEFERRED_STRUCT_PAGE_INIT.
> 
> This should be done at MIPS arch level I guess.
You mean the real fix or the set nid for the reserved memblock region?

+ the real fix is [1](see old mail).

I do not think MIPS arch needs it:

+ This ONLY matters on NUMA, most of MIPS platforms is UMA.

+ MM does not care about the nid of reserved memblock region provided by 
arch/platform, nor it provide "memblock_reserved_node" like
"memblock_add_node". Loongson64 knows about nid of reserved region and the
regular distribution of physical memory bewtween nodes, that is why it can
be done by simple "memblock_set_node" and I add it.

> 
> Thanks
> - Jiaxun
> 
> > 
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >   arch/mips/loongson64/init.c | 2 ++
> >   arch/mips/loongson64/numa.c | 2 ++
> >   2 files changed, 4 insertions(+)
> > 
> > diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> > index f25caa6aa9d3..000ba91c0886 100644
> > --- a/arch/mips/loongson64/init.c
> > +++ b/arch/mips/loongson64/init.c
> > @@ -103,6 +103,8 @@ void __init szmem(unsigned int node)
> >   	if (loongson_sysconf.vgabios_addr)
> >   		memblock_reserve(virt_to_phys((void *)loongson_sysconf.vgabios_addr),
> >   				SZ_256K);
> > +	/* set nid for reserved memory */
> > +	memblock_set_node((u64)node << 44, (u64)(node+1) << 44, &memblock.reserved, node);
> >   }
> >   #ifndef CONFIG_NUMA
> > diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> > index 8f61e93c0c5b..6345e096c532 100644
> > --- a/arch/mips/loongson64/numa.c
> > +++ b/arch/mips/loongson64/numa.c
> > @@ -132,6 +132,8 @@ static void __init node_mem_init(unsigned int node)
> >   		/* Reserve pfn range 0~node[0]->node_start_pfn */
> >   		memblock_reserve(0, PAGE_SIZE * start_pfn);
> > +		/* set nid for reserved memory on node 0 */
> > +		memblock_set_node(0, (u64)1 << 44, &memblock.reserved, 1);
> >   	}
> >   }
> 
> -- 
> ---
> Jiaxun Yang


