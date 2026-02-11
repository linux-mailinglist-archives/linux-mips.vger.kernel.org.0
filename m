Return-Path: <linux-mips+bounces-13169-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD1HFE9wjGlsoAAAu9opvQ
	(envelope-from <linux-mips+bounces-13169-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 13:04:31 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C524412412C
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 13:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6A213013720
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 12:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2241F17B505;
	Wed, 11 Feb 2026 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dominikbrodowski.net header.i=@dominikbrodowski.net header.b="jTgTQfyk"
X-Original-To: linux-mips@vger.kernel.org
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E37280A5B;
	Wed, 11 Feb 2026 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.243.71.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770811469; cv=none; b=aRR0B+Ogps+uXFLqnB6PMbuSHGXJ6etpmWwS0OOo0SOPPdRtbBI/J9g0d3h6K8vYxp5Ywx1UVTKqFeu1nTRiPuEV89Z7Ocox6rjbsYpAeuAiVNxxirV7SSCLdrGWI77TeQF7IXlj05VNDkcIcdOhVxrTl/5YDCu93rAqlQLg4v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770811469; c=relaxed/simple;
	bh=F5ocLiFb5PagaCJNTCTkOoYR8su+CxhPpODAa4a2U68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQ3wsPDDyZIikXJcvV4Ndrm+it1q1XwnuGq1kZEdQ4aLbSy7SC9dOiggCy7MOAC+Ja+3oohVLZfFq1EkCeEi/eUVq8bT5Kia8mumZRnaQSCRvHXVAtcLvl740Tv1YfT75ibjwyTyOGVyGVvlfyKP7Gh3pzhJgxjWEAf4NRyqRS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dominikbrodowski.net; spf=pass smtp.mailfrom=dominikbrodowski.net; dkim=pass (2048-bit key) header.d=dominikbrodowski.net header.i=@dominikbrodowski.net header.b=jTgTQfyk; arc=none smtp.client-ip=136.243.71.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dominikbrodowski.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dominikbrodowski.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dominikbrodowski.net;
	s=k25.isilmar-4; t=1770810959;
	bh=F5ocLiFb5PagaCJNTCTkOoYR8su+CxhPpODAa4a2U68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jTgTQfyk6DGXiB6SilnA7QB+cED1F8DbgS8ibkkK8UXVYDVfrN+rBg5r0xCVxDzkd
	 9R976RUlE5fn1V7Rfw3wLoE1fDG0RRvgjjP0//vNgDu8Yh5xzyy7Ze7iLuA8oYpRPx
	 36/DviW67q9k704KNQh5o5xadJHyLqAMzkuXppIHIvdwCX4gjpiC/GfVTQpDC3tkzO
	 2znC1pjOuu/lJgsFL/KY2AtuLyJZC16qktwHOv3b7cZu4tle29uqd6NUitUM9VXCs5
	 M1P4eeMaQ9FI3kLXWCusR8U9RT3pc0thP2a7ol/dcyvYk0xuhQHbkuQTLgAo8Qnk+6
	 fSkTTJWf4Xy2g==
Received: from scops.dominikbrodowski.net (unknown [10.2.0.113])
	by isilmar-4.linta.de (Postfix) with ESMTPSA id 58AE020033E;
	Wed, 11 Feb 2026 11:55:59 +0000 (UTC)
Received: by scops.dominikbrodowski.net (Postfix, from userid 1000)
	id 366CA80054; Wed, 11 Feb 2026 11:02:27 +0100 (CET)
Date: Wed, 11 Feb 2026 11:02:27 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	Ondrej Zary <linux@rainbow-software.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Theodore Ts'o <tytso@mit.edu>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>, Paul Moore <paul@paul-moore.com>,
	Simon Horman <horms@kernel.org>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [RFC PATCH] bluetooth: remove all PCMCIA drivers
Message-ID: <aYxTsxNj2NLj8I6y@scops.dominikbrodowski.net>
References: <20260211082246.41148-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211082246.41148-1-enelsonmoore@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[dominikbrodowski.net:s=k25.isilmar-4];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13169-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[dominikbrodowski.net];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,rainbow-software.org,armlinux.org.uk,kernel.org,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,holtmann.org,gondor.apana.org.au,oracle.com,mit.edu,linaro.org,linux-foundation.org,cmpxchg.org,linux.dev,paul-moore.com,schaufler-ca.com,google.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@dominikbrodowski.net,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[dominikbrodowski.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,dominikbrodowski.net:email,dominikbrodowski.net:dkim,scops.dominikbrodowski.net:mid]
X-Rspamd-Queue-Id: C524412412C
X-Rspamd-Action: no action


Am Wed, Feb 11, 2026 at 12:22:04AM -0800 schrieb Ethan Nelson-Moore:
> PCMCIA is almost completely obsolete (the last computers supporting it
> natively were from ~2009), and the general consensus [1] seems to be
> that support for it should be gradually removed from the kernel.
> 
> In 2023, an initial step of removing all the PCMCIA char drivers was
> taken in commit 9b12f050c76f ("char: pcmcia: remove all the drivers"),
> and that has not been reverted, so it seems logical to continue this
> process by removing more low-hanging fruit.
> 
> These three Bluetooth drivers have had no meaningful changes since
> their status was discussed in 2022 [2], and are unlikely to have any
> remaining users. The latest functional change to any of them was a
> patch to bluecard_cs to fix LED blinking behavior in 2017. The other
> two drivers have not had any meaningful changes made since 2007. Remove
> them.
> 
> Note that even with these drivers removed, it is still possible to use
> other PCMCIA Bluetooth cards that present themselves as a standard
> serial port via serial_cs and hciattach while the serial_cs driver is
> still present.
> 
> [1] https://lore.kernel.org/all/c5b39544-a4fb-4796-a046-0b9be9853787@app.fastmail.com/
> [2] https://lore.kernel.org/all/Y07d7rMvd5++85BJ@owl.dominikbrodowski.net/
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Which tree will this go through?

Thanks,
	Dominik

