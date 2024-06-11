Return-Path: <linux-mips+bounces-3579-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F38B4903BC4
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 14:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F00791C218ED
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 12:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B8E17BB25;
	Tue, 11 Jun 2024 12:22:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB8C17B437;
	Tue, 11 Jun 2024 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718108542; cv=none; b=uyZnSFF3cx2C/yl0jizpkUSmlZRLWaBh7yRTPV5alfIaslc3/V2VUn9vW3K9zlPtuCGCLmiatZWuOQ+IYr7RHoclrmXamERa3jcW4tFOsxbK2O6AY3/3SUbM4jfi6ZL7HVSEu2W4LFGR7vN4Bg53UcD6gSECmHXOj45anSDP0VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718108542; c=relaxed/simple;
	bh=xNKFRd8JMvvsnTc6kECOfW1SxZSS9jNzHNft0SA3yWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppjJThc4KdU18vqBFDG1oHTYMwfLNJc2MCqCncXmzUNZrGzQ+ZqK02YyY1e64wwtBUfer2JlHXU28q8b5GpmIILCRkpgDhLVYm6y0PAu1IKeLmWqcxeOIi17f+i0SjX2zwFaKRgDh/JsGnV/JrJNH737g0ewRbg+92nX7ctG2g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sH0Vq-0002Bf-00; Tue, 11 Jun 2024 14:22:06 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AAFEFC0688; Tue, 11 Jun 2024 13:16:04 +0200 (CEST)
Date: Tue, 11 Jun 2024 13:16:04 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] MIPS: Loongson64: Implement PM suspend for LEFI
 firmware
Message-ID: <Zmgx9A5ea1uW6SHt@alpha.franken.de>
References: <20240507-loongson64-suspend-v1-0-534d92a4e09a@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507-loongson64-suspend-v1-0-534d92a4e09a@flygoat.com>

On Tue, May 07, 2024 at 04:21:58PM +0100, Jiaxun Yang wrote:
> Hi all,
> 
> This series implemented PM suspend for LEFI firmware.
> We missed this for long in upstream kernel...
> 
> Please review
> Thanks
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Jiaxun Yang (3):
>       MIPS: asm/pm.h: Use platform agnostic macros
>       MIPS: select CPU_PM with SUSPEND
>       MIPS: Loongson64: Implement PM suspend for LEFI firmware
> 
>  arch/mips/Kconfig              |  2 +-
>  arch/mips/include/asm/pm.h     | 22 +++++------
>  arch/mips/loongson64/Makefile  |  2 +-
>  arch/mips/loongson64/pm.c      | 88 +++++++++---------------------------------
>  arch/mips/loongson64/sleeper.S | 17 ++++++++
>  5 files changed, 48 insertions(+), 83 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

