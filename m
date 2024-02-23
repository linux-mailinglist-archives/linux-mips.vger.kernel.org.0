Return-Path: <linux-mips+bounces-1706-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D6E86163A
	for <lists+linux-mips@lfdr.de>; Fri, 23 Feb 2024 16:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46AD91C23FD4
	for <lists+linux-mips@lfdr.de>; Fri, 23 Feb 2024 15:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AEB82C88;
	Fri, 23 Feb 2024 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LIvapF4v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="19IzzYiQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cbazDP/v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OJZGHVrC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF83823DF;
	Fri, 23 Feb 2024 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708703265; cv=none; b=lgX4lw/D1pi2BJdk3GIwrTI7ozZbPa7oNSR8pnFZpEkHRAIVv8X4fVcypsgKjITQkRHZrW9GImDKNUHYJvB2V4I5Fp66Fzhd7BGdEiRTfES4n41omYnbigKC+jhSg2cH6R9e1RA2IaVp+CywUKu2I0WDfU9dlN9hCkT2TXWnDgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708703265; c=relaxed/simple;
	bh=pviszrvrxVooRDXZC7JsnpLYVRn17s/W863VwimbX8U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z6syMVWi9oW8fGDwu5b1+zIuBfCNZ9OMvg3j1j7MceWI4+w7rouYNe5gy0KuUycj4Y/1D1yk5fn3ahpbh+vuhAf+OwqyNonbg2OjRCCXdi3fNWo+jFd2GAlk/kHZJHIGGrp/Ks0Hk5Ud0DOJ7IfhWxp8A4JG42RNwNil7xUhqVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LIvapF4v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=19IzzYiQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cbazDP/v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OJZGHVrC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D3B2321F20;
	Fri, 23 Feb 2024 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708703262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b3QlUICJRs2maa/NQNk9hAYFx5fEK151u6biOpKRxTI=;
	b=LIvapF4vWOtt1Z8Fgquuk262wsFkDfHheTsQSh4kbsFzA4VmV+2DIlAa+zbFD+JHRSWWQ0
	w2J4B0HCXN26It1Kimwxw7Re3cU5l1sDxyUE3WVeIRQ2CdxEI73QgklYZHgiBExslTWFf6
	wJHTW8ZrKMgjLDKlQ3aYD9wUzl6uuxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708703262;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b3QlUICJRs2maa/NQNk9hAYFx5fEK151u6biOpKRxTI=;
	b=19IzzYiQcWFTiCIvLtP9au/JRRbdqV45dK9xnp/CnTJeivHZboavz7PCCat5xBpZRedMQv
	5dCxqwtgvVmB7ADg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708703261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b3QlUICJRs2maa/NQNk9hAYFx5fEK151u6biOpKRxTI=;
	b=cbazDP/vK5XqGKKjJGuzH2yJODLigdji9pDuVD0CUesPgj00p28VRCsfDirKlKpgzSdaun
	I/U59Mc7Rl6g2wdWQnQIdB1qzOFmloQC/wc6xFgZ63scVq10YHWTl4HTXIEPpm0julUjHA
	hmPwmEjv32lmiqP3dk5VdvgwHAMsDiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708703261;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b3QlUICJRs2maa/NQNk9hAYFx5fEK151u6biOpKRxTI=;
	b=OJZGHVrC3ligBdkDQG/MUqO2hDL+Xx8BS2E1UZF83r18Kvz6/F8bxwUp9Re0vsxJHfB3Wu
	DeJFD9Lm8vwjJwDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87DF0132C7;
	Fri, 23 Feb 2024 15:47:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sTTMHx2+2GVQJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 15:47:41 +0000
Date: Fri, 23 Feb 2024 16:47:41 +0100
Message-ID: <87cysn2ndu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lee Jones <lee@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	linux-sound@vger.kernel.org,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/4] leds: trigger: Improve handling of led_trigger_event() and simplify mute audio trigger
In-Reply-To: <20240223154559.GF1666215@google.com>
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
	<20240223154559.GF1666215@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="cbazDP/v";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OJZGHVrC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.01 / 50.00];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[35.17%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[gmail.com,ucw.cz,perex.cz,suse.com,alpha.franken.de,vger.kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Score: -1.01
X-Rspamd-Queue-Id: D3B2321F20
X-Spam-Flag: NO

On Fri, 23 Feb 2024 16:45:59 +0100,
Lee Jones wrote:
> 
> On Tue, 13 Feb 2024, Heiner Kallweit wrote:
> 
> > If a simple trigger is assigned to a LED, then the LED may be off until
> > the next led_trigger_event() call. This may be an issue for simple
> > triggers with rare led_trigger_event() calls, e.g. power supply
> > charging indicators (drivers/power/supply/power_supply_leds.c).
> > Therefore persist the brightness value of the last led_trigger_event()
> > call and use this value if the trigger is assigned to a LED.
> > This change allows to use simple triggers in more cases.
> > As a first use case simplify handling of the mute audio trigger.
> > 
> > This series touches few subsystems. I'd propose to handle it via
> > the LED subsystem.
> > 
> > Heiner Kallweit (4):
> >   leds: trigger: Store brightness set by led_trigger_event()
> >   ALSA: control-led: Integrate mute led trigger
> >   Input: leds: Prepare for removal of config option LEDS_AUDIO_TRIGGER
> >   leds: trigger: audio: Remove this trigger
> > 
> >  arch/mips/configs/ci20_defconfig     |  1 -
> >  drivers/input/input-leds.c           |  8 +---
> >  drivers/leds/led-triggers.c          |  6 ++-
> >  drivers/leds/trigger/Kconfig         |  7 ---
> >  drivers/leds/trigger/Makefile        |  1 -
> >  drivers/leds/trigger/ledtrig-audio.c | 67 ----------------------------
> >  include/linux/leds.h                 | 29 ++++++------
> >  sound/core/Kconfig                   |  1 -
> >  sound/core/control_led.c             | 20 +++++++--
> >  9 files changed, 37 insertions(+), 103 deletions(-)
> >  delete mode 100644 drivers/leds/trigger/ledtrig-audio.c
> 
> Are the sound maintainers on-board with this?

See
  https://lore.kernel.org/r/87zfw1ewrd.wl-tiwai@suse.de


thanks,

Takashi

