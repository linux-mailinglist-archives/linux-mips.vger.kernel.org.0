Return-Path: <linux-mips+bounces-1708-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CED28616D6
	for <lists+linux-mips@lfdr.de>; Fri, 23 Feb 2024 17:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0141C23071
	for <lists+linux-mips@lfdr.de>; Fri, 23 Feb 2024 16:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB36083A03;
	Fri, 23 Feb 2024 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6G+inPk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1E482C9B;
	Fri, 23 Feb 2024 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708704317; cv=none; b=K2UBNE4VReoCpvGnqubCvacfCFzktqD70b6Y2tL2TKqT2Lk6+pbutA5BJB0jg4msD2xiIe9bmm0bXWUeGFeYi6rU5nIIeGx4IMgq18E009kHvg3rpbL376ELAyHl/inOpjWGUjZlfy319zqeYWTlcNQpkoT9EzyE9K81jdxFOow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708704317; c=relaxed/simple;
	bh=1pA9cWrE5jmzu4ZXRhRg9bx1JFZpGVx6t7K0cwxoOR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3it/Pd8SwXj6nKxPf9hNx1LwmQs4HGIIqvv4pPX3pFwi489MLgsVI71FQ12Qew3Rouy8e6DvVWHW+yl6JydNkO+U7uHRxKTSu8CpI4gmrqGTPCXyLMR39TU4vmMOdjSZDPnz9Hg0l23bkA2sG/KTlrz1hDsYId5MbI0qk1TUzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6G+inPk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E05DC433C7;
	Fri, 23 Feb 2024 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708704317;
	bh=1pA9cWrE5jmzu4ZXRhRg9bx1JFZpGVx6t7K0cwxoOR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6G+inPkJr6Yh47U2LQuWUXQB6tvS3B37yZ4gUkSCqm7NthylGlaQvQ2YVMQ8Fh4C
	 QhOE8nG1Qs5DF9qIg+YvnSqnhpsuFqQlNfJ3caaDWvfWXRIYGlqljIetFZGSKV97oL
	 QR9VCGonOwGGZGGSylDiaGilrcohWKFyGmofdg3F6GQDMwQqwaUmmejaEj5vz7M81y
	 t24HZLvS818YF+hAqv8oA6zYNT5o5wxEpUMzTER+J7XgysK+gZSRpfLyL2Jfu7/gF0
	 NhtmOrvfYiBedlYFM+X/EozlLcHqJ7rHX1hX2gLh3mgV0+c65/q3e02ksW+gW6OSax
	 z9DIZU+7AbgFg==
Date: Fri, 23 Feb 2024 16:05:12 +0000
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
Message-ID: <20240223160512.GH1666215@google.com>
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>

On Tue, 13 Feb 2024, Heiner Kallweit wrote:

> If a simple trigger is assigned to a LED, then the LED may be off until
> the next led_trigger_event() call. This may be an issue for simple
> triggers with rare led_trigger_event() calls, e.g. power supply
> charging indicators (drivers/power/supply/power_supply_leds.c).
> Therefore persist the brightness value of the last led_trigger_event()
> call and use this value if the trigger is assigned to a LED.
> This change allows to use simple triggers in more cases.
> As a first use case simplify handling of the mute audio trigger.
> 
> This series touches few subsystems. I'd propose to handle it via
> the LED subsystem.
> 
> Heiner Kallweit (4):
>   leds: trigger: Store brightness set by led_trigger_event()
>   ALSA: control-led: Integrate mute led trigger
>   Input: leds: Prepare for removal of config option LEDS_AUDIO_TRIGGER

Dmitry, you happy too?

>   leds: trigger: audio: Remove this trigger
> 
>  arch/mips/configs/ci20_defconfig     |  1 -
>  drivers/input/input-leds.c           |  8 +---
>  drivers/leds/led-triggers.c          |  6 ++-
>  drivers/leds/trigger/Kconfig         |  7 ---
>  drivers/leds/trigger/Makefile        |  1 -
>  drivers/leds/trigger/ledtrig-audio.c | 67 ----------------------------
>  include/linux/leds.h                 | 29 ++++++------
>  sound/core/Kconfig                   |  1 -
>  sound/core/control_led.c             | 20 +++++++--
>  9 files changed, 37 insertions(+), 103 deletions(-)
>  delete mode 100644 drivers/leds/trigger/ledtrig-audio.c
> 
> -- 
> 2.43.1
> 

-- 
Lee Jones [李琼斯]

