Return-Path: <linux-mips+bounces-1705-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2C986162C
	for <lists+linux-mips@lfdr.de>; Fri, 23 Feb 2024 16:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B9A21C242BB
	for <lists+linux-mips@lfdr.de>; Fri, 23 Feb 2024 15:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B48382D76;
	Fri, 23 Feb 2024 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxBRfAoy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5DD82D66;
	Fri, 23 Feb 2024 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708703165; cv=none; b=VBdOMBaPcqM7TC2NyfhlO6SbtYV/A/WxT14JyMJtqp/YXQ/vxmd+9El/ZgkyLk4/PU/XV1r8WLtEEYIJdsDjUZEFvX9yOcxTLRGi5/Vw9l5NThHqyDQ9+SOTnq/h+orJkpbsMjhxy9BdqTTA8aBeFs9d2CfCtZPZXx2BV3DtHfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708703165; c=relaxed/simple;
	bh=lbsgBK2Ozez/f96f+DKOLPPFisW/G9PWWa6YYGbHsMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3B7cr+iYj2LfEg6P/wxkHrotx5JJPTveH2qlAie8GIB0dxchQmq8Th+ht0LrTiuWcCMwNgS6VXrTJzTbNe8PLyod7VBakx1v/Q1+c0Usa6nyH1ZMAx9a5p4qXhbdQG1Duo+lHhFhD/Zj8GRUitWpE3l70g123t0qjYQ7MV0/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxBRfAoy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C74C43394;
	Fri, 23 Feb 2024 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708703164;
	bh=lbsgBK2Ozez/f96f+DKOLPPFisW/G9PWWa6YYGbHsMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HxBRfAoyr0HdM1/QBR+TLrT3+FZnlv66BuT2jyUJARdCuvd7fE/hWONLe5TSJKP4v
	 hPnkOYPrVeVW8Itxo8HmUGs61G8Mffuxg7pTT1DQOxe8YwnhNJrCwgJTKIHV4nGYqm
	 tiBx932v/1NHL1kWajIixDVamA1ESznOwsENqz57iY2/kiDWYZ4XOid9z4QFXf08FQ
	 03K8/mUHNh5hGropWQ32NWFJlZ/dM/5bZY+BaMhOrjVpE++6RDHLGEWZtAKnvZ0G5i
	 RVC7Y3xz43ovHw9koIQ5gqlNg67tSe0NJVoiNqWcOxPR5E5Rr0diRiRs3bjigrsnTZ
	 ffLkGmU198h8g==
Date: Fri, 23 Feb 2024 15:45:59 +0000
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
Message-ID: <20240223154559.GF1666215@google.com>
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
>  drivers/leds/led-triggers.c          |  6 ++-
>  drivers/leds/trigger/Kconfig         |  7 ---
>  drivers/leds/trigger/Makefile        |  1 -
>  drivers/leds/trigger/ledtrig-audio.c | 67 ----------------------------
>  include/linux/leds.h                 | 29 ++++++------
>  sound/core/Kconfig                   |  1 -
>  sound/core/control_led.c             | 20 +++++++--
>  9 files changed, 37 insertions(+), 103 deletions(-)
>  delete mode 100644 drivers/leds/trigger/ledtrig-audio.c

Are the sound maintainers on-board with this?

-- 
Lee Jones [李琼斯]

