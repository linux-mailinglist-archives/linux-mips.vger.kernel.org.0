Return-Path: <linux-mips+bounces-2708-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BDF8A1B12
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 19:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 025DA1F280DF
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 17:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1B1205E13;
	Thu, 11 Apr 2024 15:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbZ8w1WN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4070205E11;
	Thu, 11 Apr 2024 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712850258; cv=none; b=QIkOX68C4DAFoHovVL86I0mXGYN8eDJG3zp0b9ihBQG3IzScZFVRKbjhBaia+w+21mOVcaWy7cquRGjjvCGWAeymo2i2HkWTnGVGXKVs8xMsMwf4eLAtjDDCah/155zhSUFyG4CNGL4tfMuyqsbzZuBFsohJ1MK+OTWzcs91Tsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712850258; c=relaxed/simple;
	bh=e1dvSCg1omiFQogVZpulW6Xvv0upb7nj/qFDuBgjDAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWrRl3B2rRNU1Y7LVc5zrR8/8gJwluEXarCLKljvtjcdDdd0f4xUSoeKOg0M5CNMYd9M4zhbQUndu5QeeJV+I9qpdF23WxEICOk3c+oMePYYLvejmjUzo7gEYeNuFOeOLl7TdZpkGFqv8n/GEfdotQPHMgkxzsexWOcjFufssio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbZ8w1WN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC88C072AA;
	Thu, 11 Apr 2024 15:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712850257;
	bh=e1dvSCg1omiFQogVZpulW6Xvv0upb7nj/qFDuBgjDAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kbZ8w1WNmdaJATT3ZsRE6gEYKmsANWdKfvQFyHYcLQbngKRMqNHZyGVn44Ritnne5
	 RrrIdNFBqXjPCvN8l4I19ujQkKrwbzfnWAaTjtPueu5BF0VmSM+5gtHV1ScRFUFpLE
	 7UI+8sD6a9xT5L+Cttqa9TEFUFSjxh7/9+JpZ95pEAdedHiyIahKHj1GieC9vX+Rp0
	 zc9Z1N9wilo5RsgYoUr8tZdcqbY7QbE+H26rXHrhfUT+bWD6oJ+T7HFvCFzCNV4UzF
	 ug/lnkVqJaJsyv1SOeGFqGrtGWSfE83PEk8GhMcf+B80O3/bLxMJ5eU8AegsUUeaCT
	 PcWZxVVtdqUxQ==
Date: Thu, 11 Apr 2024 16:44:13 +0100
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Pavel Machek <pavel@ucw.cz>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	linux-sound@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD, MIPS and Sound due for the
 v6.10 merge window
Message-ID: <20240411154413.GG2399047@google.com>
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>

Enjoy!

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git ib-leds-mips-sound-v6.10

for you to fetch changes up to ab2ab9e69ef9734b875ce6d43fe3f9f90135daae:

  leds: trigger: audio: Remove this trigger (2024-03-28 10:40:24 +0000)

----------------------------------------------------------------
Immutable branch between MFD, MIPS and Sound due for the v6.10 merge window

----------------------------------------------------------------
Heiner Kallweit (3):
      leds: trigger: Store brightness set by led_trigger_event()
      ALSA: control-led: Integrate mute led trigger
      leds: trigger: audio: Remove this trigger

 arch/mips/configs/ci20_defconfig     |  1 -
 drivers/leds/led-triggers.c          |  6 ++--
 drivers/leds/trigger/Kconfig         |  7 ----
 drivers/leds/trigger/Makefile        |  1 -
 drivers/leds/trigger/ledtrig-audio.c | 67 ------------------------------------
 include/linux/leds.h                 | 29 ++++++++--------
 sound/core/Kconfig                   |  1 -
 sound/core/control_led.c             | 20 +++++++++--
 8 files changed, 36 insertions(+), 96 deletions(-)
 delete mode 100644 drivers/leds/trigger/ledtrig-audio.c

-- 
Lee Jones [李琼斯]

