Return-Path: <linux-mips+bounces-15080-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mxidIIPYL2pOHwUAu9opvQ
	(envelope-from <linux-mips+bounces-15080-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:48:35 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE96685735
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:48:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15080-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15080-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC76E309A636
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 10:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BA733DEFE;
	Mon, 15 Jun 2026 10:44:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC8833F589;
	Mon, 15 Jun 2026 10:43:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520240; cv=none; b=hsLoJJixZ0Qgec613m6aC+7saPaE9ruA3KZRB0SUCQ0mIbXQgNZed5UhgGqunMqze6+T7xn1Jani8PNq42xeBq29yNBhbl240YXFQ9mVM0wNLTYltNFWC7R7MJVDdbJjBL+pHpgpiCq5OBbuRBdSZy8FqUTZW6CoqapObB0+Sn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520240; c=relaxed/simple;
	bh=CvHuvUq3VhVxKI+huI73tbZ5If/qKqZw9tNL5YxdXWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AD2s59sOipOQg6KFI8CbJoLb7eu1sVKunYNCuvibi8/M2rhNsBjACEdTaOOYlOp+jW7tqYnMtB1pOSuHZn3W40tJes1l16z6dGveLvwy4W9wN38w0ZoS+QStHeo4A6TkoxCHTApdAeqyx7dWbfc6vQk6KXPLoJaWgFmUkHOJrG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZ4ey-0000JT-00; Mon, 15 Jun 2026 12:35:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 66FD9C0650; Mon, 15 Jun 2026 12:28:02 +0200 (CEST)
Date: Mon, 15 Jun 2026 12:28:02 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Catalin Iacob <iacobcatalin@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH v4 2/5] mips: Remove remaining defconfig references to
 the pktcdvd driver
Message-ID: <ai_TsvPSc6dUt2-X@alpha.franken.de>
References: <20260608-remove-pktcdvd-references-v4-0-72f88b04cc87@gmail.com>
 <20260608-remove-pktcdvd-references-v4-2-72f88b04cc87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-remove-pktcdvd-references-v4-2-72f88b04cc87@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[franken.de];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15080-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:iacobcatalin@gmail.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:axboe@kernel.dk,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-scsi@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,hansenpartnership.com,oracle.com,kernel.dk,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,alpha.franken.de:mid,alpha.franken.de:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAE96685735

On Mon, Jun 08, 2026 at 05:29:17PM +0300, Catalin Iacob wrote:
> Commit 1cea5180f2f8 ("block: remove pktcdvd driver") left behind some
> CONFIG_CONFIG_CDROM_PKTCDVD references in defconfigs. Remove them.
> 
> Signed-off-by: Catalin Iacob <iacobcatalin@gmail.com>
> ---
>  arch/mips/configs/fuloong2e_defconfig    | 1 -
>  arch/mips/configs/ip22_defconfig         | 1 -
>  arch/mips/configs/ip27_defconfig         | 1 -
>  arch/mips/configs/ip30_defconfig         | 1 -
>  arch/mips/configs/jazz_defconfig         | 1 -
>  arch/mips/configs/malta_defconfig        | 1 -
>  arch/mips/configs/malta_kvm_defconfig    | 1 -
>  arch/mips/configs/maltaup_xpa_defconfig  | 1 -
>  arch/mips/configs/rm200_defconfig        | 1 -
>  arch/mips/configs/sb1250_swarm_defconfig | 1 -
>  10 files changed, 10 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

