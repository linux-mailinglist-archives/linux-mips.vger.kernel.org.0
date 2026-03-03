Return-Path: <linux-mips+bounces-13333-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A0UO85Jp2n2gQAAu9opvQ
	(envelope-from <linux-mips+bounces-13333-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 21:51:26 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B471F6F69
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 21:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C501A306ABE6
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 20:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB78386C00;
	Tue,  3 Mar 2026 20:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="pLDSmkoG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YTVlBjzR"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D41335F179;
	Tue,  3 Mar 2026 20:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571069; cv=none; b=Phk+NVibkSuhMVkbSDIiZaBCjellrnwtVKEXBF876aUpYmQ/Hvy30iyrZoyiDE69sWNOdPeidtqkH8150rvFLxfiyrDvynPDFFYCDlDIL5RP+Ji2ISu5zpJsF67OtiaA2nC3q4Qs9q9eQLveWOhq4lxMgDERFbEBjT7Ne8V+Oq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571069; c=relaxed/simple;
	bh=UETo54LCAdRyr1VDe/7jjjWKgtGXvc43LN9M+ho0yQg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Mxk9lJ/egFKrdmxqbMpQFtV4M0I8LiOqI1SICrd+0q96D3eFdTQq/BYbYj/B4QSseFViqcf86Xu1xaqEMBA6FK3NiJVx9vjF6Dd19GxehV30vVgmViNoEZOMxRDJ//A0LcDdQvg1l+2jiT7Sn5RVH8py+ckgOqewwLT+hr30MCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=pLDSmkoG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YTVlBjzR; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 4CC3D1D00091;
	Tue,  3 Mar 2026 15:51:06 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 03 Mar 2026 15:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772571066;
	 x=1772657466; bh=W4+9AyMIj1WDxYgl7TvopUa7BgXQ+cJMbbNJ/Z/1ir4=; b=
	pLDSmkoGAjS8lnVtR1khysjif4VTY5cRWo9PIxyDJiT28SEFPnk1yXN58zkVxEMh
	GFW1phu55AtGZbKUNoh3VcX9JTNkCzW7xIACqKccu9Yi2xgImIbaihihSab3Ybcy
	ZvzdJ9KnUtHX1L96Lz7VaETXaw0WUeq2GiwLcE6rz6wfW+eI9zJX585FXdCVD7tl
	X/ZMK3WFoNbmP0JCWCs6+hhgv/UQvUhqfxQhQnXjEDrZ2LaRSAzKVL24K3PzJhIn
	rqjjxOu2ekH2xWndLoEQtcbD8+ZX+k3wfPuxfVMI3M5Nh4HTdK7tar6AT4OhAaVE
	NNHUNEpsd4v5NMVnDGl1cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772571066; x=
	1772657466; bh=W4+9AyMIj1WDxYgl7TvopUa7BgXQ+cJMbbNJ/Z/1ir4=; b=Y
	TVlBjzRPOIJet/lh3awFNLl+wSE9XarGY7dyctHiw5tGwZ6LRJ3BrauySyy4mzo0
	b0+dmt15Vi2YI3e9F9TlBU30QCqEG5DY1aVhkCoxyCw1e9CyBFJ1RYuMAgn+NGDb
	6jVVcHqBihXYHtfSXv2h/C0REEUlC4kpEOGjzIHLx3Pd90Iw46MOeQyLcV/cFl+E
	5dZqAzFlk60ZLRCJhmu+gRhtmD+V3HzFy3GlHl8IKJ69OzkPyaZFRzxeRWMWHXa3
	0ck/5T/lVenCbLgUVMTqHhaKndC/nJbyDoy1H5u/Y2BPqio99jPYioYRMJHI3mjS
	S58LoC5QRY0ZI/dbjZyuQ==
X-ME-Sender: <xms:t0mnaTNMr7HRS--AuI8r-Sjs0TE5jFMLYGjK3yJPu0GcoqGNF90Dww>
    <xme:t0mnaYwXrHoghs8YGSaKStp_jMggeks5AVkqXKoty1d9tlJzn8unKKfyiC4rOp_Hx
    1VCQixKCnYpCwvpJMpvifb4MBADS_tOIRySc2OTiVe2hw8vnsMqbhs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprh
    gtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgv
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:uEmnaTovlr41bMOoG-myb6wYD6yoZjgMxJaD4C1IsznfOvQliSGM7A>
    <xmx:uEmnaZPe6a9Yagzc6v8dA-19Wn_ba6NmwvRIUy5a__y8EQwCklW78Q>
    <xmx:uEmnaQNzCnwjn_-woKHF5KKnpyufa8dxgdgTmaQq9JlXYt8CehqaaQ>
    <xmx:uEmnab2d3NaeSyTEJISJaVuDlDdHY35r82elxjQMDUg6M0f0aHZDjQ>
    <xmx:ukmnaaN0mkEav7UlHMX3vyXNihfd1xX8twV1ttpCy-ygb33aiA8wnMPB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E3624700065; Tue,  3 Mar 2026 15:51:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ARwL1vy566MZ
Date: Tue, 03 Mar 2026 21:50:33 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "H. Peter Anvin" <hpa@zytor.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
In-Reply-To: <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 00B471F6F69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-13333-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,app.fastmail.com:mid,messagingengine.com:dkim,arndb.de:dkim]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026, at 19:11, H. Peter Anvin wrote:
> On 2026-02-27 01:34, Thomas Wei=C3=9Fschuh wrote:
>>>>
>>> The thing about gettimeofday() and time() is that they don't have
>>> a 64-bit version and libc implementations are expected to call
>>> clock_gettime() instead. The result was that there was never a
>>> patch to turn the off either.
>>=20
>> gettimeofday() is currently the only way to get the timezone of the k=
ernel.
>> But I guess this is a legacy thing anyways. If you say we should drop=
 it,
>> let's drop it.
>>=20
>
> The time zone in the kernel has never worked anyway, as it would requi=
re the
> kernel to contain at least the forward portion of the zoneinfo/tzdata =
table in
> order to actually work correctly. The only plausible use of it would b=
e for
> local time-based filesystems like FAT, but I don't think we bother.
>
> A bigger question is whether or not we should omit these from the vDSO
> completely (potentially causing link failures) or replace them with st=
ubs
> returning -ENOSYS.

I see no harm in keeping gettimeofday() in the vdso when
COMPAT_32BIT_TIME is turned on, as existing code will call it
no matter whether it's in the vdso or the syscall.

Equally, I see no point in having either version of
gettimeofday() or settimeofday() when COMPAT_32BIT_TIME is
disabled, as clearly anything calling it would pass incorrect
data for times past 2038.

Neither glibc nor musl support actually returning the kernel
timezone to callers of gettimeofday in modern versions that
support time64 syscalls.

      Arnd

