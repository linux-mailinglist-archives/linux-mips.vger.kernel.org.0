Return-Path: <linux-mips+bounces-14200-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tBeWG1oz5GnGSQEAu9opvQ
	(envelope-from <linux-mips+bounces-14200-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 03:43:54 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F3F422DA1
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 03:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C4773017FA9
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 01:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081E71D8E01;
	Sun, 19 Apr 2026 01:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsjS61Cv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CAD13D503;
	Sun, 19 Apr 2026 01:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776563028; cv=none; b=TyLPC2pIgoSgksAC/uD3x6Hgw24DWXIPFFVauIAmcpGeCPZCRD+cxMRHCtCFNbD8x3z2VEhTH+IHAO/ZV8kmARUWYXPdygxV3wZSTN7CfLFwpi3TE9VY2b0GbvgDeWgPTQRibD7Jzx9RC1LT36RyLAdpisX1AzdpZQoBVjtZD0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776563028; c=relaxed/simple;
	bh=pzUmLX5R4DnpEeNbxt28aHEILJI2jC0iSN7V9SF6P4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYyvJlc/g3sEasAJJlu6OlLBCYoOsLTp0mbGbfQp4vcPFKdgSCRZsIgKlybbG/2Yn6Mr3MkHn3UxqD5Q8emmJrt71xNjdbdTG7Ej43Fj46gncMYpHLDe4YkofeZj/pjXqscb0afM8o+tHrO35YsU8rNEsRfL53TfiSQ3RlD/3uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsjS61Cv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1939CC19424;
	Sun, 19 Apr 2026 01:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776563028;
	bh=pzUmLX5R4DnpEeNbxt28aHEILJI2jC0iSN7V9SF6P4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XsjS61Cv53OcqLFWJnY+muwrFTpi0tBiwkGSCwDM7DrmuQlcjT+Ow7K8chbc0C9LA
	 kjvB72YXGlW6kUAutyVfauRnoKrf3wk+1Q80FpLQN/dahWULsL+pn6JgAkrkNMYkXx
	 QRCOi6/zD+9vnoDy0TMBZFKJxJJQLLUTeZAEAREJQR50PBK4KVaNY4aI8I++2Le0Re
	 /KstGdPcrkWTv0fzi9E8TqeAWvybsbUfbA68vRVhtX2HZbMcRc6867oLKyzNlb+fwo
	 2zTUkjF0+lA+RwftIDbUVbAcfJX2DjPhvE6QtbfWx3RdiHSEti2Q/VU2ZrOcgyLQPG
	 RZ1nJboK0U56A==
Date: Sat, 18 Apr 2026 18:43:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] lib/crypto: mips: Drop optimized MD5 code
Message-ID: <20260419014346.GC18115@quark>
References: <20260326204824.62010-1-ebiggers@kernel.org>
 <aeQjj0J1k7siaqOF@darkstar.musicnaut.iki.fi>
 <20260419010835.GB18115@quark>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419010835.GB18115@quark>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14200-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1F3F422DA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 06:08:36PM -0700, Eric Biggers wrote:
> On Sun, Apr 19, 2026 at 03:36:31AM +0300, Aaro Koskinen wrote:
> > Hi,
> > 
> > On Thu, Mar 26, 2026 at 01:48:24PM -0700, Eric Biggers wrote:
> > > MD5 is obsolete.  Continuing to maintain architecture-optimized
> > > implementations of MD5 is unnecessary and risky.  It diverts resources
> > > from the modern algorithms that are actually important.
> > > 
> > > While there was demand for continuing to maintain the PowerPC optimized
> > > MD5 code to accommodate userspace programs that are misusing AF_ALG
> > > (https://lore.kernel.org/linux-crypto/c4191597-341d-4fd7-bc3d-13daf7666c41@csgroup.eu/),
> > > no such demand has been seen for the MIPS Cavium Octeon optimized MD5
> > > code.  Note that this code runs on only one particular line of SoCs.
> > > 
> > > Thus, let's drop it and focus effort on the more modern SHA algorithms,
> > > which already have optimized code for the same SoCs.
> > 
> > I don't mind deleting this (I shut down all my MIPS hardware already
> > in new year 2020 to start a "fresh" decade), but just for the record,
> > this will probably downgrade the performance of TCP_MD5SIG which I recall
> > was the original reason this code got added...
> 
> Sure, for any removal of optimized code it's always possible to
> hypothesize a case where it regresses performance.  The question is
> whether it actually matters and is worth keeping around.  You mentioned
> that you did care about this code, but no longer do.  I think anyone who
> may have cared about this in the past is likely to have had a similar
> experience.
> 
> After all, the only line of SoCs that could run this code switched from
> MIPS to ARM in 2016.  Meanwhile, TCP-MD5 itself is insecure and has been
> superseded by TCP-AO.  (Note that TCP-AO supports HMAC-SHA1 and
> HMAC-SHA256, which are still accelerated on MIPS Cavium Octeon.)
> 
> Yes, there are still people using TCP-MD5 anyway (on some platforms, not
> necessarily this particular one).  But a nudge towards upgrading to
> TCP-AO isn't necessarily a bad thing, either...

I should also emphasize, again, that we don't actually know whether this
code even still worked.  It underwent quite a bit refactoring in the
last year or so to keep it theoretically working as the crypto subsystem
evolved.  Yet it has never been testable in QEMU, and there were never
any reports of anyone re-testing it on the hardware.

If there were someone who had said, "Yes, I need this legacy code, it
passes the MD5 KUnit test, and I'll be re-testing it regularly", that
would have been more encouraging.  But otherwise we may have been just
been keeping broken code around, which is much worse than simply using
the well-tested generic code.

- Eric

