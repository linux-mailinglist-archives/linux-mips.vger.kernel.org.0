Return-Path: <linux-mips+bounces-14500-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MID/LItA/GlMNgAAu9opvQ
	(envelope-from <linux-mips+bounces-14500-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 09:34:35 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D754E418D
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 09:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9DA13005590
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2026 07:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D831B3161AD;
	Thu,  7 May 2026 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sEOC+Yt3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ht4P6rCC"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926AB32D441;
	Thu,  7 May 2026 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139271; cv=none; b=jvX3q1HHpXVWAZIjstxa36EofSH5PTBBKN8l0mNI9u8OwzpJscof/h71hB4Z9Z6fSuDq/eNZtvVINmMEHW9obbMA/puQsayer4EsiHFnFMUXrUKFeoiZd+rlh/jjE8TNLLkWmJk0pLo+MeV5pAXQ8+eLz5ATSL/IZDlWUSDt8T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139271; c=relaxed/simple;
	bh=1BWhZEj5wjEI7Zr/301s1oCCVafsmJSbsyZyk7tgBVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICwJ73KkuQcllhpENonG/TVuUd2d6lgCnyesfhvYxpLlbukAv5uAsO7rp5HeRSQ1clwRnURvnWTgQzJMQgRb4xn92KTGbNjzyJC10nW6qEvYlhdzdtQjv7MqBNIEvF/XsKBd5m+yo1sy0p7xvnDywIKsNwOxJaJrdFMVH6mlk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sEOC+Yt3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ht4P6rCC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 7 May 2026 09:34:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778139269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3TFmwYRSkODm0VVYgNgy2av15i1ufVLpD3DudaLP68=;
	b=sEOC+Yt3SWpyUKymT/rHCeyQseEYPHvMRgZmEYF7nDvQJr24oizHsPz8c+ZoW7tNFDB5++
	76CiZA17dIJBZUSyXwl9YRjy4lmPmzAl2tHQ+p+62BGvijbzxZ1c2wdWbou+ldqLk1Kcis
	o/DnUaLNNbk5XFdsYvldugno6Lxtys+qC+xd2xez5J02iCaaR3AH5oouPwYxRNf+jZAQei
	wOSbvCqS7e3rNEkrpuIHlvHXYDNoIuybl8cFSOodNunYGDGX6wAm8RXKo1ahyAk8VdtOoQ
	Xv7gDZai2y9pS88XDqEu3aiwDyW8lO8bNkCdtarQ1tz/XmsWfFCozKrF603eEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778139269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3TFmwYRSkODm0VVYgNgy2av15i1ufVLpD3DudaLP68=;
	b=ht4P6rCCDd4KXzUXl3WNOk6Js8oA2jdpMMT7z/gSSj0NkVWvit3nZO6R07jMYiKzvKRQS+
	nNC/9qyBm2az7RCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] declance: Remove IRQF_ONESHOT
Message-ID: <20260507073427.atoJ5zsY@linutronix.de>
References: <20260127165430.7ui_LGkg@linutronix.de>
 <alpine.DEB.2.21.2601271739250.40317@angie.orcam.me.uk>
 <alpine.DEB.2.21.2603292037020.60268@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605042332070.46195@angie.orcam.me.uk>
 <20260505072954.Ov2t-FGt@linutronix.de>
 <alpine.DEB.2.21.2605051233210.46195@angie.orcam.me.uk>
 <20260505123203.jifiaxEL@linutronix.de>
 <alpine.DEB.2.21.2605051410280.46195@angie.orcam.me.uk>
 <20260505152450.1KYVS2pr@linutronix.de>
 <alpine.DEB.2.21.2605060040230.46195@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <alpine.DEB.2.21.2605060040230.46195@angie.orcam.me.uk>
X-Rspamd-Queue-Id: 56D754E418D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	TAGGED_FROM(0.00)[bounces-14500-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 2026-05-06 10:25:02 [+0100], Maciej W. Rozycki wrote:
> On Tue, 5 May 2026, Sebastian Andrzej Siewior wrote:
>=20
> > I'm not if sure if you may need to change the primary handler if the
> > interrupt flow is EOI and cascading based on what you wrote. If you have
> > access to the HW then you it should be easy to test given the
> > `threadirqs' argument should expose problems.
>=20
>  The interrupt is exceedingly rare, I've only seen it actually fire maybe=
=20
> a dozen times across all my systems in 25+ years.  It happens when there=
=20
> is a memory read error on DMA, such as an uncorrected ECC or parity error=
=20
> (depending on the system variant), or a bus timeout.

I assumed you have other interrupts on that hw, cascaded/ operating the
same way. But otherwise=E2=80=A6

>  It should be possible to orchestrate it, such as by making the LANCE DMA=
=20
> pointer register refer an unpopulated location in the system address map;=
=20
> memory ECC errors can be induced too by the DRAM controller's diagnostic=
=20
> feature.  It seems enough hassle though I'd rather get things right by th=
e=20
> spec.

Oh, yeah. That should do it.

>  Thanks for the hint as to the `threadirqs' facility though, it may come=
=20
> up helpful sometime.

:)

>   Maciej

Sebastian

