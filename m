Return-Path: <linux-mips+bounces-7322-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF95A0755C
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 13:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC03B3A461D
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 12:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CB621764D;
	Thu,  9 Jan 2025 12:11:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0082216E39;
	Thu,  9 Jan 2025 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424666; cv=none; b=dsMp9MeQbLVqQC6Jsja6QugG0kGxt4FTd5QJ02GSyTFoJmlpwvXINZ23Bt5wZzT0zcDHYfliuo3DGVpZpVYA8SyamKN+J5jEJwN1S90zs7u/0Sq0QAm3VYW3+DXu/bdCK/9bQ7yLhEk4yEJcLojtPeBmU3OAnBVljaSn1MWimSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424666; c=relaxed/simple;
	bh=C3HIHuvx3iq6QFRkyCMdjardeCFNG2fLyrXiDgM4lOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6tI3CkCZ+nulSyTP3VPcEatCzi1mOtF2U/KIj+lDpKs92K9PdwD8o3XGQsAy4m8yctfTnVAt4QbrigWyqxjs40WOdcS3Ooc+sVpMS+rRsNCzCKZLjZ7tcJDnGRu4dbIfdDdR0g4g1kkPDq13ScWSltTizAJXEM9HFFtJDNBMKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id D569472C8F5;
	Thu,  9 Jan 2025 15:11:02 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id C39FF7CCB3A; Thu,  9 Jan 2025 14:11:02 +0200 (IST)
Date: Thu, 9 Jan 2025 14:11:02 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Oleg Nesterov <oleg@redhat.com>
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
Message-ID: <20250109121102.GA16212@strace.io>
References: <20250107230153.GA30560@strace.io>
 <20250107230418.GB30633@strace.io>
 <20250109120453.GC26424@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109120453.GC26424@redhat.com>

On Thu, Jan 09, 2025 at 01:04:53PM +0100, Oleg Nesterov wrote:
> On 01/08, Dmitry V. Levin wrote:
> >
> >  arch/arc/include/asm/syscall.h       | 14 +++++++++
> >  arch/arm/include/asm/syscall.h       | 13 ++++++++
> >  arch/arm64/include/asm/syscall.h     | 13 ++++++++
> >  arch/csky/include/asm/syscall.h      | 13 ++++++++
> >  arch/hexagon/include/asm/syscall.h   |  7 +++++
> >  arch/loongarch/include/asm/syscall.h |  8 +++++
> >  arch/mips/include/asm/syscall.h      | 46 ++++++++++++++++++++++++++++
> >  arch/parisc/include/asm/syscall.h    | 12 ++++++++
> 
> Confused... arch/x86 needs syscall_set_arguments() too ?

Sure, all HAVE_ARCH_TRACEHOOK architectures need them, but most of these
architectures already provide them since the previous patch in the series:
[PATCH 1/6] Revert "arch: remove unused function syscall_set_arguments()"


-- 
ldv

