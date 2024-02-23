Return-Path: <linux-mips+bounces-1709-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5E8861701
	for <lists+linux-mips@lfdr.de>; Fri, 23 Feb 2024 17:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B03891F27AC2
	for <lists+linux-mips@lfdr.de>; Fri, 23 Feb 2024 16:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3471D84A36;
	Fri, 23 Feb 2024 16:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ttPNwGAq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yY0o5r85";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ttPNwGAq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yY0o5r85"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D92583CD3;
	Fri, 23 Feb 2024 16:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708704359; cv=none; b=V3+AOlDetBMxAtBEIwiBUIuv/tRoS4870pj7FxSN73sk4f6733tJ2FTKk+jmUARpzvned/s85LeX4borD1HEoyA1UcKoMPVCuPYWnuwcBTGz0Z5dXImhMvAMW81ytyIqqiT6ZuatIpeifAG7xcmbYY30PQKuUeAVEnkSMwfvJS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708704359; c=relaxed/simple;
	bh=zH2MvSplEEXgx46LBtOzJeLTlqge/RgcaokSnyMh7sw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q4GJBDzEVWitRkjt76R5lBRpIcNbcjWIkt9+vR8v/6HAjQegfEplZqdXzkpSiVr2yOZ3RaZBFWdOzIBVvcleyXKi0inmvcfKkhug/5nbJlIFc7XpL65Zzd0TQXI9kyg7en78J9P5Os/yDuzCPqjZl+ND91+en1UVbChALdEZP+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ttPNwGAq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yY0o5r85; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ttPNwGAq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yY0o5r85; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 91DAD22061;
	Fri, 23 Feb 2024 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708704355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4kUKyBE8wK/e7CbFCZFUsuzEC5HbRBaNLxtB2b2mDE=;
	b=ttPNwGAq3csd73zQ01YKgwvjMjfZUgWSvBQINzjTaxCh5nX3xKz0vwTv+O9xrZ2p18kMzD
	RuF3cEsYDRxw8xCNt/Ro3/S8gtCIOBZcgpA4JFkwkfSGDw9HRBLzTeMzwxdbjkq62W8t8r
	yxeznWq3K0BkmzmtqTXZ+zm80BkiXSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708704355;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4kUKyBE8wK/e7CbFCZFUsuzEC5HbRBaNLxtB2b2mDE=;
	b=yY0o5r85FetfwOgUtyOdRKohBEXnlgL75bFOSo2Fn957pOy+fgEmAIQ+r3lkTKEYkbpfnP
	QuNHawi5KDvi9lDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708704355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4kUKyBE8wK/e7CbFCZFUsuzEC5HbRBaNLxtB2b2mDE=;
	b=ttPNwGAq3csd73zQ01YKgwvjMjfZUgWSvBQINzjTaxCh5nX3xKz0vwTv+O9xrZ2p18kMzD
	RuF3cEsYDRxw8xCNt/Ro3/S8gtCIOBZcgpA4JFkwkfSGDw9HRBLzTeMzwxdbjkq62W8t8r
	yxeznWq3K0BkmzmtqTXZ+zm80BkiXSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708704355;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4kUKyBE8wK/e7CbFCZFUsuzEC5HbRBaNLxtB2b2mDE=;
	b=yY0o5r85FetfwOgUtyOdRKohBEXnlgL75bFOSo2Fn957pOy+fgEmAIQ+r3lkTKEYkbpfnP
	QuNHawi5KDvi9lDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35519132C7;
	Fri, 23 Feb 2024 16:05:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R5uLC2PC2GUiLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 16:05:55 +0000
Date: Fri, 23 Feb 2024 17:05:54 +0100
Message-ID: <878r3b2mjh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lee Jones <lee@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
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
In-Reply-To: <20240223160415.GG1666215@google.com>
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
	<20240223154559.GF1666215@google.com>
	<87cysn2ndu.wl-tiwai@suse.de>
	<20240223160415.GG1666215@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-0.60 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BAYES_HAM(-3.00)[100.00%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.de,gmail.com,ucw.cz,perex.cz,suse.com,alpha.franken.de,vger.kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.60

On Fri, 23 Feb 2024 17:04:15 +0100,
Lee Jones wrote:
> 
> On Fri, 23 Feb 2024, Takashi Iwai wrote:
> 
> > On Fri, 23 Feb 2024 16:45:59 +0100,
> > Lee Jones wrote:
> > > 
> > > On Tue, 13 Feb 2024, Heiner Kallweit wrote:
> > > 
> > > > If a simple trigger is assigned to a LED, then the LED may be off until
> > > > the next led_trigger_event() call. This may be an issue for simple
> > > > triggers with rare led_trigger_event() calls, e.g. power supply
> > > > charging indicators (drivers/power/supply/power_supply_leds.c).
> > > > Therefore persist the brightness value of the last led_trigger_event()
> > > > call and use this value if the trigger is assigned to a LED.
> > > > This change allows to use simple triggers in more cases.
> > > > As a first use case simplify handling of the mute audio trigger.
> > > > 
> > > > This series touches few subsystems. I'd propose to handle it via
> > > > the LED subsystem.
> > > > 
> > > > Heiner Kallweit (4):
> > > >   leds: trigger: Store brightness set by led_trigger_event()
> > > >   ALSA: control-led: Integrate mute led trigger
> > > >   Input: leds: Prepare for removal of config option LEDS_AUDIO_TRIGGER
> > > >   leds: trigger: audio: Remove this trigger
> > > > 
> > > >  arch/mips/configs/ci20_defconfig     |  1 -
> > > >  drivers/input/input-leds.c           |  8 +---
> > > >  drivers/leds/led-triggers.c          |  6 ++-
> > > >  drivers/leds/trigger/Kconfig         |  7 ---
> > > >  drivers/leds/trigger/Makefile        |  1 -
> > > >  drivers/leds/trigger/ledtrig-audio.c | 67 ----------------------------
> > > >  include/linux/leds.h                 | 29 ++++++------
> > > >  sound/core/Kconfig                   |  1 -
> > > >  sound/core/control_led.c             | 20 +++++++--
> > > >  9 files changed, 37 insertions(+), 103 deletions(-)
> > > >  delete mode 100644 drivers/leds/trigger/ledtrig-audio.c
> > > 
> > > Are the sound maintainers on-board with this?
> > 
> > See
> >   https://lore.kernel.org/r/87zfw1ewrd.wl-tiwai@suse.de
> 
> Were you happy with Heiner's response?

Yes.


Takashi

