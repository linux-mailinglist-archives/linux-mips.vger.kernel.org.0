Return-Path: <linux-mips+bounces-2068-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8A9871C03
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 11:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 505331F246F3
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 10:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE8A5B664;
	Tue,  5 Mar 2024 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IG0YkgI/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F50F5A78D;
	Tue,  5 Mar 2024 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709635206; cv=none; b=LT2kJ895qjmEvcjuTNphXpQpTnEdGM2ASnQ5dLcVaZMdDktYe+S+dnnF8HYRwP9cOS4f0pLf5CMASnOOaMDrg5hrTLqtHOpJvh3gg7TYzln8nxvjTuyyD3c+bDjwpwtaWcCAczxVhh/hzlvazbEmUNgWRc8PXaCwwUpghO9f54E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709635206; c=relaxed/simple;
	bh=IJDVz1uipxvQs+z2wfWz4EQe35sYMgwDkAU8oGgCkfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHdYYMCvXxuN1OejYybHchNgVddC8OBxm7ePvaUwiAdkgdRCuDcx4glnGwCMH5JcC2Wo/HpjJIWrwsAjCmcu2p6P+EwWBmoHcD+0I6lWINOTRIYg2Tvi5WjgfC0/BB93OHLKs25/srDXPk2VgJkEntfxENpPM0T8HVSjZY/pMPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IG0YkgI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77779C433F1;
	Tue,  5 Mar 2024 10:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709635205;
	bh=IJDVz1uipxvQs+z2wfWz4EQe35sYMgwDkAU8oGgCkfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IG0YkgI/VfyLOtJMVZvNwGqFJaWZF344+xm8SzYA6a4CCUjrLevkeRI34sXmryMuV
	 tSD3ZJsRKSWE7MM0whXPbTNoNcDttLYN86EodmAY9U2ypzvjgAsz4sIriGVzJy+y4l
	 L2kTRAfyY797LslqJZZ8S5bIuxgZx7lgk6usCoQ/pRkaimUTre28WRXZoSZEWiz8Ge
	 Jh4a9RoZaITjjOq3jyrpAT7S3gRoy3VqcPX2zHDm/Z7jXQDwT0/M8qGRizodIEbdKT
	 42xMIm60lKoHeSPkQHJU8a81cju2MR/EVELVRKTmEJrusJOdE2zyBTGFRzde/e88nm
	 T6dwyk1tkzP5A==
Date: Tue, 5 Mar 2024 10:40:00 +0000
From: Lee Jones <lee@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	linux-sound@vger.kernel.org,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/4] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
Message-ID: <20240305104000.GG5206@google.com>
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
 <20240229172653.GB1209090@google.com>
 <208e8bcc-1f35-4095-9a70-7243fdabaf87@gmail.com>
 <20240305095539.GE5206@google.com>
 <875xy1ynya.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875xy1ynya.wl-tiwai@suse.de>

On Tue, 05 Mar 2024, Takashi Iwai wrote:

> On Tue, 05 Mar 2024 10:55:39 +0100,
> Lee Jones wrote:
> > 
> > On Sat, 02 Mar 2024, Heiner Kallweit wrote:
> > 
> > > On 29.02.2024 18:26, Lee Jones wrote:
> > > > On Tue, 13 Feb 2024, Heiner Kallweit wrote:
> > > > 
> > > >> If a simple trigger is assigned to a LED, then the LED may be off until
> > > >> the next led_trigger_event() call. This may be an issue for simple
> > > >> triggers with rare led_trigger_event() calls, e.g. power supply
> > > >> charging indicators (drivers/power/supply/power_supply_leds.c).
> > > >> Therefore persist the brightness value of the last led_trigger_event()
> > > >> call and use this value if the trigger is assigned to a LED.
> > > >> This change allows to use simple triggers in more cases.
> > > >> As a first use case simplify handling of the mute audio trigger.
> > > >>
> > > >> This series touches few subsystems. I'd propose to handle it via
> > > >> the LED subsystem.
> > > >>
> > > >> Heiner Kallweit (4):
> > > >>   leds: trigger: Store brightness set by led_trigger_event()
> > > >>   ALSA: control-led: Integrate mute led trigger
> > > >>   Input: leds: Prepare for removal of config option LEDS_AUDIO_TRIGGER
> > > >>   leds: trigger: audio: Remove this trigger
> > > >>
> > > >>  arch/mips/configs/ci20_defconfig     |  1 -
> > > > 
> > > >>  drivers/input/input-leds.c           |  8 +---
> > > > 
> > > > This does not apply.
> > > > 
> > > > Please rebase onto v6.8-rc1.
> > > > 
> > > Since v6.8-rc1 the following has been added, which is touched by
> > > my series:
> > > 698b43780ba2 ("Input: leds - set default-trigger for mute")
> > > 
> > > Rebasing onto v6.8-rc1 would mean:
> > > - remove the change to input-leds from the series
> > > - resubmit this change via input subsystem
> > > 
> > > This would affect bisectability, because for the time being
> > > input-leds would reference a config symbol that doesn't exist
> > > any longer.
> > > 
> > > We'd be fine only if the change to input-leds is applied first.
> > > I think that's the best way to go, if you can't accept a series
> > > based on linux-next.
> > 
> > Then it's going to have to wait until v6.10.
> 
> Or merging via input tree?
> The changes are relatively small and easy, after all.

That's likely to culminate in similar merge-conflicts when further
changes are made to:

  drivers/leds/led-triggers.c
  drivers/leds/trigger/Kconfig
  drivers/leds/trigger/Makefile
  drivers/leds/trigger/ledtrig-audio.c
  include/linux/leds.h

What happens if I take all but the Input change?  If this doesn't cause
build-failures and the Input change will definitely land in v6.9, it
could work.

-- 
Lee Jones [李琼斯]

