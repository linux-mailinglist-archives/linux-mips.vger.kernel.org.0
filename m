Return-Path: <linux-mips+bounces-14138-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOE6Hb8Z3WkJaAkAu9opvQ
	(envelope-from <linux-mips+bounces-14138-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 18:28:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEED73EF093
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 18:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C49F30B5877
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 16:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF6F25DB12;
	Mon, 13 Apr 2026 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tkXY4nmg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LoVkYl6M"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B4D27280A;
	Mon, 13 Apr 2026 16:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096840; cv=none; b=Wry15LH1col0G4YMvUR9StcwKBHNuHgUO7j6u0+L/FltqJjzJ3YmoBP+C1+Mj8p+yas9XnZr9Or6R4ny6ODsLvxy92lGy5XE34iVxRXwq8N1jtH6XZ/4qNl4vt+w0aakxGX18vAd6zRsE2VxpGN5aSfTq6MDENqqQ7os1HUvVM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096840; c=relaxed/simple;
	bh=YEGAsuIFlSK4e89HOWZ4gJ5oIe5U2yJXD8/MCew1HRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUzejb9RNdc1zYHfW1g4la53QCnaRmdN1TBMBxuEtFPkqWrkNG/2zWJpWZDuhwCXDbMXAxH2dVXNySb6862Uawwl6eXgDYiEv+c3ICRGPBCvZCTgWGWTbFLVon0H8H8/KLczC/f3jPD8IDbMbdt99GJK8YJabbYMgrXYD0iUVBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tkXY4nmg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LoVkYl6M; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 13 Apr 2026 18:13:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776096838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QTxZjlPwQbG3YSd8NjMQF965BtCe0lPqly+S72Myshs=;
	b=tkXY4nmg+ufLH8pIEREGPRIN7lEqDgcVyS4rMzP1pwHp3yL9b7kXJNaCAOrhLb02cE7TGx
	ggSSsIsYsGtFlAqRc8UG2XgBwu4Qk7X16r+d5lL2igIBjpcbMUvCVDWy7ZLItlTIXxZD2z
	h84JvMJNCIi1kvdvkxIIavJgYl+u/z8BcToeOgc+aJOW6lKeBrGdb3kEMvdFXGg6XytgEk
	rPMpXXME1ph1vQl4s9O5z+BEsC7htoA6IsUN921QvLHj7U4PfLX+8Y45VLFAq5AKYwtmoY
	FG1tRrjVloQGmzZUNVRNkeyCEHHE5ks19vbY61zf1F/NW+xmp2dLuPlt0SZxoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776096838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QTxZjlPwQbG3YSd8NjMQF965BtCe0lPqly+S72Myshs=;
	b=LoVkYl6MMLeNBjAM4BvQVhVn1NnaY+OSsVvNNOBvu1HsCV87BqTgHRgkWFHBm1kAvMqe5B
	HVlxTATbwykTSSCg==
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
Message-ID: <20260413180541-e13f374c-b990-4236-bc83-8fde948899df@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
 <20260410091131-46b6354c-9d06-4e47-9345-ee224d8528f7@linutronix.de>
 <15925544-1ae5-406a-b9cc-af5935cc9f02@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15925544-1ae5-406a-b9cc-af5935cc9f02@app.fastmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14138-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Queue-Id: DEED73EF093
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 05:59:52PM +0200, Arnd Bergmann wrote:
> On Fri, Apr 10, 2026, at 09:24, Thomas Weißschuh wrote:

(...)

> > Recap/Proposal:

(...)

> > * Always provide settimeofday(). If CONFIG_COMPAT_32BIT_TIME is *not*
> >   set, reject passing any 'tv' argument where it may not be y2038 safe.
> 
> This sounds wrong to me now: the case I'm worried about is a 32-bit
> system calling settimeofday() based on the value of an RTC or NTP.
> The idea of CONFIG_COMPAT_32BIT_TIME=n is to catch this by causing
> an intentional ENOSYS error even for valid times, so it doesn't
> suddenly start breaking in 2038.

This is what I meant with "where it *may*" be not y2038 safe.
Even if the value fits, the call would be rejected.
My wording was crappy indeed, though.

In code:

if (tv && !IS_ENABLED(CONFIG_COMPAT_32BIT_TIME) && sizeof(tv->tv_sec) < 8) {
	pr_warn_once(...);
	return -EINVAL;
}

Or maybe drop the EINVAL but still emit a warning. That warning would be
useful for gettimeofday(), too.

Thomas

