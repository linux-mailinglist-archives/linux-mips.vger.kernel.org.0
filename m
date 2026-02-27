Return-Path: <linux-mips+bounces-13280-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDaAOnFboWmDsQQAu9opvQ
	(envelope-from <linux-mips+bounces-13280-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 09:53:05 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF01B4BBB
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 09:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4C1F3091C81
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 08:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CBB3A9D83;
	Fri, 27 Feb 2026 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Blq25ZTI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JGOXmZzM"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D8C36C0B9;
	Fri, 27 Feb 2026 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182321; cv=none; b=Ly/RdF8A8jwmGdMLgDj53E8HQve0uPxK6SwL1OR2t5ZKAB9j3AWoLrazETxG5ZpkzzXVNhj2xQxjoZG0AeZTlpzWoYZfcchsCIB31UblpF867/y7IM3fVW07OcT9xEUvKp30rB88+UUd8WTL6uQRkLIVWnaQQ+fDKOZK8m5cZ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182321; c=relaxed/simple;
	bh=+KCsio2wrHwIiV5/dMoK3Tw/3j2a8KEfcABD565rOG4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dAV/QWCdqhus9AC+v59pM94Munp07qI4WB7XQf/nc/PdGouD/U29xay1AbwwcL3bGxmOU3RVO7V01VJp4puHHUtZhRPQjSrxflHiI33f87JMAAo4O58TnV8XNHDnE+Uafr4YtN5jVaVtX6Yerug2mMeCpNXteCuuieUW6TcMVjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Blq25ZTI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JGOXmZzM; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B193B7A0090;
	Fri, 27 Feb 2026 03:51:58 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 03:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772182318;
	 x=1772268718; bh=+KCsio2wrHwIiV5/dMoK3Tw/3j2a8KEfcABD565rOG4=; b=
	Blq25ZTIr2oecLSxKNEUueJHjo4Evtx26CAq9L8MjT0z2zDKnwTIxAIj/Zu5djrd
	7qzXiXqL/PwjOp5EfNRC8OPb34ozFWwrtdfMyw1HboBSWlZfa9EEhfdDoSm6aBKQ
	VGoZUgtcBIFNI61PU7/lbEe+C75i5BAGouT1SL+9PDRH1LhPxwTVTZjOtEBCWYWe
	nnlXz6pqvrBQvkr2UQxUiL7NIlzwXbsSAI6ceOjzrd1PeFQ775FgObKnWtcxVPSN
	6aOTxej5pe9OSwP+/TqZJT4k3hejBMbsYW8iXX8fXFR58C9gniRSbZAoUiqXoaMZ
	nxrLJPWqZBZoZ/VVr3MNcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772182318; x=
	1772268718; bh=+KCsio2wrHwIiV5/dMoK3Tw/3j2a8KEfcABD565rOG4=; b=J
	GOXmZzMJnGKWMmUc0ue+u2pXOBIrYTmAxLuSpTsDuTA5n+4c/vPWyCj15FGwcRVK
	0fkFIm6TdWSW3J7Nn0U9/1Z2eTnPTMgxfIpBU6Ul6Mybmo0ZOpuUoqoXzqkLFO76
	13lDWTgKrLRbY2anDPqF1c8UO1H3I+sgEXDTXTjMCVg7G7fFfDWQNNYFyIc+4ST/
	+l6aNHJ1K6YEyzCd19lv7Ov8bpTEojUBLObCB4Jb3/vYDuTPbyNnKxXYyQxabwbK
	rwcWaGKjkbdZa54IgyKm0QuDgPq5L8lZorSgZ5UUzU1QXmpef0pXIhRE9VC2G4jz
	BUeuwyKS/6B4Zl91OHsxQ==
X-ME-Sender: <xms:LluhaSAzAZPE6KRpH-aznGnF-edp0VO-ppRwUVRjiDU_PLNE5eifNw>
    <xme:LluhaXVYgGg7XgYWCfF-hlJ8ZwLAiAe7nZuMDZj6Q6diFbueVzkr-FShp7OpwZj4_
    OGHjawiQzyyZPvBUw2XeIV1qQBo18Uem0bu1iyHO03nIT4-gCKjs44>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekheeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:Lluhaa_Z-NYZFJU8JxieTGZ8X3mA1PQy2-Wi-UNa4EOIGcjh0y3j-A>
    <xmx:LluhaWSQ7VCUZ699wMGLPT878vS4RJq1aVEnB16IRyXAvSX5DB0rsQ>
    <xmx:LluhaQDvCoc1WHlNRQytR8CUzFe0vNQ5VFFCAmDi1T64p4zRiMCv7g>
    <xmx:LluhaXa2sqhlcTFagSv8ygCNJkXiUVnmn1YeXZkzLMSw8yQbGYA5lg>
    <xmx:LluhafC83NJGThoiRMmADNRyjJkNd33U8dE4gx47yWse_NbXWivPWLf4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3B969700065; Fri, 27 Feb 2026 03:51:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ARwL1vy566MZ
Date: Fri, 27 Feb 2026 09:51:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
In-Reply-To: 
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13280-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,arndb.de:dkim,messagingengine.com:dkim,app.fastmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:email]
X-Rspamd-Queue-Id: 6BDF01B4BBB
X-Rspamd-Action: no action

On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> provide any 32-bit time related functionality. This is the intended
> effect of the kconfig option and also the fallback system calls would
> also not be implemented.
>
> Currently the kconfig option does not affect the gettimeofday() syscal=
l,
> so also keep that in the vDSO.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

