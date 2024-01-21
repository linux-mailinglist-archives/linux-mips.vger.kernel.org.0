Return-Path: <linux-mips+bounces-1028-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9498E8354CA
	for <lists+linux-mips@lfdr.de>; Sun, 21 Jan 2024 08:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC9B1B23D8D
	for <lists+linux-mips@lfdr.de>; Sun, 21 Jan 2024 07:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5D43611B;
	Sun, 21 Jan 2024 07:13:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0663394
	for <linux-mips@vger.kernel.org>; Sun, 21 Jan 2024 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705821202; cv=none; b=JDWCmLyBQSnpjL2FxODBnnzAEX15W6mPFkr6JtyeJimyXJTbJ0eoEM4Xo7eIHkDYkzBWazGT1nA3AIYjae8YCZJKdUqdGe6pmb5KMDB7UGk7i2uzdemeqtWlJcfeCBms1r0qvgab4wBv8JacR0UZethvbkDqsISoLvlTr9L9XhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705821202; c=relaxed/simple;
	bh=5HoYuEDv/T3PR0eaIQZ9jNq9kickX/a5BZuEEzHFxjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxGT/lceOp0IpPsv3KfltTYp/Vo1FvwvAGeJjonksZGEhrwKhsR9leSJCTLOCbe4E3fp4XDCVYKp7ze8eZnXK3Pl8ZEEXtH18OTHzEMGcjE/3h4orzkbFkcbkmkqcmve+Z1vjw0+SuxXus0UaR1oOZLha5X3gGIzj9SEdYJH4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8DxWPAMxKxlh80CAA--.12222S3;
	Sun, 21 Jan 2024 15:13:16 +0800 (CST)
Received: from Board-3A3000 (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxlcwIxKxlFnEOAA--.3159S2;
	Sun, 21 Jan 2024 15:13:14 +0800 (CST)
Date: Sun, 21 Jan 2024 15:13:12 +0800
From: Huang Pei <huangpei@loongson.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/2] MIPS: reserve exception vector space ONLY ONCE
Message-ID: <20240121071312.bsdkkubywb27umn2@Board-3A3000>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240119040240.392442-1-huangpei@loongson.cn>
 <20240119040240.392442-2-huangpei@loongson.cn>
 <ZaqgBugqaPLZTofT@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZaqgBugqaPLZTofT@alpha.franken.de>
X-CM-TRANSID:AQAAf8BxlcwIxKxlFnEOAA--.3159S2
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF43uw47Cry3JrW3Ww1Dtwc_yoW8Gw1xpr
	1DAas0kr409ryqvay3Jw4kJrWrXa1xXr40gr98trZ0va43ZrnxXr1xtrsxWr9FvrWIk3Wr
	uF45X3Wqkan7ZacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU=

On Fri, Jan 19, 2024 at 05:15:02PM +0100, Thomas Bogendoerfer wrote:
> On Fri, Jan 19, 2024 at 12:02:39PM +0800, Huang Pei wrote:
> > "cpu_probe" is called both by BP and APs, but reserving exception vector
> > (like 0x0-0x1000) called by "cpu_probe" need once and calling on BPs is
> > too late since memblock is unavailable at that time.
> > 
> > So, reserve exception vector ONLY by BP.
> > 
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >  arch/mips/kernel/cpu-probe.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> > index b406d8bfb15a..6939d0de2a03 100644
> > --- a/arch/mips/kernel/cpu-probe.c
> > +++ b/arch/mips/kernel/cpu-probe.c
> > @@ -1581,7 +1581,9 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
> >  			__cpu_name[cpu] = "Broadcom BMIPS4380";
> >  			set_elf_platform(cpu, "bmips4380");
> >  			c->options |= MIPS_CPU_RIXI;
> > -			reserve_exception_space(0x400, VECTORSPACING * 64);
> > +			if (cpu == 0) {
> > +				reserve_exception_space(0x400, VECTORSPACING * 64);
> > +			}
> 
> why not do a 
> 
> if (smp_processor_id() == 0)
> 	memblock_reserve(...)
> 		
> in reserve_exception_space() ?

This is better, I will include this in V6
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]


