Return-Path: <linux-mips+bounces-14719-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPe3A8BzEGoZXgYAu9opvQ
	(envelope-from <linux-mips+bounces-14719-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 17:18:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3135B6C32
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 17:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0026530262F9
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 15:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4105146AEF1;
	Fri, 22 May 2026 15:15:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864D73CC33D;
	Fri, 22 May 2026 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779462923; cv=none; b=ATIP3u65plEQ9cEEHf2qnWzoPA9D46W0ujT7FrLucXm1WyOim5XDnuR1IGyDwghmdT1YvAKRY/LL4lu2pqJAkz8LUgjvOIMysSzgwefk1mmIKxWYTSo2Wc4AGzAkSIS9128OHg9wLsLv4igjJi81Ox6FZ3eXIN/XKXZsHoxssf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779462923; c=relaxed/simple;
	bh=nM0U+b2T/CJ5j7pAUzglayS8uvz77dq7aIX6uTDBgfo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hmf7HVaiO8ePCRTMlh10m1uD/s7Oavh0zzljOEFz8hBeCJ91WQTuEKqGVf+UwPcApFAK+AHOA+3x27Y1JQuArjOv5UaqViDqcN9KjFLNnwQTF2QL887ciq0sV0ofDy4xq5FZuQC96CbAmsN+kWeIZlRtA5g8kP8ggh1AQhXpsu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CED1692009C; Fri, 22 May 2026 17:15:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C8C4D92009B;
	Fri, 22 May 2026 16:15:06 +0100 (BST)
Date: Fri, 22 May 2026 16:15:06 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org, 
    linux-serial@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 00/10] MIPS: DEC: Fix serial device regressions + RTC
 cleanup
In-Reply-To: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2605221609220.1450@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14719-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: BB3135B6C32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

On Wed, 6 May 2026, Maciej W. Rozycki wrote:

>  Two extra introductory changes, 01/10 and 02/10 have now been added to 
> platform code.  No modification has been made to original changes.  The 
> original description follows, updated for patch renumbering.

 Will you be able to get these two changes merged sometime soon now that 
Greg has queued changes 03/10 through 09/10, so that these prerequisites 
land ahead and there's no 64-bit regression in mainline?

 Let me know if you need anything from me here before I disappear for a 
couple weeks in a fortnight's time.

  Maciej

