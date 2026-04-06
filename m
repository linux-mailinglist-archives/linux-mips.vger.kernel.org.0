Return-Path: <linux-mips+bounces-14069-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCg1AYKo02k4kAcAu9opvQ
	(envelope-from <linux-mips+bounces-14069-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 14:35:14 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DFE3A34E7
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 14:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E55A630071DD
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2026 12:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0103382F4;
	Mon,  6 Apr 2026 12:35:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023B73368B0;
	Mon,  6 Apr 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478909; cv=none; b=EbIH6A38RaJTOejMV1NIwbLHjpWmOod7yMd66Zxn+WsEv3rZBe52Zm+oUavaJ8M5HPTKkpB5a48pvtE28+LssYJRuUkkqvFf5spjs89FlNZgc+v4V1enhIugJRxX64YyJBhwaTqSpJU+RuDQm+muFE53ZJz6cHpkY4ct5Bj7iGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478909; c=relaxed/simple;
	bh=vBPIg4H+iweXLC+OcCInTHlCM6AOS6qRwvX8vRHnn/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXhMh0qUOu6knBz95xqcpcvwwb2naOITNGBu1r6Zl/P7FGsEDVxyGEDXMX9cUQjNfLOGwuddkkexsXxvlESeGOWjrTqERcH0RvFX7csBEtRM1dzmmQAsVnKKnn/Uxw1wXaLKZIThsfbFT6tsNbXsqP1GssN4A6xl/2hJAyZc6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w9jAQ-00040x-00; Mon, 06 Apr 2026 14:34:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A998EC0EA5; Mon,  6 Apr 2026 14:33:56 +0200 (CEST)
Date: Mon, 6 Apr 2026 14:33:56 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] MIPS: DEC: Rate-limit memory errors
Message-ID: <adOoNI2MNygS9A7U@alpha.franken.de>
References: <alpine.DEB.2.21.2603281455390.60268@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2603281455390.60268@angie.orcam.me.uk>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-14069-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.577];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86DFE3A34E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 03:49:52PM +0000, Maciej W. Rozycki wrote:
> Hi,
> 
>  A recent failure of one of my systems revealed an issue with memory error 
> logging where the flood of messages produced, which reported corrected ECC 
> errors, made the system unusable despite the errors themselves having been 
> recovered from and the messages serving informational purpose only.
> 
>  I took the opportunity and actually verified the rate-limiting does its 
> purpose with the offending system before cleaning memory module contacts, 
> which has cured the original problem, the third time in ~25 years I've had 
> the system for -- not too bad, but clearly a recurring issue.
> 
>  For consistency I have also updated support for the other two DEC memory 
> system designs, although they're parity-based and therefore memory errors 
> are fatal and consequently less likely to cause a message flood, although 
> in principle still possible where a faulty memory location causes a bus 
> error exception to kill user processes repeatedly.  They seem not to have 
> the issue with memory contacts though, which use the common SIMM design 
> rather than 0.1"-pitch PCB connectors.
> 
>  Please apply.

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

