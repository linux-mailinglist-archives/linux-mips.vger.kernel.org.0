Return-Path: <linux-mips+bounces-13561-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMkGGD1qsWnsugIAu9opvQ
	(envelope-from <linux-mips+bounces-13561-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 14:12:29 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C59264351
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 14:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C299E3013B79
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 13:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77DC2FFDE1;
	Wed, 11 Mar 2026 13:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ii2aVCaU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SPbAAUrM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ii2aVCaU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SPbAAUrM"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872BD2FD7BC
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 13:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234745; cv=none; b=Nd8m2AQgZw5p6hMzYbGT/AR+uXyfvzcjUNN9upTtEoc5tb4nkmMraUIWIH50YMGQtU3FsrHhflbEj9dd2uNrC+ByLGeRcYtwipHH+G2rE0Y9WlW0yhBKWepcA18EFqbxYjhIlKlM25iioLsnVuLbG38XOPCHaeuZ+choT9hN6QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234745; c=relaxed/simple;
	bh=klNijv9VeZCuILMMNUP4dkrWpUjGN6TZWVyYSOEH0mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+C5+fw757izTg8+r0LjaJ4Sij5wnwtrG8PEMALFbRUNfOLlbFYEG1qPzylML92d0Mumt6xcVL9/PsmJ40mpeJZGvQ2TVvyUM1ychGAFUX5qttyvzSTYsDHD5H9Xv0NlwuALf3fpCBbWEW1JaVV2s5+cA+ixArfc66xnRN0V+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ii2aVCaU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SPbAAUrM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ii2aVCaU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SPbAAUrM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DEA4B4D357;
	Wed, 11 Mar 2026 13:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773234742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eEsFilC8x48DoYuD12G2GruYm9kvDHinwy2SB11tyPg=;
	b=Ii2aVCaUmi3FKr3X1uFYBKWtVqH/u2MhksnWvTYo4mfnsy0s5DZKKn79tE3EgeHO35iUSN
	M+QM43lnmKuedhpKTXcEHA0kmxvBKHYe3jPwJBbt/hzICdNUHKwKAuvEddCCuRWKmWEcOe
	K6X7vOV2W4G6Uq9bC8yiAFjkNs0G6zg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773234742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eEsFilC8x48DoYuD12G2GruYm9kvDHinwy2SB11tyPg=;
	b=SPbAAUrMfx1e5rCaZ+MNJgpVHh8CYQrgYxS3wFutxGvDXUlc2Bkpyj5DruoO24Fn/PVxLd
	tDTDfoBtsf0rr+Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ii2aVCaU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SPbAAUrM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773234742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eEsFilC8x48DoYuD12G2GruYm9kvDHinwy2SB11tyPg=;
	b=Ii2aVCaUmi3FKr3X1uFYBKWtVqH/u2MhksnWvTYo4mfnsy0s5DZKKn79tE3EgeHO35iUSN
	M+QM43lnmKuedhpKTXcEHA0kmxvBKHYe3jPwJBbt/hzICdNUHKwKAuvEddCCuRWKmWEcOe
	K6X7vOV2W4G6Uq9bC8yiAFjkNs0G6zg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773234742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eEsFilC8x48DoYuD12G2GruYm9kvDHinwy2SB11tyPg=;
	b=SPbAAUrMfx1e5rCaZ+MNJgpVHh8CYQrgYxS3wFutxGvDXUlc2Bkpyj5DruoO24Fn/PVxLd
	tDTDfoBtsf0rr+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF8853FA27;
	Wed, 11 Mar 2026 13:12:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tHyiMjZqsWljRgAAD6G6ig
	(envelope-from <jwiesner@suse.de>); Wed, 11 Mar 2026 13:12:22 +0000
Received: by incl.suse.cz (Postfix, from userid 1000)
	id 3A023FE189; Wed, 11 Mar 2026 14:12:22 +0100 (CET)
Date: Wed, 11 Mar 2026 14:12:22 +0100
From: Jiri Wiesner <jwiesner@suse.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	John Stultz <jstultz@google.com>, Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Daniel J Blueman <daniel@quora.org>,
	Scott Hamilton <scott.hamilton@eviden.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
Message-ID: <abFqNsVLKmhc6aLY@incl>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.926490888@kernel.org>
 <aZ87wpdHJ5vajYoL@incl>
 <87y0k21vro.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0k21vro.ffs@tglx>
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Queue-Id: C8C59264351
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13561-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,quora.org,eviden.com,gmx.de,alpha.franken.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jwiesner@suse.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 11:05:31AM +0100, Thomas Gleixner wrote:
> On Wed, Feb 25 2026 at 19:13, Jiri Wiesner wrote:
> > On Sat, Jan 24, 2026 at 12:18:01AM +0100, Thomas Gleixner wrote:
> >> To address this and bring back sanity to the watchdog, rewrite the code
> >> completely with a different approach:
> >> 
> >>   1) Restrict the validation against a reference clocksource to the boot
> >>      CPU, which is usually the CPU/Socket closest to the legacy block which
> >>      contains the reference source (HPET/ACPI-PM timer).
> >
> > The UEFI picks the boot CPU so the kernel does not have control over
> > that. On the other hand, I think the CPU that is connected to the
> > southbridge chip (by DMI or PCIe) will be selected in the majority of
> > UEFI implementations.
> 
> Picking a remote node CPU would be insane, but yes BIOSes are insane by
> definition.

Yes, I was mostly just being paranoid. Please include:
Reviewed-by: Jiri Wiesner <jwiesner@suse.de>
in the next version of the patchset.
-- 
Jiri Wiesner
SUSE Labs

