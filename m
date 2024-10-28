Return-Path: <linux-mips+bounces-6510-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36D99B37B5
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02F651C2183F
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 17:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2DC1DF27B;
	Mon, 28 Oct 2024 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2N8Pbhz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E497C1922FC;
	Mon, 28 Oct 2024 17:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730136848; cv=none; b=I6/3iFuxqkp8+peZ2vN5Q7eKbfO3dkvfZXPm+pFNgQo6IYUq2AMCpwzLiFHHmqKZzC8qmmoxIk9DY6ToI4peckAMswPSRc8wnIve4U7k3WDT6JdRdC1tQ3486LW3119K+2C0SFBjN9LbfmiE0odcmXb2EwzhO0vUIf4QjuNhB6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730136848; c=relaxed/simple;
	bh=pcLLhLxlquE4QPOlWW4Lr1bb5MuHYN7k6DZdbDCx9DQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cg0czanWR37a8+VicdPXU51Mhb17q24fWItfRuuxS73V4QSn27eBp4hLVajFLkt94+lj7mGU2rOsCDXUcmEnmg9Z7sR+db8PpmPayfbZYEorhG3k5q/ofNAHR+p9zOzbPuSUK9kD/wQlIWLyU/f9YOnNSoDaLEytiUzyKu0yLzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2N8Pbhz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C90C4AF09;
	Mon, 28 Oct 2024 17:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730136847;
	bh=pcLLhLxlquE4QPOlWW4Lr1bb5MuHYN7k6DZdbDCx9DQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N2N8PbhzCFAC8L9B/R+n6LS/2Vz3FY30Fm8hWgEopytD1knoRkeGPQKL3kqI2YZh4
	 N66V/nX5SYYKx1XlmynUto9sGLWOvhBEmg5rJSntmjzIwGDKa6y6pQ5CqfVhu6ox3z
	 XXy4qMSqLoaPINE/LE66ohBgCVuwypgcmHq7aI6zsMGsZnZ0NSH6AbSvbsTjET7iO5
	 tM6H9w8I9wRriKG8/z+JwgusAW1OG4vSksb8DGG2Dt3CZPSWdvjdM4zjviLYwYBMsG
	 60iDnfcMYPZgh5mphm7YYFd/flxuIVSEHd35xe9nF7CCH1OilerJX6R47wN1hlmM2E
	 GJMGejqlT3Efw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e6c754bdso4078000e87.2;
        Mon, 28 Oct 2024 10:34:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAMWbrkn5mXVOFCzQeQEALwhN9lCwQEXEhXmTja0qVP3mjN3fDvzjrPHKaS1BRZRt+t4F8BQFetBP3Qw==@vger.kernel.org, AJvYcCUn9NdQr0SzJc3v9/rVBemhnQFXxEwqynQotrqJcrZYRYNYtq0K5pYNRWCA1WT0QspPXdJiAHKd+/Q=@vger.kernel.org, AJvYcCUuyhFZhhVIbJTGeWWVCDt7aqIGSLmifhTfJEuCXvSA2elvDiAifHciQL/pV5ZXfcQ21NyW3VTOcP/lPg==@vger.kernel.org, AJvYcCVcUN0fUkpPpa/+hcQ0PwdwIFwTJJHyLMDjo6K/qGxVoFCZqCsgIPGn+AQtZ6p73WvMpeooLyVNhE4m4cfOtfM=@vger.kernel.org, AJvYcCXDd1I/EmuzOevVcqR9CcJjQKSs/aTbF0iYiPNSRNTtpTP23haMG7qIcottTxsm5oh16w+4wdsTQX4F@vger.kernel.org, AJvYcCXMotUyL+EGndyxEgQTqNwCFjeAqv13+HJVzpA4nfVnOfbc4Jh73en3/tJ37s+ygx/1V7eY5L96ULOXEWZ9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxch5vVSIHlMv+6XJ/vz3TNRO5Z/BmsMRwMYIXpmSRMDuslMI9Z
	qKiAiFc0+YtPYqzkVoPzu4FejX77YriVQ+ucqB/Jq6l4YzizWLemAzF6+wKaZK1uY+T2ezBSKvy
	YWV7YpkP2jyliVquMj/kyFKJp/g==
X-Google-Smtp-Source: AGHT+IF5IETAXGDmlx+LAKug+dwz64NqnsL1okXnnGJyl9RYKmQIgXl4x3+ziMcKV48JBCGh1PNtcevuXjcqmWy53WY=
X-Received: by 2002:a05:6512:224e:b0:539:e85c:c888 with SMTP id
 2adb3069b0e04-53b34a1900emr4148343e87.40.1730136845913; Mon, 28 Oct 2024
 10:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023171426.452688-1-usamaarif642@gmail.com> <20241028154054.GE2484@willie-the-truck>
