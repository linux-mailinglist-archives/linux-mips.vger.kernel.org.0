Return-Path: <linux-mips+bounces-1481-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A185632E
	for <lists+linux-mips@lfdr.de>; Thu, 15 Feb 2024 13:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF2D41F2381B
	for <lists+linux-mips@lfdr.de>; Thu, 15 Feb 2024 12:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973B712C54E;
	Thu, 15 Feb 2024 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LklKqVpM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p1DQAUh/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LklKqVpM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p1DQAUh/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D544A12C52A;
	Thu, 15 Feb 2024 12:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708000170; cv=none; b=kemAninjwR7LY1q+4qKGHJ4FHdkz84LtxqcSlEG5epCpYJPF5S1DGp6pj+SHDFGASvtgrUA7HC1zpBFB0UBt6Ma4bIaFiE6pr7C19WoQqfqwJj9spQakum0e5+AvdqooWH63WTtpgNLkdkk+FsFhN8B/b6QgSUHulnYU20o8k1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708000170; c=relaxed/simple;
	bh=pr05/woSUV6TNjaB6fjye3Wd7P0srA1HwHBQB4N5oZE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uv44RJaFqPEz4Mt/YcM3nd02PhMhqMfLsnMz2yE0WSPgi1HVCUHogdAi9PiQ3j+pqlP0YqdlBNRAle7G5Ia48e+h2ItTo/y2Z01hiiK4gcOjTmJb0BeVd4P52uJhQxvDglpRz7ckeY8o9xbgsAOjpMKf1qt3RSJI6PWlndUqJ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LklKqVpM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p1DQAUh/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LklKqVpM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p1DQAUh/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1ADC822031;
	Thu, 15 Feb 2024 12:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708000167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j5ffrxL5/U5QWmiM5A695uqHTsmp7YVlzVLTiNzpy38=;
	b=LklKqVpMGF5+QPgxbPaKYyrShpRaoeo9KaUC2qBtK9+BVDLZX+UWHK8K77m3NkMbxbmkac
	GKWM4f6diUNjnOxqKSwCU3aGeVjy8QDSJLEz+YPx9Xnf366bM7yrDIEEKcjqDbLgCz5yzd
	WwnkzOMJl5wx/BaQrOzb+QrftxITYMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708000167;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j5ffrxL5/U5QWmiM5A695uqHTsmp7YVlzVLTiNzpy38=;
	b=p1DQAUh/ZdJ+Fr0O8/kq/lYmI7BC3YT+MoVamXbu2jdhQlgR5MbpLL+i9o/d4FU4EieQwj
	nyinAQzKNNLASBAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708000167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j5ffrxL5/U5QWmiM5A695uqHTsmp7YVlzVLTiNzpy38=;
	b=LklKqVpMGF5+QPgxbPaKYyrShpRaoeo9KaUC2qBtK9+BVDLZX+UWHK8K77m3NkMbxbmkac
	GKWM4f6diUNjnOxqKSwCU3aGeVjy8QDSJLEz+YPx9Xnf366bM7yrDIEEKcjqDbLgCz5yzd
	WwnkzOMJl5wx/BaQrOzb+QrftxITYMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708000167;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j5ffrxL5/U5QWmiM5A695uqHTsmp7YVlzVLTiNzpy38=;
	b=p1DQAUh/ZdJ+Fr0O8/kq/lYmI7BC3YT+MoVamXbu2jdhQlgR5MbpLL+i9o/d4FU4EieQwj
	nyinAQzKNNLASBAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5D2413A82;
	Thu, 15 Feb 2024 12:29:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +uSdKqYDzmXwRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Feb 2024 12:29:26 +0000
Date: Thu, 15 Feb 2024 13:29:26 +0100
Message-ID: <87zfw1ewrd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	linux-sound@vger.kernel.org,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/4] leds: trigger: Improve handling of led_trigger_event() and simplify mute audio trigger
In-Reply-To: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
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
X-Spamd-Result: default: False [2.38 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BAYES_HAM(-0.02)[52.40%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[ucw.cz,kernel.org,perex.cz,suse.com,gmail.com,alpha.franken.de,vger.kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: **
X-Spam-Score: 2.38
X-Spam-Flag: NO

On Tue, 13 Feb 2024 08:30:30 +0100,
Heiner Kallweit wrote:
> 
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

LGTM.

Reviewed-by: Takashi Iwai <tiwai@suse.de>

One thing I'm not 100% sure is the movement from ledtrig:audio-mute
and ledtrig:audio-micmute alias into snd-ctl-led module.  Who would
use/process those aliases?  I don't think this would be a problem, but
it might change the loading order.


Thanks!

Takashi

