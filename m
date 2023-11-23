Return-Path: <linux-mips+bounces-241-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 466307F639E
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 17:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3E2A28193D
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 16:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA2A3E47D;
	Thu, 23 Nov 2023 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 96F0C10E2;
	Thu, 23 Nov 2023 08:08:01 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1r6CF3-0002rO-00; Thu, 23 Nov 2023 17:07:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C04F6C0136; Thu, 23 Nov 2023 17:07:10 +0100 (CET)
Date: Thu, 23 Nov 2023 17:07:10 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yinglu Yang <yangyinglu@loongson.cn>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Chao-ying Fu <cfu@wavecomp.com>, Marc Zyngier <maz@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] mips: dmi: Fix early remap on MIPS32
Message-ID: <ZV94rifAIF2p9Nej@alpha.franken.de>
References: <20231122182419.30633-1-fancer.lancer@gmail.com>
 <20231122182419.30633-2-fancer.lancer@gmail.com>
 <b996b542-4cd3-4f9d-b221-00b2d5ef224e@app.fastmail.com>
 <c7cuvhuu6py5vxhhvkhekv6ned5sro4a3wzzn7v45oahfw42ud@gyqmucagt5e2>
 <8ca730b9-fa8c-46ea-bdc5-158da0f29c3a@app.fastmail.com>
 <ZV9Fq1ihUm1Rn6yO@alpha.franken.de>
 <d6d7e27a-b1a1-48af-be6c-aa9097c48992@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6d7e27a-b1a1-48af-be6c-aa9097c48992@app.fastmail.com>

On Thu, Nov 23, 2023 at 03:07:09PM +0000, Jiaxun Yang wrote:
> 
> 
> 在2023年11月23日十一月 下午12:29，Thomas Bogendoerfer写道：
> > On Thu, Nov 23, 2023 at 12:13:11PM +0000, Jiaxun Yang wrote:
> >> > Ok. Thanks for the heads up. I'll fix the patch to be using ioremap()
> >> > in v2. ioremap_uc() is just an macro-alias of ioremap() on MIPS.
> >> 
> >> Perhaps we need to fix ioremap_cache so it can give a KSEG1 address?
> >
> > KSEG0 ?
> 
> Ah yes it's KSEG0.

the problem with all 32bit unmapped segments is their limitations in
size. But there is always room to try to use unmapped and fall back
to mapped, if it doesn't work. But I doubt anybody is going to
implement that.

> >> AFAIK for Loongson DMI is located at cached memory so using ioremap_uc
> >> blindly will cause inconsistency.
> >
> > why ?
> 
> Firmware sometimes does not flush those tables from cache back to memory.
> For Loongson systems (as well as most MTI systems) cache is enabled by
> firmware.

kernel flushes all caches on startup, so there shouldn't be a problem.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

