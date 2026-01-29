Return-Path: <linux-mips+bounces-13044-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLn4Gutje2l2EQIAu9opvQ
	(envelope-from <linux-mips+bounces-13044-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 14:43:07 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7CBB0806
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 14:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F7A7300B191
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jan 2026 13:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9DA3112B7;
	Thu, 29 Jan 2026 13:43:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A533A1CD;
	Thu, 29 Jan 2026 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694185; cv=none; b=HBSL6QnzSAWIk/T5qQC2Nh8HIM/VtOtX+ceu76LRjZBHpFDj7lFp11IQAqp7rjduFaxgznYGF/HXD7qjIhdJWGkJoJzlXgU2Fc0B30m9lEs7y/58Yt+3UnpS8VnhfH+D2oUtW2xO/mZlhN4RlSDFgrEb4KtH+CupfxprPlKbmOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694185; c=relaxed/simple;
	bh=ibKK0IcqWngoOXa8EwyaZZK2r6ZumQd3dGbnqk2e2VM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RJVs3l0/HRnYT/1YLW8/RBfpuPYqDbpByeE91Iql2jTv8r9GcyAssuxk+zLfYs0cZAfdtPhzdyxnEF89vAmwV/3e5R/iGWmyvNDhAWFs2klVa2/yud5GochRilzupX5d18IZEIfnxJfnUgLDC+r5B6h59UnUQm53Qk4dRcAaoIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C51D492009C; Thu, 29 Jan 2026 14:42:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C152692009B;
	Thu, 29 Jan 2026 13:42:53 +0000 (GMT)
Date: Thu, 29 Jan 2026 13:42:53 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jakub Kicinski <kuba@kernel.org>
cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, netdev@vger.kernel.org, 
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
In-Reply-To: <20260127155607.3f80ec99@kernel.org>
Message-ID: <alpine.DEB.2.21.2601290525150.40317@angie.orcam.me.uk>
References: <20260126031352.22997-1-enelsonmoore@gmail.com> <alpine.DEB.2.21.2601270110590.40317@angie.orcam.me.uk> <20260127155607.3f80ec99@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lwn.net,linux.ibm.com,google.com,davemloft.net,redhat.com,kernel.org,alpha.franken.de,ellerman.id.au,lunn.ch,linux-foundation.org,posteo.de,ucw.cz,ti.com,net-swift.com,netfilter.org,suse.de,mit.edu,linux-m68k.org,oracle.com,gondor.apana.org.au,linux.dev,mucse.com,wunner.de,intel.com];
	DMARC_NA(0.00)[orcam.me.uk];
	TAGGED_FROM(0.00)[bounces-13044-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C7CBB0806
X-Rspamd-Action: no action

On Tue, 27 Jan 2026, Jakub Kicinski wrote:

> > > highly unlikely that this driver is still being used. Remove the
> > > driver, and move the former maintainer to the CREDITS file (restoring
> > > credit for the vxge driver, which was removed in commit f05643a0f60b
> > > ("eth: remove neterion/vxge").  
> > 
> >  How do you know it's not used? 
> 
> Hard to prove a negative and whatnot.
> 
> We deleted the vxge which I think(?) was for a newer version of this HW
> 3+ years ago and nobody complained. 

 It may or may not mean anything.  Overall I think it would be fair to 
have a deprecation period of say a year with the affected code guarded 
with CONFIG_DEPRECATED, giving a chance for people downstream to notice 
and act.  That seems to work for the other projects I've been involved 
with (GNU toolchain components and the policy for target removal).

> > What's the gain from removing a driver unless say it's broken and
> > does not build?
> 
> People keep sending cleanups and fixes for these old drivers.
> It takes time to review that stuff.

 Fair point, however the driver has a maintainer listed who should be 
taking care of that.  I can see he was cc'd on v1 but not this revision, 
so does that mean the address bounces?  If so, it should be stated in an
updated change description, and that would certainly be a good reason to 
first deprecate a driver and if no one steps up, then discard it.

  Maciej

