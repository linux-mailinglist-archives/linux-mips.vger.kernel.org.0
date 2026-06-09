Return-Path: <linux-mips+bounces-15007-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ru0/ClelJ2pw0AIAu9opvQ
	(envelope-from <linux-mips+bounces-15007-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 07:32:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02865C739
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 07:32:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=HUojIW4+;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15007-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15007-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BC97306AA20
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2026 05:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EEE3B7779;
	Tue,  9 Jun 2026 05:31:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B79622689C;
	Tue,  9 Jun 2026 05:31:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983111; cv=none; b=ra+Pw10baXpmw96PpXWzK5JpEcN6VEjgEWO6WaH/5ASR9LxiI1Z8L2s6fFemOKY7foOeXSxDxlGs3A+G+ynZP3rPYzG1S7HziSfdLXt5sTH8ljwOEsExOMIiI1dlxALhFM6F9qrGGVFJuY1E0jz042HdxsmryhYKZ9M96vQtycE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983111; c=relaxed/simple;
	bh=N1tSz0WfDaCJhOS0IGgSj9qi0hu8FB5rtygEVzNePOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJ8bEemvhMSCz/I2OQxRFY77ml+daAmus4dZ0TgzOc1APdBpSbxlb5p9Tj2fn6XuXGRxecVSX3AtL4w2dFY9U5CjoPcrOBTFFJdhWq2yk8bPf3dRptXqZCAn4GIW32BI5HdfP4xOS+3l8SoduArmgXWKBGS3yUds9Dzsr+mL1/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HUojIW4+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D771F00893;
	Tue,  9 Jun 2026 05:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780983109;
	bh=4nHhNOei7QNfUzNrgd6b9zKAHktqrjJSs2tQI7XWv90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HUojIW4+spXliS/WJ9e0L7NRKhF43nwz9aw6NUlkgYwKcPTg2maOoeUcdMDkZXrl3
	 EAecWoTuok6//TMhj/wDkVEsx6wjgJGqGaAS09ejhEghuKdQy80zYGvv5CT8tXBo61
	 vR69FojFHwv32I3+mgvzzPXqixHjLsWV4DNdSQQ8=
Date: Tue, 9 Jun 2026 07:30:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/2] serial: earlycon: add uart_clk_freq
 parameter
Message-ID: <2026060957-chaperone-tarot-d548@gregkh>
References: <20260609-acpi_spcr-v2-0-3cd9a3bda727@posteo.de>
 <20260609-acpi_spcr-v2-1-3cd9a3bda727@posteo.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-acpi_spcr-v2-1-3cd9a3bda727@posteo.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:rafael@kernel.org,m:lenb@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:jirislaby@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-serial@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15007-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:from_mime,gregkh:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E02865C739

On Mon, Jun 08, 2026 at 10:40:21PM +0000, Markus Probst wrote:
> Add `uart_clk_freq` parameter to `setup_earlycon`. This allows the
> options string to be reused with `add_preferred_console`, while still
> allowing to set the uart clock frequency. This will be used in the
> following commit ("ACPI: SPCR: Support UART clock frequency field").

Ick, this is bad, now you need to look up what this 0 is as a parameter
every time you see this call.  Please just add a new function that takes
the new paramter, don't abuse the old one for this.

thanks,

greg k-h

