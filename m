Return-Path: <linux-mips+bounces-15497-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JhxhEHxsSmphCwEAu9opvQ
	(envelope-from <linux-mips+bounces-15497-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Jul 2026 16:38:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031F70A555
	for <lists+linux-mips@lfdr.de>; Sun, 05 Jul 2026 16:38:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=fJFiZ+vq;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15497-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15497-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53EC5300A622
	for <lists+linux-mips@lfdr.de>; Sun,  5 Jul 2026 14:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF50380FDA;
	Sun,  5 Jul 2026 14:38:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52148233938
	for <linux-mips@vger.kernel.org>; Sun,  5 Jul 2026 14:38:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783262299; cv=none; b=pEv482O8bvgckBdnzZQwUixbUZ0nwlkIljXAxxogxarxcohHbSd5sPifKFJzu4Yhzwd2K0PMUR3CMadxz/fjgH2AbhUp3FXiRsXhY5rxHEXMBaNIgRqNzC3RUKbLJ/Kckv6UsqV3U7ZeEkWpNEi1c6jxj4N84RWooekk5+4pO1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783262299; c=relaxed/simple;
	bh=aPArtlUCrnwSwRu1vn5i6EhCuL/T47dKwXLsSUbOJ80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Je4G3/2+x037vwJ1Nv/vpeu7/xkQpfK/NSK5c39O5gvsr70l1VvnnYhERINX3mSOyJ68O/6UYM/LwLZMqKSA6pjEuLKp+WLdTOQe2PhH9Dp2JVz7P+MYjnYj6gXtjTNubZ+M5cNVDP1l7zJD1DKKt5eUKgdLLn/HJEpwEtl2PRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fJFiZ+vq; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783262297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pGJwaa0imwMJYY5uUzpEPYmoINJAg8vBQDfV9XFieSI=;
	b=fJFiZ+vqj6vRQm+ZMbCxpoxPK/6XbEmGjk8qLooTUIw9AMZ4iP6wSHTzC0FhNT4nUDYw64
	/miETYcXZQ/DgQYUSQl5QYdR+zhD1OmtPdVVrSmL50RKbKV3qyy+QoE6C6aWl6jrMyRyc8
	YTnNxO/KbQvIV3hSkJC2CwL9twOnAP8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-EG6Z_kZHPUyfopVsMPtgLg-1; Sun,
 05 Jul 2026 10:38:13 -0400
X-MC-Unique: EG6Z_kZHPUyfopVsMPtgLg-1
X-Mimecast-MFC-AGG-ID: EG6Z_kZHPUyfopVsMPtgLg_1783262292
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84AC118005AE;
	Sun,  5 Jul 2026 14:38:11 +0000 (UTC)
Received: from fedora (unknown [10.44.32.112])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 57BD23000239;
	Sun,  5 Jul 2026 14:38:06 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun,  5 Jul 2026 16:38:11 +0200 (CEST)
Date: Sun, 5 Jul 2026 16:38:05 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Renzo Davoli <renzo@cs.unibo.it>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, "Dmitry V . Levin" <ldv@strace.io>,
	"open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] ptrace: PTRACE_SET_SYSCALL_INFO syscall skipping
 support
Message-ID: <akpsTT20F6M2QWND@redhat.com>
References: <20260704142643.692754-1-renzo@cs.unibo.it>
 <20260704142643.692754-2-renzo@cs.unibo.it>
 <akn8g3ya85YFqcjV@cs.unibo.it>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akn8g3ya85YFqcjV@cs.unibo.it>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux-foundation.org,kernel.org,gmail.com,lists.strace.io,strace.io];
	TAGGED_FROM(0.00)[bounces-15497-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[oleg@redhat.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:renzo@cs.unibo.it,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:akpm@linux-foundation.org,m:shuah@kernel.org,m:legion@kernel.org,m:evgsyr@gmail.com,m:berardi.dav@gmail.com,m:strace-devel@lists.strace.io,m:ldv@strace.io,m:linux-mips@vger.kernel.org,m:berardidav@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6031F70A555

Oh... I know nothing about mips.

Add Thomas. Thomas could you help? See the question below.

OK, lets only allow the _SECCOMP -> _EXIT transition for now.
But will it work on MIPS?

grep, grep... So arch/mips/ has

	static inline void syscall_set_return_value(struct task_struct *task,
						    struct pt_regs *regs,
						    int error, long val)
	{
		if (error) {
			regs->regs[2] = -error;
			regs->regs[7] = 1;
		} else {
			regs->regs[2] = val;
			regs->regs[7] = 0;
		}
	}

	static inline void syscall_set_nr(struct task_struct *task,
					  struct pt_regs *regs,
					  int nr)
	{
		/*
		 * New syscall number has to be assigned to regs[2] because
		 * it is loaded from there unconditionally after return from
		 * syscall_trace_enter() invocation.
		 *
		 * Consequently, if the syscall was indirect and nr != __NR_syscall,
		 * then after this assignment the syscall will cease to be indirect.
		 */
		task_thread_info(task)->syscall = regs->regs[2] = nr;
	}

I have no idea. But at least ptrace_set_syscall_info_exit(skip => true)
must do syscall_set_nr(-1) before syscall_set_return_value(), otherwise
the value assigned to regs[2] will be lost.

-------------------------------------------------------------------------------
Now the question. To simplify, suppose we need something like

	void skip_syscall_and_set_return_value(task, regs, retval)
	{
		syscall_set_nr(task, regs, -1);
		syscall_set_return_value(task, regs, 0, retval);
	}

which can be used by debugger when the tracee sleeps in ptrace_report_syscall_entry().

However, arch/mips/kernel/ptrace.c:syscall_trace_enter() does:

	ptrace_report_syscall_entry(regs);

	if (current_thread_info()->syscall < 0)
		syscall_set_return_value(current, regs, -ENOSYS, 0);

and this means that this func won't work on MIPS. Is it possible to make it
work somehow? May be we can abuse regs->regs[7] somehow to detect the case when
syscall_set_return_value() was called by debugger and avoid the unconditional
-ENOSYS ?

Oleg.

On 07/05, Renzo Davoli wrote:
>
> There is a problem on MIPS:
> https://sashiko.dev/#/patchset/20260704142643.692754-1-renzo%40cs.unibo.it
>
> It appears that on MIPS the feature of skipping a system call by setting its
> number to -1 does not work correctly when transitioning from _ENTRY to _EXIT:
> the system call return value is overwritten.
>
> PTRACE_EVENT_SECCOMP, however, has an explicit UAPI specification stating that
> setting the system call number to a negative value suppresses the system call.
>
> Moreover, kernel/ptrace.c contains the following comment:
> /*
>  * If the syscall number is set to -1, setting syscall arguments is not
>  * just pointless, it would also clobber the syscall return value on
>  * those architectures that share the same register both for the first
>  * argument of syscall and its return value.
>  */
> Thus, PTRACE_EVENT_SECCOMP is explicitly designed to preserve the system call
> return value when the system call is skipped.
>
> By contrast, for PTRACE_SYSCALL syscall-entry stops, the man page only states
> that the tracer may modify the system call number. It does not specify that
> assigning a negative value must suppress the system call and preserve the
> return value across all architectures, even though many architectures implement
> exactly this behavior.
>
> At this point I see two possible approaches:
>
> * fix the MIPS implementation (and audit, and possibly fix, the other
>   architectures as well);
>
> * revert to the original proposal and allow the "skip syscall" feature only for
>   PTRACE_EVENT_SECCOMP, i.e. permit PTRACE_SET_SYSCALL_INFO to transform only
>   PTRACE_SYSCALL_INFO_SECCOMP stops into PTRACE_SYSCALL_INFO_EXIT stops.
>
> I would prefer the latter approach. I am concerned that changing the ptrace
> implementation in each architecture may introduce subtle regressions or other
> unintended side effects.
>
> In my opinion, seccomp-based syscall tracing is also the more powerful and
> flexible model compared to the traditional PTRACE_SYSCALL entry/exit mechanism.
>
> Support for system call suppression from PTRACE_SYSCALL_INFO_ENTRY can always
> be added later if and when a real use case arises. That would also provide an
> opportunity to audit the behavior of all supported architectures and, if
> necessary, make the semantics of negative system call numbers consistent across
> architectures.
>
> 	renzo
>


