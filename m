Return-Path: <linux-mips+bounces-4998-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C92E95AF61
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 09:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 199C51F242D0
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 07:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0508F1531F8;
	Thu, 22 Aug 2024 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="nlPGcbSN"
X-Original-To: linux-mips@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0805A933;
	Thu, 22 Aug 2024 07:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724312053; cv=none; b=bWJiCgBltBUJT1iMF392wm/UsQHy9X9nWkG0yjDEKVGIYPhT8FPQ2quDQgKAXTcAs+ht3HVlnUrEXmmcPy+kIXyBOKwecDkavjrJlCrLB8j4Wdwqx8FU95hsY2/Ka21UsblSL/XqR9ggIlqloxPOQiGB4SLEGGoh8ScbLz2uJiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724312053; c=relaxed/simple;
	bh=lIKHvHDsMIm2CVSLExtUiHMjQu2vPE8seshIYDk/SIk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xoe2pz7eb+mUHZJzXgpZGHZ4B8ofNx/p7hGl+TTyVUCm50/XxErPZ03l8NCywy56bzsAOpOJ7wUo/cbkIxqaBjwRFJy+x+lqdyu+Ew60DT+NWX5dfq9ACWdQhljE1t+cklWSCrSL61A/XcHN5+Bilt/H6lETIUD4l0UothAtG8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=nlPGcbSN; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nsNs6OoEVbcw2LLEgSbDKi7BEPoPfsioIF+I1dRzjSQ=; t=1724312050; x=1724916850; 
	b=nlPGcbSNTlJ1ua53ttil+1bd31AMJzzCWczPIlCSh1ckviFmz5/SvN4/+KmwHN7ROOQP6jaPlNN
	xdPCDJ2h56xYGwLbDG/+tBZUxf1rSaTe4MwwBakvXHEue5fDbVIgQmXWtMjc60v723txEaBKwo3ft
	qt3tgfrXa9vpd4k2Imvzxda6Se4VWwfsnnkjvbTyPbo26HuQIYvjkE4Kjt36HeZXyrnOKFZsV1aA7
	5eJ2ChYEEg16SPepCcqYip+VQI0P9eLTzX0ZvVEZiHTeBhV4lvYa+XI8V0aYEmRpxT8IXlD7eH5Rw
	nwsXDZ5c1beiTcK26lrVGa2yj3+kYQyIeyBA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sh2KT-000000008j9-3CbJ; Thu, 22 Aug 2024 09:33:57 +0200
Received: from p5b13a2bf.dip0.t-ipconnect.de ([91.19.162.191] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1sh2KT-00000002vTy-29Tp; Thu, 22 Aug 2024 09:33:57 +0200
Message-ID: <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related
 config items
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Cc: Dave Vasilevsky <dave@vasilevsky.ca>, Michael Ellerman
 <mpe@ellerman.id.au>,  kexec@lists.infradead.org,
 debian-powerpc@lists.debian.org, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev,  akpm@linux-foundation.org,
 ebiederm@xmission.com, hbathini@linux.ibm.com,  piliu@redhat.com,
 viro@zeniv.linux.org.uk, Sam James <sam@gentoo.org>
Date: Thu, 22 Aug 2024 09:33:56 +0200
In-Reply-To: <20240124051254.67105-6-bhe@redhat.com>
References: <20240124051254.67105-1-bhe@redhat.com>
	 <20240124051254.67105-6-bhe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Baoquan,

On Wed, 2024-01-24 at 13:12 +0800, Baoquan He wrote:
> By splitting CRASH_RESERVE and VMCORE_INFO out from CRASH_CORE, cleaning
> up the dependency of FA_DMUMP on CRASH_DUMP, and moving crash codes from
> kexec_core.c to crash_core.c, now we can rearrange CRASH_DUMP to
> depend on KEXEC_CORE, and make CRASH_DUMP select CRASH_RESERVE and
> VMCORE_INFO.
>=20
> KEXEC_CORE won't select CRASH_RESERVE and VMCORE_INFO any more because
> KEXEC_CORE enables codes which allocate control pages, copy
> kexec/kdump segments, and prepare for switching. These codes are shared
> by both kexec reboot and crash dumping.
>=20
> Doing this makes codes and the corresponding config items more
> logical (the right item depends on or is selected by the left item).
>=20
> PROC_KCORE -----------> VMCORE_INFO
>=20
>            |----------> VMCORE_INFO
> FA_DUMP----|
>            |----------> CRASH_RESERVE
>=20
>                                                 ---->VMCORE_INFO
>                                                /
>                                                |---->CRASH_RESERVE
> KEXEC      --|                                /|
>              |--> KEXEC_CORE--> CRASH_DUMP-->/-|---->PROC_VMCORE
> KEXEC_FILE --|                               \ |
>                                                \---->CRASH_HOTPLUG
>=20
> KEXEC      --|
>              |--> KEXEC_CORE--> kexec reboot
> KEXEC_FILE --|
>=20
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  kernel/Kconfig.kexec | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index 8faf27043432..6c34e63c88ff 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -9,8 +9,6 @@ config VMCORE_INFO
>  	bool
> =20
>  config KEXEC_CORE
> -	select VMCORE_INFO
> -	select CRASH_RESERVE
>  	bool
> =20
>  config KEXEC_ELF
> @@ -99,8 +97,11 @@ config KEXEC_JUMP
> =20
>  config CRASH_DUMP
>  	bool "kernel crash dumps"
> +	default y
>  	depends on ARCH_SUPPORTS_CRASH_DUMP
> -	select KEXEC_CORE
> +	depends on KEXEC_CORE
> +	select VMCORE_INFO
> +	select CRASH_RESERVE
>  	help
>  	  Generate crash dump after being started by kexec.
>  	  This should be normally only set in special crash dump kernels

The change to enable CONFIG_CRASH_DUMP by default apparently broke the boot
on 32-bit Power Macintosh systems which fail after GRUB with:

	"Error: You can't boot a kdump kernel from OF!"

We may have to turn this off for 32-bit Power Macintosh systems.

See this thread on debian-powerpc ML: https://lists.debian.org/debian-power=
pc/2024/07/msg00001.html

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

