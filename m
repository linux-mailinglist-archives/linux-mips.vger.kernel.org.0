Return-Path: <linux-mips+bounces-15099-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kObJCP2LMGo4UQUAu9opvQ
	(envelope-from <linux-mips+bounces-15099-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 01:34:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B62468A966
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 01:34:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fu-berlin.de header.s=fub01 header.b="gbi4/14R";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15099-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15099-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=fu-berlin.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DEE9A3007220
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 23:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF51D309DB1;
	Mon, 15 Jun 2026 23:34:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6E9253958;
	Mon, 15 Jun 2026 23:34:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781566454; cv=none; b=hSbg85hkAL5/mVshb5P+N0GpiYvqsyhzkqVHVRKkIfIbK9wR8qxZwaqy93MzRkGLtPWY+4Uq6pZD45w7q4roSXeY23uE9OwzdGtoDtEzz5QI6eMBgl+X9OyaPLgHJSGlFAHHAQVNV0CGC8kp6DVpButLCOCLNMIQYRJbTPRuKxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781566454; c=relaxed/simple;
	bh=LXPzkweTrBcVo856qcmPgb1DtDvaLPEH+jEfOqPfT2s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f+3cqXpJgkQPo0ne/hlNTk1eLdW87m+1gJHsTEe1lcsLoR5tH7m9HWvsOCs9eGiIZyDkMPefo98Q+gLfn6YWIEhLhvurT6XAZo07k+g117B3cjkXnvZg3JOHepvZgKy7cea0HV0Fh5KFcv1qtYPz26IMizgUEkkA1lsyVoMDtcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=gbi4/14R; arc=none smtp.client-ip=130.133.4.66
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=UcyzNe2kkvCr0tmZScGHxnkfzSMWsq/75HfrZoct7a8=; t=1781566451;
	x=1782171251; b=gbi4/14Rbq1UHRcZuwhRyoS/XOMsmNb05vcdPgr1il1d/7KL64g7WLXa3kg12
	GYVrFxJK/5GXJXX8iA58s2RTudg/eDEH4zCT1FLb5XYdBc9dWtKOluI2Ha1ju0nhQrEhVzKlyRz/w
	pmqrjH8+p6D3lR9GHFmqacZvc4e99T74P3QD28dqSp8NMW7TE3JGO9aZoPs3gUVnOwXW5uqTomXJi
	aUqlZUxIhqyQP7tLshjCIPwPrAl+NQF7igdaUJdd9tchfhspTZ5DZsGWnLsicvu3hvd5kL6xw8Q5l
	HLZC6Be9dhOB6JzquvALsmWapkIbb3RTtqHr33vcctG27jNdCQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wZGoh-00000000EPh-2I78; Tue, 16 Jun 2026 01:34:07 +0200
Received: from p57bd94c1.dip0.t-ipconnect.de ([87.189.148.193] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wZGoh-00000000RxC-1Ebx; Tue, 16 Jun 2026 01:34:07 +0200
Message-ID: <c3789160609a10e232ba3e27c4b13adbb170956c.camel@physik.fu-berlin.de>
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, horms@kernel.org, geert@linux-m68k.org,
 chleroy@kernel.org, 	npiggin@gmail.com, mpe@ellerman.id.au,
 maddy@linux.ibm.com, 	linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, 	linuxppc-dev@lists.ozlabs.org
Date: Tue, 16 Jun 2026 01:34:06 +0200
In-Reply-To: <20260615222935.947233-1-kuba@kernel.org>
References: <20260615222935.947233-1-kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-15099-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:geert@linux-m68k.org,m:chleroy@kernel.org,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:linux-mips@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linuxppc-dev@lists.ozlabs.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[glaubitz@physik.fu-berlin.de,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,linux-m68k.org,gmail.com,ellerman.id.au,linux.ibm.com,lists.linux-m68k.org,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,fu-berlin.de:dkim,physik.fu-berlin.de:mid,physik.fu-berlin.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B62468A966

Hello Jakub,

On Mon, 2026-06-15 at 15:29 -0700, Jakub Kicinski wrote:
> This tiny series moves appletalk out of tree, to:
>=20
>   https://github.com/linux-netdev/mod-orphan
>=20
> Core maintainainers are unable to keep up with the rate of security
> bug reports and fixes. Nobody seems to care about appletalk enough
> to review the patches.

Why would fixing these vulnerabilities be relevant? No one is going to
expose an Apple Talk server to an untrusted network, are they? The same
applies to hamradio and AX.25, they are all used by hobbyists in DMZ
networks, so no one really cares about vulnerabilities in these protocols.

I find it sad that AI tools are basically used to shoot at the kernel
to kill off features as some people are apparently getting scared by
these AI reports and just nuke everything in a panic reaction as if it
wouldn't just be possible to disable these protocols at compile time
to reduce the attack surface.

> As Eric pointed out Mac OS dropped AppleTalk over a decade ago.

That's not the point though. No one is going to use AppleTalk to network
a Linux box to a modern macOS machine. The usefulness lies in hooking up
a Linux box to a vintage Mac or other retro computer.

So far, one of the huge advantages of open source operating systems has
always been that even niche use cases were supported and people could make
use of old hardware by using open source operating systems over commercial
offerings such as Windows or macOS.

With the advent of AI security reports, these niche use cases are more and
more being killed off with the argument that a vulnerability in the harmrad=
io
code could pose a threat to a large SAP database running on a Linux enterpr=
ise
distribution. However, if your enterprise distribution is enabling kernel
features their customers aren't using and therefore enlarging the attack su=
rface,
it's more a problem of said enterprise distribution and not of these old an=
d
obscure network protocols.

I am trying my best to save as many classic features in the kernel as possi=
ble
to enable retro computing but I am sometimes fearing that commercial intere=
st
in the kernel is taking over too much making my efforts harder every day.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

