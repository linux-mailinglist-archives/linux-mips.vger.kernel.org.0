Return-Path: <linux-mips+bounces-12730-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EEFCEFE52
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 11:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 603653022AA3
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 10:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B390130B520;
	Sat,  3 Jan 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BAnF2WpJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3256B22D4E9
	for <linux-mips@vger.kernel.org>; Sat,  3 Jan 2026 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767437817; cv=none; b=SQsRH0Aq6OYYBlQGik7aejzSXBAwZG1bH/m53azC5YVpThYzr6jyELjBnzTRTl0/jMka7YwbPhuLRarFeuNrf/s+BL5ghkgnxfpXdRjj64ayvoBzGEJzcir4kfTeAQKa24VrO/eQYPXCoaJb+ONf6l471PeY3PFJIBotzjJQ7oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767437817; c=relaxed/simple;
	bh=hq8AfZhlZnF8YEaUWpeqIlg3uGOCHDohB5SQyX3jsE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRJkDgV6q+cU9xG5Aoy9sk0LhocvBagsrk+ejafzvMjGD4HnX1+6E5MFsQ31iX5RhoKtmmCB/lE0O/4634HVRwLihZJzo00TRHxaP0mdrHpOGjb/qZJLxbqYEftKzWQBEI0Gmbsy/Ld5wxxW9BjkMfntKPqCtDnQGqusy0n8rSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BAnF2WpJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767437815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yGpUw0Ox/Jp3kMXH8XGSAcDFluSymyYJIP4RuNh5bqs=;
	b=BAnF2WpJY5PCKjpyunmTQAFvf6LNuMDSSQP+MyuGzG61kc6OyIn78p+ySTuF4XG03EeoRc
	1bhb8ASswxJvhHlREo3LAD1+AEjzFuS4k/1K/MfMr4goLoiO7oqe7c493QeFqei0KnaE65
	OjG1LkTQ71Mp4zA1XldwbvR8e+HIT4w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-zNokpBgqPf6VSRWU69Yn0Q-1; Sat,
 03 Jan 2026 05:56:49 -0500
X-MC-Unique: zNokpBgqPf6VSRWU69Yn0Q-1
X-Mimecast-MFC-AGG-ID: zNokpBgqPf6VSRWU69Yn0Q_1767437807
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0451619560A5;
	Sat,  3 Jan 2026 10:56:45 +0000 (UTC)
Received: from fedora (unknown [10.45.224.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3114119560A7;
	Sat,  3 Jan 2026 10:56:36 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat,  3 Jan 2026 11:56:44 +0100 (CET)
Date: Sat, 3 Jan 2026 11:56:35 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Keke Ming <ming.jvle@gmail.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, linux@armlinux.org.uk,
	catalin.marinas@arm.com, will@kernel.org, tsbogend@alpha.franken.de,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/5] uprobes: transition from kmap_atomic to
 kmap_local_page
Message-ID: <aVj146EunyaOQzxO@redhat.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 01/03, Keke Ming wrote:
>
> Keke Ming (5):
>   riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
>   arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
>   mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
>   arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
>   uprobes: use kmap_local_page() for temporary page mappings
>
>  arch/arm/probes/uprobes/core.c     |  4 ++--
>  arch/arm64/kernel/probes/uprobes.c |  4 ++--
>  arch/mips/kernel/uprobes.c         |  4 ++--
>  arch/riscv/kernel/probes/uprobes.c |  4 ++--
>  kernel/events/uprobes.c            | 12 ++++++------
>  5 files changed, 14 insertions(+), 14 deletions(-)

Thanks,

Acked-by: Oleg Nesterov <oleg@redhat.com>


