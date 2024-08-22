Return-Path: <linux-mips+bounces-5004-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0598D95B1D2
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 11:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8123F281A73
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 09:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAAA17DFF7;
	Thu, 22 Aug 2024 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="I8DhLB1n"
X-Original-To: linux-mips@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B1817C9EA;
	Thu, 22 Aug 2024 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724319441; cv=none; b=HhYRT84Tnn3p+IW76cJbVGvAAJFJJdN0gKFwVk89F04VXMq7fKHmKCSqhVMyvYrQ5znMWhn39W0c3RCO9VR0kQK7FTLGpPGUwx5up+ocH+sJZdnW6Q5UbBP5N9Rq+bllpjcYuw67pnFrKSj5zcWSuv8SNwitJhO6fcVKwJGyv40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724319441; c=relaxed/simple;
	bh=JfPBsxQR8Kp4umY5k36wENIPhFCipCQYrvgc2/vm00o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nlE15lPHsAI+1eDpy/ct/tkWhLernZAlkHcmjui3Go6TZ9u+UJFqjpsZjJAlBQIs1QzDvmyDNXnnEa6MDM2t1E7xZUWfcyQ3Kf0Gl7eobODWWND9C0ZXrmsKbqb+YvvzzwViK3Z7SjLfLP5tSLzW70dTnXGoh269ovJTU7ZSwVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=I8DhLB1n; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ew4XJV0bOTsY5qn2+zYb5/OFku83Mlpg9puNUd46LUI=; t=1724319437; x=1724924237; 
	b=I8DhLB1nxh88Sxy6KQ8uHtbR4aCB9rPKpTOWlEKgG7/4uV153/ftzTlNSLl1SqeOYyACBsHVqCt
	G1pIKMgEguDUf6zJGn3eOW3+QAqKL6PqeGL48krX5nhbZJI4vcLMW6EDFf4qKIYsUcsXc+9CfeMm/
	N0gC9skUcdiGrd7uqjtmnst78LzgOuLhN+yXCJZ3mDEAOOlEfSWIDtrznRmQ4wFkQp1QlSSbIcvdd
	xi3dGG7J6F9yNXxMlJq/SpWCkBUAc/qpfviSRru8UgyBCjNCIo7HyuYH9A4PKQ031L3yTZFtUuofl
	Kg6QvSKmY7f+PIKjo609beZNPiFQHtXmP23A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sh4Fi-000000011Jg-3QjS; Thu, 22 Aug 2024 11:37:10 +0200
Received: from p5b13a2bf.dip0.t-ipconnect.de ([91.19.162.191] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1sh4Fi-00000003DQ3-2PLa; Thu, 22 Aug 2024 11:37:10 +0200
Message-ID: <c5e9996e4d2ba2a0849d65f68e3dce94fffc5828.camel@physik.fu-berlin.de>
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related
 config items
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, Dave Vasilevsky <dave@vasilevsky.ca>, 
 Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
 debian-powerpc@lists.debian.org, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev,  akpm@linux-foundation.org,
 ebiederm@xmission.com, hbathini@linux.ibm.com,  piliu@redhat.com,
 viro@zeniv.linux.org.uk, Sam James <sam@gentoo.org>
Date: Thu, 22 Aug 2024 11:37:09 +0200
In-Reply-To: <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
	 <20240124051254.67105-6-bhe@redhat.com>
	 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
	 <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
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

On Thu, 2024-08-22 at 17:17 +0800, Baoquan He wrote:
> > The change to enable CONFIG_CRASH_DUMP by default apparently broke the =
boot
> > on 32-bit Power Macintosh systems which fail after GRUB with:
> >=20
> > 	"Error: You can't boot a kdump kernel from OF!"
> >=20
> > We may have to turn this off for 32-bit Power Macintosh systems.
> >=20
> > See this thread on debian-powerpc ML: https://lists.debian.org/debian-p=
owerpc/2024/07/msg00001.html
>=20
> If so, fix need be made.
>=20
> We may need change in ARCH_SUPPORTS_CRASH_DUMP of ppc, can you or anyone
> post a patch? I don't know how to identify 32-bit Power Macintosh.
>=20
> arch/powerpc/Kconfig:
> =3D=3D=3D
> config ARCH_SUPPORTS_CRASH_DUMP
>         def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
>        =20
> config ARCH_SELECTS_CRASH_DUMP
>         def_bool y
>         depends on CRASH_DUMP
>         select RELOCATABLE if PPC64 || 44x || PPC_85xx
> ......
> config PHYSICAL_START
>         hex "Physical address where the kernel is loaded" if PHYSICAL_STA=
RT_BOOL
>         default "0x02000000" if PPC_BOOK3S && CRASH_DUMP && !NONSTATIC_KE=
RNEL
>         default "0x00000000"

I think the architecture does support crash dumps, but I think the kernel h=
as to
be booted from kexec in this case. Booting a kernel with CRASH_DUMP enabled=
 won't
work from Open Firmware. So, I think CRASH_DUMP should just be disabled for
PPC_BOOK3S_32 by default and users who want to use it on these systems, wil=
l have to
enable it explicitly.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

