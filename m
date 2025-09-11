Return-Path: <linux-mips+bounces-11243-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 502D4B52C01
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 10:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D1A617DF38
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 08:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7F02E543E;
	Thu, 11 Sep 2025 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BG2qJ6Qj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2808E2206A7;
	Thu, 11 Sep 2025 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580134; cv=none; b=dSXmUyceUoXrdLMlVFYbHtqlyWZuBa/2meS824DMlcWgTQ53iyG3sRdUtBpvriFGPFIuKlpoRs9H3BSgLpVqz/OrmkI4Pe4n9NHLluHqHxpUh3sPC0ZFlC8WLnwDYF+g/45SD8njSMEd+q16Qt/KBK23C8814affFAcaEHExc2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580134; c=relaxed/simple;
	bh=Tb4mY4mFW4j6C2X7p0oCDZvBDicQe45QQXnOwRSNQ+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=deDaLQ7D/LkrR9TpB3rjiBVEc7R4ZyURLjjl/wM3J6m9nWfcgH6tM+4MwSHzFk/ArFJwxBnAELEyf9L175Ai0O7WeKEyrSkbt2jp+Lb5oQhd63TAn8KU8vuc0z5qObb0Qv3065ZGKLG52QiNH58wFsPeFDwq4fxGadZXZMHCGME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BG2qJ6Qj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FACC4AF09;
	Thu, 11 Sep 2025 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757580133;
	bh=Tb4mY4mFW4j6C2X7p0oCDZvBDicQe45QQXnOwRSNQ+w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BG2qJ6Qj3Zgd++kVqEIb9CEfgHmTEriGlx0wYjQMHmcDoD6Qtgg6ut9K+LQJY55PF
	 qenM8/pC8YXiU0dg8P3PBKZO5rIvQpFYTJQL1bBFWQVjTqGHuav6Aj7DOVqwoO+j4J
	 5uGvKWD8iVFfVKPuvN8P4k4gCW9vcIsTB0rh6I14wvfmUtValRWnCa12MfdqSOzVmT
	 JGp0zoSzN5YqKDQ2tPgY00HkB82u1niAX5YaCuJCDlycd9roJP3EIzI6AWSdtUbmox
	 ljZFCqKYhlj+RaYjg7I7VARqMttJNPNzUPD1u9dxERTsdY0DFRXl19/CCNyeg9t4Xi
	 cjnJ9RuyPwfpw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so63647366b.3;
        Thu, 11 Sep 2025 01:42:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUS12fO5x0pkTjQwi6VNK4Ft9+3pOTKmVq5sBRYp2ET0iQzixQ8lFeZRR2llPVXdAAb8hfl7tVYsVHa1Q==@vger.kernel.org, AJvYcCVfwlo4NAZmGBuuvRhLcznx6s3F/FLqWWqvXRNo5RE8POBuS880x7NcDQz4XUBKe7b2XL7ubY0jibWDplk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvt2wpS8ciMquhFsqKEVxd93yA5P1a2SJcGVLc4T14JZNe18ET
	iNpKfjekR5OnL1Mgk6vBApfPedT8hIBtac+SlFbVnBEA9xcpkXKwbpdW3akyjBjijM+O7Jz6xes
	ePUuBh79Qbf8GyBZybDmFZxXrrZ2tS20=
X-Google-Smtp-Source: AGHT+IGCNRWZexHleebCSpfx1aSECkro4rJmPTtqtIk5TyiQEHbOwU5Kk+Tgn7aWOoS0ew5Z1CnEGtBPHPMKfsUUoFE=
X-Received: by 2002:a17:907:1ca2:b0:aff:fe6:78f0 with SMTP id
 a640c23a62f3a-b04b16c47f5mr1929541466b.54.1757580132302; Thu, 11 Sep 2025
 01:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911083546.649949-1-wangming01@loongson.cn>
