Return-Path: <linux-mips+bounces-2071-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3896871E96
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 13:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA8DA1F25569
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 12:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDD959B70;
	Tue,  5 Mar 2024 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5I1GYoa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDCA59B44;
	Tue,  5 Mar 2024 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640524; cv=none; b=tKghJS+af2auMHhIh9SE/7qt4UCfJnzh/DUWtPvTtLZ4b3HiKubsIJhI4nJCGdnDOOUuOUCs8ZM+RygvtoLO/KMBEeZmfuWe9yKD6hZcaX+3BdG7M7xTf2j17wme16DMu/filJl5efCejLO1rfrgdo2sePBLYt/ORQJgcDxNKIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640524; c=relaxed/simple;
	bh=G0QbItLjj+JulZ/XRXWAziWDn1yIFNbJ42oiTXqzUoc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LF1miywnXUEeGyOLdj3M2Ts6QrVTj5Qb+zZ19dywhaj9tvnjQCE7ODrFhj27inKvq9SVHhIBTkyEM07Sae+lHDVAnjMzmrZ+etDJSV9U9zN8OpyUJX6CLhSrVmKmTaHjApZ91lfHa+vToXrSmhDLykqcPePAWw89CmYL5C3QBeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5I1GYoa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0700C433F1;
	Tue,  5 Mar 2024 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709640524;
	bh=G0QbItLjj+JulZ/XRXWAziWDn1yIFNbJ42oiTXqzUoc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P5I1GYoajb2CYoDEbvH5RJ6Dqs56dW0NCZkEsCCWyRWpQfX7aOwjRKUWua6W9EG6N
	 FckEuSP6MAzzjebtX3EIzaDp+1hvRyk1UJ0J3kaBIINnk6iS0a7m1+I+wa0OTxBZLd
	 5w/ITTA0Je2GDDIqLFs4R6cF4nz4zDkxyJTa/WxmBbSGEDwglCEdn1RZgk0TLtvVOm
	 0WWLrqevoa1qK2NBkLkmIn5gc2c/gSjFkwG7QMKrUC+1Ft667SJ8ko8w+8mFwOMLnM
	 p79N/bU3pZTgTAcxmwx2W/ofQqN9o+pYvnEE8XRImrImLRoppM5xiaYsr8ruGZ+Stm
	 3Jfi15g5P2Kiw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-sound@vger.kernel.org, 
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, 
 linux-mips@vger.kernel.org
In-Reply-To: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
Subject: Re: [PATCH 0/4] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
Message-Id: <170964052149.128456.2500353687868869381.b4-ty@kernel.org>
Date: Tue, 05 Mar 2024 12:08:41 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Tue, 13 Feb 2024 08:30:30 +0100, Heiner Kallweit wrote:
> If a simple trigger is assigned to a LED, then the LED may be off until
> the next led_trigger_event() call. This may be an issue for simple
> triggers with rare led_trigger_event() calls, e.g. power supply
> charging indicators (drivers/power/supply/power_supply_leds.c).
> Therefore persist the brightness value of the last led_trigger_event()
> call and use this value if the trigger is assigned to a LED.
> This change allows to use simple triggers in more cases.
> As a first use case simplify handling of the mute audio trigger.
> 
> [...]

Applied, thanks!

[1/4] leds: trigger: Store brightness set by led_trigger_event()
      commit: 575129855dee0e364af7df84a77ab5cca54b1442
[2/4] ALSA: control-led: Integrate mute led trigger
      commit: ba8adb1646ee498029ac12b20e792d9d0dd17920
[3/4] Input: leds: Prepare for removal of config option LEDS_AUDIO_TRIGGER
      (no commit info)
[4/4] leds: trigger: audio: Remove this trigger
      (no commit info)

--
Lee Jones [李琼斯]


