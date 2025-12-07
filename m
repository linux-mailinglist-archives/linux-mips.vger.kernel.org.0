Return-Path: <linux-mips+bounces-12408-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F27DBCAB40F
	for <lists+linux-mips@lfdr.de>; Sun, 07 Dec 2025 13:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A1C830542C1
	for <lists+linux-mips@lfdr.de>; Sun,  7 Dec 2025 12:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4DC28C5AA;
	Sun,  7 Dec 2025 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ptJ+j6YP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VkgzOLXv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0YuJJ3XF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yM/pJrbc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D63B8D52
	for <linux-mips@vger.kernel.org>; Sun,  7 Dec 2025 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765109882; cv=none; b=uTUkpKj0LVtGJGV902foBkNeWfWiuxglEGVPLxTJTn9MfTdFj2xVxxa4J80O0/3rJdopix7BM2snAOk3VlVizAoQUrO4qWLnI+l5Ukt5jj61pRdCqQTbEfdhkIjIcBFtYzXjqw8Vm9GpF82DIqmI32Q7cIVbzomtGS74m9Lcfi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765109882; c=relaxed/simple;
	bh=eHHuk8EuA0OkibycrFyOsApgYPoSZn1CWZpS/ijvq0Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVtRpTbmKm+NKbO3CaZlWA3wGmTvaDvcDXWjFPdTQHwC3qtOVzoqPdMcbGLzXLk4ECRuSwvd3tG2csfxBfB/eoOGPMVUr4x1mdDE78BlgyWwN8EeKe67HiA7MVoOu3X3WeMw82QTzUBsY1dSQ9UwRt7N/GZ+5Bi3CUJxlBdZNpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ptJ+j6YP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VkgzOLXv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0YuJJ3XF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yM/pJrbc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 16A455BCFD;
	Sun,  7 Dec 2025 12:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765109879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=ptJ+j6YPX4g+bVfgoE8ZGTjROuh8vTpSPNCv/qp0Q1ZljH1k6a8NBRAl9PuRb/OAq+XIDy
	Ms3IQNYL1UGQXarbvyUzIeXgSBkeivNsvAZU9knIC1uAehc4VZSgwD6WyKttisOejkucd4
	wsZ8RlWhvRqiXF3CkmGsZ4ILGDkvVZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765109879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=VkgzOLXvVzmsNyshw1DtVQoAoqZnxBQbXa/ajCsN5DdEWhfMRf3OddfIE276hMSQ5nWGvz
	qgzw3pUkeCxWoFDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0YuJJ3XF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="yM/pJrbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765109878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=0YuJJ3XFWR17M6QyJQov2+FyIAhSdoGYPfrmbxb1xuXppPswhnxE1s6EE+4EqIbTRZu8Bp
	8EX1Rjq6OSEDARqS9qICqkYEYcKjU0uA/07KnY5JMh6XQQnbIagxjjj5mgDtxZuknqyCQ7
	S6z6B7TTfVPYuJuL+MrjDPCS+IZkj04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765109878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBd0eFWa3WTOx819+QWxAtcmpEF3LgSjzGKmJhb1WOc=;
	b=yM/pJrbcO/dEmDdgL7ZVTAFBtzM7UxjjJqeIgGuIINwlyBUV6fSD7Tb1eGcAL+4S1SR8dQ
	ln3+ze8SfTkZ/GCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67A4E3EA63;
	Sun,  7 Dec 2025 12:17:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gID+FnVwNWl9JAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 07 Dec 2025 12:17:57 +0000
Date: Sun, 07 Dec 2025 13:17:57 +0100
Message-ID: <87pl8qv62y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: david@ixit.cz,
	David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: Do not build obsolete API
In-Reply-To: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
References: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 16A455BCFD
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[armlinux.org.uk,mleia.com,timesys.com,iki.fi,gmail.com,atomide.com,nvidia.com,alpha.franken.de,linux.ibm.com,ellerman.id.au,kernel.org,users.sourceforge.jp,libc.org,physik.fu-berlin.de,perex.cz,suse.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[david.ixit.cz];
	R_RATELIMIT(0.00)[to_ip_from(RLin1spj7ezzoz4e1zj94tyerm)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Wed, 03 Dec 2025 23:34:10 +0100,
David Heidelberg via B4 Relay wrote:
> 
> From: David Heidelberg <david@ixit.cz>
> 
> ALSA 0.9.0-rc3 is from 2002, 23 years old.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Maybe I could drop also the code and Kconfig option?

Thanks, applied now.

I believe it's safer to have this default only off for 6.19, then
disable for 6.20, eventually drop the dead code later.


Takashi