In-Reply-To: <20250911083546.649949-1-wangming01@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 11 Sep 2025 16:42:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4FtYpgrWnvTm0=2_kit5ETxyhJCXFoV=66NKgVbipPrA@mail.gmail.com>
X-Gm-Features: AS18NWBB5OUFbWKCB0yhIXcdIShPf3lhsEnwkMqfw21SM-WpT2sYaBJihfEkMvE
Message-ID: <CAAhV-H4FtYpgrWnvTm0=2_kit5ETxyhJCXFoV=66NKgVbipPrA@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/loongson-pch-lpc: Use legacy domain for
 PCH-LPC IRQ controller
To: Ming Wang <wangming01@loongson.cn>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 4:35=E2=80=AFPM Ming Wang <wangming01@loongson.cn> =
wrote:
>
> On certain Loongson platforms, drivers attempting to request a legacy
> ISA IRQ directly via request_irq() (e.g., IRQ 4) may fail. The
> virtual IRQ descriptor is not fully initialized and lacks a valid irqchip=
.
>
> This issue does not affect ACPI-enumerated devices described in DSDT,
> as their interrupts are properly mapped via the GSI translation path.
> This indicates the LPC irqdomain itself is functional but is not correctl=
y
> handling direct VIRQ-to-HWIRQ mappings.
>
> The root cause is the use of irq_domain_create_linear(). This API sets
> up a domain for dynamic, on-demand mapping, typically triggered by a GSI
> request. It does not pre-populate the mappings for the legacy VIRQ range
> (0-15). Consequently, if no ACPI device claims a specific GSI
> (e.g., GSI 4), the corresponding VIRQ (e.g., VIRQ 4) is never mapped to
> the LPC domain. A direct call to request_irq(4, ...) then fails because
> the kernel cannot resolve this VIRQ to a hardware interrupt managed by
> the LPC controller.
>
> The PCH-LPC interrupt controller is an i8259-compatible legacy device
> that requires a deterministic, static 1-to-1 mapping for IRQs 0-15 to
> support legacy drivers.
>
> Fix this by replacing irq_domain_create_linear() with
> irq_domain_create_legacy(). This API is specifically designed for such
> controllers. It establishes the required static 1-to-1 VIRQ-to-HWIRQ
> mapping for the entire legacy range (0-15) immediately upon domain
> creation. This ensures that any VIRQ in this range is always resolvable,
> making direct calls to request_irq() for legacy IRQs function correctly.
>
> Signed-off-by: Ming Wang <wangming01@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

>
> ---
> Changes in v2:
>   - Address review comments from Huacai Chen.
>   - Fix function call indentation style.
> ---
>  drivers/irqchip/irq-loongson-pch-lpc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq=
-loongson-pch-lpc.c
> index 2d4c3ec128b8..01fe4325ff84 100644
> --- a/drivers/irqchip/irq-loongson-pch-lpc.c
> +++ b/drivers/irqchip/irq-loongson-pch-lpc.c
> @@ -200,8 +200,13 @@ int __init pch_lpc_acpi_init(struct irq_domain *pare=
nt,
>                 goto iounmap_base;
>         }
>
> -       priv->lpc_domain =3D irq_domain_create_linear(irq_handle, LPC_COU=
NT,
> -                                       &pch_lpc_domain_ops, priv);
> +       /*
> +        * The LPC interrupt controller is a legacy i8259-compatible devi=
ce,
> +        * which requires a static 1:1 mapping for IRQs 0-15.
> +        * Use irq_domain_create_legacy() to establish this static mappin=
g early.
> +        */
> +       priv->lpc_domain =3D irq_domain_create_legacy(irq_handle, LPC_COU=
NT, 0, 0,
> +                                                   &pch_lpc_domain_ops, =
priv);
>         if (!priv->lpc_domain) {
>                 pr_err("Failed to create IRQ domain\n");
>                 goto free_irq_handle;
> --
> 2.43.0
>

