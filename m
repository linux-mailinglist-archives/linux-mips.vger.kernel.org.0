Return-Path: <linux-mips+bounces-2483-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D9088FD47
	for <lists+linux-mips@lfdr.de>; Thu, 28 Mar 2024 11:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 064441F25024
	for <lists+linux-mips@lfdr.de>; Thu, 28 Mar 2024 10:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FB87C09E;
	Thu, 28 Mar 2024 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZGk4Ooz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A50C52F6F;
	Thu, 28 Mar 2024 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711622557; cv=none; b=jFhn9osDjUbZqQ4ll9ED+RpH82XLivHli+fal81zSb6vON38oAVPuRyW335zieAvCYrskrQsfrcXyxXYC3iPEv5I5U1FLI8BcXm9oXlH2twy+sYoztI9sQv4vV0fseRRRWzoUw4aLQd7ss2sJDnwBbS6jAmnnG+YXjQp7kwNBao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711622557; c=relaxed/simple;
	bh=TLwY36m+qZUIug2QETpHdrHJjSCnPwwXo3SwxpZsk4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFrUp9p4phFzxIwpmSbrhKCGWYP2QxnllFnh7h/tNTJy3ryLpSL9SXnbNjX81KdaUXHmAFaBtVD/RPNsmNL6MDHHK1AEa7sG3VM/NtlSJqVN/UR69WHcvo7znFIzC3EDdMytoStCAUISqJzziDYYkIwB2J/e/EdERxiYC85jf9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZGk4Ooz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EED4C433C7;
	Thu, 28 Mar 2024 10:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711622556;
	bh=TLwY36m+qZUIug2QETpHdrHJjSCnPwwXo3SwxpZsk4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZGk4OozBnsgiNryIE1NMlmvrHq9TidF1DKxZYUPUfNgEbPkRpqR0jxSthUT7HDh+
	 xyCAPDkvZmVAiZ3cfmzOWwfSvmUnNcLfIsCf25sJ7Lt8Zng2zHJZwCnJoNc9IL1XQR
	 Y/wSvNwwFH+2WcCt8/9lRTOzCw8lKEIbkpURnMT7SxdXwhpuzuqrcwIM514QHfJbnB
	 5RSbDKSM3CA8pSXP+8tod/PRbWfQESIykxYIgqCc4z7qDwON5IRrfdWMnwcjOWhhkp
	 TV2H1uZbWCv3pwWQA0U9BwkjBrTcw18/BLPd3M0d1clGkM/pDLYLcmfpSS9gMCpWrS
	 +bf7iSDaNIA9g==
Date: Thu, 28 Mar 2024 10:42:32 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Pavel Machek <pavel@ucw.cz>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/3] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
Message-ID: <20240328104232.GZ13211@google.com>
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
 <170964052434.128456.128263499797916605.b4-ty@kernel.org>
 <20240305120947.GD86322@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305120947.GD86322@google.com>

On Tue, 05 Mar 2024, Lee Jones wrote:

> On Tue, 05 Mar 2024, Lee Jones wrote:
> 
> > On Mon, 04 Mar 2024 21:56:29 +0100, Heiner Kallweit wrote:
> > > If a simple trigger is assigned to a LED, then the LED may be off until
> > > the next led_trigger_event() call. This may be an issue for simple
> > > triggers with rare led_trigger_event() calls, e.g. power supply
> > > charging indicators (drivers/power/supply/power_supply_leds.c).
> > > Therefore persist the brightness value of the last led_trigger_event()
> > > call and use this value if the trigger is assigned to a LED.
> > > This change allows to use simple triggers in more cases.
> > > As a first use case simplify handling of the mute audio trigger.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/3] leds: trigger: Store brightness set by led_trigger_event()
> >       commit: 575129855dee0e364af7df84a77ab5cca54b1442
> > [2/3] ALSA: control-led: Integrate mute led trigger
> >       commit: ba8adb1646ee498029ac12b20e792d9d0dd17920
> > [3/3] leds: trigger: audio: Remove this trigger
> >       commit: 2c61168294d0ea42a5542dbc864afb03a76bbc11
> 
> Submitted for build testing.
> 
> Once succeeded, a PR will follow for other maintainers to pull from.

Rebased onto v6.9-rc1 and resubmitted for build testing.

-- 
Lee Jones [李琼斯]

