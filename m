Return-Path: <linux-mips+bounces-13967-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BBaAo6vxmmiNgUAu9opvQ
	(envelope-from <linux-mips+bounces-13967-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 17:25:50 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F55B34765A
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 17:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62EDB3073F9A
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 16:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07493491C2;
	Fri, 27 Mar 2026 16:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ta4/5kO6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD337347530;
	Fri, 27 Mar 2026 16:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628238; cv=none; b=YTkIBP6yhpAQRl/uzWhGcab3aeZqpRQFEB4OrBCt4RGJC4WsmtNytroJ05Ec2waGrS93EkmJ8/761hr/18sr/4BuGRkZtGyvTrrqH3GgjbVTh4gmVI6jyiOgQN0XhFE+E0zpIqJAXNtn7/Vf7LriHM2tDoYFS+tX312gid6o5AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628238; c=relaxed/simple;
	bh=BKJFY2NIxudZsPuHzaM9oRP1BXkSuTngg+X2PglP7zs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Udfj8YIyuJ98Y53cLPr9vabGStFimJ1p7bEVKDE46IwaZL3va+RqmgIEIDa8LraVGFHl+JqeUGKt+P7TA6cC6sBuRUievvIuSk5k9w1tWjDSkLVlSB7HPD1UW8iQcuDuh9d9QzY/UUSWe8mCvxdIxjKinqgU5bVn6gPGqmtPbSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ta4/5kO6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE87C2BC87;
	Fri, 27 Mar 2026 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774628238;
	bh=BKJFY2NIxudZsPuHzaM9oRP1BXkSuTngg+X2PglP7zs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ta4/5kO6i/NoZ7jADBQwO1eVl+FIre1hh0h3wpQHkxv7xYyFLKwxgZtjEZf1OWzIn
	 YmzwATeKQVgyqqRz3FpOuZBxp7rnkYLuxauGXJC3zhTGT7TWXc2/5NKIdMN8PUYamM
	 o/9YrOkXgCmQljqeQv4MX/DVcEXvO+fPIeVKr6aegHULbZhFZseK5e440w53chOKUS
	 cGJfdYnQht6rlYChproMSvVkL0x1/XeeX6Rpqcsje8E0s13CCLdxx+1gK50R5DXok7
	 slpUplsCZvVBRquI4qaJVKo6foLIrLD01y+8/3h9OZxMVM2S3PD5SRA+l3fgzSsM0x
	 RTu4VbknguuFg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 639E3F4007F;
	Fri, 27 Mar 2026 12:17:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Fri, 27 Mar 2026 12:17:17 -0400
X-ME-Sender: <xms:ja3GaR2ZnKms9mzEpICKhnwmpuiK3DQwLPKIwyZsR4-V5XZI8Z2Dng>
    <xme:ja3GaS4TiBH1x0Yunyb9YQb4ifOLPAAIyswY_sRDKj0WC9Fdaj-G2xS6qAH-HRPrG
    Aoh02IP2t1mW-OOUfWBJBsr8d-_uHC4VyaRXGzdy4DnRBqOgMp4R-o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedtjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekvdffkefhgfegveekfedtieffhfelgeetiedvieffhfekfeeikeetueeg
    teetteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    jedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphh
    grrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdr
    rghprghnrgdrohhrghdrrghupdhrtghpthhtohepvggsihhgghgvrhhssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgtrhihphhtohesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehjrghsohhnseiigidvtgegrdgtohhm
X-ME-Proxy: <xmx:ja3GaSmEaoF7GOySYIoRDIbYRksB5hdSAWFizXRGPzGEGguoXhTbZw>
    <xmx:ja3Gacb7lmOfkVDThy6x-4aj-0_p0fA5pvcnGtT6O-VDMuo8p2WLug>
    <xmx:ja3GaUTsImO6Keb3OW39MqVZogk0lmfsL0H8JUjqwkY7SSkt37BmIg>
    <xmx:ja3GaWtmYGozyZghlvoKBKSS_IxXqfAjdkPtctY5fdsglcHwwmpAvQ>
    <xmx:ja3GaWHtM51ifQOiy6bDSpuIoNtENT3YAZfx8KYzG1zHaFGaffygST3V>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 432DD700065; Fri, 27 Mar 2026 12:17:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AgNmpo8XctVF
Date: Fri, 27 Mar 2026 17:16:57 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, linux-mips@vger.kernel.org,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Message-Id: <62b754e9-b619-46a0-8646-aafaf7a6fa73@app.fastmail.com>
In-Reply-To: <20260326204824.62010-1-ebiggers@kernel.org>
References: <20260326204824.62010-1-ebiggers@kernel.org>
Subject: Re: [PATCH] lib/crypto: mips: Drop optimized MD5 code
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13967-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,app.fastmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.937];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F55B34765A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Thu, 26 Mar 2026, at 21:48, Eric Biggers wrote:
> MD5 is obsolete.  Continuing to maintain architecture-optimized
> implementations of MD5 is unnecessary and risky.  It diverts resources
> from the modern algorithms that are actually important.
>
> While there was demand for continuing to maintain the PowerPC optimized
> MD5 code to accommodate userspace programs that are misusing AF_ALG
> (https://lore.kernel.org/linux-crypto/c4191597-341d-4fd7-bc3d-13daf7666c41@csgroup.eu/),
> no such demand has been seen for the MIPS Cavium Octeon optimized MD5
> code.  Note that this code runs on only one particular line of SoCs.
>
> Thus, let's drop it and focus effort on the more modern SHA algorithms,
> which already have optimized code for the same SoCs.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>
> This patch is targeting libcrypto-next
>
>  lib/crypto/Kconfig    |  1 -
>  lib/crypto/mips/md5.h | 65 -------------------------------------------
>  2 files changed, 66 deletions(-)
>  delete mode 100644 lib/crypto/mips/md5.h
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

