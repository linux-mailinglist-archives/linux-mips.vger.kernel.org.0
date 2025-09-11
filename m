Return-Path: <linux-mips+bounces-11229-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 524DFB527D5
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 06:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9B623A454F
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 04:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836AB2376FC;
	Thu, 11 Sep 2025 04:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJFl2VkX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B48733F3;
	Thu, 11 Sep 2025 04:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757566209; cv=none; b=jnWO8pNNmbPuOv21QkjhpU+Q9bShOx99lDXqurUnMDADuxF0f+KT/0UfngpAqM/kQeEs5OnzFkrtxOSNHTjqpkIVJ9HaaWVydqFV6crUZ+C/sAPKveeSOf31H+/QhGChYdWiLpoEKA4J2QP7DH6jArItVyo6fJKV/np2CYgUiRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757566209; c=relaxed/simple;
	bh=0b2X14K1Ynnp+L63vjAz5LtdOkWxYN0nZEQNEjzxgTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDuAeI08Lpgk+FcHGnTzI8lTynKiSQMOcOnLgkVJOZkd6PXa3akrK5WlbhHMn5m4IkKfB4eI3zkkBbSqYct6z+OvMqk4PIr5ipcHgpsV9HGhxlEiY0xBrR8BHJq/3MH2LNVIX5N6o0Okiamm94kWmCkkgUObfgs4YDPzJ8ZPgJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJFl2VkX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03FBC4CEF7;
	Thu, 11 Sep 2025 04:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757566208;
	bh=0b2X14K1Ynnp+L63vjAz5LtdOkWxYN0nZEQNEjzxgTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GJFl2VkXGRO98ft5A0bOppNpovV4tE9/f3osRRbNuaZSrPkn1tNhdo1TdIL00S4pS
	 oUH2T9QKh9jC38rE9E8xjwxOlRAI/TobCgRcy1MucGt9edTznVy0VIcDsddP7SEQVD
	 pNHLV5UmBRrVMgKYvbAYVZQdzfKqjDA4/OrYA/1nOESQIZeixAjuDSYWhgzQYszRUz
	 ApS9J1MYbJZN2dkPwx/cTPBCrYstMhR/5H2lSkbcS+zj4rZRAZUyuCKZICGmEw9G7O
	 wlgIu71M+V4QqqVzkrcZmPO4dCpjdCRc90tL/rKVTDhjzsy3Lql7RCpqD5nCaU2N5f
	 cutY966cN8GZg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b0787fa12e2so39954966b.2;
        Wed, 10 Sep 2025 21:50:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTSM6b6bvqrtxF9CzNCWKADkOTglGQmv7MIBTkwZU/9luC7iZZh+PIKvnRGjsimLoR+mvtQEYlbmZ9JA==@vger.kernel.org, AJvYcCXYnch3U7YldHtt627FFig162wUhEGVH5XnQKJGG3lBOBR1LBaw7TvVxpIVq/wWJG8TvDFzlK1nbqr6hWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1kT5ef53AcBQlmV2XPWA7gaKCx5Z7iRAKyNI43YCANjKcNhBN
	ETr7Z5HCLubkRW84zHG/ui5q0PGftt4/B6z9AAkECLQZZzYVPd/O4N2K6suxdjEHUiVHdjfosV3
	LV1ncIYyuWEtGlwTQ9wVyhgTPo3FIiSM=
X-Google-Smtp-Source: AGHT+IEV7VwFYiQTBYe7V+o/hAVArywynYDDta4S7WFt8W7ilPeTxemYEqgtek7e5nRRPDDJFCog1y1fq+4i8hDm1W4=
X-Received: by 2002:a17:907:1c28:b0:b04:9854:981f with SMTP id
 a640c23a62f3a-b04b16bf13dmr1742724866b.43.1757566207495; Wed, 10 Sep 2025
 21:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909125840.638418-1-wangming01@loongson.cn>
In-Reply-To: <20250909125840.638418-1-wangming01@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 11 Sep 2025 12:49:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4NDsrvuPH2o1D=UzTTH13Q62YxcHCZLN-QvZ2Dc5qEqw@mail.gmail.com>
X-Gm-Features: Ac12FXyBHlX6bzX7g0WxlJicRLJgk6ijicwFR_bAJciSiP8YQ80aWpC_nBkUZcM
Message-ID: <CAAhV-H4NDsrvuPH2o1D=UzTTH13Q62YxcHCZLN-QvZ2Dc5qEqw@mail.gmail.com>
Subject: Re: [PATCH] irqchip/loongson-pch-lpc: Use legacy domain for PCH-LPC
 IRQ controller
To: Ming Wang <wangming01@loongson.cn>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Wangming,

On Tue, Sep 9, 2025 at 8:58=E2=80=AFPM Ming Wang <wangming01@loongson.cn> w=
rote:
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
If we create a legacy domain, the VIRQ0~15 are pre-allocated, then an
ACPI device claims GSI 4, what will happen?

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
> ---
>  drivers/irqchip/irq-loongson-pch-lpc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq=
-loongson-pch-lpc.c
> index 2d4c3ec128b8..68b09cc8c400 100644
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
> +        * Use irq_domain_create_legacy to establish this static mapping =
early.
irq_domain_create_legacy()

> +        */
> +       priv->lpc_domain =3D irq_domain_create_legacy(irq_handle, LPC_COU=
NT, 0, 0,
> +                       &pch_lpc_domain_ops, priv);
The recommended indentation is:
       priv->lpc_domain =3D irq_domain_create_legacy(irq_handle, LPC_COUNT,=
 0, 0,

                   &pch_lpc_domain_ops, priv);

which means "&" is below "irq_handle".

Huacai

>         if (!priv->lpc_domain) {
>                 pr_err("Failed to create IRQ domain\n");
>                 goto free_irq_handle;
> --
> 2.43.0
>

