Return-Path: <linux-mips+bounces-8619-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FFFA91FA8
	for <lists+linux-mips@lfdr.de>; Thu, 17 Apr 2025 16:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F61319E5CFC
	for <lists+linux-mips@lfdr.de>; Thu, 17 Apr 2025 14:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D9F253326;
	Thu, 17 Apr 2025 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q5TEdOCv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xdvRs3fs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q5TEdOCv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xdvRs3fs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CDD252919
	for <linux-mips@vger.kernel.org>; Thu, 17 Apr 2025 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900047; cv=none; b=mr0FOMeZ+iISAD9z3KauHND4MLpCBouxSVtOU+EdP6osXj96FWHDZD+ESmdYpyVwAY6AdRYZth9gQL4J9zFd2vgnHguS+IYl7QlNrTAEVrCTzvLcwFsbzoA7D5U+IDLgyuVoenWwTvYRDwN8Y9hQZekEfHYBFsDH39hMSozIU/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900047; c=relaxed/simple;
	bh=/wlRLlvGCRJyQcf8KfFhaL1Dra4/nZn492rCe1AyKNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7iy4fRfToH7UiKyfpef1dVmzgd72Iw/7tUxmWo57TdF4qrZ9Gd8HFfy8cEx+Ybl8qspmH9gV+vBQZT7rAANXLW04pbNZqnwosuvY06W6rMUkFj/sxZSmTxTavwGR5/h/S/fGzncuSsaAx0WIjeYs4zVJwhg0g3diXJosBaOBx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q5TEdOCv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xdvRs3fs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q5TEdOCv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xdvRs3fs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D6BF821169;
	Thu, 17 Apr 2025 14:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744900043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OTOlmfXBkX0z6KmD/qDsm4EQbX4+4WK/B07AutJC1Pg=;
	b=Q5TEdOCvrv31wuwYUSI8WZfsWmyBIRRfe5jW71exn0imyeLWRqBFYrXvq+6SlawXugtrmv
	YGXDIJhdai088tEq3QoOoudK685SZBxN2YQbnn866J2THlzDHP2nS/7Oi40bIjWtYLBIjM
	Gnz9TibTf2ZD0QLkU/h2CHaKYfM4Zn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744900043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OTOlmfXBkX0z6KmD/qDsm4EQbX4+4WK/B07AutJC1Pg=;
	b=xdvRs3fsdGoldkFuNlF4tNwJG0SS2LfIxMJZ43WYkcwCwjawCiI/y2FGsKmxZdFA0om3KW
	TUSURhstwlZzdmBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q5TEdOCv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xdvRs3fs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744900043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OTOlmfXBkX0z6KmD/qDsm4EQbX4+4WK/B07AutJC1Pg=;
	b=Q5TEdOCvrv31wuwYUSI8WZfsWmyBIRRfe5jW71exn0imyeLWRqBFYrXvq+6SlawXugtrmv
	YGXDIJhdai088tEq3QoOoudK685SZBxN2YQbnn866J2THlzDHP2nS/7Oi40bIjWtYLBIjM
	Gnz9TibTf2ZD0QLkU/h2CHaKYfM4Zn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744900043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OTOlmfXBkX0z6KmD/qDsm4EQbX4+4WK/B07AutJC1Pg=;
	b=xdvRs3fsdGoldkFuNlF4tNwJG0SS2LfIxMJZ43WYkcwCwjawCiI/y2FGsKmxZdFA0om3KW
	TUSURhstwlZzdmBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83D1B137CF;
	Thu, 17 Apr 2025 14:27:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Wrc0HcoPAWiOUwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 17 Apr 2025 14:27:22 +0000
Date: Thu, 17 Apr 2025 15:27:16 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: WangYuli <wangyuli@uniontech.com>
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, akpm@linux-foundation.org, 
	jeffxu@chromium.org, lorenzo.stoakes@oracle.com, kees@kernel.org, 
	Liam.Howlett@oracle.com, hca@linux.ibm.com, takumaw1990@gmail.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, tglx@linutronix.de, namcao@linutronix.de, zhanjun@uniontech.com, 
	niecheng1@uniontech.com, guanwentao@uniontech.com, Erpeng Xu <xuerpeng@uniontech.com>
Subject: Re: [PATCH] mseal sysmap: enable mips with LOONGSON64
Message-ID: <dpagj64oai5yn45poxfr36jtliwpbueu3pvhbrb5flxgu7hnql@7rarpfgkf6wz>
References: <7EB087B72C4FBDD3+20250417132410.404043-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7EB087B72C4FBDD3+20250417132410.404043-1-wangyuli@uniontech.com>
X-Rspamd-Queue-Id: D6BF821169
X-Spam-Level: 
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,alpha.franken.de,linux-foundation.org,chromium.org,oracle.com,kernel.org,linux.ibm.com,gmail.com,vger.kernel.org,linutronix.de,uniontech.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Flag: NO

On Thu, Apr 17, 2025 at 09:24:10PM +0800, WangYuli wrote:
> Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on mips with
> CPU_LOONGSON64, covering the vdso.
> 
> NOTE:
>   There is significant diversity among devices within the MIPS
> architecture, which extends to their kernel code implementations.
>   My testing capabilities are limited to Loongson 3A4000/3B4000
> CPUs.
>   Consequently, I have not enabled mseal sysmap support for the
> entirety of mips64, as I lack the necessary devices for testing.
>

I strongly suggest we don't do this kind of stuff. Lets keep things simple and either:

1) Check that there's no problem for _all_ variations of the arch. Then enable
   ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS.
2) If not checking everything, then don't do any sort of enabling.

It should help reduce confusion.

And, to be clear for folks not following mseal, this feature is rather small and not a
priority in any way (and will not be enabled in linux distros for a whole bunch of years,
due to the current situation being unworkable for !chromeOS). There's really no rush
in having this enabled for all architectures.

-- 
Pedro

