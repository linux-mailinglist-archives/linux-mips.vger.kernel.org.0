Return-Path: <linux-mips+bounces-10510-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B7B323E4
	for <lists+linux-mips@lfdr.de>; Fri, 22 Aug 2025 23:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C159FAC81D6
	for <lists+linux-mips@lfdr.de>; Fri, 22 Aug 2025 21:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB3C26B769;
	Fri, 22 Aug 2025 21:02:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8133117BA3;
	Fri, 22 Aug 2025 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755896531; cv=none; b=sKGvwqh30YdBZWmdCMjacajA5EJSbTZSEwjlKwXeI40OpeB4o0IJwSMuu25PZJmRqS9hfH/f1n4kvIuPkJPul0PRCWjMQNaogJCSxuBIJL6NwQCrvSIVsD3LOPFK/xJUSQEV5dgssx8mJG18rbuxHM+EThNqx5Xab6V4+oSkqmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755896531; c=relaxed/simple;
	bh=N0od3Zda4p0wNa9XTkQyDqmvTL6HjPvbtZhHcqO6698=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFJipr4pX5tKPiZfgmlOooA9Yhb/25RZXwP7rW1ehMci8UEY/yL2XOPW+RUpA492H2gkksbg3Y+xXhb/669Ipa3Jz1AXJ+7kcylojxLjgp+mLUCq7zkndZHoAlDsLV/GvUgauBruSYXn4sUWTSB6iB9TG86VTg4zgWclNOKsgUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1upYtZ-0007kR-00; Fri, 22 Aug 2025 23:01:57 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id F09F0C04FD; Fri, 22 Aug 2025 22:05:37 +0200 (CEST)
Date: Fri, 22 Aug 2025 22:05:37 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, john@phrozen.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] mips: lantiq: fix ethernet support
Message-ID: <aKjNkagCFYlZTFXn@alpha.franken.de>
References: <20250817131022.3796476-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817131022.3796476-1-olek2@wp.pl>

On Sun, Aug 17, 2025 at 02:49:05PM +0200, Aleksander Jan Bajkowski wrote:
> This series fixes broken Ethernet in the upstream danube dts. The
> driver doesn't attach due to missing burst length property. OpenWRT
> has its own dts, which is correct, so the problem has only been
> spotted now. Other dts inconsistencies with bindings have been
> fixed as well.
> 
> ---
> Changes in v2:
> - renaming clocks in sysctrl
> ---
> Aleksander Jan Bajkowski (2):
>   mips: dts: lantiq: danube: add missing burst length property
>   mips: lantiq: xway: sysctrl: rename the etop node
> 
>  arch/mips/boot/dts/lantiq/danube_easy50712.dts |  5 ++++-
>  arch/mips/lantiq/xway/sysctrl.c                | 10 +++++-----
>  2 files changed, 9 insertions(+), 6 deletions(-)

series applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

