Return-Path: <linux-mips+bounces-2072-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A98871E9A
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 13:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0FC1285492
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 12:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F875A113;
	Tue,  5 Mar 2024 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFO1bMVe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB4F59B44;
	Tue,  5 Mar 2024 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640527; cv=none; b=qxcw1Tqdd7Pl7OtG2tS/Y97EtxOdVxtz7yOivvjOPP/oo6I4/H1qYTFpdoMm/fnx4q2o674MKBpi+QRYyta3OKCJKS6pX5N4Cdo9JRFFtA7jps3yntDl+zP0sBk/leSDd3xQGbi2PzHTnWgKV627IqV390tdLiE8+DYdUtXlOMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640527; c=relaxed/simple;
	bh=ULPNIicbFkdHNoy+aBOiq1HCUxQahvNFhSZ9F1lDn5g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QY62ipXj/V1KhmO8H0rTyqLMhfF9nLSIPd7AZtbAuS9xuv/LLOh0QMYBeR0hwttHghdWG4zk0QDFsCXefr0pWstK7wIcPbskJCQHlBGThDlWdM8N57qHaSP/5l8FDWSc2yRL4Cz5AL2drTyXEmKvLTkzzVN8UP/puW9oHFyBJCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFO1bMVe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907B3C43390;
	Tue,  5 Mar 2024 12:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709640526;
	bh=ULPNIicbFkdHNoy+aBOiq1HCUxQahvNFhSZ9F1lDn5g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uFO1bMVepye5Q6jK1/x6/BlfTBAtwE/u5TzuFZMnmg1LXlfgdFJp7X/cVRuNaaExf
	 XEREAhW7y/syN9WnNAtq38HP+D0cUdx0b8wpElourS6iJ6BC3Zv6NTXZfg3aAPqeFH
	 PzWbJeT+iJbarWGtHZy+IdIUPJIIGaO6Kgm9pA/vFsZtiLtc7W1J6l0KXBIFrG+eO2
	 oou7EEYpfe15Mz7WOT4icXrNkcN/twmHEwg84/L4j0/E5YxmgfR6ZfE72PT96J36ws
	 AVFY3yEN6GtJjoXumBUNWNBRXaXDVt0HWC1bjiG5VSzp1QDiuwFqwDa0dEMCBikxur
	 9+GAQ9/JGln6A==
From: Lee Jones <lee@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-mips@vger.kernel.org
In-Reply-To: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
Subject: Re: [PATCH v2 0/3] leds: trigger: Improve handling of
 led_trigger_event() and simplify mute audio trigger
Message-Id: <170964052434.128456.128263499797916605.b4-ty@kernel.org>
Date: Tue, 05 Mar 2024 12:08:44 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Mon, 04 Mar 2024 21:56:29 +0100, Heiner Kallweit wrote:
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

[1/3] leds: trigger: Store brightness set by led_trigger_event()
      commit: 575129855dee0e364af7df84a77ab5cca54b1442
[2/3] ALSA: control-led: Integrate mute led trigger
      commit: ba8adb1646ee498029ac12b20e792d9d0dd17920
[3/3] leds: trigger: audio: Remove this trigger
      commit: 2c61168294d0ea42a5542dbc864afb03a76bbc11

--
Lee Jones [李琼斯]


