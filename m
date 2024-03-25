Return-Path: <linux-mips+bounces-2385-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9616488B0C1
	for <lists+linux-mips@lfdr.de>; Mon, 25 Mar 2024 21:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E088BA3CBC
	for <lists+linux-mips@lfdr.de>; Mon, 25 Mar 2024 14:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6E01474B5;
	Mon, 25 Mar 2024 10:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FSxmuxYv"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170661272BD
	for <linux-mips@vger.kernel.org>; Mon, 25 Mar 2024 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711360123; cv=none; b=KB9LY3NtNs9YSr4tTs/ALwf3a3o3TlkQq/TQdHYviDQKfM7mjYM9qXztjE7DFToA93MRMCpzknfjJJ6wduzj5oKo08T6BZhb+3El2GUtZLYdOPHD9NP5HFimoiZjLBU9Oz73/y8iASCyuDfEdIae7q7K+g3uGP5Rv/1t16LY/ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711360123; c=relaxed/simple;
	bh=z7nQ+fuXBBJwghbwTKA/0pe69mO2YVrSsG63TX2xrh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fL6mJMsirbdYouo6X8yC44C3gtpaEeuCzF38z8tUic13t2bY3Zb08OXSpcqA0vadlHiXC+lCfgawJA3jiY5NLa+MKvdom2E30PR9C4EcoZPRAo6IBYv9dGIVSzbA/wtD/02qK5ZY3M4C+7jHgEKd+v+1nrS0+YdzY4yuGQvvqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FSxmuxYv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711360120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BzvHsR0swPhNezye8rUpRIe+AmkradciiszFVdBH2qI=;
	b=FSxmuxYvPrdDs8HMLQzeY8sSXAKYWv4QR1yZp4UN36bWow0Ors90vwH9arkjzN11rdXqw/
	ayOcVbPm6SGLAIG24KKyPVtqIx8a4b6hzSIQ/XE+5w2Lp/Xmdp3ExS53t2QQl9OrFj/4rX
	fF5qtAXTcXwZDBIhsql93t2MMJJyjFA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-81-sGBrjBOZPjWGzkRUL_JyGQ-1; Mon,
 25 Mar 2024 05:48:36 -0400
X-MC-Unique: sGBrjBOZPjWGzkRUL_JyGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B0273C0BE29;
	Mon, 25 Mar 2024 09:48:35 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4782E112131D;
	Mon, 25 Mar 2024 09:48:25 +0000 (UTC)
Date: Mon, 25 Mar 2024 17:48:18 +0800
From: Baoquan He <bhe@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev, akpm@linux-foundation.org,
	ebiederm@xmission.com, hbathini@linux.ibm.com, piliu@redhat.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH linux-next v3 02/14] crash: split vmcoreinfo exporting
 code out from crash_core.c
Message-ID: <ZgFIYuYULrgF1tFG@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-3-bhe@redhat.com>
 <CAMuHMdVxKEGYj9C1=P-493vcrN_HmLNx8gS6i1nheXO9gH46oA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVxKEGYj9C1=P-493vcrN_HmLNx8gS6i1nheXO9gH46oA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

On 03/25/24 at 09:24am, Geert Uytterhoeven wrote:
> Hi Baoquan,
> 
> On Wed, Jan 24, 2024 at 6:13 AM Baoquan He <bhe@redhat.com> wrote:
> > Now move the relevant codes into separate files:
> > kernel/crash_reserve.c, include/linux/crash_reserve.h.
> >
> > And add config item CRASH_RESERVE to control its enabling.
> >
> > And also update the old ifdeffery of CONFIG_CRASH_CORE, including of
> > <linux/crash_core.h> and config item dependency on CRASH_CORE
> > accordingly.
> >
> > And also do renaming as follows:
> >  - arch/xxx/kernel/{crash_core.c => vmcore_info.c}
> > because they are only related to vmcoreinfo exporting on x86, arm64,
> > riscv.
> >
> > And also Remove config item CRASH_CORE, and rely on CONFIG_KEXEC_CORE to
> > decide if build in crash_core.c.
> >
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> > v2->v3:
> > - There's conflict when rebasing to linux-next in kernel/crash_core.c
> >   because of below commits from Uladzislau:
> >   commit 699d9351822e ("mm: vmalloc: Fix a warning in the crash_save_vmcoreinfo_init()")
> >   commit 5f4c0c1e2a51 (:mm/vmalloc: remove vmap_area_list")
> 
> Thanks for your patch, which is now commit 443cbaf9e2fdbef7
> ("crash: split vmcoreinfo exporting code out from
> crash_core.c") in v6.9-rc1.
> 
> After this, there are still two references left to CRASH_CORE:
> 
>   1. Documentation/admin-guide/kdump/kdump.rst:
> 
>          Subsequently, CRASH_CORE is selected by KEXEC_CORE::
> 
>   2. arch/loongarch/Kconfig
> 
>          config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>              def_bool CRASH_CORE

Sure, will post patch to clean them up. Thanks a lot.


