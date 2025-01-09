Return-Path: <linux-mips+bounces-7321-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E93DA07543
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 13:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 486053A7C91
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 12:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225C92144AE;
	Thu,  9 Jan 2025 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IxTpv9vY"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64116195
	for <linux-mips@vger.kernel.org>; Thu,  9 Jan 2025 12:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424344; cv=none; b=R892xeF5hcF41Pc3uJzjsRn4u+kjKOsSc1JmbsFdbFOJJ/iDCwHh3WXZoaqYD2/H2CTmy/f2dqXl0eXB4NdJScb3vNbS17MbuFHp4iXS1VscEAFLphsmbsrUILpow1FHIm4Zem/uxf82bZ/kdC4UKttxaZQi0ouWyzSiLhk6fGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424344; c=relaxed/simple;
	bh=4IB/eQ9VBoGQuFGrmyKaV7oClh4zrK7iu/0v7nFpJOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsYeNOYadh4Ff/5usqzXyu25GPH51cSgHi3NclD1KOTB2MLWAclwzNTsVq1jvc4uQmrwjXjh2MLvgLqlBX5ypTEc2FPm1EUvEFcF7/zZ0IMMK41eJMsGN/E28oUvYrACmaCYm5fACW7COftetHZV86DpJ2+jAf5Zj6zwiZJK2p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IxTpv9vY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736424340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KxvKKIzlzclPZzGZDamCIT9TdR6k/Feb4jp3cOGYzmU=;
	b=IxTpv9vYgqNOzSJenh/7KpqTBHi8/SdXNKa5Y8HpwB9QDzZpOnmex4mcV2ANnt5Q3IBW01
	o7Zw1V1d27HldvElsqBeF3LzcrdKdWSw6+F7Zh1I9CYJ9lJ/SmhcHjQLNwFofto8rqyGQD
	GWJvYf6RDtWBV1nAFzDgFLicX0HWb2Q=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-SzhSxQMxPJGF5wclok4rgw-1; Thu,
 09 Jan 2025 07:05:35 -0500
X-MC-Unique: SzhSxQMxPJGF5wclok4rgw-1
X-Mimecast-MFC-AGG-ID: SzhSxQMxPJGF5wclok4rgw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D06D1955DD1;
	Thu,  9 Jan 2025 12:05:29 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.245])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id ACCCA19560AA;
	Thu,  9 Jan 2025 12:05:19 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  9 Jan 2025 13:05:04 +0100 (CET)
Date: Thu, 9 Jan 2025 13:04:53 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH 2/6] syscall.h: add syscall_set_arguments() on remaining
 HAVE_ARCH_TRACEHOOK arches
Message-ID: <20250109120453.GC26424@redhat.com>
References: <20250107230153.GA30560@strace.io>
 <20250107230418.GB30633@strace.io>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107230418.GB30633@strace.io>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 01/08, Dmitry V. Levin wrote:
>
>  arch/arc/include/asm/syscall.h       | 14 +++++++++
>  arch/arm/include/asm/syscall.h       | 13 ++++++++
>  arch/arm64/include/asm/syscall.h     | 13 ++++++++
>  arch/csky/include/asm/syscall.h      | 13 ++++++++
>  arch/hexagon/include/asm/syscall.h   |  7 +++++
>  arch/loongarch/include/asm/syscall.h |  8 +++++
>  arch/mips/include/asm/syscall.h      | 46 ++++++++++++++++++++++++++++
>  arch/parisc/include/asm/syscall.h    | 12 ++++++++

Confused... arch/x86 needs syscall_set_arguments() too ?

Oleg.


