Return-Path: <linux-mips+bounces-8791-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92762A9E0BA
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 10:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B9CC7A5A9F
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 08:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A9524503E;
	Sun, 27 Apr 2025 08:19:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B341CAA85;
	Sun, 27 Apr 2025 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745741945; cv=none; b=q3onrhgK9Ii89v+t0MCPzBC8fx1j/2PUqlsaNXssY2Gjm9xizKPlv4zIL62XGYqnebWivYvOSN2cKPlPhfCiVXX2sjG7bnqc42VhiUpLqYHqEzaZMYB6KvoIEtUWrPYkwfce755/3yra6p+nLOjkWSdXjB+uKWmBEfXMz3lUZu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745741945; c=relaxed/simple;
	bh=K/LAiiDDRBvOuo+r4km25h7Zoc4FKiIKhE0c8fH1Vco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTHIIw9C5aNLUfjobriCSUWiRUzVobCQU3Hjjrdy6XJGZqwaKzn8jkY2UnVE0QiFrGGG7u64FJCGfyNNNUK5dHRNG3MXs4S51ZjJrZy/hKFHA6/J6In9tbAEBAGMMcymlcCgbGCEHdIIcU3iEUBGxGVXpP/xEu6nhshAKtrdq8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8xE5-0007QX-00; Sun, 27 Apr 2025 10:19:01 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 17DA1C0A20; Sun, 27 Apr 2025 10:18:35 +0200 (CEST)
Date: Sun, 27 Apr 2025 10:18:35 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ralink: Avoid x/x division in rt_timer_config()
Message-ID: <aA3oWzkUP3CYbShi@alpha.franken.de>
References: <20250408082804.796515-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408082804.796515-2-thorsten.blum@linux.dev>

On Tue, Apr 08, 2025 at 10:28:05AM +0200, Thorsten Blum wrote:
> Avoid the 'rt->timer_freq / rt->timer_freq' division when the divisor is
> larger than the timer frequency and use '1' directly.
> 
> No functional changes intended.
> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/ralink/timer.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/ralink/timer.c b/arch/mips/ralink/timer.c
> index 54094f6e033e..5d8286603584 100644
> --- a/arch/mips/ralink/timer.c
> +++ b/arch/mips/ralink/timer.c
> @@ -75,12 +75,16 @@ static int rt_timer_request(struct rt_timer *rt)
>  
>  static int rt_timer_config(struct rt_timer *rt, unsigned long divisor)
>  {
> -	if (rt->timer_freq < divisor)
> +	u32 t;
> +
> +	if (rt->timer_freq < divisor) {
>  		rt->timer_div = rt->timer_freq;
> -	else
> +		t = 1;
> +	} else {
>  		rt->timer_div = divisor;
> -
> -	rt_timer_w32(rt, TIMER_REG_TMR0LOAD, rt->timer_freq / rt->timer_div);
> +		t = rt->timer_freq / rt->timer_div;
> +	}
> +	rt_timer_w32(rt, TIMER_REG_TMR0LOAD, t);

I really don't see the point for this change. IMHO, this isn't really 
runtime critical and I prefer the code like it is at the moment.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

