Return-Path: <linux-mips+bounces-13058-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJwIEYHYfGlbOwIAu9opvQ
	(envelope-from <linux-mips+bounces-13058-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 17:12:49 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7452FBC6B8
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 17:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B0D63014848
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 16:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B97F346FAE;
	Fri, 30 Jan 2026 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Fd4Q2puz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eP7OX5/4"
X-Original-To: linux-mips@vger.kernel.org
Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EFC346AF3;
	Fri, 30 Jan 2026 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769789566; cv=none; b=e3ANJAkntd0ojS7OvlfiRKaJYS9DaoVMG+qkOBLg+jcBO8rY9zW82IZvH6VTAxfsW1QKEaQ9DmmM664FASqyBvuysinw2DLlRJLoihYjenpq6D44KcE7l8nwyF6fPr3FWSxybGN0mgsQP2dHsF0W6gFqqBRMDBeMDr8rmhtomwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769789566; c=relaxed/simple;
	bh=t1VaZcai64anTnxkmyyYyO32XtCUa02OUBLobw5ShzU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NM03TvM78SoawuihzdotZEuoW5B0SsJHPb+rAk3bRIHipxsmUADLoPQW5M5Pm7oHsS4dTrrbEqaK2JLIZ8b/Rzo1W6RZ/lPKhQ8T22eMX5wUatAW32tmdLSMaL70JuxpGQSSV7qRZWQW4Yq7GVXnSbIwBq/vfdj7xHTprXV90T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Fd4Q2puz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eP7OX5/4; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id D2B25130039A;
	Fri, 30 Jan 2026 11:12:42 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 30 Jan 2026 11:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769789562;
	 x=1769796762; bh=NgaaW04BVeRCEXIicPLRKqDnPy40XNDnRvPy76NkRPI=; b=
	Fd4Q2puzPhcnh4xIfcafphjjQImSdLOjE6gY98a3Pn3jrALgvMF9xXzMjN16058f
	wTvOXis8oP1dHGqXb9KquYM46SCnL0+Zc8LcKuBM/tHo5BN7WqExItgaWb4wmboZ
	J7p6KQ+X8EuHbkHM8dTfyI5SrJoHQn1rzESpaXs/LBQO+yFwmJMJJd145+/ub4Nk
	+plCE+eOzs1A/UX8dQ0kLcx1qLZ6RnKVapG5JNXeoUyVS72xG8OqK3r4CJ5pgUrr
	LU4hr5YvP1bBPvCEbLu9WSUHmx5zg+lKW2u2GoxJYr4ezH9y6WBdkKMOEOsoKf5c
	YGCnCByKvySWbe9yy8SC7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769789562; x=
	1769796762; bh=NgaaW04BVeRCEXIicPLRKqDnPy40XNDnRvPy76NkRPI=; b=e
	P7OX5/4KRUP4j6VzSd82Fy+/0i/kHebC9lF7pG8IKD1r5N9qfg7IbDGfr6BBgV6b
	6hur/VbJBq/YjoHaoZFgFJXzbMQB8jSJOZFD5qYZn0tZr33MP7kKy4v2fXSV/s2F
	C9+qK027PNN4179a2ufo6R7yzM5kwxjVItffNymp2+KMHsf5cLIoW354h+cfIwuw
	+T+zh7bYvUwS6Ov95/LGJH6auyevvOLgUwK38mqKv0LR84/10UJTbuRMZG/c0R1p
	NeT7pI6RTUYnak9WLOT3PA8QkbC8tdwi0P1mVNow9B/NLshMst/+zxg2hE347GaC
	0bbPNMJFUaUO303S36egQ==
X-ME-Sender: <xms:d9h8aTTvXkBgmTH8dvLwUAGnZNpedogQ5CrO9dzRqVkpxLYXcY798w>
    <xme:d9h8aflk0ypf6S1j1NdfnZWIp4TNaq_lCzC671G1duHpDwbLQBvQw7182_ZI4XgLO
    QTErjSzy89X5t2uTq6eb4BVyVQMMi5XRZcgftksnC1ToFifZmvKimo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieelgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepjhhirgiguhhnrdih
    rghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehvuhhlrggssehishgtrghsrdgrtgdrtghnpdhr
    tghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:d9h8aYAYtQsrR8F5YcwPqS5d9I428xKFWEuayc5uW3FIUtNgaN9q8A>
    <xmx:d9h8aXvFVlwmyqzTSuN7fyVRMtkdRWvV3Kff_rc-fR-AZmfo3paZBQ>
    <xmx:d9h8aQEQevXu1FCHOgTTMKuc7s7QdpOQekFSl0j_lhzr9W3Jahe_Ag>
    <xmx:d9h8aa-9DuTZysIM5xg6VfVsjeJw34yBGirSZEm6Ehp1ud5mNMKA-Q>
    <xmx:eth8aU29_Njm0ZqFr9Ttu3N0veXitG_Ue8Oxkt1V6q77s8hZ3E4SrRVe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BE6A9700065; Fri, 30 Jan 2026 11:12:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A3aFyCCYhEv3
Date: Fri, 30 Jan 2026 17:12:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "John Garry" <john.g.garry@oracle.com>
Cc: loongarch@lists.linux.dev, "Peter Zijlstra" <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, vulab@iscas.ac.cn,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, x86@kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Andy Lutomirski" <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Borislav Petkov" <bp@alien8.de>, "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "WANG Xuerui" <kernel@xen0n.name>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>
Message-Id: <491f601c-00db-410b-ab7e-a411d4be71ba@app.fastmail.com>
In-Reply-To: <1171c2c1-1d9e-49ad-8d94-ede3c68c9f9c@oracle.com>
References: <20260107094007.966496-1-john.g.garry@oracle.com>
 <20260107094007.966496-2-john.g.garry@oracle.com>
 <1171c2c1-1d9e-49ad-8d94-ede3c68c9f9c@oracle.com>
Subject: Re: [PATCH v2 1/4] include/asm-generic/topology.h: Remove unused definition of
 cpumask_of_node()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13058-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arndb.de:dkim]
X-Rspamd-Queue-Id: 7452FBC6B8
X-Rspamd-Action: no action

On Fri, Jan 30, 2026, at 13:24, John Garry wrote:
> On 07/01/2026 09:40, John Garry wrote:
>> The definition of cpumask_of_node() in question is guarded by conflicting
>> CONFIG_NUMA and !CONFIG_NUMA checks, so remove it.
>
> Arnd, can you consider picking this up please?

Merged now, sorry missing this earlier.

     Arnd

