Return-Path: <linux-mips+bounces-14006-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GOQNIqAzWlveQYAu9opvQ
	(envelope-from <linux-mips+bounces-14006-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Apr 2026 22:31:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D080A380301
	for <lists+linux-mips@lfdr.de>; Wed, 01 Apr 2026 22:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A1793008D2A
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2026 20:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F21E33B97D;
	Wed,  1 Apr 2026 20:30:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5B123D7DF;
	Wed,  1 Apr 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075456; cv=none; b=B87NCrLipBa2DGaeyKS0LUSiy9eP0yKxhKN4Moul0ZuscP3PrUVm3o+6++2J6qn8gybiqo2+NBb+/V1lM2QDOjo+/qnSUfjgfeMDVI/KMaoOuBNFK79+ltOsV2W0ldteb94hc1DbHSiO8mTiFR+pzLMVGKF8mYGc/VjFs63ohmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075456; c=relaxed/simple;
	bh=xviB7VE8lSbReotwgH4meCqTzTGCKs6nWjk9crlRYs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkfKdl1ZPubf6z44BvmxzvPgRAVm0afGEZeHhv09xeA210y/58gi5xOeiQxbuhrsroMEfNMhu8+q2gKVN92IFmn3fDFlFEaEGgzKDFvm03VsqCy6PtgzWGKFUTXSCpv38EYnWufPFgM+quSapGzNV1xxiLh1nzngpYkPVtgvU8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w82D7-0008HB-00; Wed, 01 Apr 2026 22:30:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 891B7C0CA1; Wed,  1 Apr 2026 22:29:48 +0200 (CEST)
Date: Wed, 1 Apr 2026 22:29:48 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Huth <thuth@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Waldemar Brodkorb <wbx@openadk.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] MIPS: Avoid a TLB shutdown induced by a hidden TLB
 entry bit
Message-ID: <ac2APKPkBRPAcUtT@alpha.franken.de>
References: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,redhat.com,linaro.org,gmail.com,flygoat.com,openadk.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	TAGGED_FROM(0.00)[bounces-14006-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D080A380301
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 06:57:10PM +0000, Maciej W. Rozycki wrote:
> Hi,
> 
>  This is a reimplementation of initial TLB entry uniquification so as to 
> address an issue with processors that implement a hidden TLB entry bit 
> triggered by commit 9f048fa48740 ("MIPS: mm: Prevent a TLB shutdown on 
> initial uniquification") for platforms that hand the TLB over unchanged 
> from reset.
> 
>  This has been verified across the following systems:
> 
> - DECstation 5000/150, R4000SC MIPS III CPU, SEGBITS == 40, 48-entry TLB, 
>   32-bit kernel,
> 
> - Broadcom BCM91250A, BCM1250 MIPS64 CPU, SEGBITS == 44, 64-entry TLB, 
>   64-bit kernel,
> 
> - MIPS Malta, 74Kf MIPS32r2 CPU, SEGBITS == 31, 64-entry TLB, 32-bit 
>   kernel.
> 
> A debug change was used to verify the TLB is initialised as expected.
> 
>  See individual commit descriptions for details.
> 
>  I consider this code ready to use, but given the diversity of TLB designs 
> with MIPS architecture processors I will appreciate verification across 
> various actual hardware, particularly in preparation for backporting, as 
> this addresses a serious regression for a subset of systems.
> 
>  Please apply otherwise.  Thank you for patience waiting for this fix.

series applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

