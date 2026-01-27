Return-Path: <linux-mips+bounces-13036-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA6SCrxQeWnYwQEAu9opvQ
	(envelope-from <linux-mips+bounces-13036-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jan 2026 00:56:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5939B8B0
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jan 2026 00:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E46F30431E5
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 23:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F2E2F6562;
	Tue, 27 Jan 2026 23:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMD59OVp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35342F39A7;
	Tue, 27 Jan 2026 23:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769558170; cv=none; b=SmrIlNKjSWIPShIhMGRVuTx8GFYhmaNKtRrM3Kk3L56dSRqNvlQ9ZhE63d32EvHbfPTZ+X5eaqL1OGAvGDpVceAuh4m0/nvJwlqbSsKB+FVs79xvWgwu9V5gZ6KvTpg6OtGsRaxVtDxIA8zO9102VHCwNvKcArQe0SoQM/W9Qp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769558170; c=relaxed/simple;
	bh=j7KRe0raHrvtJFDpR+y3ObfH2IMsbuHrS5l2kNpyX/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lokp4Hlha+Gc33ZNQVk6Wo44WFjSfllvabTOq0I1UjIw1hlB2JZbXiHaCRebaCi6WQbGgEzr1Yx5H0pksaT8v5XfU6oP7b5gL543slLub5vVb3MZy272aZwkAs1e0ygawd7e7igHsoWG+DcX3me3YR0J8nGskeX6T5Gl2o1Hju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMD59OVp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F847C116C6;
	Tue, 27 Jan 2026 23:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769558170;
	bh=j7KRe0raHrvtJFDpR+y3ObfH2IMsbuHrS5l2kNpyX/Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DMD59OVpflIDwQkNqjQ+clVKyGxhb1vAoq4aj0kXeSP8U+WNUd+tg81w7kr+hayZM
	 vfYHLKxmLFiYqumFrLmcnzUMPtnUh6P9I4QQkajSsaouMUGOkYzGkdrP2Y/i8zfFF1
	 7vZifsBKatBiDssgLFwCSLw1ydmdJb+aDDcld4NMqH3I9BCyE04xSszi/XKj72DZPg
	 YuM7fpaweU2oBDs1hrO6/UEhsRfgsxtiNrsZk4bkuiLRgHL7KL2bW0PswNG6j1BrBs
	 6QEj1tfQiVenBDi8cKntmjB6AIN+MFo9mW0sILE9v6zzk1KraTvy7Xdpzur38sGtUa
	 a+wyQypx3RA9A==
Date: Tue, 27 Jan 2026 15:56:07 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Jonathan Corbet
 <corbet@lwn.net>, Linas Vepstas <linasvepstas@gmail.com>, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Martin =?UTF-8?B?S2VwcGxpbmdlci1Ob3Zha292acSH?= <martink@posteo.de>, Pavel
 Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Takashi Iwai <tiwai@suse.de>, Huacai Chen <chenhuacai@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, Eric Biggers <ebiggers@google.com>, Madadi Vineeth
 Reddy <vineethr@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ard Biesheuvel
 <ardb@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan
 <ajd@linux.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>, Konstantin
 Shkolnyy <kshk@linux.ibm.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Lukas Bulwahn
 <lukas.bulwahn@redhat.com>, Dong Yibo <dong100@mucse.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@kernel.org>, Lukas Wunner <lukas@wunner.de>, Giovanni Cabiddu
 <giovanni.cabiddu@intel.com>
Subject: Re: [PATCH net-next v2] net: ethernet: neterion: s2io: remove
 unused driver
Message-ID: <20260127155607.3f80ec99@kernel.org>
In-Reply-To: <alpine.DEB.2.21.2601270110590.40317@angie.orcam.me.uk>
References: <20260126031352.22997-1-enelsonmoore@gmail.com>
	<alpine.DEB.2.21.2601270110590.40317@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lwn.net,linux.ibm.com,google.com,davemloft.net,redhat.com,kernel.org,alpha.franken.de,ellerman.id.au,lunn.ch,linux-foundation.org,posteo.de,ucw.cz,ti.com,net-swift.com,netfilter.org,suse.de,mit.edu,linux-m68k.org,oracle.com,gondor.apana.org.au,linux.dev,mucse.com,wunner.de,intel.com];
	TAGGED_FROM(0.00)[bounces-13036-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AE5939B8B0
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 01:19:34 +0000 (GMT) Maciej W. Rozycki wrote:
> > highly unlikely that this driver is still being used. Remove the
> > driver, and move the former maintainer to the CREDITS file (restoring
> > credit for the vxge driver, which was removed in commit f05643a0f60b
> > ("eth: remove neterion/vxge").  
> 
>  How do you know it's not used? 

Hard to prove a negative and whatnot.

We deleted the vxge which I think(?) was for a newer version of this HW
3+ years ago and nobody complained. 

> What's the gain from removing a driver unless say it's broken and
> does not build?

People keep sending cleanups and fixes for these old drivers.
It takes time to review that stuff.

