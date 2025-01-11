Return-Path: <linux-mips+bounces-7395-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E35A0A38C
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 13:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EC061886ABE
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 12:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83AA19A2A3;
	Sat, 11 Jan 2025 12:18:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A594188734;
	Sat, 11 Jan 2025 12:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736597921; cv=none; b=B8Db0TIYtPlmjmHNWqR+v1fLD+Qgw/7YPfeQUOKgjSx+rEbZfGlbQ++/229PRdofNHrUiyeww2Cyh5Y0zl1zsn91g4wyOUEmQ2Ioz/OIkYD8VfuU2XmpP1/7YQMgcXrqurXsz4iY1nY2YhgmRc71sG2x87Hq6cove8CslEfhJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736597921; c=relaxed/simple;
	bh=6Si6UXrycb9zL+r+d3n+4RzqtwVyXn1hEdlnaJysWfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VV4o7pc0T+gne4dQWXwiWEprWOI/fxq098Hsv5GGSwMn/3WH8srz0iaWab7k55vbOsoGUP+vW/sFKX8mjMnBxUDznRK2p1YQ4XJP9TPlCguW8gAN90NCKpf3SffATczQIzOmeeqo6QvAi4nI5nr2Sf2VU0rWD1D4Ej6yY3IrX4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tWaRL-0006NO-00; Sat, 11 Jan 2025 13:18:07 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 93ADBC010B; Sat, 11 Jan 2025 13:01:43 +0100 (CET)
Date: Sat, 11 Jan 2025 13:01:43 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Kexy Biscuit <kexybiscuit@aosc.io>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mingcong Bai <jeffbai@aosc.io>,
	Icenowy Zheng <uwu@icenowy.me>, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] MIPS: Loongson64: Remove ROM Size in LEFI boardinfo
Message-ID: <Z4Jdp2Da+e52Eolb@alpha.franken.de>
References: <20250111-loongson64-boardinfo-no-size-v1-0-e9f26fcd069e@aosc.io>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250111-loongson64-boardinfo-no-size-v1-0-e9f26fcd069e@aosc.io>

On Sat, Jan 11, 2025 at 01:22:07AM +0800, Kexy Biscuit wrote:
> In "MIPS: Loongson64: Add /sys/firmware/lefi/boardinfo", "ROM Size" was
> added under section "BIOS Info". However, that is incorrect per Appendix
> A.7 in Q/LS 0013-2014 (龙芯CPU开发系统固件与内核接口规范 V2.2,
> lit. Loongson DevSys Firmware Kernel Interface Specification V2.2),
> which defines the size to be the size of this interface itself.
> 
> Removing "ROM Size" from boardinfo, and also adding comments to the
> struct interface_info to clarify meanings of its members.
> 
> Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
> ---
> Kexy Biscuit (2):
>       MIPS: Loongson64: remove ROM Size unit in boardinfo
>       MIPS: Loongson: Add comments for interface_info
> 
>  arch/mips/include/asm/mach-loongson64/boot_param.h | 8 ++++----
>  arch/mips/loongson64/boardinfo.c                   | 2 --
>  2 files changed, 4 insertions(+), 6 deletions(-)
> ---
> base-commit: 2144da25584eb10b84252230319b5783f6a83041
> change-id: 20250111-loongson64-boardinfo-no-size-a25dd2a03a8b

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

