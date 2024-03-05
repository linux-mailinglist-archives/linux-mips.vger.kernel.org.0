Return-Path: <linux-mips+bounces-2066-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F2D871A07
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 10:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3550E28270E
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 09:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4FC535DB;
	Tue,  5 Mar 2024 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNFTdIAk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2414CB58;
	Tue,  5 Mar 2024 09:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709632545; cv=none; b=T9uyIYhSrGbCA1YE0jRePPEV6sPiTf+qn7afBDo9tNDzfhHfAM1hYmF4Qd/T0W3PjbQr9Z6gdGOgkmhZ7I/Uez+oOGEwpRVGaWmYtQSwplL5IsCzwJ9yJvi4fZLkR2k1f3gg1BlvkLll1SOphvn1uuKbm7NWtPBk/6+xsZvLLLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709632545; c=relaxed/simple;
	bh=YtlwpB+GkUwXzSfpnqd55fmhtpEXUCAU/amcVsEaIwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7uJXNwPB2x0wgIAGFFlAFmqTS5p5xCyg+8tpMhSJbQWTJ1tTnSQ8OxTe4vEEQTkKuEz+9o4mM6SaTvqs52zBun5sf93HsqKVd7qZHoiVWEduPmcC6eIC1IuzKG1FI2HkI1ah7xQ654ALAyQJr/9YY/RIeUuB9ModZTA8P1Qob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNFTdIAk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FDCC433F1;
	Tue,  5 Mar 2024 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709632544;
	bh=YtlwpB+GkUwXzSfpnqd55fmhtpEXUCAU/amcVsEaIwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNFTdIAkcCbEbr5/pyFB56UVLEq+ohmU+IBnx03xnpC1QSXFZ9PYB4FYsQu7dv0no
	 fdWUPp/Ljgbayw7CdJL4kiqKyFXgey1PupA698nAPz3Q9vWQIGuLpvWNlMtqem1MLj
	 0JxXo+vGYB78hP3LMQuFM6EXGcQfGwxPtwxl2hfDw9oTbX6yhFFnxu57fBVcYXU1Ec
	 Vdrhzz4KBMAcGeKcoL7W0lt8SgjwG+N09Z29qXIMbw8fn77kxntjuBOBNb+d3RGzKK
	 W2Kgu76M+MLg/+eW7XIlRVDizQYS0NlT9jXCuWaGitNT4iprK684ZQCSwSJcZrbevW
	 xBc/KHDLe4UdQ==
Date: Tue, 5 Mar 2024 09:55:39 +0000
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	linux-sound@vger.kernel.org,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/4] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
Message-ID: <20240305095539.GE5206@google.com>
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
 <20240229172653.GB1209090@google.com>
 <208e8bcc-1f35-4095-9a70-7243fdabaf87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <208e8bcc-1f35-4095-9a70-7243fdabaf87@gmail.com>

On Sat, 02 Mar 2024, Heiner Kallweit wrote:

> On 29.02.2024 18:26, Lee Jones wrote:
> > On Tue, 13 Feb 2024, Heiner Kallweit wrote:
> > 
> >> If a simple trigger is assigned to a LED, then the LED may be off until
> >> the next led_trigger_event() call. This may be an issue for simple
> >> triggers with rare led_trigger_event() calls, e.g. power supply
> >> charging indicators (drivers/power/supply/power_supply_leds.c).
> >> Therefore persist the brightness value of the last led_trigger_event()
> >> call and use this value if the trigger is assigned to a LED.
> >> This change allows to use simple triggers in more cases.
> >> As a first use case simplify handling of the mute audio trigger.
> >>
> >> This series touches few subsystems. I'd propose to handle it via
> >> the LED subsystem.
> >>
> >> Heiner Kallweit (4):
> >>   leds: trigger: Store brightness set by led_trigger_event()
> >>   ALSA: control-led: Integrate mute led trigger
> >>   Input: leds: Prepare for removal of config option LEDS_AUDIO_TRIGGER
> >>   leds: trigger: audio: Remove this trigger
> >>
> >>  arch/mips/configs/ci20_defconfig     |  1 -
> > 
> >>  drivers/input/input-leds.c           |  8 +---
> > 
> > This does not apply.
> > 
> > Please rebase onto v6.8-rc1.
> > 
> Since v6.8-rc1 the following has been added, which is touched by
> my series:
> 698b43780ba2 ("Input: leds - set default-trigger for mute")
> 
> Rebasing onto v6.8-rc1 would mean:
> - remove the change to input-leds from the series
> - resubmit this change via input subsystem
> 
> This would affect bisectability, because for the time being
> input-leds would reference a config symbol that doesn't exist
> any longer.
> 
> We'd be fine only if the change to input-leds is applied first.
> I think that's the best way to go, if you can't accept a series
> based on linux-next.

Then it's going to have to wait until v6.10.

-- 
Lee Jones [李琼斯]

