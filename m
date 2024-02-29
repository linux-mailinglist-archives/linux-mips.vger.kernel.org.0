Return-Path: <linux-mips+bounces-1942-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE186D08F
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 18:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDD501F24423
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 17:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BBF6CBF0;
	Thu, 29 Feb 2024 17:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFlmFR5V"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE844AECD;
	Thu, 29 Feb 2024 17:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709227619; cv=none; b=X9JO3aFMiL2wN5hlOtbTPLpL2YrcHC14FHsL5PE67a46ymXsYeYeOTyYNOHi3DqjWgEZoJ2sTe48MUVPl+DQ1RPvx+UxRQ1cE/U2O/1xyklvfmlSWAMMHdKbFGLBvITo5kNSYbQ8uFWKZTg0CXQRNffuXp3ViDkvgLAD88yRcgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709227619; c=relaxed/simple;
	bh=/+vxeGoa9JMmFeA7U/NM1GhP4jJ2AQtTVmh5PXJiVqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qvyk1ym2veOiBwpzl3OC/8FkMEdloUiTb8LvadJ6aQA43Wf3cCP4ldABstDqzxD8livl9Q8xvKs/alC3j6gxYkXGRL2Zw61YaVmsxW8HjKq4Or8j8eGC/IcvmTEyqTpkSOKd6fCQFWxpRDf5TFCMPY9RTd+dQO1SZHVlPI3rEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFlmFR5V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDC9C433C7;
	Thu, 29 Feb 2024 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709227618;
	bh=/+vxeGoa9JMmFeA7U/NM1GhP4jJ2AQtTVmh5PXJiVqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFlmFR5Vtjnu0AEZnfm0sc9VeVNGqeqknxsqd9UsGfod5t11c0gunlUylOXrI4HT0
	 ouhWQztuyEBNMb5SolghaMHCKAdf0eQEw1CLFpxaRCb82xV9Z1T0NyAGjz0vO5n0iG
	 TwKGbnRn0z3kb55lQ68XQN4ejnHSEMUWsR5wh+oJeBWEdiTX3LHt9ZlcRgO8s7yGUF
	 3yOyiveO7SW2CJYqqs32wPWfmg8q/hhgc9c4tdLFX657+BYFF4IraSelnXcBXt6bRI
	 PFZKmIkv3xA1Igsy4ajYV4aaEZ59TToY4+UwvyroGH3858RByLknscA/wG3b2H93D4
	 XcoTOY0UaT5eA==
Date: Thu, 29 Feb 2024 17:26:53 +0000
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
Message-ID: <20240229172653.GB1209090@google.com>
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
>   leds: trigger: audio: Remove this trigger
> 
>  arch/mips/configs/ci20_defconfig     |  1 -

>  drivers/input/input-leds.c           |  8 +---

This does not apply.

Please rebase onto v6.8-rc1.

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

