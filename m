Return-Path: <linux-mips+bounces-9028-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B0ABCFEB
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 08:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95B154A15C9
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 06:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7621325D1EF;
	Tue, 20 May 2025 06:56:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAB825CC6A;
	Tue, 20 May 2025 06:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747724212; cv=none; b=gaJInANg8jigSc083fgyMXFropyvxSkIm5vN45+RTixAubQsqKDrc0cwCh1YXmjH45eAzCmvWP8EWqNifemJKMvad8LRAUU59z6uiICY37ehx5EMllzc4zYhxek0X/zY4xCG9vh90JijGOodv4fCc4UPwFyK/P7mkfhixttVfFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747724212; c=relaxed/simple;
	bh=obD3W9aalppgKCmnqrg4Z36XY9rCjKoeskW1Vsxn4LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Io1qXqlOuiv4GJjvkTNzodLjgqtgNlBsJ2IuLWKJzLFa8akrGdGVQPWyY9ThiMYqA8CEsiG1a5u2A5M6IwGAOutlIMReAg1E9JeQflf97EfOEIiXnXbISAf1q6iL62XBgqQtXC6/dHT0GHV/fjFRFSEpFQYERXdCFtQovWuscQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uHGu1-0006iP-00; Tue, 20 May 2025 08:56:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3FA21C05FC; Tue, 20 May 2025 08:50:36 +0200 (CEST)
Date: Tue, 20 May 2025 08:50:36 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SMP: Move the AP sync point before the
 non-parallel aware functions
Message-ID: <aCwmPKm3NjbhLiNA@alpha.franken.de>
References: <20250505-hotplug-paralell-fix-v1-1-86f222cb6d90@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505-hotplug-paralell-fix-v1-1-86f222cb6d90@bootlin.com>

On Mon, May 05, 2025 at 02:57:58PM +0200, Gregory CLEMENT wrote:
> When CONFIG_HOTPLUG_PARALLEL is enabled, the code executing before
> cpuhp_ap_sync_alive() is executed in parallel, while after it is
> serialized. The functions set_cpu_sibling_map() and set_cpu_core_map()
> were not designed to be executed in parallel, so by moving the
> cpuhp_ap_sync_alive() before cpuhp_ap_sync_alive(), we then ensure
> they will be called serialized.
> 
> The measurement done on EyeQ5 did not show any relevant boot time
> increase after applying this patch.
> 
> Reported-by: Huacai Chen <chenhuacai@kernel.org>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> Hello,
> 
> As discussed last week [1], this is the patch that fixes the potential
> issue with the functions set_cpu_sibling_map() and set_cpu_core_map().
> 
> Gregory

applied to mips-next with a Fixes tag added

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

