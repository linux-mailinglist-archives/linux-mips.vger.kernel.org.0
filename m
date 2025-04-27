Return-Path: <linux-mips+bounces-8800-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0251A9E12B
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 10:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E747D5A5B47
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 08:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C692024EF79;
	Sun, 27 Apr 2025 08:48:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC96824E4C4;
	Sun, 27 Apr 2025 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745743720; cv=none; b=PoXvh2wAlxQuLsdVYsa/hQ5Bv62VVdvGr8OmOKV42gWCh3TSCZ9Vl3gFcMOL90vY28M+3ReN7wHgRvM9dBkmNhBqu4SAbob1YGyByrBVeG5979A9tnlnqNV5HPHC5gR6plK3C4APW70LMqVRZG0/UH91Ff4cbRhzv7ptrjgdz/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745743720; c=relaxed/simple;
	bh=mMsmxoMT8dXqIPS1ivgCYted1V3EETcXhAfyFylVErQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReJD8T8gQtEUHi5IdrCXv42vAzYbmjj6JWbFWpNILYyfUXXQlro50gvVHm/QwQ7gvRUxbu9BYioXlHG4hu06dkjjdagkHf2w+s0V4ZDBqUp+2+oWytqfU3POB15yT4D2kbYh4CYyOu3wTrQGC9YpwXhBwLdU0+ylBAEPF4H4wx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8wsd-0007Kk-00; Sun, 27 Apr 2025 09:56:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7DBB3C0A9A; Sun, 27 Apr 2025 09:54:26 +0200 (CEST)
Date: Sun, 27 Apr 2025 09:54:26 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: WangYuli <wangyuli@uniontech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, jiaxun.yang@flygoat.com,
	chenhuacai@kernel.org, yangtiezhu@loongson.cn,
	zhanjun@uniontech.com, niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: Re: [PATCH] MIPS: Loongson64: Add missing '#interrupt-cells' for
 loongson64c_ls7a
Message-ID: <aA3islGKVa7cKUaT@alpha.franken.de>
References: <6E749D043BC7BD99+20250416034548.805069-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6E749D043BC7BD99+20250416034548.805069-1-wangyuli@uniontech.com>

On Wed, Apr 16, 2025 at 11:45:48AM +0800, WangYuli wrote:
> Similar to commit 98a9e2ac3755 ("MIPS: Loongson64: DTS: Fix msi node for ls7a").
> 
> Fix follow warnings:
>   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#interrupt-cells' in interrupt provider
>   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
> 
> Fixes: 24af105962c8 ("MIPS: Loongson64: DeviceTree for LS7A PCH")
> Tested-by: WangYuli <wangyuli@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts b/arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts
> index c7ea4f1c0bb2..6c277ab83d4b 100644
> --- a/arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts
> +++ b/arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts
> @@ -29,6 +29,7 @@ msi: msi-controller@2ff00000 {
>  		compatible = "loongson,pch-msi-1.0";
>  		reg = <0 0x2ff00000 0 0x8>;
>  		interrupt-controller;
> +		#interrupt-cells = <1>;
>  		msi-controller;
>  		loongson,msi-base-vec = <64>;
>  		loongson,msi-num-vecs = <64>;
> -- 
> 2.49.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

