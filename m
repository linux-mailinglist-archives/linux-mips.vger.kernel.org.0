Return-Path: <linux-mips+bounces-2073-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E2871E9D
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 13:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED313286383
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 12:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD645822E;
	Tue,  5 Mar 2024 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8y4oa+H"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522677484;
	Tue,  5 Mar 2024 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640592; cv=none; b=tjuxLdRatqscjx4GUF3ac0UG99s3ULULNjEnuaKCKYkHtscYQhCh3UYGac1haue8meWMWNZuuNkibZjK50Hpx5yRkW3lj3zhwSFXF0PmtDauIxf6SSCVzWotolc+puHx4nLOWsgPMdbYAyTRl6joDgzcFnUMTIPCKJiQYbLsQyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640592; c=relaxed/simple;
	bh=TPtJtVZnWukNSHq5RvVLOZ6puDBbDvzzbdZt98utfDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BG3kDj2CWCGSJC2NeL/3J5islWBjrpf8cvx4j/9hnjZE+eZf98/kntHn/Hab4YWkkwG+o/1Sn6eYslXhHmHtt3OF/RJZ0anrtN6dB9tkRBPPT7b6MAEbuYiPkLIQ1PrPG/UelWiiU2sfkzBkVJR8o0kva5iKK2LYAAScdHSxAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8y4oa+H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339CDC433C7;
	Tue,  5 Mar 2024 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709640591;
	bh=TPtJtVZnWukNSHq5RvVLOZ6puDBbDvzzbdZt98utfDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8y4oa+HeNHfSS2aqjOOpgtrTZTf1q94RBVqgmeXN5m+zPt7XmCCd6dIb19FWkgNv
	 gWvSVoklh6WNYRbr7g9QG2kWLWeRJRg00cHeVei/xXSSKEyp3N/6UeJp3z94wGrahp
	 763KL00JNr3wRqHOGW6tDL070Wz0DYuoqzxNrXIuCxpHFmqZZGNnHV3xV0CXPIlCnV
	 /ZiOYiGDrjaXoTIUaj2U3soT2RZ44sidK8bDMs3jq1uIIhxyoyvIH43XW3JETt3HKT
	 Au52l60kv3SY6ww1v5r75KyxCzNa7rU3SVyfcCW9PeQtwbl1WPFYXGnUCa7/qLtojl
	 ypW5zYKpAIB/Q==
Date: Tue, 5 Mar 2024 12:09:47 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Pavel Machek <pavel@ucw.cz>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/3] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
Message-ID: <20240305120947.GD86322@google.com>
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
 <170964052434.128456.128263499797916605.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <170964052434.128456.128263499797916605.b4-ty@kernel.org>

On Tue, 05 Mar 2024, Lee Jones wrote:

> On Mon, 04 Mar 2024 21:56:29 +0100, Heiner Kallweit wrote:
> > If a simple trigger is assigned to a LED, then the LED may be off until
> > the next led_trigger_event() call. This may be an issue for simple
> > triggers with rare led_trigger_event() calls, e.g. power supply
> > charging indicators (drivers/power/supply/power_supply_leds.c).
> > Therefore persist the brightness value of the last led_trigger_event()
> > call and use this value if the trigger is assigned to a LED.
> > This change allows to use simple triggers in more cases.
> > As a first use case simplify handling of the mute audio trigger.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] leds: trigger: Store brightness set by led_trigger_event()
>       commit: 575129855dee0e364af7df84a77ab5cca54b1442
> [2/3] ALSA: control-led: Integrate mute led trigger
>       commit: ba8adb1646ee498029ac12b20e792d9d0dd17920
> [3/3] leds: trigger: audio: Remove this trigger
>       commit: 2c61168294d0ea42a5542dbc864afb03a76bbc11

Submitted for build testing.

Once succeeded, a PR will follow for other maintainers to pull from.

-- 
Lee Jones [李琼斯]

