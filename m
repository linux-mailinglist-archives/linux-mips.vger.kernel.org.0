Return-Path: <linux-mips+bounces-15795-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5XInFSgHVGo1hAMAu9opvQ
	(envelope-from <linux-mips+bounces-15795-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jul 2026 23:29:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A665745F90
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jul 2026 23:29:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Ro4HZFhb;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15795-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15795-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70EE0300B048
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jul 2026 21:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BE3353A76;
	Sun, 12 Jul 2026 21:29:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369AD2701B6
	for <linux-mips@vger.kernel.org>; Sun, 12 Jul 2026 21:29:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783891749; cv=none; b=ESAK48SvL9Y5+xmTK2l58nP0/KPp4AtqEQB2XkTYGxywuZgfklAWKeLQdnDWNR7TaaxTSse4r2LUxCMvYnZmhZLWPzt8dZ94HO3AGujXR+q1m6Yextz6mYKTobO922b1U9DfUDdkSOTb1s4D7cGCWwAfhlvsScNTpFgZUDy5JJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783891749; c=relaxed/simple;
	bh=FTabt0p6OUBIXgxGPhka9dYcFu+RjNk/+q/0ndP5BIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbTPwepWuNpTrJOdY4ZBglTSOxOMFrE28gT5sn1WUcVNItUCwf9Pm9KgSQ/O4lCoNxt9Np2HYXF5b0EfbO0jOHSrWDfmY2W5MrzceqYrZaJBjibnwqukG9UKQewtvPFSGhuP/bBzN1pzyGQ+frRneMBaMKplgp+4XENexQb4PdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ro4HZFhb; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783891747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8e01pt38fyqBBiPKwXX6Ga5cwdge0ok/kxnqJ9JKk38=;
	b=Ro4HZFhbVKSuwkKqnDrNFjAKRDouQP0DJHhRuXpULS5Fl+tUoR1ZN9N78BlBMc5LuxV7im
	IxtrQVXlTf4P6z4uv5vM4H8weFTWLATW83nOsMtL7DIaXgJfue1mZ2Mu8NVLK4akD5Crf1
	uC5L0MawVltDyZzwoAjiHxATRyY0ADA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-zxhJe5hgO_W8RNNqMKc6Cg-1; Sun,
 12 Jul 2026 17:27:54 -0400
X-MC-Unique: zxhJe5hgO_W8RNNqMKc6Cg-1
X-Mimecast-MFC-AGG-ID: zxhJe5hgO_W8RNNqMKc6Cg_1783891672
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 51263195605E;
	Sun, 12 Jul 2026 21:27:51 +0000 (UTC)
Received: from fedora (unknown [10.44.49.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E5BAD1800594;
	Sun, 12 Jul 2026 21:27:46 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 12 Jul 2026 23:27:50 +0200 (CEST)
Date: Sun, 12 Jul 2026 23:27:45 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Renzo Davoli <renzo@cs.unibo.it>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, "Dmitry V . Levin" <ldv@strace.io>,
	"open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] ptrace: PTRACE_SET_SYSCALL_INFO syscall skipping
 support
Message-ID: <alQG0c8eGNi8nLvo@redhat.com>
References: <20260704142643.692754-1-renzo@cs.unibo.it>
 <20260704142643.692754-2-renzo@cs.unibo.it>
 <akn8g3ya85YFqcjV@cs.unibo.it>
 <akpsTT20F6M2QWND@redhat.com>
 <ak0MykKEi4b6AHRV@cs.unibo.it>
 <ak0jqCyrtFg7azDM@redhat.com>
 <alDm5TUIIlGLSRdn@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alDm5TUIIlGLSRdn@alpha.franken.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[cs.unibo.it,vger.kernel.org,linux-foundation.org,kernel.org,gmail.com,lists.strace.io,strace.io];
	TAGGED_FROM(0.00)[bounces-15795-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[oleg@redhat.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:renzo@cs.unibo.it,m:linux-kernel@vger.kernel.org,m:akpm@linux-foundation.org,m:shuah@kernel.org,m:legion@kernel.org,m:evgsyr@gmail.com,m:berardi.dav@gmail.com,m:strace-devel@lists.strace.io,m:ldv@strace.io,m:linux-mips@vger.kernel.org,m:berardidav@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleg@redhat.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A665745F90

On 07/10, Thomas Bogendoerfer wrote:
>
> On Tue, Jul 07, 2026 at 06:04:56PM +0200, Oleg Nesterov wrote:
> >
> > Agreed, it is not that I think it won't... but it would be nice to have an ACK
> > from arch/mips maintainers. syscall_trace_enter() is called from MIPS asm code
> > which I obviously can't understand.
>
> current code works for SECCOMP and with below untested change it should
> work for PTRACE_SYSCALL, too.

Thanks!

Obviously, I can't know if this patch is correct. I can't even understand
why syscall_trace_enter() has to do syscall_set_return_value(ENOSYS) because
I don't understand the mips asm callers.

But I agree, this should fix the problems we discussed in this thread.

Thank you,

Oleg.

> Thomas.
> 
> diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
> index 3f4c94c88124..87102a03b6ea 100644
> --- a/arch/mips/kernel/ptrace.c
> +++ b/arch/mips/kernel/ptrace.c
> @@ -1321,8 +1321,12 @@ long arch_ptrace(struct task_struct *child, long request,
>   */
>  asmlinkage long syscall_trace_enter(struct pt_regs *regs)
>  {
> +	long syscall;
> +
>  	user_exit();
>  
> +	syscall = current_thread_info()->syscall;
> +
>  	if (test_thread_flag(TIF_SYSCALL_TRACE)) {
>  		if (ptrace_report_syscall_entry(regs))
>  			return -1;
> @@ -1342,7 +1346,7 @@ asmlinkage long syscall_trace_enter(struct pt_regs *regs)
>  	 * Negative syscall numbers are mistaken for rejected syscalls, but
>  	 * won't have had the return value set appropriately, so we do so now.
>  	 */
> -	if (current_thread_info()->syscall < 0)
> +	if (syscall < 0)
>  		syscall_set_return_value(current, regs, -ENOSYS, 0);
>  	return current_thread_info()->syscall;
>  }
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
> 


