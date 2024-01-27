Return-Path: <linux-mips+bounces-1190-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0E83ECA5
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jan 2024 11:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4476E1C21E29
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jan 2024 10:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00767200D6;
	Sat, 27 Jan 2024 10:09:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C666200CB
	for <linux-mips@vger.kernel.org>; Sat, 27 Jan 2024 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706350166; cv=none; b=NaPsyRiDgmfzVKWv/mwE8+xoyKhBvkm8Y4uajEFxEdyCtj1p07P85pFDKJKmVee6sPWN8RtExZnX8aTDTlETIvrsshEBURNtPj3zwamkCysAHSX0qLuL5qKzYe+G78rS8MJ6hHVX3o+CNJRfflVFuOKwXhYI1yNh3uoaxbtpTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706350166; c=relaxed/simple;
	bh=pusQHn9Lbn/7BO+VF1uVbESlfALcfwJA1m7T4qxLaW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUEHRDfYLBK7k7rKhz4B4wN+QLureeCBp0LZHuvLYV8dzORJuzAGrZ/W79GNRgpPb1YoFPvCSJsPlVaY5ssUHGecV1tF5U7vMmpt7NDRxQzuxlp4vFqFR9UJYansyaAc252EVgIE4Xh9jgI/QizCM+HzCZ9rSICXSCSzjJ2ih90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rTfcj-000137-00; Sat, 27 Jan 2024 11:09:17 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 8C571C0135; Sat, 27 Jan 2024 11:04:04 +0100 (CET)
Date: Sat, 27 Jan 2024 11:04:04 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Huang Pei <huangpei@loongson.cn>
Cc: Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH] MIPS: loongson64: set nid for reserved memblock region
Message-ID: <ZbTVFEHxGp/azvPM@alpha.franken.de>
References: <ZbPq0yF20Qyo1rKb@alpha.franken.de>
 <20240127091221.2884-1-huangpei@loongson.cn>
 <20240127091221.2884-2-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240127091221.2884-2-huangpei@loongson.cn>

On Sat, Jan 27, 2024 at 05:12:21PM +0800, Huang Pei wrote:
> Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()") reveals
> that reserved memblock regions have no valid node id set, just set it
> right since loongson64 firmware makes it clear in memory layout info.
> 
> This works around booting failure on 3A1000+ since commit 61167ad5fecd
> ("mm: pass nid to reserve_bootmem_region()") under
> CONFIG_DEFERRED_STRUCT_PAGE_INIT.
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/loongson64/init.c | 3 +++
>  arch/mips/loongson64/numa.c | 2 ++
>  2 files changed, 5 insertions(+)

I would've needed a patch just fixing the one line since the broken commit
is already in mips-fixes, which is a public tree so no rebasing.
I'm going to revert the old commit instead and add the new one, 
BTW. please send new patches as it's own thread and not as a reply.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

