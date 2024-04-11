Return-Path: <linux-mips+bounces-2697-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C70A78A0C38
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 11:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C8CD1F21B92
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 09:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA5B144314;
	Thu, 11 Apr 2024 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqAteOPO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D7713FD76;
	Thu, 11 Apr 2024 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712827344; cv=none; b=FhN/CX+grMW4PwkjcWem8czoAmaBuR4dSw31hrtORynjXkaWGJzlNPmCaOY81eS4xMyAXgZjBMXKK6P+gR01ODXbF2CD4fTL1Khx8xkGj49Fs245o1eDqj9FSGptAfogFAjNCL+RoKORHsPU/HJZ65NQyWLpbcH1BtSIVE9fRBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712827344; c=relaxed/simple;
	bh=M44Zkp4UwKNeUl3v+NyzoK7eywLyI+1hmslOcmP1Tw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5C6ou53NqOfcXJOcvxNgdcFB7aufQRCGlDBe8b0bAv8plSa2m1uBsu9T3h2VtXTpWTli4HtoX5J+FdJlErSgq5iCr1kIaVss8swZO3aPdev2wh8jGG7rjx3lc50fro2fq9L6BvvMEFtYicwYqsORvdAYcIXIfHp7Gv559hXVt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqAteOPO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F02C433C7;
	Thu, 11 Apr 2024 09:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712827344;
	bh=M44Zkp4UwKNeUl3v+NyzoK7eywLyI+1hmslOcmP1Tw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqAteOPONxhXLzvknNGVIkhuSSp06hPF3xmxs4yBTAv93Gm5Ih5YufAUaKLxLldrW
	 rMP+DCLywX88H/C5lkR2Bow5IyF/q5AI+jhQDpJ4ICqfVPV5//PiWnbKlFAMJlunTn
	 DK9kbtbaKoNgKKmqQatlTvrYhQi1GmssAvBfed6XHq75bpg8ZXFrmKDDkH97e3K7wB
	 XZlsfzn92Dq+BFO0/9BO4JThau2uti3tCanhJnxIrsQid/bQ1aqHi0vDRGhQZrghdP
	 lgyK7UcJWrbkiL7oqu1KXq69kJcpEJnvs/QKLnUSCv2hH4MGW/a8xGLMWFlhJmDM+t
	 DzssCpzsC3oYw==
Date: Thu, 11 Apr 2024 10:22:19 +0100
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/3] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
Message-ID: <20240411092219.GG6194@google.com>
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
 <170964052434.128456.128263499797916605.b4-ty@kernel.org>
 <20240305120947.GD86322@google.com>
 <20240328104232.GZ13211@google.com>
 <6c0a1792-50a2-4208-8f6e-fbf0295110c0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c0a1792-50a2-4208-8f6e-fbf0295110c0@gmail.com>

On Fri, 05 Apr 2024, Heiner Kallweit wrote:

> On 28.03.2024 11:42, Lee Jones wrote:
> > On Tue, 05 Mar 2024, Lee Jones wrote:
> > 
> >> On Tue, 05 Mar 2024, Lee Jones wrote:
> >>
> >>> On Mon, 04 Mar 2024 21:56:29 +0100, Heiner Kallweit wrote:
> >>>> If a simple trigger is assigned to a LED, then the LED may be off until
> >>>> the next led_trigger_event() call. This may be an issue for simple
> >>>> triggers with rare led_trigger_event() calls, e.g. power supply
> >>>> charging indicators (drivers/power/supply/power_supply_leds.c).
> >>>> Therefore persist the brightness value of the last led_trigger_event()
> >>>> call and use this value if the trigger is assigned to a LED.
> >>>> This change allows to use simple triggers in more cases.
> >>>> As a first use case simplify handling of the mute audio trigger.
> >>>>
> >>>> [...]
> >>>
> >>> Applied, thanks!
> >>>
> >>> [1/3] leds: trigger: Store brightness set by led_trigger_event()
> >>>       commit: 575129855dee0e364af7df84a77ab5cca54b1442
> >>> [2/3] ALSA: control-led: Integrate mute led trigger
> >>>       commit: ba8adb1646ee498029ac12b20e792d9d0dd17920
> >>> [3/3] leds: trigger: audio: Remove this trigger
> >>>       commit: 2c61168294d0ea42a5542dbc864afb03a76bbc11
> >>
> >> Submitted for build testing.
> >>
> >> Once succeeded, a PR will follow for other maintainers to pull from.
> > 
> > Rebased onto v6.9-rc1 and resubmitted for build testing.
> > 
> Can the series be expected soon in linux-next for broader testing?

Yes.  Catching-up today and this is on the list.

-- 
Lee Jones [李琼斯]

