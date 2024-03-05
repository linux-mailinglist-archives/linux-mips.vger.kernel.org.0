Return-Path: <linux-mips+bounces-2065-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 796E5871910
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 10:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC0841F23F19
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 09:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF20751C5F;
	Tue,  5 Mar 2024 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JzeleGA+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QfUKBmxO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JzeleGA+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QfUKBmxO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5075A535BE;
	Tue,  5 Mar 2024 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709629702; cv=none; b=EOwbByKaK83c2PiRCikuK4a6Pak7ZEyiqM6iSc3k6A55Y8SlVHi5Tdz9bvPgMpEHzQdLexuF+Zj81KPZajhJkYr6N80FA4mlsK4E9gmAh+dYs51Qv6ExQHkqhNBg0f3ekUVVmkn84G1ZuviEsygt+9UAfqvH3ruJdZQO4sRhuvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709629702; c=relaxed/simple;
	bh=dJJ8xB6XXnRbWBIQhylTIEHXutcBPu2XQojDf3ZKT4E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shqVeaxEYFtUem83V/BE87io68An+pq487O9IXBoXErCCm8F0wQYJNSEIi4PKLS1otA1UN1Bj99u1LoO13wH6KhDAcFgy7XUdV2DFiJjd3FZvPhKUjgG6MMYrNvZOzXR4tyfwefhxLYOeUtY5oQCxvxOPGXA6dTaC8fq/lTgpAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JzeleGA+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QfUKBmxO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JzeleGA+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QfUKBmxO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9F9BB76642;
	Tue,  5 Mar 2024 09:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709629699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3grdCOzoZL6gib2IBBQ/ruwCobMgyq9Af3iW3E6AvE0=;
	b=JzeleGA+KWZdtPWaWzBmhH7rWMkAk0CTjEWGpe4fYvmhrVeqkP537ktyaT/me8QGyCuu55
	cTLQHUv8bwxhmDVE/y/tm6BNj4Tr6HmXknoD02rCxRglBtzWI058xx3b2uOMhV1t2t8SiW
	vd9nFe2KuptNF/LaGnDUiLePn1GxmdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709629699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3grdCOzoZL6gib2IBBQ/ruwCobMgyq9Af3iW3E6AvE0=;
	b=QfUKBmxOFcHom0Q2rJb9evsTsM9uiosVNT68nF7dc8vIGSC/lU2z9aEDy4AvAK7ZlpuRm2
	oV6rxKeuiIvq3qAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709629699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3grdCOzoZL6gib2IBBQ/ruwCobMgyq9Af3iW3E6AvE0=;
	b=JzeleGA+KWZdtPWaWzBmhH7rWMkAk0CTjEWGpe4fYvmhrVeqkP537ktyaT/me8QGyCuu55
	cTLQHUv8bwxhmDVE/y/tm6BNj4Tr6HmXknoD02rCxRglBtzWI058xx3b2uOMhV1t2t8SiW
	vd9nFe2KuptNF/LaGnDUiLePn1GxmdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709629699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3grdCOzoZL6gib2IBBQ/ruwCobMgyq9Af3iW3E6AvE0=;
	b=QfUKBmxOFcHom0Q2rJb9evsTsM9uiosVNT68nF7dc8vIGSC/lU2z9aEDy4AvAK7ZlpuRm2
	oV6rxKeuiIvq3qAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5880F13A5B;
	Tue,  5 Mar 2024 09:08:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G3SuEgPh5mUyAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 05 Mar 2024 09:08:19 +0000
Date: Tue, 05 Mar 2024 10:08:18 +0100
Message-ID: <87v861gi65.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	linux-sound@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/3] leds: trigger: Improve handling of led_trigger_event() and simplify mute audio trigger
In-Reply-To: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
References: <3918a80c-b885-40f6-a96e-bcd4c53ff448@gmail.com>
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
X-Spam-Score: -0.33
X-Spamd-Result: default: False [-0.33 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.03)[55.14%]
X-Spam-Flag: NO

On Mon, 04 Mar 2024 21:56:29 +0100,
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
> v2:
> - Split out patch 3 from series and apply it separately via Input tree
> - Improve bisectability and ensure that audio mute trigger can't be
>   built twice between patches 2 and 4.
> 
> Heiner Kallweit (3):
>   leds: trigger: Store brightness set by led_trigger_event()
>   ALSA: control-led: Integrate mute led trigger
>   leds: trigger: audio: Remove this trigger

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

