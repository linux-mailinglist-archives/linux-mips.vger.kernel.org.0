Return-Path: <linux-mips+bounces-14763-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E+uBoKzFWpxYAcAu9opvQ
	(envelope-from <linux-mips+bounces-14763-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:51:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF09C5D7F61
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2605301889D
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 14:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D668B3FFAD6;
	Tue, 26 May 2026 14:51:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3623FFABF;
	Tue, 26 May 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807071; cv=none; b=ptf9OoyFMq6UBISoW+CKjA8dycq9hrDQShgxXQZDF0tdT82R+Tpp2eoQAaMpbxoNghVQtyHxsOrsm/qIZpbMYmUPdsVNzTKN1YKnqxzrE9ZcoIgQSFxWUl1KWdAStVuYFZxYXHodeiK2cmvZzsrmqTl1O8PLUVyEIvQkO8bGDWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807071; c=relaxed/simple;
	bh=cWenXFLMKmeC3y25U4Fhwh7pccjCy2v6ru88HiYYOrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOx7W5R79xETaHZfYL7eZOUyACAaONaOmh2a8qq7H6P6tVaX1wm65B1YJL8QrT9mt80opRgo3oCa1N/waKv++6lEPp+mPtGpxadsdNU+z8dGnZzm6h254LcpEFZYggunfXwvCDVN5YL78hzZmw6WTF/CeLksfqKPZwvTFBN1wKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7c-00015T-00; Tue, 26 May 2026 16:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7E58EC06AC; Tue, 26 May 2026 16:44:14 +0200 (CEST)
Date: Tue, 26 May 2026 16:44:14 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix big-endian stack argument fetching in o32
 wrapper
Message-ID: <ahWxvsiqlhwYFrkw@alpha.franken.de>
References: <alpine.DEB.2.21.2604302350440.38805@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2604302350440.38805@angie.orcam.me.uk>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.988];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-14763-lists,linux-mips=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: AF09C5D7F61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 02, 2026 at 12:14:20AM +0100, Maciej W. Rozycki wrote:
> Fix an issue in call_o32() where the upper 32-bit half of incoming n64 
> stack arguments is fetched and used for outgoing o32 stack arguments on 
> big-endian platforms.
> 
> This code was adapted from arch/mips/dec/prom/call_o32.S which was meant 
> for a little-endian platform only and therefore using 32-bit loads from 
> 64-bit stack slot locations holding incoming stack arguments resulted in 
> correct values being retrieved for data that is expected to be 32-bit.  
> 
> This works on little-endian platforms where the lower 32-bit half of the 
> 64-bit value is located at every 64-bit stack slot location.  However on 
> big-endian platforms the lower 32-bit half is instead located at offset 
> 4 from every 64-bit stack slot location.
> 
> So to fix the issue the offset of 4 would have to be used on big-endian 
> platforms only, or alternatively a 64-bit load from the 64-bit stack 
> slot location can be used across the board, as the subsequent 32-bit 
> store to the corresponding outgoing stack argument slot will correctly 
> truncate the value and cause no unpredictable result.  We already take 
> advantage of this architectural feature for the incoming arguments held 
> in $a6 and $a7 registers, since the o32 wrapper does not know how many 
> incoming arguments there are and consequently propagates incoming data 
> which may not be 32-bit.
> 
> Since this code is generally supposed to be used with the stack located 
> in cached memory there is no extra overhead expected for 64-bit loads as 
> opposed to 32-bit ones, so pick this variant for code simplicity.
> 
> Fixes: 231a35d37293 ("[MIPS] RM: Collected changes")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
>  arch/mips/fw/lib/call_o32.S |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

