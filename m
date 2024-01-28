Return-Path: <linux-mips+bounces-1195-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E1683F3C7
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jan 2024 05:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 301421F21F58
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jan 2024 04:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6D4611B;
	Sun, 28 Jan 2024 04:42:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD626117
	for <linux-mips@vger.kernel.org>; Sun, 28 Jan 2024 04:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706416952; cv=none; b=dl/F/sGuMqLF9/sc7cyWclPPuSkOd9WjaJDU4NfdXku4Zs45OEDg+tIX4LCeqyDAiEkH8rEFdZVt5YK1nzL03WRh4XJo+6IEBip8x7CfLZYtV+VqxxH6dsvRZE9aq8CGTrsAl6/h7vGHKnI90xeaQVfbyZNNq4xS+FMO4dJM7uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706416952; c=relaxed/simple;
	bh=KKg6a1Mr4aaVqqzD51u1ixUQLxlh8Awbxy5gMlR2WeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blSr+O9IT/OOoShs7w+/RKWX6dBcXMlTIHg7jPH6unCvQCyXm7AXhKhCUELRRqyqlapHVv6kl0jH+nEvML8ZrboOEXFjBLMx94tb9RA0nj1tKVwJPh+4tdWZsUjT6oXzMPpv94718GW3aEZP0KGQMsEzCGe9DB7mYQEdXVWbN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Axeegz27Vl8FIHAA--.3999S3;
	Sun, 28 Jan 2024 12:42:27 +0800 (CST)
Received: from Board-3A3000 (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxF80w27Vlly8hAA--.9197S2;
	Sun, 28 Jan 2024 12:42:26 +0800 (CST)
Date: Sun, 28 Jan 2024 12:42:24 +0800
From: Huang Pei <huangpei@loongson.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH] MIPS: loongson64: set nid for reserved memblock region
Message-ID: <20240128044224.3aqdtimmuhhqpek6@Board-3A3000>
References: <ZbPq0yF20Qyo1rKb@alpha.franken.de>
 <20240127091221.2884-1-huangpei@loongson.cn>
 <20240127091221.2884-2-huangpei@loongson.cn>
 <ZbTVFEHxGp/azvPM@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZbTVFEHxGp/azvPM@alpha.franken.de>
X-CM-TRANSID:AQAAf8BxF80w27Vlly8hAA--.9197S2
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrury7tr1UJFWkWF45uw45Jwc_yoWkuFg_Xr
	42krn7Cw15Jr4xWa17tF13u3y29ayUuay5XrnrG34FqF1YvFW5GF4Yg39Iyw17KrWxtF15
	Cw4Yy34Svw129osvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

On Sat, Jan 27, 2024 at 11:04:04AM +0100, Thomas Bogendoerfer wrote:
> On Sat, Jan 27, 2024 at 05:12:21PM +0800, Huang Pei wrote:
> > Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()") reveals
> > that reserved memblock regions have no valid node id set, just set it
> > right since loongson64 firmware makes it clear in memory layout info.
> > 
> > This works around booting failure on 3A1000+ since commit 61167ad5fecd
> > ("mm: pass nid to reserve_bootmem_region()") under
> > CONFIG_DEFERRED_STRUCT_PAGE_INIT.
> > 
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >  arch/mips/loongson64/init.c | 3 +++
> >  arch/mips/loongson64/numa.c | 2 ++
> >  2 files changed, 5 insertions(+)
> 
> I would've needed a patch just fixing the one line since the broken commit
> is already in mips-fixes, which is a public tree so no rebasing.
> I'm going to revert the old commit instead and add the new one, 
> BTW. please send new patches as it's own thread and not as a reply.
> 
Ok, new patches always as its own thread not as a reply, I got it.
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]


