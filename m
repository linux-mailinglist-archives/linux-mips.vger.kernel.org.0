Return-Path: <linux-mips+bounces-13924-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHV3BSDKwmmIlgQAu9opvQ
	(envelope-from <linux-mips+bounces-13924-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:30:08 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C4831A07A
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0B29300C990
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 17:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6B23FFAC5;
	Tue, 24 Mar 2026 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="YuQaN1x1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="y7freEIq"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ED4256C70;
	Tue, 24 Mar 2026 17:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373377; cv=none; b=cVECySieXUen0ZeaS5ve2YnSR26uUqZbD+E5npz9LhLxObU2Us+zbOVCm3PsNZuku+DhwmmvC8UHdBMEWvwLKo+HBK35M3Gj9PnP4tmsSLtBT6xyXtw/6IaLtl0Yk43rvblRK/gF1tLif9ynEmX6eimrTe1JX57Pxa59WrEIcy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373377; c=relaxed/simple;
	bh=aVVqW3dXkqtlcT/dcJ39nYxlzkzHYy4YUl0DMroL2Vc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=M0dxjeed9+Qjnl2nBs8HPPe9tg1BovXOA+PGgTeUHhq0zznEixcrJ08APw8A2mGNCEIgdl7rLkQ9XPvIkEnrG5jY33cm34HGBg61jJKmxo9Z3jo/q9ViuQdZPAtPifrv5XiKzi/VN23LdOEfC6gLIj2NpFRRWgeuJU1MQ13d9dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=YuQaN1x1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=y7freEIq; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 359C7EC01DC;
	Tue, 24 Mar 2026 13:29:34 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 24 Mar 2026 13:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774373374;
	 x=1774459774; bh=1Opu1ntQwi1qCryRQPCaJQQ6dDUZsjycqgXDl5cqa0Q=; b=
	YuQaN1x18FmrKKt7fhfDIC/SVI3WK5HlzphyaVoaHGAJXalIgK3WuyzgWgYHBwZd
	glU78rdmij8n7eHRGw0hHzWhjzPj5DFdJzvjolpc536topnPJAOPPiW1Xc+0W0Dh
	FUnynymbcofLwiQm3MwsiAvpD/XWIx7bioEwSgeuEGpQdBlaw6nJPSHvFALvXAWV
	eY5teZxQo8iimnjWS3caY0oDeLfZNkeLQ5WkUdRIbM4vu5x8MyYlFtfXlNXIRTyd
	+1KBlv5BkQvF30Eh0CJPpzoH/ujTPeztTB0W1v3CoFM0YeNtn/hJkhzNjHCpw2Bg
	+KvccRzogXFhZ/hiZyVjAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774373374; x=
	1774459774; bh=1Opu1ntQwi1qCryRQPCaJQQ6dDUZsjycqgXDl5cqa0Q=; b=y
	7freEIqA2mhtC4cHYqVNe36M+4MAuuJuvApIDaRVcxple7tjeoqLkPrQ32JL17AX
	j92YvU57m/7LfhYPdF+rijPFxq5fiNaZz2WrX4jQwqiGCKDHkArUgHFfZj4ClxRg
	ay8Dm3gN58Am5e0lOX7BT9B4nWfOBNRjg+5GMyUyWWQjvD+v6i0JRFcg3YAzsQa7
	pDaX6JJ1kvwfL6M8FEib3kUWdLBMtwSz4r0sPIsWjXRLdBbDUxGLkUwN7ZGGYfMn
	gfyRh0yPD5eSdjsP2EA3CNfWih5gyWRghxJFva5n3KF1TIRSXWpAancZHQt6QSSa
	miLyPzMGLcc5ifo2lqIPg==
X-ME-Sender: <xms:_cnCaUxt8Ru5zCA4Q3L4E2X4xU7cvBc1hos6UEnJfr4Qa1_P12DuXw>
    <xme:_cnCaTGlnFN_9QtmSDAJgZ-9pRMgaBjy_o6rIC0yoF6hVd7s8-WQbpGBinZx848xK
    CNNc6yqvTVmWQX8mFYzgHo5x8imXKgTiTgz_flxMLun5f6JGqL2-QZh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvddvudekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprh
    gtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugiesfigvihhsshhstghhuhhhrd
    hnvght
X-ME-Proxy: <xmx:_cnCaaBDpw2lp34uZcgzCJaB60uFASqQ_JFosG4knlnH6Mp1mqZkQQ>
    <xmx:_cnCaU9BG0DGC_9qxf2QmLMNsYDI3DaXFWXKUORUwCLpCq9yChheWQ>
    <xmx:_cnCaeTEIkhpTweN8Vj1hBL-kqLOXFXMhsm6smgPXdh0uHlNuPEx2g>
    <xmx:_cnCaQWUrqWv7tgxNJw9ydjB5irjlpt_zpdYjoxOAt-AjFXLZ1UiEQ>
    <xmx:_snCaTipYXh4oK0XaJpY7aQjzB_2CMksYlmEubF0gV3_7lxiAygrotnU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9CB23700065; Tue, 24 Mar 2026 13:29:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A3qnTrBlQk53
Date: Tue, 24 Mar 2026 18:29:13 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org
Message-Id: <604e8db2-6745-48b1-9db7-29fe12eb9579@app.fastmail.com>
In-Reply-To: 
 <20260324-kbuild-missing-syscalls-v2-0-651b8beb0bfd@weissschuh.net>
References: 
 <20260324-kbuild-missing-syscalls-v2-0-651b8beb0bfd@weissschuh.net>
Subject: Re: [PATCH v2 0/3] checksyscalls: only run when necessary
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13924-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checksyscalls.sh:url,weissschuh.net:email,arndb.de:dkim,arndb.de:email]
X-Rspamd-Queue-Id: 33C4831A07A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026, at 18:16, Thomas Wei=C3=9Fschuh wrote:
> Currently checksyscalls.sh is unconditionally executed during each bui=
ld.
> Most of these executions are unnecessary.
>
> Only run checksyscalls.sh if one of its inputs have changed.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Nice series!

Acked-by: Arnd Bergmann <arnd@arndb.de>

At some point, we should revisit the syscall table use and just have
a shared table across all architectures for the syscalls above 402,
which are almost identical already. That requires a bit of scripting
but will let us just drop the checksyscalls script that hasn't
been all that useful for a while now.

      Arnd

