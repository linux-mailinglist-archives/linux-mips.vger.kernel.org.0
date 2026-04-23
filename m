Return-Path: <linux-mips+bounces-14238-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI9uK4GG6WmMcAIAu9opvQ
	(envelope-from <linux-mips+bounces-14238-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 04:40:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 161CD44C545
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 04:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5F693045007
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 02:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFBD3BADB3;
	Thu, 23 Apr 2026 02:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prvyABly"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477703A7F61;
	Thu, 23 Apr 2026 02:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776911912; cv=none; b=I7lFbKzeqfVPODe8cb2Iqao2gXl1Q0nJ3EZZFzad1hYzPVL+H6g9qBMyGioUyOlAQY6SB29hPuo1G3lumNMsKNM7GHHqyWXdf0WC6MXNkrqD53mjcbmgcg1rlr3e2D4j4+rnj7W+/0W3L65+o8wmBpn/uiNCj4XdNA/bAIjglz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776911912; c=relaxed/simple;
	bh=7HQSrbuMx/rshmSLfm00CK6rla06OEjtmcvJSRGnOjY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mcy2fIQORusAM3W0cTle0RqRVi81M9Y7Gpqq3WK12ha9LP1/FwxHJhEBRs+J90dLumjB4Y254wNOhvDGf/SqZggDAETqGmf5ePLKD/W1UXtT6ZgTc604l4SO/XW3SZ2X3oFN9Jo2HnAQhs5drB4cCnl5vDP0zCRDkvMlp0kpWI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prvyABly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B354C19425;
	Thu, 23 Apr 2026 02:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776911911;
	bh=7HQSrbuMx/rshmSLfm00CK6rla06OEjtmcvJSRGnOjY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=prvyABlyIBh76ipwT0Afooq3T3f6JlD/yCFjPoSCymJl3aylCSjP6Kgv6P+8HJVc9
	 7aGu7xLaYmd8MZUomu6ml+HSk0MZqBBwFhwGr6Ys73P8lChfUFlcP9g0h9xpIOyvmE
	 QOWO+F+sTBZVg7XnJOmb+wh2BQR/8m6Ry8iDoNT9Kcs4faHr9nOlsJIQj2Bai54J7h
	 VL89KdofK8lO10crs15R4zUBxqWmHokA3Fi+4ikMGqNxNLWnsOAULtv7ToMihHLvqR
	 WDzjNYdm3wHQ2ZG5wPZO5wA21ly8uYx6htZdQAgY7Zcon/Z4U60W2hPdf4RZfTXFGV
	 EZatCi46/sjuQ==
Date: Wed, 22 Apr 2026 19:38:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: davem@davemloft.net, openwrt-devel  <openwrt-devel@lists.openwrt.org>,
 Guy Ellis <guy@traverse.com.au>, netdev@vger.kernel.org,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux@armlinux.org.uk, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
 3chas3@gmail.com, razor@blackwall.org, idosch@nvidia.com,
 jani.nikula@intel.com, mchehab+huawei@kernel.org, tytso@mit.edu,
 herbert@gondor.apana.org.au, geert@linux-m68k.org, ebiggers@kernel.org,
 johannes.berg@intel.com, jonathan.cameron@huawei.com, kees@kernel.org,
 kuniyu@google.com, fourier.thomas@gmail.com, andriy.shevchenko@intel.com,
 rdunlap@infradead.org, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bridge@lists.linux.dev
Subject: Re: [PATCH net-deletions v2] net: remove unused ATM protocols and
 legacy ATM device drivers
Message-ID: <20260422193829.0b8539a3@kernel.org>
In-Reply-To: <accbbcdf0ec14ae4d3f21ef5da7091bdcbd6574f.camel@infradead.org>
References: <20260422041846.2035118-1-kuba@kernel.org>
	<accbbcdf0ec14ae4d3f21ef5da7091bdcbd6574f.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14238-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,lists.openwrt.org,traverse.com.au,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,armlinux.org.uk,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,blackwall.org,nvidia.com,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,huawei.com,infradead.org,linux-foundation.org,lists.ozlabs.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,openwrt.org:url]
X-Rspamd-Queue-Id: 161CD44C545
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 22 Apr 2026 14:05:31 +0100 David Woodhouse wrote:
> On Tue, 2026-04-21 at 21:18 -0700, Jakub Kicinski wrote:
> > =C2=A0=C2=A0 I'm still deleting the solos driver, chances are nobody us=
es it.
> > =C2=A0=C2=A0 Easy enough to revert back in since core is still around.
> > =C2=A0=C2=A0 The guiding principle is to keep USB modems and delete
> > =C2=A0=C2=A0 the rest as USB ADSL2+ CPEs were most popular historically=
. =20
>=20
> Still not entirely convinced; I worked on both USB ATM modems and on
> Solos, and the Solos is both the most modern and the only one I still
> actually have. And the only one we have native support for that could
> ever do full 24Mb/s ADSL2+, I believe.
>=20
> If we drop it, OpenWrt will need to drop support for these, which I
> think were quite popular at the time; there were a few UK resellers:
> https://openwrt.org/toh/traverse/geos1_1
>=20
> I still don't actually care *enough* to try to find an ADSL line I
> could plug one into for testing though... :)

I'm inversely unconvinced. The argument has the ring of "I still have
this HW lying around somewhere", which is usually what prevents us from
shedding all this dead weight code. I don't want to argue, so I'll keep it.
But if one "fix" arrives for this driver - it's going :(

