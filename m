Return-Path: <linux-mips+bounces-15174-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ugUkCUWcOmpyBggAu9opvQ
	(envelope-from <linux-mips+bounces-15174-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 16:46:29 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B2F6B801C
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 16:46:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15174-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15174-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 181BE303C8F1
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 14:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390063A6F1B;
	Tue, 23 Jun 2026 14:46:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF7E363C6B;
	Tue, 23 Jun 2026 14:46:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225987; cv=none; b=TGtiLuQBwcJnW+nGL6xX5Bzcht2vKzAIvpleIQIBqLuBrNTuX6gUEHfHeRzUC/T1tqRJM6LaGRGVGjXTfXSzNkz4fAR+8yEh9kkx7A7mF3e5Gq/77ivBuIVAg7bFFGHWSVUyafHkWA47F5wSLFgBOtnSWx0OdFRyuavzyfSwPgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225987; c=relaxed/simple;
	bh=OxkK1z+xWbkxXuAzONXcUIzcOp0u1A+Z+7OOe3jTQck=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sWIfxJecSH83NIs0NThMvgCQN/Np4UtYaI4dRfGWjQtxKcG3xbXdOwkIk3EUxhXx8K4QfWta6GFC5AQvwqWhcZ5Rt8xA4EmiFt+/Q8jp4P0LUlJcKTRqy7A7XfS5j0kTdgSRApH5S25KwzwjqwIr5HXnwp8msCyxfRZXnqvaFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 934AA92009C; Tue, 23 Jun 2026 16:39:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 90B7F92009B;
	Tue, 23 Jun 2026 15:39:57 +0100 (BST)
Date: Tue, 23 Jun 2026 15:39:57 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@aosc.io>
cc: guanwentao@uniontech.com, linux-kernel@vger.kernel.org, 
    linux-mips@vger.kernel.org, niecheng1@uniontech.com, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, wangyuli@uniontech.com, 
    zhanjun@uniontech.com
Subject: Re: Gentle ping: [PATCH v2 0/6] MIPS: Resolve build problems on
 decstation_64
In-Reply-To: <20260623132631.480565-1-wangyuli@aosc.io>
Message-ID: <alpine.DEB.2.21.2606231518110.58268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2507071545400.56608@angie.orcam.me.uk> <20260623132631.480565-1-wangyuli@aosc.io>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15174-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	FORGED_RECIPIENTS(0.00)[m:wangyuli@aosc.io,m:guanwentao@uniontech.com,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:niecheng1@uniontech.com,m:tsbogend@alpha.franken.de,m:wangyuli@uniontech.com,m:zhanjun@uniontech.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1B2F6B801C

Hi WangYuli,

> I happened to notice that part of this patch series appears to have made
> its way upstream via a separate submission, with you listed as the
> author, and has since been picked up by Thomas.
> 
> Link: https://lore.kernel.org/all/ahWx0vtGim1VlHc7@alpha.franken.de/
> 
> That was, I have to say, a rather unexpected way for those patches to
> make progress. Since you have already found time to handle that part of

 Aww, I have duplicated your effort it would seem and came up with an 
almost identical change (which sort of proves the obviousness), which I 
needed to make my life easier with the verification of the serial driver 
fixes I have recently made to make the platform usable again.

 My apologies to appear unfair to you.  Sadly I have lost track of your 
submission (which has sat in my inbox along with other 20k+ old messages) 
and genuinely wrote this stuff from scratch.

 Your addition of:

#include <linux/interrupt.h>

to arch/mips/include/asm/dec/reset.h is still in principle required for 
the `irqreturn_t' data type to be directly pulled, as pointed out by AI 
review, so it's a good opportunity to have it applied on top.

> the series, I would be grateful if you could also review the remaining
> patches, which fix the build failures triggered by using clang together
> with -Werror.

 I'm coming back after a fortnight away on holiday and still catching up, 
but will get back to your patches ASAP now that I'm back in business with 
this DEC stuff.  Sadly one machine's PSU has fried in the course of final 
verification of serial driver fix backports, so I'll have to set some time 
aside in July to get the unit (hopefully) repaired.

 Please ping again if I don't come back by mid July.  Thank you for your 
patience and understanding.

  Maciej

