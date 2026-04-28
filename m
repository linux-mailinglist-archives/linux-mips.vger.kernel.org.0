Return-Path: <linux-mips+bounces-14382-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JYPOdu88Gk9YAEAu9opvQ
	(envelope-from <linux-mips+bounces-14382-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2026 15:57:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC9A486676
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2026 15:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C87DD308628B
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2026 13:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6A640FD9D;
	Tue, 28 Apr 2026 13:50:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D0340FDA4;
	Tue, 28 Apr 2026 13:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384202; cv=none; b=dzdQmrTNs2sIrIAXSmc7YrYgkD7aHOvF9rsP1o1isV9X18XmpDjYpsIM4S1U6avNWldeEdbYGg0fcxmRhK9q8k47E6yKjLfwl+4mDf3PH1apEd9w3+zrwUI5kzyYB1EyTjp5+NTjNGXtRqf3WSTHRFRFQ9Vub6EyZ3IiX+KDulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384202; c=relaxed/simple;
	bh=Yul00JZr3xk9/sL+/4OeGpEpvQSal9RZ2J5klF+bOxs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cQ6LWNa/szbnuShVNnquTIdT3DC6ifnwo9nx/uyjQJi+Q+dE2stTfZDXyQPckMeHtCDMngwq4wpIG5//9tW2ofEVEshbk5OH1WRlIwrDbIJ1YBNknUXu2sneUaHMN3swrUUBAS4C0xtOE/OyynP25NyFrQiatA9vsxVUE/ugqiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CFF3A9200B4; Tue, 28 Apr 2026 15:49:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C98D292009D;
	Tue, 28 Apr 2026 14:49:51 +0100 (BST)
Date: Tue, 28 Apr 2026 14:49:51 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: Re: [PATCH 6/8] serial: zs: Convert to use a platform device
In-Reply-To: <alpine.DEB.2.21.2604110034160.29980@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2604281415030.38805@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2604102250060.29980@angie.orcam.me.uk> <alpine.DEB.2.21.2604110034160.29980@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 6FC9A486676
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14382-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[angie.orcam.me.uk:server fail,sto.lore.kernel.org:server fail];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.937];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[angie.orcam.me.uk:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Mon, 13 Apr 2026, Maciej W. Rozycki wrote:

> An unfortunate consequence of the switch to a platform device is we now
> hand the console over from the bootconsole much later in the bootstrap.
> The firmware console handler appears good enough though to work so late
> and in particular with interrupts enabled.

 Additional verification revealed actual fallout from this postponement of 
console switching, where the kernel hangs in the 64-bit configuration at:

pid_max: default: 32768 minimum: 301

or somewhat later, but always before:

cblist_init_generic: Setting adjustable number of callback queues.

I have tracked down the cause to be the initial console output handler now 
being called from other kernel threads beyond the initial one, and unlike 
the latter they have their stack allocated in 64-bit XKPHYS segment rather 
than 32-bit compatibility CKSEG0 segment.

 Consequently the stack pointer is no longer a 32-bit value and when the 
firmware console output handler being called uses 32-bit ALU operations to 
manipulate the stack pointer, the calculated result is incorrect (in fact 
in the 64-bit MIPS ISA it is UB for almost all 32-bit ALU operations to 
execute on 64-bit data) and control goes astray.

 We already have code in the generic call_o32() 32-bit firmware call stub 
for 64-bit code to do optional stack switching, so all that has to be done 
is making the platform supply the stub with a pointer to an alternative 
stack located in CKSEG0, such as to a chunk of initdata space.  This will 
be straightforward to implement; I'll yet think whether to arrange for the 
stack to be switched every time or only when the incoming stack pointer is 
outside the 32-bit space.

 In any case I'll respin the series shortly so as to include the platform 
update required and prevent an unnecessary maintenance complication from 
happening that a standalone fix would cause.

 The other driver never runs on 64-bit hardware, so it causes no issue.

  Maciej

