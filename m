Return-Path: <linux-mips+bounces-7564-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A40A17FD8
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jan 2025 15:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C068D1887860
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jan 2025 14:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF1E1B4237;
	Tue, 21 Jan 2025 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BWTUe7vl"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2E11F1508
	for <linux-mips@vger.kernel.org>; Tue, 21 Jan 2025 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737469885; cv=none; b=MO6BnoKPsDFYVy1bdepksrjR9scTtImVQo2B65oP7LP8s9xLBWaYe+akAfKqVe/tXM8u6/idg0xaWBPnuD5W7LNBebpDqZG4PfnhC0MMtQCqmbq74Nk5YWT9546jjv5PZ+rx0xQ6g8a6yxEVq49KVlH5dCZAEK4t20XDK/AdeLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737469885; c=relaxed/simple;
	bh=QKnYRc3Pixg7SCAJOgEmX8GpqnC9liD+Mi5ZMIeQvJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcLdKJRjClD3+GGowDjOXMZgNRb8P18LkNi8RZZHKi/9dtc9eGTbIfR28Tp/cCs+Ac8uGK5hHXx0PkNSqpjlW0mURsr0eOcsCz81JlMgZuyEBLRg6tbWrUnnv/WulFOVbnxM36qJzsRooA83fLEf4li6dS5o0caHTTHwVMq61Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BWTUe7vl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737469882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GmbrizBccdqBYi6hb4h7oEWiAa4+DQ5hN9o7ZNXkI4=;
	b=BWTUe7vlaEKY5XXoI11B7p9d67TmH4YVjmpRqJ76dU20QNeIxUyilOb/g9woU1zteK/g8f
	5JV7EZZvm2yxq7uKTMQ9Z7buifuEjQOCs0CZgScqw+fBKPm7AUMsuW5jKnNke4giRfI8w1
	3032vv/jL8bd7VBVyZfy8x5jgsBwB4E=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-328-OpeHi3p_NmG1prZqbVPb9w-1; Tue,
 21 Jan 2025 09:31:14 -0500
X-MC-Unique: OpeHi3p_NmG1prZqbVPb9w-1
X-Mimecast-MFC-AGG-ID: OpeHi3p_NmG1prZqbVPb9w
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C15C21955BD2;
	Tue, 21 Jan 2025 14:31:11 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.31])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id A06E019560A7;
	Tue, 21 Jan 2025 14:31:06 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 21 Jan 2025 15:30:45 +0100 (CET)
Date: Tue, 21 Jan 2025 15:30:39 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] seccomp: kill the dead code in the
 !CONFIG_HAVE_ARCH_SECCOMP_FILTER version of __secure_computing()
Message-ID: <20250121143038.GB3422@redhat.com>
References: <20250120134409.GA21241@redhat.com>
 <20250120134452.GA21275@redhat.com>
 <202501201353.168E6AAC8@keescook>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501201353.168E6AAC8@keescook>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 01/20, Kees Cook wrote:
>
> On Mon, Jan 20, 2025 at 02:44:52PM +0100, Oleg Nesterov wrote:
> > Depending on CONFIG_HAVE_ARCH_SECCOMP_FILTER, __secure_computing(NULL)
> > will crash or not, this is not consistent/safe.
>
> Right now this never happens because there are no callers.
>
> > Fortunately, if CONFIG_HAVE_ARCH_SECCOMP_FILTER=n, __secure_computing()
> > has no callers, these architectures use secure_computing_strict().
>
> As you say here.
>
> > Also, after the previous change __secure_computing(sd) is always called
> > with sd == NULL, so it is clear that we can remove the code which makes
> > no sense.
>
> However, after this change, if someone were to *add* a caller, it would
> bypass strict mode.

OK, thanks, I agree this is not consistent, even if I think that
!CONFIG_HAVE_ARCH_SECCOMP_FILTER arches should not add a new caller.

> Instead of "return 0", it seems like it'd be better
> to remove the function entirely (and maybe add a comment about calling
> secure_computing_strict() directly)?

This means that __secure_computing() will be defined even if !CONFIG_SECCOMP,
but it won't be defined if CONFIG_SECCOMP && !CONFIG_HAVE_ARCH_SECCOMP_FILTER.

How about

	__secure_computing()
	{
		return secure_computing_strict(syscall_get_nr(...));
	}

in the "#ifndef CONFIG_HAVE_ARCH_SECCOMP_FILTER" section near
secure_computing_strict() in kernel/seccomp.c ?

Oleg.


