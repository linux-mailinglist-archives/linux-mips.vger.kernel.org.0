Return-Path: <linux-mips+bounces-13119-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6pCqFlxXhGlq2gMAu9opvQ
	(envelope-from <linux-mips+bounces-13119-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 09:39:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9BCEFF90
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 09:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4505F3004D02
	for <lists+linux-mips@lfdr.de>; Thu,  5 Feb 2026 08:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5076C367F38;
	Thu,  5 Feb 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V77r26dW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D8366DD5
	for <linux-mips@vger.kernel.org>; Thu,  5 Feb 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770280793; cv=none; b=eJ+m9chaWBSacXJ+UjTADsK2iYa/cbqXX5ct2cClhX872WevJnkMgow2oFPwGXlPaA+dyEx3ChGUhw844qoLU0XFHyoZqxop107sggs6dTuv60GEIZ0JO49oYlkPlAaCRMRdHdpPvYCHoyTzwJZdPewBORj7IoWx40ef1A5PH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770280793; c=relaxed/simple;
	bh=YvD04nQyj1/NEz9sq9P4Bg/004zZVjWDe2tCRNbeF9o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lqWRpyS8i5P+c6NafXQXwkwSBRHjDOvkiwm/TA1g0jn1oMzumXMdi54QdWzySaNDKQXtH6ySMASKzEiN4tHeEEAZ2pbxZIq9evzXnimXiGNPuHJMdanmHGsZZLMZhCbji5YPOOhLmxt+h1k8M47CaEXLDdRmsy9zghqsjfvLAqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V77r26dW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93BEC16AAE;
	Thu,  5 Feb 2026 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770280792;
	bh=YvD04nQyj1/NEz9sq9P4Bg/004zZVjWDe2tCRNbeF9o=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=V77r26dW7HwTNUYJVbKHRYfmwl0/7Ut+k589x6FkFF0ByVk4ky5qelsqjJA7v9jc/
	 eFblXq90/q1nJFhW7wct34ZKkg489smnbrFNqp73mvzEfa3hlDkOVyqqQ4difHILmx
	 hhzEs0zcaqBMAf2ORRZ1xgr4LXppqvwuBZUcdawgg67VGmcoDzQUTGz2UDNviGkzn1
	 aU/ObF3iBS6Wvb/l+t4zOk4Flx4LJAvWsgJ3ueZMHJKUM3+ZFBPWuUKtRp9K0jXyIB
	 dj/Ep237KU7qKKI7OlXdL9r5TLGt7X8X43sQgnoizb5ANLGC+O4SvqQu8PHCZDGnbW
	 tAhk9hz9tj04g==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 865ABF40068;
	Thu,  5 Feb 2026 03:39:51 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 05 Feb 2026 03:39:51 -0500
X-ME-Sender: <xms:V1eEaZnUPLitqx4T7kAHJyRfHtFVrhs15n--zl9ofe9Q80bygjjx4A>
    <xme:V1eEafrOgp_V0uwuXwG9NObqcWZL3DEpESpfF6yP9qgv60RUKbfM_V6doG91UHgdW
    R_PMzmcofkn74HuOHJxpAkalQgk_zoh8L4beiD32IidVlEUW1xN2Qk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeegkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
    jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoh
    epnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggtrhhosehorhgt
    rghmrdhmvgdruhhkpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepmhgvseiiihihrghordgttg
X-ME-Proxy: <xmx:V1eEaf-HI6aWTNnxaUUEzTywjeBuiZkW297i-bHJ0cH5cBQHlVpYmw>
    <xmx:V1eEacZvE7l_MutuELZ7tGyMIgepk_5PQU9s10yjpPCikxAS0J1ESw>
    <xmx:V1eEabNP70lxOha8GKFsMdCZrDl7HLVbMoXnc9hulJvX8pCq4wLI9w>
    <xmx:V1eEaQAh0YEsjkQfFDgGLg1w2DRxgtcuFI7vnubWPZlGVqCy25jiLQ>
    <xmx:V1eEaaJoiwmHaQ194NF3xdW4foPiXJVSe8UTQUCgr4C_MBNFMXEPp6gj>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 572D1700069; Thu,  5 Feb 2026 03:39:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8lqlFeQHG57
Date: Thu, 05 Feb 2026 09:39:31 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, "Yao Zi" <me@ziyao.cc>
Cc: "Nathan Chancellor" <nathan@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <e6b09549-7dfd-451d-949e-f7c118ecd86a@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2602050110020.17548@angie.orcam.me.uk>
References: <20260202041610.61389-1-me@ziyao.cc>
 <99c54e93-fb8c-4bdb-ad40-a3161a42bb8b@app.fastmail.com>
 <20260202230729.GA2319189@ax162> <aYFx5L2xC_u9t0IN@pie>
 <alpine.DEB.2.21.2602050110020.17548@angie.orcam.me.uk>
Subject: Re: [PATCH] MIPS: tools: relocs: Ship a definition of R_MIPS_PC32
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13119-lists,linux-mips=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF9BCEFF90
X-Rspamd-Action: no action



On Thu, 5 Feb 2026, at 02:26, Maciej W. Rozycki wrote:
> On Tue, 3 Feb 2026, Yao Zi wrote:
>
>> > I interpret that to mean that the kallsyms patch should work fine since
>> > the toolchain can handle these relocations? It is just building the
>> > relocs tool against an older glibc or musl that does not have the
>> > R_MIPS_PC32 definition that is broken? Or am I misunderstanding
>> > something?
>> 
>> Yes, this patch is only meant to fix building of relocs tool. I don't
>> think there are problems about toolchain supporting since R_MIPS_PC32
>> has been in binutils for a long time, as Nathan found, since 2004. The
>
>  Since Y2K to be exact:
>
> commit bb2d6cd7b19cd82313963d2d878a94e6e85a38b6
> Author: Geoffrey Keating <geoffk@geoffk.org>
> Date:   Sat Mar 11 02:16:25 2000 +0000
>
> [...]
>     In include/elf:
>     	* mips.h: Add R_MIPS_GNU_REL_HI16, R_MIPS_GNU_REL_LO16,
>      	R_MIPS_GNU_REL16_S2, R_MIPS_PC64 and R_MIPS_PC32 relocation
>      	numbers.
>
>> situation is that it's likely to have a toolchain supporting
>> R_MIPS_PC32, while elf.h on the build machine doesn't have its
>> definition. And after ff79d31eb536 ("mips: Add support for PC32
>> relocations in vmlinux"), the relocs tool started to require a
>> definition of R_MIPS_PC32 to build.
>
>  But where does ff79d31eb536 come from?  I can't see it on Linus's master 
> and you can't refer an SHA-1 ID from another repo in a 'Fixes:' tag AFAIK, 

Yes, you can, as long as the owner of the tree does not rebase.


