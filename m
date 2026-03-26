Return-Path: <linux-mips+bounces-13956-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHRxEdhkxWkn+AQAu9opvQ
	(envelope-from <linux-mips+bounces-13956-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 17:54:48 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC86338C3E
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 17:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E99C3038F4D
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 16:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9254841C2EC;
	Thu, 26 Mar 2026 16:46:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAA7221265;
	Thu, 26 Mar 2026 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774543584; cv=none; b=mPmsGC7mgQgZka+EpHNlqwWeIF4NZufdo/Bp+oYNpMLEWRtQezOIoDfsLQE6XyI29VBVM9MThYYNz89iJe4Ko0G45kAj5SODCALgk6UVevwlEdBiRaN4R6ybVfR9DAf5DNNWAOXXKXejMJT+4hnD/4I9r+q4vaeU6eiJJ7BYGp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774543584; c=relaxed/simple;
	bh=IrNMG8JzJf0gLtDRAMekvNsaWFh/Zj1yl1xgjQeFBX8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l5OZZNYtOi+/cUwgQqWM16l7QHXZiht2UyNs17+kCBfbtupgsagydT8cRoDyN59e2CxtWc/qeLqvfsvYtRAYc/fsTrKlkhtPoq3k+DtASL+e45Hs6phZMnA+GyrNOlcvCckxYioR8b3ojhniTATCWVBVBRq3iVqrPPb4mnBNq8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 96E35140E1C;
	Thu, 26 Mar 2026 16:46:13 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id AA7C220032;
	Thu, 26 Mar 2026 16:46:07 +0000 (UTC)
Date: Thu, 26 Mar 2026 12:46:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Dmitry Ilvokhin <d@ilvokhin.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Waiman Long <longman@redhat.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Juergen Gross <jgross@suse.com>, Ajay Kaher
 <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann
 <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>, Tejun Heo
 <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH v4 0/5] locking: contended_release tracepoint
 instrumentation
Message-ID: <20260326124654.66b4dbc1@gandalf.local.home>
In-Reply-To: <acVW6eFGwqACD91Y@casper.infradead.org>
References: <cover.1774536681.git.d@ilvokhin.com>
	<acVW6eFGwqACD91Y@casper.infradead.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: oxpnmau35kmgbeef69arytyyqjdq4tcm
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18T30hkquOyghpO0b3wg7U69NQLAoKWLEI=
X-HE-Tag: 1774543567-165604
X-HE-Meta: U2FsdGVkX1+aucRsg/fJwSO9PcSLmk9Uk3XJJ6a8zNjBvZXhrYnWw8QuFZDYOQAZcKByDBMi6oGlRWtTF/Acf81GjhgOA6h7nGVnnpPy9E5e0/5WaXs311Ddp5diPLuMOv2IW38+0Dk/6tOn+Zkvvq989+N+UF2XvBrebx1sWJWtvBgdDrf9ptRKO/b1FQfSq2VqlITHIQYMVZy7JK1h3nZDehd2eU/kzpM76hR0FzJKGqVYc7rtfpxOV3e5SKzZPSzkoOwAOuxo4uaGOxH6Qi1DWYPmS90pi+Lwbv2tjNOCuDuR2Jn16cNcy8fcYO0C5X4AfXaiHii7M18gBqE54UkvWLH/jjdU1XUWoqlX11A9Tv93kHbWpf7w0uUHT93G
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-mips@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13956-lists,linux-mips=lfdr.de];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gandalf.local.home:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email]
X-Rspamd-Queue-Id: 9AC86338C3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 15:55:21 +0000
Matthew Wilcox <willy@infradead.org> wrote:

> > - The holder's stack at release time, which may differ from what perf lock
> >   contention --lock-owner captures if the holder does significant work between
> >   the waiter's arrival and the unlock.  
> 
> As someone who's not an expert in this area (so please use short words
> to explain it to me), why do we want to know how long this holder took
> to release the lock from when it became contended?
> 
> I understand why we want to know how long any given waiter had to wait
> to gain the lock (but we already have tracepoints which show that).
> 
> I also don't understand why we want to know the holder's stack at
> release time.  The stack at contention-begin time will include
> the point at which the lock was acquired which should be correlated
> with where the lock was released.
> 
> Perhaps examples might help me understand why we want this?

Dmitry could give his own rationale for this, but I have my only use case.

This would be useful to find out how long the critical section is. If a
lock is highly contended by many tasks, you could get a high contention
time simply because other tasks are causing the delay for the waiter.
Seeing the release time and location would let you also know how long the
critical section was held, and if the length of the critical section is
causing the contention.

Having a stack trace of the release would differentiate the path that
released the lock, as there can be many places that release them. Although,
I have to admit, I'm not sure there are many different places locks are
released. Especially now that we have guard(), which will make all the
releases in a function at the same location.

-- Steve


