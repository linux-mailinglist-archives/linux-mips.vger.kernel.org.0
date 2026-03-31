Return-Path: <linux-mips+bounces-13995-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJMGABCfy2loJgYAu9opvQ
	(envelope-from <linux-mips+bounces-13995-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 12:16:48 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D61A367BEB
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 12:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0530D30311A4
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 10:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5DE3CEB98;
	Tue, 31 Mar 2026 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZV77eGoB"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B9B3A6B77
	for <linux-mips@vger.kernel.org>; Tue, 31 Mar 2026 10:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951920; cv=none; b=Hfj1W67Xe5BhGi/Jk26QDwyXjCJdcvNn8vB1zfkdWio5dhhcQKzONNGJzHgwPVg/REALe6dNiqSXPV8EuThNOu+Qaxb455PHQGdwSrzWAD6nldmUF/p+3LYhz60UeM4Euh90PueL05zkUZ3NZGMlg21KG/BMhYkaZ0Tzqb1jpXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951920; c=relaxed/simple;
	bh=HHo+6RORxqzwkw1Oh/DBYbRN33EnFnNxrGcTNZrX4Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jhcdju/XJHsKeDRFVlOlYyx0oEbwTQwhjkpvUxnGftuPhYTN5tlSWxXALNCcvTEP9c4h875MbKmvU9xMtu4W9gvExVyrwRKLSV421hqZAFjD5jZPUSZbfwjs5UXYt3vMHNibY655MERz94ezyEevFLRI25p9P11VPFlu5cM46u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZV77eGoB; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774951907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/KT1XoeoGhxQZGd0moPT/YeBL0YVj4iz/EMh/8Na9M=;
	b=ZV77eGoBYxkTQ01Z1xvT+NwWiLOnJG01ICF7R8IEluW7BoQaYyfRsHnF4bxuJdehzxdj8i
	m5gLxZ96FaWK0TlLmANrVzEeuUXgeDwIUAYiYJMSXgUyIuQtaXpJnCSPnF9/D0yIb0gnxj
	f7KmNc4JXej6hhm5RiNUBa77Va9m+5E=
From: Usama Arif <usama.arif@linux.dev>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v4 1/5] tracing/lock: Remove unnecessary linux/sched.h include
Date: Tue, 31 Mar 2026 03:11:32 -0700
Message-ID: <20260331101134.643490-1-usama.arif@linux.dev>
In-Reply-To: <5593ed9718b1a6e4ec51d99772c485734029d4d4.1774536681.git.d@ilvokhin.com>
References: 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13995-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ilvokhin.com:email]
X-Rspamd-Queue-Id: 5D61A367BEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 15:10:00 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wrote:

> None of the trace events in lock.h reference anything from
> linux/sched.h. Remove the unnecessary include.
> 
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
> ---
>  include/trace/events/lock.h | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Usama Arif <usama.arif@linux.dev>