In-Reply-To: <20241028154054.GE2484@willie-the-truck>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Oct 2024 12:33:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK=cbknmjKa-rtr9vPhaOoYf26KNzvQ0uGabOwy19jcCA@mail.gmail.com>
Message-ID: <CAL_JsqK=cbknmjKa-rtr9vPhaOoYf26KNzvQ0uGabOwy19jcCA@mail.gmail.com>
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and early_init_dt_verify
To: Will Deacon <will@kernel.org>
Cc: Usama Arif <usamaarif642@gmail.com>, mark.rutland@arm.com, leitao@debian.org, 
	catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net, 
	saravanak@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 10:41=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> On Wed, Oct 23, 2024 at 06:14:26PM +0100, Usama Arif wrote:
> >  __pa() is only intended to be used for linear map addresses and using
> > it for initial_boot_params which is in fixmap for arm64 will give an
> > incorrect value. Hence save the physical address when it is known at
> > boot time when calling early_init_dt_scan for arm64 and use it at kexec
> > time instead of converting the virtual address using __pa().
> >
> > Reported-by: Breno Leitao <leitao@debian.org>
> > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()"=
)
> > ---
> > v1 -> 2:
> > - pass dt_phys in early_init_dt_scan instead of creating
> >   anorther arch->dt function (Rob Herring)
> > ---
> >  arch/arc/kernel/devtree.c              |  2 +-
> >  arch/arm/kernel/devtree.c              |  2 +-
> >  arch/arm64/kernel/setup.c              |  6 +++++-
> >  arch/csky/kernel/setup.c               |  4 ++--
> >  arch/loongarch/kernel/setup.c          |  2 +-
> >  arch/microblaze/kernel/prom.c          |  2 +-
> >  arch/mips/kernel/prom.c                |  2 +-
> >  arch/mips/kernel/relocate.c            |  2 +-
> >  arch/nios2/kernel/prom.c               |  4 ++--
> >  arch/openrisc/kernel/prom.c            |  2 +-
> >  arch/powerpc/kernel/dt_cpu_ftrs.c      |  2 +-
> >  arch/powerpc/kernel/prom.c             |  2 +-
> >  arch/powerpc/platforms/pseries/plpks.c |  2 +-
> >  arch/riscv/kernel/setup.c              |  2 +-
> >  arch/sh/kernel/setup.c                 |  2 +-
> >  arch/um/kernel/dtb.c                   |  2 +-
> >  arch/x86/kernel/devicetree.c           |  2 +-
> >  arch/xtensa/kernel/setup.c             |  2 +-
> >  drivers/of/fdt.c                       | 14 ++++++++------
> >  drivers/of/kexec.c                     |  2 +-
> >  include/linux/of_fdt.h                 |  5 +++--
> >  21 files changed, 36 insertions(+), 29 deletions(-)
> >
> > diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
> > index 4c9e61457b2f..cc6ac7d128aa 100644
> > --- a/arch/arc/kernel/devtree.c
> > +++ b/arch/arc/kernel/devtree.c
> > @@ -62,7 +62,7 @@ const struct machine_desc * __init setup_machine_fdt(=
void *dt)
> >       const struct machine_desc *mdesc;
> >       unsigned long dt_root;
> >
> > -     if (!early_init_dt_scan(dt))
> > +     if (!early_init_dt_scan(dt, __pa(dt)))
> >               return NULL;
> >
> >       mdesc =3D of_flat_dt_match_machine(NULL, arch_get_next_mach);
> > diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> > index fdb74e64206a..3b78966e750a 100644
> > --- a/arch/arm/kernel/devtree.c
> > +++ b/arch/arm/kernel/devtree.c
> > @@ -200,7 +200,7 @@ const struct machine_desc * __init setup_machine_fd=
t(void *dt_virt)
> >
> >       mdesc_best =3D &__mach_desc_GENERIC_DT;
> >
> > -     if (!dt_virt || !early_init_dt_verify(dt_virt))
> > +     if (!dt_virt || !early_init_dt_verify(dt_virt, __pa(dt_virt)))
> >               return NULL;
> >
> >       mdesc =3D of_flat_dt_match_machine(mdesc_best, arch_get_next_mach=
);
> > diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> > index b22d28ec8028..177262739c49 100644
> > --- a/arch/arm64/kernel/setup.c
> > +++ b/arch/arm64/kernel/setup.c
> > @@ -175,7 +175,11 @@ static void __init setup_machine_fdt(phys_addr_t d=
t_phys)
> >       if (dt_virt)
> >               memblock_reserve(dt_phys, size);
> >
> > -     if (!dt_virt || !early_init_dt_scan(dt_virt)) {
> > +     /*
> > +      * dt_virt is a fixmap address, hence __pa(dt_virt) can't be used=
.
> > +      * Pass dt_phys directly.
> > +      */
> > +     if (!dt_virt || !early_init_dt_scan(dt_virt, dt_phys)) {
>
> nit: It looks like early_init_dt_verify() will now return false if
> !dt_virt, so we can drop the additional check here.

That was true before, but I'll fix this up when applying.

Rob

