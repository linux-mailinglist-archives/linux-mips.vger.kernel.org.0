Return-Path: <linux-mips+bounces-14767-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBNOGKOzFWpCYQcAu9opvQ
	(envelope-from <linux-mips+bounces-14767-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:52:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADB65D7FA6
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44D583014823
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 14:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BED740242F;
	Tue, 26 May 2026 14:51:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE413FFAA0;
	Tue, 26 May 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807072; cv=none; b=HSe7f63L1dy52ZVQEMvvKKwhDDu8H7tS4Ow88QMB6Gng3GrXRsTRKDQz+IVyQwm20U3OfIjg4iZyQu0nL6T1QXalrRpNeRyX8UGeCNrFr/tLbQ+Nso5Y3u1eM6HOwW0O+qb4QdYsvCLe/P2oL9wt/e3ethd5SBFQybn1SwkhD0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807072; c=relaxed/simple;
	bh=D54dXkES4/5Qz4ImCNPRUfLNuTwbg7rXLpPm0aikQnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnSfhoLJ7ZdUhSMp1hGE/+eSClDqB/VMAec2ZuMU+VPElmtRtqvjBljJJogHMeGsSk/DXADEwyIkhBnEaJmPo1V5BV+m/w4oxgKpJLW/phrsaqCJOOtECa2A/vhQPuJmd/HKzCf4JLq7xQNClRnGpGZEo0dVYGkderhxUg6D1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7c-00015k-00; Tue, 26 May 2026 16:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 51EADC0837; Tue, 26 May 2026 16:45:46 +0200 (CEST)
Date: Tue, 26 May 2026 16:45:46 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 01/10] MIPS: DEC: Ensure 32-bit stack location for o32
 prom_printf()
Message-ID: <ahWyGm4X0ETXNupE@alpha.franken.de>
References: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605062249160.46195@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2605062249160.46195@angie.orcam.me.uk>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.996];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-14767-lists,linux-mips=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0ADB65D7FA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 06, 2026 at 11:42:23PM +0100, Maciej W. Rozycki wrote:
> In 64-bit configurations calling any firmware entry points from a kernel 
> thread other than the initial one will result in a situation where the 
> stack has been placed in the XKPHYS 64-bit memory segment.
> 
> Consequently the stack pointer is no longer a 32-bit value and when the 
> 32-bit firmware code called uses 32-bit ALU operations to manipulate the 
> stack pointer, the calculated result is incorrect (in fact in the 64-bit 
> MIPS ISA almost all 32-bit ALU operations will produce an unpredictable 
> result when executed on 64-bit data) and control goes astray.
> 
> This may happen when no final console driver has been enabled in the
> configuration and consequently the initial console continues being used
> late into bootstrap, or with an upcoming change that will switch the zs
> driver to use a platform device, which in turn will make the console
> handover happen only after other kernel threads have already been
> started, and the kernel will hang at:
> 
>   pid_max: default: 32768 minimum: 301
> 
> or somewhat later, but always before:
> 
>   cblist_init_generic: Setting adjustable number of callback queues.
> 
> has been printed.
> 
> It seems that only the prom_printf() entry point is affected.  Of all 
> the other entry points wired only rex_slot_address() and rex_gettcinfo() 
> are called from a kernel thread other than the initial one, specifically 
> kernel_init(), and they are leaf functions that do no business with the 
> stack, having worked with no issue ever since 64-bit support was added 
> for the platform back in 2002.
> 
> To address this issue then, arrange for the stack to be switched in the 
> o32 wrapper as required for prom_printf() only, by supplying call_o32() 
> with a pointer to a chunk of initdata space, which is placed in the 
> CKSEG0 32-bit compatibility segment, observing that prom_printf() is 
> only called from console output handler and therefore with the console 
> lock held, implying no need for this code to be reentrant.
> 
> Other firmware entry points may be called with interrupts enabled and no 
> lock held, and may therefore require that call_o32() be reentrant.  They 
> trigger no issue at this point and "if it ain't broke, don't fix it," so 
> just leave them alone.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # v2.6.12+
> ---
> No change from v2, 
> <https://lore.kernel.org/r/alpine.DEB.2.21.2605010132340.38805@angie.orcam.me.uk/>.
> 
> New change in v2.
> ---
>  arch/mips/dec/prom/init.c        |    6 +++++-
>  arch/mips/include/asm/dec/prom.h |   15 +++++++++++++--
>  2 files changed, 18 insertions(+), 3 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

