Return-Path: <linux-mips+bounces-2067-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE1C871BD8
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 11:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC3CE2843AE
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 10:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304D2604C1;
	Tue,  5 Mar 2024 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="13PwMeqf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JDUOiM/3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="13PwMeqf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JDUOiM/3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EBB60262;
	Tue,  5 Mar 2024 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709634370; cv=none; b=AM4g+IRqOovE/7/2jgTQdmdvq7BLgSWMYZP3Kx5mRbjEucUEDbwgLdKWdJ+uw4IT0aKKZidtlgKxfxIwzv5MAsJzJbSNm81QK7eiVn0fjVvCXIlLcZmI2auBanrcN1YpYGY22+l4AV8WbOoDVjU4bRz2YBiJA8ltsZDTqQIkV/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709634370; c=relaxed/simple;
	bh=QkYsbuOW0bNH1ycaDN7kYa55HDHIjyGscIc5+5+hLJ4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rWdGP8BJhRmLGNJzIW3qweZpdo4vh6kHRODJ9eFb9EWfTFPRCX4JNMnMw+BUKOAbh4NH3Rqb3G8HlC2YdUj67cM9O2L1jDuZ5CzblySgNr9kfxVjnv/o0S4/2YvvS1IH4zEnNBVfeOQLR0uAiKnMcoNT2mBUnVazS+ApnZjA448=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=13PwMeqf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JDUOiM/3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=13PwMeqf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JDUOiM/3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C41476BF3;
	Tue,  5 Mar 2024 10:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709634366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AOMeiuLUzH4qzjkfCfDWcPFHWC7F8NSJUZ6JcPM5vBk=;
	b=13PwMeqfVFAJmcVzr/tBk7EDh1rw93JFGzalqpSLxCjOBMawgocLjrnhTvLFCM5IHmKARW
	xNxviwV4DkXunBmZXxggdm/krjE/f4hwCj/gbAizTHql85gvfUilJFq08FQwy9dbAhVmks
	5JrBMfruswmRFU1+r3MVx0piPmXrgCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709634366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AOMeiuLUzH4qzjkfCfDWcPFHWC7F8NSJUZ6JcPM5vBk=;
	b=JDUOiM/3bkBjBbngIuJdVO3ntINbp8bUK6VkTQbW2RmqLdUK+iYnQDc0bnNlc7IlRdGFVQ
	jRWwy3o12PWfiRDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709634366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AOMeiuLUzH4qzjkfCfDWcPFHWC7F8NSJUZ6JcPM5vBk=;
	b=13PwMeqfVFAJmcVzr/tBk7EDh1rw93JFGzalqpSLxCjOBMawgocLjrnhTvLFCM5IHmKARW
	xNxviwV4DkXunBmZXxggdm/krjE/f4hwCj/gbAizTHql85gvfUilJFq08FQwy9dbAhVmks
	5JrBMfruswmRFU1+r3MVx0piPmXrgCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709634366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AOMeiuLUzH4qzjkfCfDWcPFHWC7F8NSJUZ6JcPM5vBk=;
	b=JDUOiM/3bkBjBbngIuJdVO3ntINbp8bUK6VkTQbW2RmqLdUK+iYnQDc0bnNlc7IlRdGFVQ
	jRWwy3o12PWfiRDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D4C4139D0;
	Tue,  5 Mar 2024 10:26:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id olpgDj7z5mXPGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 05 Mar 2024 10:26:06 +0000
Date: Tue, 05 Mar 2024 11:26:05 +0100
Message-ID: <875xy1ynya.wl-tiwai@suse.de>
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
In-Reply-To: <20240305095539.GE5206@google.com>
References: <30d49088-283c-40f3-b97b-fd5f5174a467@gmail.com>
	<20240229172653.GB1209090@google.com>
	<208e8bcc-1f35-4095-9a70-7243fdabaf87@gmail.com>
	<20240305095539.GE5206@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-3.00)[100.00%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.997];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,ucw.cz,perex.cz,suse.com,alpha.franken.de,vger.kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO

On Tue, 05 Mar 2024 10:55:39 +0100,
Lee Jones wrote:
> 
> On Sat, 02 Mar 2024, Heiner Kallweit wrote:
> 
> > On 29.02.2024 18:26, Lee Jones wrote:
> > > On Tue, 13 Feb 2024, Heiner Kallweit wrote:
> > > 
> > >> If a simple trigger is assigned to a LED, then the LED may be off until
> > >> the next led_trigger_event() call. This may be an issue for simple
> > >> triggers with rare led_trigger_event() calls, e.g. power supply
> > >> charging indicators (drivers/power/supply/power_supply_leds.c).
> > >> Therefore persist the brightness value of the last led_trigger_event()
> > >> call and use this value if the trigger is assigned to a LED.
> > >> This change allows to use simple triggers in more cases.
> > >> As a first use case simplify handling of the mute audio trigger.
> > >>
> > >> This series touches few subsystems. I'd propose to handle it via
> > >> the LED subsystem.
> > >>
> > >> Heiner Kallweit (4):
> > >>   leds: trigger: Store brightness set by led_trigger_event()
> > >>   ALSA: control-led: Integrate mute led trigger
> > >>   Input: leds: Prepare for removal of config option LEDS_AUDIO_TRIGGER
> > >>   leds: trigger: audio: Remove this trigger
> > >>
> > >>  arch/mips/configs/ci20_defconfig     |  1 -
> > > 
> > >>  drivers/input/input-leds.c           |  8 +---
> > > 
> > > This does not apply.
> > > 
> > > Please rebase onto v6.8-rc1.
> > > 
> > Since v6.8-rc1 the following has been added, which is touched by
> > my series:
> > 698b43780ba2 ("Input: leds - set default-trigger for mute")
> > 
> > Rebasing onto v6.8-rc1 would mean:
> > - remove the change to input-leds from the series
> > - resubmit this change via input subsystem
> > 
> > This would affect bisectability, because for the time being
> > input-leds would reference a config symbol that doesn't exist
> > any longer.
> > 
> > We'd be fine only if the change to input-leds is applied first.
> > I think that's the best way to go, if you can't accept a series
> > based on linux-next.
> 
> Then it's going to have to wait until v6.10.

Or merging via input tree?
The changes are relatively small and easy, after all.


thanks,

Takashi

