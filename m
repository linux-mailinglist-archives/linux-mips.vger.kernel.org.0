Return-Path: <linux-mips+bounces-8251-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E22A6B7D3
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 10:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 512893BCC04
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 09:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A93822157E;
	Fri, 21 Mar 2025 09:38:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757CF210192;
	Fri, 21 Mar 2025 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742549910; cv=none; b=DeECEZD6gYAlo24mf1bOd2JnmgdXu2jNSnmXZoJc8E3HStHfYyaxj9HGMXXmFJ/whzF1rO4dcl1vzm6uOFIclDC0wAFl1JJzbyHmcJTTjX4llET+BoCIn48RFIGdQkhdXeHHauvvERk0Bu2ASYwOZy2JzroiF65H2zdNZi48QJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742549910; c=relaxed/simple;
	bh=1huO00OkX0Vakm7rr7rzZ8OBPfeAzXVRpl8jPbeH2ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGOGMzbqkBvGCshiFhcS1uPeLrK9N75PC185NJdiq2dXfxcfetJVRdPFw6lXnoMMaCpzFyO1hQC/JVvBvg/1aBViam7YQqwUEVO9/OF9Ep9BJyMGNB6LSs+IiWI9MUW9akm5bo3uLjyTywLEurkMwcr5DvzQk9NF8MzW/IXr2dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tvYpU-0006y1-00; Fri, 21 Mar 2025 10:38:16 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id F2DD4C0135; Fri, 21 Mar 2025 10:38:01 +0100 (CET)
Date: Fri, 21 Mar 2025 10:38:01 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z90zebpJE4Y9SbkK@alpha.franken.de>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
 <Z9qlW81QikxeVzQa@alpha.franken.de>
 <Z9rYAT9i3Ko92uUo@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de>
 <Z9rjZf0ZT7iejVlA@alpha.franken.de>
 <CAAofZF7XPm+tzPpwAPu0oDZem+EOVY18oAbVwAXzkGmtstnBQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAofZF7XPm+tzPpwAPu0oDZem+EOVY18oAbVwAXzkGmtstnBQg@mail.gmail.com>

On Thu, Mar 20, 2025 at 09:44:23AM +0100, Marco Crivellari wrote:
> Hi,
> 
> yesterday I made this changes:
> 
> @@ -128,7 +128,11 @@ LEAF(__r4k_wait)
>         */
>        wait
>        /* End of idle interrupt region. */
> -1:
> +SYM_INNER_LABEL(__r4k_wait_exit, SYM_L_LOCAL)

do we really need that for a symbol local to that file ?

> +       /* Check idle interrupt region size. */
> +       .ifne   __r4k_wait_exit - __r4k_wait - 36

I have to say, that I prefer my .if statement, since this clearly spells out
the comparision in the expression. Is there a reason for your version ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

