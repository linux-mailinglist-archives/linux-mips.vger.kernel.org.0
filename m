Return-Path: <linux-mips+bounces-939-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8A882E975
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jan 2024 07:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F084284760
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jan 2024 06:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F50D10976;
	Tue, 16 Jan 2024 06:20:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E96B10971
	for <linux-mips@vger.kernel.org>; Tue, 16 Jan 2024 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8BxuvCo86Vlk44AAA--.2853S3;
	Tue, 16 Jan 2024 11:10:32 +0800 (CST)
Received: from Board-3A3000 (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxzM6k86Vl4ioDAA--.665S2;
	Tue, 16 Jan 2024 11:10:30 +0800 (CST)
Date: Tue, 16 Jan 2024 11:10:28 +0800
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
Message-ID: <20240116031028.vbew7z7fjl26hlxe@Board-3A3000>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240113095509.178697-1-huangpei@loongson.cn>
 <20240113095509.178697-4-huangpei@loongson.cn>
 <2ce1affb-b39f-4de3-a57f-29f9580fc083@flygoat.com>
 <20240114085316.prb7ynh4gfytv2rb@Board-3A3000>
 <7d4fe00c-259d-4e19-90a1-272bc2adcc7e@flygoat.com>
 <20240115012512.y2ujt3xmks3regel@Board-3A3000>
 <92cc976f-cd24-48c0-9ac6-b9374fba158a@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92cc976f-cd24-48c0-9ac6-b9374fba158a@flygoat.com>
X-CM-TRANSID:AQAAf8DxzM6k86Vl4ioDAA--.665S2
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFW5tryUKr47Cw4DGFyDJwc_yoW8CF4fpr
	43JF1xAr4UGrs7tw4vyw15ur10vw4rKr4UXry5ArykWr4jvr1fAw18Gr4rZF90qrWxJr1j
	qF4UX34DXw1DAFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==
X-Gw-Check: 100e95e1ea4d306c

On Mon, Jan 15, 2024 at 02:14:14PM +0000, Jiaxun Yang wrote:
> 
> 
> 在 2024/1/15 01:25, Huang Pei 写道:
> > On Sun, Jan 14, 2024 at 11:58:25AM +0000, Jiaxun Yang wrote:
> > > 
> > > 在 2024/1/14 08:53, Huang Pei 写道:
> > > > On Sat, Jan 13, 2024 at 11:59:11AM +0000, Jiaxun Yang wrote:
> > > [...]
> > > > In my test system with kunlun firmware they are actually covered by SYSRAM
> > > > type.
> > > > IMO, better to add those memory to memblock as well in your case.
> > > > 
> > > > My test machine is PMON-based 3B1500, the SMBIOS_TABLE located in
> > > > 0xfffe000-0xfffe7ff, which is not included in SYSTEM_RAM_LOW(0x200000-
> > > > 0xeffffff), I think we need a check like,
> > > > ----------------------------------------------------------------------
> > > > 	if(memblock_is_region_memory(addr, size))
> > > > 		memblock_reserve(addr, size);
> > > > ----------------------------------------------------------------------
> > > > to support both cases;
> > > Then we are running into ordering issue. memblock_add of SYSRAM may later
> > > then reservation.
> > > What about unconditionally add those ranges to memblock? As it's certain
> > > that those regions will
> > > be RAM.
> > > 
> > I think we can do szmem twice, one for memblock.memory, the other for
> > memblock_reserve.
> IMO this is a little bit insane.
> LoongArch made a workaround to set all reserved memory to node zero [1].
> 
> [1]:
> https://lore.kernel.org/all/20230911092810.3108092-1-chenhuacai@loongson.cn/
> 
I think they forgot MIPS totally. Their fix is right, because all the
reserved memory is located on Node 0 by now. If we keep reserved
memory within range of the memoryblock.memory and keep this conresponcy,
then there would not be this bug. My fix is just another way to keep this
conresponcy and make the memory ownership more clear between kernel and 
firmware.

> Thanks
> 
> -- 
> ---
> Jiaxun Yang


