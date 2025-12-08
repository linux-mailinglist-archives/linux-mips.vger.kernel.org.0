Return-Path: <linux-mips+bounces-12416-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BD0CAC970
	for <lists+linux-mips@lfdr.de>; Mon, 08 Dec 2025 10:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32C4630034B0
	for <lists+linux-mips@lfdr.de>; Mon,  8 Dec 2025 09:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FAC31A7F9;
	Mon,  8 Dec 2025 09:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1q4XB/Nl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ytvdW7jN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1q4XB/Nl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ytvdW7jN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389D62E62A6
	for <linux-mips@vger.kernel.org>; Mon,  8 Dec 2025 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765184805; cv=none; b=Zcg22vWpNXZm9zH1yJqKfxoM1lzqJDodwbfm3p/YGZjAyyKH8TYvuch/0NU6RMiStQe/ztGPv4sjiUk0f6us6YbgpnKkf9Fj+MUP0vRNoSwtlqcg7kyuAIIWDCzVQM4svna2/FIepi4ViVqx5/iwR/tpGxkb6lt3nACDCSt4Qjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765184805; c=relaxed/simple;
	bh=ZIUzxtTaN2TX/JIFNRVeZHvJYCfQtJHXlU/faPf1QGo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FxVsvQPi0ga1HPrz9oIbc4oIDxv2gfed4tjwHIdfO5U+yKO90zRCjE1ZSxDkqZIgNHBQfezwvZv4Gka4A7AcPFPv2PYNnrSQ1esvZspyRQQW9vZM1k9Rd0hFNBT/5cfuaAEPc+PJF6ACWbYkD7L+8CZ86NIqME32hCq6a4z7WX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1q4XB/Nl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ytvdW7jN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1q4XB/Nl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ytvdW7jN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 940565BE9F;
	Mon,  8 Dec 2025 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765184801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=1q4XB/NlqyshiONdOX9hfb1mOHt6kWVTz4jdVlvVyJ2oABv8to3wYe9bYGSIGYIRL9TeiZ
	9YiEhvwgZB940ExRk/hTDCsV2vDWTrjCOk08DFRWhn6pUwwjOxqwUsWMAf3/4+Pw115ABI
	/EWTyIlfYpBV/fIgSykysE0SuSEJ4JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765184801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=ytvdW7jNBDJe2kkQ+8Lmguq/A4kIvPR8KWYSF1lhd+l2d6gVRPeU7QAZ5KY8OfSidrlidt
	xBx/U5MRxM0t+ABQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765184801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=1q4XB/NlqyshiONdOX9hfb1mOHt6kWVTz4jdVlvVyJ2oABv8to3wYe9bYGSIGYIRL9TeiZ
	9YiEhvwgZB940ExRk/hTDCsV2vDWTrjCOk08DFRWhn6pUwwjOxqwUsWMAf3/4+Pw115ABI
	/EWTyIlfYpBV/fIgSykysE0SuSEJ4JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765184801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=ytvdW7jNBDJe2kkQ+8Lmguq/A4kIvPR8KWYSF1lhd+l2d6gVRPeU7QAZ5KY8OfSidrlidt
	xBx/U5MRxM0t+ABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03DCB3EA63;
	Mon,  8 Dec 2025 09:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DDBVOCCVNmmuBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 08 Dec 2025 09:06:40 +0000
Date: Mon, 08 Dec 2025 10:06:40 +0100
Message-ID: <87fr9luyu7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Arnd Bergmann
 <arnd@arndb.de>,
	andrew.jones@linux.dev,
	linux-omap@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-mips@vger.kernel.org,
	asahi@lists.linux.dev,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	chrome-platform@lists.linux.dev,
	Paul Cercueil <paul@crapouillou.net>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-gpio@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	linux-sh@vger.kernel.org,
	x86@kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: Kconfig dangling references (BZ 216748)
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,arndb.de,linux.dev,lists.ozlabs.org,linux.intel.com,lists.linux.dev,lists.freedesktop.org,sys-base.io,crapouillou.net,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,pengutronix.de];
	R_RATELIMIT(0.00)[to_ip_from(RLdkcz77k7ty1a1n58a6bzpetp)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Mon, 08 Dec 2025 03:04:09 +0100,
Randy Dunlap wrote:
> 
> SND_SOC_AC97_BUS_NEW ---
> sound/soc/pxa/Kconfig:21:	select SND_SOC_AC97_BUS_NEW

This must be a bogus entry added in commit 1c8bc7b3de5e ("ASoC: pxa:
switch to new ac97 bus support"), which can be dropped.

> SND_SOC_CS35L56_CAL_SYSFS_COMMON ---
> sound/soc/codecs/Kconfig:920:	select SND_SOC_CS35L56_CAL_SYSFS_COMMON

The buggy commit was 32172cf3cb54 ("ASoC: cs35l56: Allow restoring
factory calibration through ALSA control").
This looks like a fallout at changing from sysfs to debugfs, so this
should be SND_SOC_CS35L56_CAL_DEBUGFS_COMMON instead.


thanks,

Takashi

