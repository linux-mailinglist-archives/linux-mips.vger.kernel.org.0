Return-Path: <linux-mips+bounces-5001-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7542095B151
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 11:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB0341F215EA
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 09:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48774181CE1;
	Thu, 22 Aug 2024 09:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UY1Q5HwY"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF3181310
	for <linux-mips@vger.kernel.org>; Thu, 22 Aug 2024 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318277; cv=none; b=fwz/Nwpk7s+45GhPojZDvcAnrHlgLV+asVn3uvKIvk/VKB7S4FvzNzrmvZu4xp/P6VxFe/PW9QTIi16OPmNemEboZllIiLXAE4WeIIB+VrxMzIvNvlQpZx7La81qSAY84s/9dPvqBUP+l2p0OZf7TJRlFk6nuIWviqmsraRJgwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318277; c=relaxed/simple;
	bh=M6DBVSoi1Ub3YvsLPKPI+Wu54c/MStvP44GPQEeuXl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiJldyUO6oxB1ofYQCAELicQVNT2s7kYHqG5r0zH38tcA4lggxQlY3+mnT5vQtAbKhJ4mjSpx6uKx8J6dg3X0rnIVtLFcAI3mN8dSxUU38r846vwd46NHj3g8hAoOTsTfd4EafRLI1xel4MpfvKgNa43leYou2Kq6EwzyK3rfpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UY1Q5HwY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724318273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TQYE68vcEgjS0sSHwEvda+5305YgNqXrXPbN5IkBuaU=;
	b=UY1Q5HwYWh3v/HAQG051COykZLBdUrl4gl4G2eetp+cjvuJnU8R6h2ijP5kqj9fVCTnipL
	VVd7ZLyrNn5+Gm8eMkJU3qbFReUaF8K48gI6YONQaTooqWYKChRa4gDUmg5eFoPcFza6bI
	WC3/oECWLfTeYNt/PLz8Iz7kqRKAfBo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-L0turdIFM4OQX6QvsCLAsw-1; Thu,
 22 Aug 2024 05:17:49 -0400
X-MC-Unique: L0turdIFM4OQX6QvsCLAsw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3C3B1955EB3;
	Thu, 22 Aug 2024 09:17:44 +0000 (UTC)
Received: from localhost (unknown [10.72.112.51])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A174E1956053;
	Thu, 22 Aug 2024 09:17:41 +0000 (UTC)
Date: Thu, 22 Aug 2024 17:17:36 +0800
From: Baoquan He <bhe@redhat.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-kernel@vger.kernel.org, Dave Vasilevsky <dave@vasilevsky.ca>,
	Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
	debian-powerpc@lists.debian.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev, akpm@linux-foundation.org,
	ebiederm@xmission.com, hbathini@linux.ibm.com, piliu@redhat.com,
	viro@zeniv.linux.org.uk, Sam James <sam@gentoo.org>
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related config
 items
Message-ID: <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-6-bhe@redhat.com>
 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 08/22/24 at 09:33am, John Paul Adrian Glaubitz wrote:
> Hi Baoquan,
> 
> On Wed, 2024-01-24 at 13:12 +0800, Baoquan He wrote:
> > By splitting CRASH_RESERVE and VMCORE_INFO out from CRASH_CORE, cleaning
> > up the dependency of FA_DMUMP on CRASH_DUMP, and moving crash codes from
> > kexec_core.c to crash_core.c, now we can rearrange CRASH_DUMP to
> > depend on KEXEC_CORE, and make CRASH_DUMP select CRASH_RESERVE and
> > VMCORE_INFO.
> > 
> > KEXEC_CORE won't select CRASH_RESERVE and VMCORE_INFO any more because
> > KEXEC_CORE enables codes which allocate control pages, copy
> > kexec/kdump segments, and prepare for switching. These codes are shared
> > by both kexec reboot and crash dumping.
> > 
> > Doing this makes codes and the corresponding config items more
> > logical (the right item depends on or is selected by the left item).
> > 
> > PROC_KCORE -----------> VMCORE_INFO
> > 
> >            |----------> VMCORE_INFO
> > FA_DUMP----|
> >            |----------> CRASH_RESERVE
> > 
> >                                                 ---->VMCORE_INFO
> >                                                /
> >                                                |---->CRASH_RESERVE
> > KEXEC      --|                                /|
> >              |--> KEXEC_CORE--> CRASH_DUMP-->/-|---->PROC_VMCORE
> > KEXEC_FILE --|                               \ |
> >                                                \---->CRASH_HOTPLUG
> > 
> > KEXEC      --|
> >              |--> KEXEC_CORE--> kexec reboot
> > KEXEC_FILE --|
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  kernel/Kconfig.kexec | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > index 8faf27043432..6c34e63c88ff 100644
> > --- a/kernel/Kconfig.kexec
> > +++ b/kernel/Kconfig.kexec
> > @@ -9,8 +9,6 @@ config VMCORE_INFO
> >  	bool
> >  
> >  config KEXEC_CORE
> > -	select VMCORE_INFO
> > -	select CRASH_RESERVE
> >  	bool
> >  
> >  config KEXEC_ELF
> > @@ -99,8 +97,11 @@ config KEXEC_JUMP
> >  
> >  config CRASH_DUMP
> >  	bool "kernel crash dumps"
> > +	default y
> >  	depends on ARCH_SUPPORTS_CRASH_DUMP
> > -	select KEXEC_CORE
> > +	depends on KEXEC_CORE
> > +	select VMCORE_INFO
> > +	select CRASH_RESERVE
> >  	help
> >  	  Generate crash dump after being started by kexec.
> >  	  This should be normally only set in special crash dump kernels
> 
> The change to enable CONFIG_CRASH_DUMP by default apparently broke the boot
> on 32-bit Power Macintosh systems which fail after GRUB with:
> 
> 	"Error: You can't boot a kdump kernel from OF!"
> 
> We may have to turn this off for 32-bit Power Macintosh systems.
> 
> See this thread on debian-powerpc ML: https://lists.debian.org/debian-powerpc/2024/07/msg00001.html

If so, fix need be made.

We may need change in ARCH_SUPPORTS_CRASH_DUMP of ppc, can you or anyone
post a patch? I don't know how to identify 32-bit Power Macintosh.

arch/powerpc/Kconfig:
===
config ARCH_SUPPORTS_CRASH_DUMP
        def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
        
config ARCH_SELECTS_CRASH_DUMP
        def_bool y
        depends on CRASH_DUMP
        select RELOCATABLE if PPC64 || 44x || PPC_85xx
......
config PHYSICAL_START
        hex "Physical address where the kernel is loaded" if PHYSICAL_START_BOOL
        default "0x02000000" if PPC_BOOK3S && CRASH_DUMP && !NONSTATIC_KERNEL
        default "0x00000000"


