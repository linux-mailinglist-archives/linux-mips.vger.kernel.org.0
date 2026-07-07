Return-Path: <linux-mips+bounces-15582-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qfd8K5MUTWr5ugEAu9opvQ
	(envelope-from <linux-mips+bounces-15582-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 17:00:35 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF53271CEFC
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 17:00:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cs.unibo.it header.s=virtlab header.b=LPg0nBLv;
	dmarc=pass (policy=reject) header.from=cs.unibo.it;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15582-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15582-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13AD530252AA
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 14:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A469B3F4824;
	Tue,  7 Jul 2026 14:27:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C112FC898;
	Tue,  7 Jul 2026 14:27:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434456; cv=none; b=LzkG839eQCQpL97JMysgmdnu21G67PWnY21mEyPLwix0W61F9gW8q3Cv194lyS/uxjNiiRiQHteNgqlL3KBTN2wFvEe+hTo0LTAnteTlbPvF2gSYO/ibQr7hbVXr3+5KcYfq9CWi0MtYccQac5RK2l24RQLLcJ/WxA+I86L3PSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434456; c=relaxed/simple;
	bh=CRDo4ckbOw5FZPs3TJzOLxqiQm893/eLqElGEjgaDZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qn8PmPgyNaY4R+n/T+O9ukWsW0uPIlOUxTXL/Orjb12fwmYH7mRestD+ODvTjMW7oCkdPxkQtMzN8oRSLWS94f+rwnNjuIV4QO8CXq3W+AcHZyC3s4GQPHWJU4814axtXWqGz2qcIQj3rUznV8xhu6leB64yr9BPiNMQR1yi7TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it; spf=pass smtp.mailfrom=cs.unibo.it; dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b=LPg0nBLv; arc=none smtp.client-ip=130.136.161.50
Received: from cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPSA id E7F621C013B;
	Tue,  7 Jul 2026 16:27:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1783434450;
	bh=CRDo4ckbOw5FZPs3TJzOLxqiQm893/eLqElGEjgaDZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPg0nBLv3AGKT+Dz564Mw36lejtqtYBAE+t+Di7FRcDq7U3DMy2f6b683vZHrzUZ1
	 mEtDcYVvDrfzbB3wAjsU9fMG6kRwGj8uClt+n2YzNyyrOqfQN6YaE8J/K+1vx3hnby
	 S0Jxyf1iDY/EpAB7qyp/30vPqVnJhPYDubHKtBZE=
Date: Tue, 7 Jul 2026 16:27:22 +0200
From: Renzo Davoli <renzo@cs.unibo.it>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, "Dmitry V . Levin" <ldv@strace.io>,
	"open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] ptrace: PTRACE_SET_SYSCALL_INFO syscall skipping
 support
Message-ID: <ak0MykKEi4b6AHRV@cs.unibo.it>
References: <20260704142643.692754-1-renzo@cs.unibo.it>
 <20260704142643.692754-2-renzo@cs.unibo.it>
 <akn8g3ya85YFqcjV@cs.unibo.it>
 <akpsTT20F6M2QWND@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akpsTT20F6M2QWND@redhat.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cs.unibo.it,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cs.unibo.it:s=virtlab];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15582-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[alpha.franken.de,vger.kernel.org,linux-foundation.org,kernel.org,gmail.com,lists.strace.io,strace.io];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleg@redhat.com,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:akpm@linux-foundation.org,m:shuah@kernel.org,m:legion@kernel.org,m:evgsyr@gmail.com,m:berardi.dav@gmail.com,m:strace-devel@lists.strace.io,m:ldv@strace.io,m:linux-mips@vger.kernel.org,m:berardidav@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[renzo@cs.unibo.it,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cs.unibo.it:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[renzo@cs.unibo.it,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,cs.unibo.it:from_mime,cs.unibo.it:dkim,cs.unibo.it:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF53271CEFC

On Sun, Jul 05, 2026 at 04:38:05PM +0200, Oleg Nesterov wrote:
> OK, lets only allow the _SECCOMP -> _EXIT transition for now.
done in v3.
> But will it work on MIPS?

IMHO yes, it will (would).

PTRACE_EVENT_SECCOMP follows a different flow, it does not call ptrace_report_syscall_entry.

As a confirmation sashiko on v3 (allowing _SECCOMP -> _EXIT only) lists no more regressions.

happy hacking
	renzo

