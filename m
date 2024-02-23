Return-Path: <linux-mips+bounces-1707-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F2B8616CE
	for <lists+linux-mips@lfdr.de>; Fri, 23 Feb 2024 17:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54FB21C20C18
	for <lists+linux-mips@lfdr.de>; Fri, 23 Feb 2024 16:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA38A839FB;
	Fri, 23 Feb 2024 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8ZqSVi8"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747A481ACE;
	Fri, 23 Feb 2024 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708704261; cv=none; b=oL431nk3VYnnlvi8MGDFIHF38zKIgFfeRwPI0ld1i1l/rO7w/eWxcWhfWTjEoakAs9l+isxweqXgqS54JoD1HwyaY46qhvMB88W3AtkF+U097/8R2n4JhwsRf0wMPUxzHFhFq1kCd2Nmx/yUr+z/J2uiHBd33M9UVM2FKjWq50s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708704261; c=relaxed/simple;
	bh=NORrAR7qjBGXPD9m+xTdx4ZwEj3ndaRdb0/FfFpO6jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQauvkHtQi0Eze5QlAm+4HaxIkI1189RKanIIfq2O54074kHPbtETUa+V0Aibn5vot7OsSpg45k+xpB+9qYwnWdtdZ8JHnhbtvlEP2MzVXF+0EnIovQbKBLckt4mjROv7553zREoDv9F/H5aEKlpz9CGXPl7Dr+9z3kq5RVDqQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8ZqSVi8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1708C43390;
	Fri, 23 Feb 2024 16:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708704260;
	bh=NORrAR7qjBGXPD9m+xTdx4ZwEj3ndaRdb0/FfFpO6jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8ZqSVi841V4dh6cqm87KdpCu1qy57DcTv4/Qmy0u+YGgqzSxQaiCNyeWtIUflivu
	 g7u1B/dUfnf7ngfzkMIlcdp685tkLRW/5Ui0aZtIF9OQi9M3wzJG9aDDYeXn8m5TmR
	 uN/7DqZDj0HY0jahstdos++1AmKYs2J/mJpycp4qyJjPDNqh4XTgBluSwc41XX1kaU
	 NaOAsV+VzVB9ydszYVxqnRRAakyl3F922Ljm9QufIiSzapn6OmkctnJ/o+0s6/gv8h
	 0kzk46QVPoGl5gjmiFH2NcRNduDGRZbyv/ulBsTuLpR131XSBXapgkwo78WRA1PBfk
	 dROvKF4VWSjmA==
Date: Fri, 23 Feb 2024 16:04:15 +0000
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
Message-ID: <20240223160415.GG1666215@google.com>
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
 <20240223154559.GF1666215@google.com>
 <87cysn2ndu.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cysn2ndu.wl-tiwai@suse.de>

On Fri, 23 Feb 2024, Takashi Iwai wrote:

> On Fri, 23 Feb 2024 16:45:59 +0100,
> Lee Jones wrote:
> > 
> > On Tue, 13 Feb 2024, Heiner Kallweit wrote:
> > 
> > > If a simple trigger is assigned to a LED, then the LED may be off until
> > > the next led_trigger_event() call. This may be an issue for simple
> > > triggers with rare led_trigger_event() calls, e.g. power supply
> > > charging indicators (drivers/power/supply/power_supply_leds.c).
> > > Therefore persist the brightness value of the last led_trigger_event()
> > > call and use this value if the trigger is assigned to a LED.
> > > This change allows to use simple triggers in more cases.
> > > As a first use case simplify handling of the mute audio trigger.
> > > 
> > > This series touches few subsystems. I'd propose to handle it via
> > > the LED subsystem.
> > > 
> > > Heiner Kallweit (4):
> > >   leds: trigger: Store brightness set by led_trigger_event()
> > >   ALSA: control-led: Integrate mute led trigger
> > >   Input: leds: Prepare for removal of config option LEDS_AUDIO_TRIGGER
> > >   leds: trigger: audio: Remove this trigger
> > > 
> > >  arch/mips/configs/ci20_defconfig     |  1 -
> > >  drivers/input/input-leds.c           |  8 +---
> > >  drivers/leds/led-triggers.c          |  6 ++-
> > >  drivers/leds/trigger/Kconfig         |  7 ---
> > >  drivers/leds/trigger/Makefile        |  1 -
> > >  drivers/leds/trigger/ledtrig-audio.c | 67 ----------------------------
> > >  include/linux/leds.h                 | 29 ++++++------
> > >  sound/core/Kconfig                   |  1 -
> > >  sound/core/control_led.c             | 20 +++++++--
> > >  9 files changed, 37 insertions(+), 103 deletions(-)
> > >  delete mode 100644 drivers/leds/trigger/ledtrig-audio.c
> > 
> > Are the sound maintainers on-board with this?
> 
> See
>   https://lore.kernel.org/r/87zfw1ewrd.wl-tiwai@suse.de

Were you happy with Heiner's response?

-- 
Lee Jones [李琼斯]

