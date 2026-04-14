Return-Path: <linux-mips+bounces-14141-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FahHhwU3mlBmwkAu9opvQ
	(envelope-from <linux-mips+bounces-14141-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 12:17:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE03F888A
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 12:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2809300F11E
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 10:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8075E303CAB;
	Tue, 14 Apr 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OSiqxWwo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M7Iqvv7a"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFEF38F62A;
	Tue, 14 Apr 2026 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161816; cv=none; b=CitQAk41oQxtz5YY+qpiV2TAlmHECK9aklxEPZEASA0i6c3vHz5KJ9TYcCitih4p2hJBkjIqzSsbN5RAdbaagKRg2qWZWqxf+SucNHueUWJC/HeO45PyTzK2JECWbdzN+O7ctjR7PHeDCFuI5pw0PEabPUm6TUMcFm7oc0qQOhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161816; c=relaxed/simple;
	bh=STvLb1j4bAVjgTtL1DKdc+anp0JioeV+OKz220hDD0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAf/+D8fgWhQqfRPLmWEQHVpwSNtr3W/evOIWIBv4KyZwRiB7f+tscBctSyB6pqRK6uomSXNGVl6kQ0qS4R4GVWfaomiQZTQZIehx5l5G/IRoq3HdMBFcAAVD9lLFSm9yR2NYhozMGC4/dVZ/W+3gappK8tIMeFlPwUNbJ7ChYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OSiqxWwo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M7Iqvv7a; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 14 Apr 2026 12:16:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776161811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiErSfuvJerZIQ4L+JF5tzrkBbOhwbYuWVg9ZYwOn2Q=;
	b=OSiqxWwog8Eyo5f66GW9p/l3q7TUrwpoIhrfJTw1X9DwXVATfIR9taZHEoi2HlR1g93VOJ
	eWDOYZFl9F7WspBEmNsFtXcOp7KlR84eLbwD94B1YXA/2DperGZ+c2FryF4Vkagz0HohfD
	H4Iwp6tgQJHAeYDhYNpAFW8TOIJpoZDAl6g3jq+josSBCcV8cQmHyl2aYHQ3f+/agOFmuj
	8cRkDhm+/y6dcV4xI2TF9VXKk37gtYgHC/6VtixvpKy4MVxbp+otsY11rquc2cydJJTitW
	d5YHjEvCWtOUvedgzu4xwx1jPp2fPPB6TxTX1g80dUPcZ96+w3zRG2fwJZE+0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776161811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiErSfuvJerZIQ4L+JF5tzrkBbOhwbYuWVg9ZYwOn2Q=;
	b=M7Iqvv7amB/lm/Bd9iU0BxSxraoC4Y4+3sMwzQ/SGLGAc2KrGilQkv7tAoHXQw2xoJuVJv
	+oP09+VAFyvd00DQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260414121405-29c9514e-590c-404e-a31d-905b1848afb4@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
 <20260410091131-46b6354c-9d06-4e47-9345-ee224d8528f7@linutronix.de>
 <15925544-1ae5-406a-b9cc-af5935cc9f02@app.fastmail.com>
 <20260413180541-e13f374c-b990-4236-bc83-8fde948899df@linutronix.de>
 <e9487ebe-3730-438a-9c23-e45f75986ecc@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9487ebe-3730-438a-9c23-e45f75986ecc@app.fastmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14141-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[zytor.com,kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Queue-Id: 51AE03F888A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 06:57:57PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 13, 2026, at 18:13, Thomas Weißschuh wrote:

(...)

> > if (tv && !IS_ENABLED(CONFIG_COMPAT_32BIT_TIME) && sizeof(tv->tv_sec) < 8) {
> > 	pr_warn_once(...);
> > 	return -EINVAL;
> > }
> >
> > Or maybe drop the EINVAL but still emit a warning. That warning would be
> > useful for gettimeofday(), too.
> 
> We discussed this during the original y2038 work and decided
> at the time to not have those warnings for syscalls. We could
> bring that back, but I think I would want one level of abstraction
> there and control this using a global Kconfig switch for all
> syscalls as well as ioctl commands that could use such a check.

I'd like to avoid another kconfig option. Linus doesn't sound too
excited about those [0].


Thomas

[0] https://lore.kernel.org/lkml/CAHk-=whigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk+XDssHU0A@mail.gmail.com/

