Return-Path: <linux-mips+bounces-4111-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14649264C5
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 17:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F9651C21819
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 15:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F27C17E907;
	Wed,  3 Jul 2024 15:24:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E6618133C;
	Wed,  3 Jul 2024 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720020298; cv=none; b=NW4GxIY9VZMpNFgzkcBp+JRmGEZIjeKH5oH7J0/W4F/u7+fWG/SI+x7bEKKMmJdWM+FVnsb3q3CQoZxPDmv8z/N0HrArbQmeQx20RZ9azuGMpy44D/SbPoItTSonMCOyWDbDhDQ0GBWxsq0y8U3bso5uzk33wx/XhjNgafVABIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720020298; c=relaxed/simple;
	bh=o19US8A1HffNsZUziElqqY8b9mHoauDq0XL3Jia+I/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCZ0Jn5WsZdU7+F6JY/U4tU44WHDKq6cwgKbS6J2Qn6XNEcf6gI7KzOn7lXVVWg+j8uZbpqylK0Eg6naVOmqdfL1t6AK9VlWl5StkwjSilMp2ZQcRtxOnPduhEPfj1uxz8tTTPi8iwmAjceS1v/GLo3TqNTcxDgkfeagVyCVg5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sP1qd-0000Hg-00; Wed, 03 Jul 2024 17:24:43 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 23F99C031A; Wed,  3 Jul 2024 17:24:14 +0200 (CEST)
Date: Wed, 3 Jul 2024 17:24:14 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 0/7] MIPS: clocksource cumulative enhancements
Message-ID: <ZoVtHkn1HuRy4SDw@alpha.franken.de>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>

On Wed, Jun 12, 2024 at 09:54:27AM +0100, Jiaxun Yang wrote:
> Hi all,
> 
> This series combined many enhancements for MIPS clocksource subsystems,
> It improved r4k count synchronisation process, clock source rating for
> selection, sched_clock eligibility and so on.
> 
> It seems fixed random RCU stall issue on Loongson 3A4000 multi-node
> system and some boot failures on QEMU.
> 
> Please review.
> 
> Thanks 
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Fix number of zeros in rating computation (Maciej)
> - Only select HAVE_UNSTABLE_SCHED_CLOCK for SMP (Maciej)
> - Link to v1: https://lore.kernel.org/r/20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com
> 
> ---
> Jiaxun Yang (7):
>       MIPS: csrc-r4k: Refine rating computation
>       MIPS: csrc-r4k: Apply verification clocksource flags
>       MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
>       MIPS: csrc-r4k: Don't register as sched_clock if unfit
>       MIPS: sync-r4k: Rework based on x86 tsc_sync

applied these patches to mips-next.

>       clocksource: mips-gic-timer: Refine rating computation
>       clocksource: mips-gic-timer: Correct sched_clock width

looks like the remaining patches don't have any dependency to the other
five patches, so they could just go via clocksource tree. BTW it would
be good to split series in such cases.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

