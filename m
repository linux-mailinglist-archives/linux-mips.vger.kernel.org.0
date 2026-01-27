Return-Path: <linux-mips+bounces-13010-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zDjmA7USeGkjnwEAu9opvQ
	(envelope-from <linux-mips+bounces-13010-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 02:19:49 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 592158EA6B
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 02:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 936043013691
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 01:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14ED0239E7D;
	Tue, 27 Jan 2026 01:19:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F0A1FF1B5;
	Tue, 27 Jan 2026 01:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476786; cv=none; b=Cu4z22h5TArDV7YOWUjeh2l1SZgIZk6hzBDfxDJQDCMeYu/vbovw8J5awEV1iGX0CP3uN7uet1y0mQHAiJ+ld95trSaxK17Fmj7ySAUdd8PajHp1tEQTMnf53/ck66tAJKCuI7hArro3R0gQy4DLWFoKz+ytShQ5fwbj/3wrFWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476786; c=relaxed/simple;
	bh=ssCiDavxKEbwZwVsjiEsnnR//r40IO9WyiCR/IKIQwg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tPXS0nAM2gcDjy7eD6b101Cg4JZHQOE6bvJyV5ExyGyqyW8q6tzixlhrnNr5ynylbbl306I/MriDn+/cdt1FQVyY+6JAl3Ryl1FNEoiJVUhT/RWSkUrit/X+L5pENJSt47JY8GBsuWpw08UGKFqNTJ+RK9pcj80u0UkEwznfMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5922092009C; Tue, 27 Jan 2026 02:19:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5181F92009B;
	Tue, 27 Jan 2026 01:19:34 +0000 (GMT)
Date: Tue, 27 Jan 2026 01:19:34 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
    linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
    Linas Vepstas <linasvepstas@gmail.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
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
In-Reply-To: <20260126031352.22997-1-enelsonmoore@gmail.com>
Message-ID: <alpine.DEB.2.21.2601270110590.40317@angie.orcam.me.uk>
References: <20260126031352.22997-1-enelsonmoore@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-13010-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,gmail.com,linux.ibm.com,google.com,davemloft.net,kernel.org,redhat.com,alpha.franken.de,ellerman.id.au,lunn.ch,linux-foundation.org,posteo.de,ucw.cz,ti.com,net-swift.com,netfilter.org,suse.de,mit.edu,linux-m68k.org,oracle.com,gondor.apana.org.au,linux.dev,mucse.com,wunner.de,intel.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 592158EA6B
X-Rspamd-Action: no action

On Sun, 25 Jan 2026, Ethan Nelson-Moore wrote:

> The s2io driver supports Exar (formerly Neterion and S2io) PCI-X 10
> Gigabit Ethernet cards. Hardware supporting PCI-X has not been
> manufactured in years. On x86, it was quickly replaced by PCIe. While
> it stuck around longer on POWER hardware, the last POWER hardware to
> support it was POWER7, which is not supported by ppc64le Linux
> distributions. The last supported mainstream ppc64 Linux distribution
> was RHEL 7; while it is still supported under ELS, ELS is only
> available for x86 and IBM Z. It is possible to use many PCI-X cards in
> standard PCI slots (which are still available on new motherboards), but
> it does not make sense to do so for 10 Gigabit Ethernet because the
> maximum bandwidth of standard PCI is only 1067 Mbps. It is therefore

 However 64-bit PCI at 66MHz will let you reach 4 times as much.  Also 
PCI-X can be bridged from PCIe or HT.

> highly unlikely that this driver is still being used. Remove the
> driver, and move the former maintainer to the CREDITS file (restoring
> credit for the vxge driver, which was removed in commit f05643a0f60b
> ("eth: remove neterion/vxge").

 How do you know it's not used?  What's the gain from removing a driver 
unless say it's broken and does not build?

  Maciej

