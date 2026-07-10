Return-Path: <linux-mips+bounces-15745-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0pGMFwXnUGrD8AIAu9opvQ
	(envelope-from <linux-mips+bounces-15745-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 14:35:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BEC73AD24
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 14:35:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15745-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15745-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57EA83006791
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 12:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F2E421896;
	Fri, 10 Jul 2026 12:35:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F59F408624;
	Fri, 10 Jul 2026 12:35:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686913; cv=none; b=laqMGxAz9XsDv68NEnOVQE54M+CWnhW0jBfBgPQBEy3YKHpcU6rhKyxYppFTF8i7iWtwff3VYugp2Vr04bPueK7UYm1eXrdsj21qij78qScmL+ABSDaF05pdL0aRWEUAbKw2vmuocfuPQH+PoCKDjuHWvjJ0zphSvxFZi9nKQB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686913; c=relaxed/simple;
	bh=PDjmw8awt2votmGhlvXDI/eRek6m+eCHuXWEHwR/8K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkOWMtkq4Grq/np0+OlCGA0hQVqE+XMDNdjlPKSoVYDh2XTBIkadl+jhyPVFJsH/a2XcJ0VmgLRzguCWjW2o2k79W0k3lCtL+7s5TymRugGj1qB4EGrqm4M5LHDIF0u/YgdjP5kHqPzuDc0V3eNOCvxHOYrpkoXt11WCJQ+tZaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wiARS-0005Rr-00; Fri, 10 Jul 2026 14:34:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 937DBC00E8; Fri, 10 Jul 2026 14:34:45 +0200 (CEST)
Date: Fri, 10 Jul 2026 14:34:45 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Renzo Davoli <renzo@cs.unibo.it>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, "Dmitry V . Levin" <ldv@strace.io>,
	"open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] ptrace: PTRACE_SET_SYSCALL_INFO syscall skipping
 support
Message-ID: <alDm5TUIIlGLSRdn@alpha.franken.de>
References: <20260704142643.692754-1-renzo@cs.unibo.it>
 <20260704142643.692754-2-renzo@cs.unibo.it>
 <akn8g3ya85YFqcjV@cs.unibo.it>
 <akpsTT20F6M2QWND@redhat.com>
 <ak0MykKEi4b6AHRV@cs.unibo.it>
 <ak0jqCyrtFg7azDM@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak0jqCyrtFg7azDM@redhat.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15745-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[cs.unibo.it,vger.kernel.org,linux-foundation.org,kernel.org,gmail.com,lists.strace.io,strace.io];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:oleg@redhat.com,m:renzo@cs.unibo.it,m:linux-kernel@vger.kernel.org,m:akpm@linux-foundation.org,m:shuah@kernel.org,m:legion@kernel.org,m:evgsyr@gmail.com,m:berardi.dav@gmail.com,m:strace-devel@lists.strace.io,m:ldv@strace.io,m:linux-mips@vger.kernel.org,m:berardidav@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,alpha.franken.de:mid,alpha.franken.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3BEC73AD24

On Tue, Jul 07, 2026 at 06:04:56PM +0200, Oleg Nesterov wrote:
> On 07/07, Renzo Davoli wrote:
> >
> > On Sun, Jul 05, 2026 at 04:38:05PM +0200, Oleg Nesterov wrote:
> > > OK, lets only allow the _SECCOMP -> _EXIT transition for now.
> > done in v3.
> > > But will it work on MIPS?
> >
> > IMHO yes, it will (would).
> 
> Agreed, it is not that I think it won't... but it would be nice to have an ACK
> from arch/mips maintainers. syscall_trace_enter() is called from MIPS asm code
> which I obviously can't understand.

current code works for SECCOMP and with below untested change it should
work for PTRACE_SYSCALL, too.

Thomas.

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index 3f4c94c88124..87102a03b6ea 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -1321,8 +1321,12 @@ long arch_ptrace(struct task_struct *child, long request,
  */
 asmlinkage long syscall_trace_enter(struct pt_regs *regs)
 {
+	long syscall;
+
 	user_exit();
 
+	syscall = current_thread_info()->syscall;
+
 	if (test_thread_flag(TIF_SYSCALL_TRACE)) {
 		if (ptrace_report_syscall_entry(regs))
 			return -1;
@@ -1342,7 +1346,7 @@ asmlinkage long syscall_trace_enter(struct pt_regs *regs)
 	 * Negative syscall numbers are mistaken for rejected syscalls, but
 	 * won't have had the return value set appropriately, so we do so now.
 	 */
-	if (current_thread_info()->syscall < 0)
+	if (syscall < 0)
 		syscall_set_return_value(current, regs, -ENOSYS, 0);
 	return current_thread_info()->syscall;
 }

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

