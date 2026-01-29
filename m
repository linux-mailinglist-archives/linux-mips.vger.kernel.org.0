Return-Path: <linux-mips+bounces-13045-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDdTOfxke2l2EQIAu9opvQ
	(envelope-from <linux-mips+bounces-13045-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 14:47:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56590B08F2
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 14:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F59F303AA93
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 13:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7D7309F00;
	Thu, 29 Jan 2026 13:44:48 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F912EBBA4;
	Thu, 29 Jan 2026 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694288; cv=none; b=WkMvCjEyOwP2GB5m1cWMT6a+lzBgsuvMIGxiIuOgiDpuourL3rLM8FIhK1ODj488YgUMeRJWQSPe7XmrIzZp046aB8LCuHgBGsXUWPSx5rWgf4mAGpBEKs1SB5LOb/pGACd2per1NHs3KQMEQG4HkhN/HgvVTzsDJeSMjq3TyUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694288; c=relaxed/simple;
	bh=TGYpPA+oEoj/iGBTPmevIonf4yZKGpNJK/MyC5lSJh0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cEAuBPgZZX5IohkgYcO1E6gj7TYoR217CIiCz+4yq0UbrGV0cHOUwnwnbjh+bUS5QSiZJIfSHr+UKfOI7g0j5oM9yFEggVkPKt93Flk2D6jQKs9iusIi9h07kwmjHFPnCi1Jm+XYC8Pon/QUbGYuYyggUuknBOTkGmyY2n1Ib8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7F37392009C; Thu, 29 Jan 2026 14:44:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 77BA392009B;
	Thu, 29 Jan 2026 13:44:44 +0000 (GMT)
Date: Thu, 29 Jan 2026 13:44:44 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, 
    linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
    Jonathan Corbet <corbet@lwn.net>, Linas Vepstas <linasvepstas@gmail.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
    Simon Horman <horms@kernel.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
    Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Sven Schnelle <svens@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    =?UTF-8?Q?Martin_Kepplinger-Novakovi=C4=87?= <martink@posteo.de>, 
    Pavel Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>, 
    Mengyuan Lou <mengyuanlou@net-swift.com>, 
    Pablo Neira Ayuso <pablo@netfilter.org>, Takashi Iwai <tiwai@suse.de>, 
    Huacai Chen <chenhuacai@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
    Eric Biggers <ebiggers@google.com>, 
    Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
    Shrikanth Hegde <sshegde@linux.ibm.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Ard Biesheuvel <ardb@kernel.org>, 
    "Martin K. Petersen" <martin.petersen@oracle.com>, 
    Frederic Barrat <fbarrat@linux.ibm.com>, 
    Andrew Donnellan <ajd@linux.ibm.com>, 
    Herbert Xu <herbert@gondor.apana.org.au>, 
    Konstantin Shkolnyy <kshk@linux.ibm.com>, 
    Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
    Lorenzo Bianconi <lorenzo@kernel.org>, 
    Lukas Bulwahn <lukas.bulwahn@redhat.com>, Dong Yibo <dong100@mucse.com>, 
    Heiner Kallweit <hkallweit1@gmail.com>, Thomas Gleixner <tglx@kernel.org>, 
    Ingo Molnar <mingo@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
    Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Subject: Re: [PATCH net-next v2] net: ethernet: neterion: s2io: remove unused
 driver
In-Reply-To: <CADkSEUjfBQLqibc2zrcWHhOwu7kUf8FceYDfevAFHV4rCqsUUQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2601290525190.40317@angie.orcam.me.uk>
References: <20260126031352.22997-1-enelsonmoore@gmail.com> <alpine.DEB.2.21.2601270110590.40317@angie.orcam.me.uk> <20260127155607.3f80ec99@kernel.org> <CADkSEUjfBQLqibc2zrcWHhOwu7kUf8FceYDfevAFHV4rCqsUUQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13045-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lwn.net,gmail.com,linux.ibm.com,google.com,davemloft.net,redhat.com,alpha.franken.de,ellerman.id.au,lunn.ch,linux-foundation.org,posteo.de,ucw.cz,ti.com,net-swift.com,netfilter.org,suse.de,mit.edu,linux-m68k.org,oracle.com,gondor.apana.org.au,linux.dev,mucse.com,wunner.de,intel.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[55];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: 56590B08F2
X-Rspamd-Action: no action

On Wed, 28 Jan 2026, Ethan Nelson-Moore wrote:

> > We deleted the vxge which I think(?) was for a newer version of this HW
> > 3+ years ago and nobody complained.
> Yes, it was for the newer PCIe version of this hardware. Since no one
> complained about that (unlike when fealnx and sundance were removed
> and then restored on request), it's even less likely someone is using
> the PCI-X version. FWIW, 64-bit PCI and 66MHz PCI are even rarer than
> PCI-X, so there's basically no way to use this card with reasonable
> performance nowadays.

 Well, I have a system with 64-bit/66MHz 3.3V PCI slots, so I could use 
the network card right away if I had one (I prefer FDDI though, works 
nicely for my intranet).  Something being rare does not mean no one has a 
use for it.

> > > What's the gain from removing a driver unless say it's broken and
> > > does not build?
> It very well might be broken. When vxge was removed it emerged that
> someone had reported it as having last worked in 4.1 and broken
> somewhere between there and 4.4 - see:
> https://bugzilla.kernel.org/show_bug.cgi?id=197881

 Now, that's surely a good argument in favour to removal, although a 
single report might be too little, as it could be an odd combination of 
the system and the option rather than the driver being outright broken.
In any case I think it should be mentioned in the commit description.

  Maciej

