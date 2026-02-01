Return-Path: <linux-mips+bounces-13077-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI0gA3y7fmmSdQIAu9opvQ
	(envelope-from <linux-mips+bounces-13077-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 01 Feb 2026 03:33:32 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E1C4ABD
	for <lists+linux-mips@lfdr.de>; Sun, 01 Feb 2026 03:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43923300F1A7
	for <lists+linux-mips@lfdr.de>; Sun,  1 Feb 2026 02:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3E825D53B;
	Sun,  1 Feb 2026 02:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+BT2xPC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B57225B1D2
	for <linux-mips@vger.kernel.org>; Sun,  1 Feb 2026 02:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769913208; cv=none; b=DVibZBqTZGtcgZWSNupjVRGJTSEv+w48FzcaPfA8/wJAaL5tae6AcsRGrxc+L39oZzu+/MhTapXSFJMukSmbos2yJGcUtf3NOKq/o2rP14ReAWs69Cfh2Tgv+cnV9PEywKgZD0R0iM6H0JVbVnZn5SweI3o8cB6xRNCI4F6H7a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769913208; c=relaxed/simple;
	bh=oadJ7vK/SzOOArI8dl4RQS9/RbWpxRBfQUZfy4XJWis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCt4fuIlMNKzs/kMt5yAyoN/1mJsAR2uwGxM+ri/sKBzUL6NZcFA4GXAKwZnGYnuaV89mbWwD+c5Il0pp1/ZoyPiavc9UAOsbZk8E/QOwY61QDF/UJuihFwjxUg/VA0uwox5CKY2gTBhU3zk7TPltGpISXGKn01WF0WQLrMv1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+BT2xPC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C950C4AF09
	for <linux-mips@vger.kernel.org>; Sun,  1 Feb 2026 02:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769913208;
	bh=oadJ7vK/SzOOArI8dl4RQS9/RbWpxRBfQUZfy4XJWis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d+BT2xPCs3j90xUW9gLaPDyOF1cZYeep9XyUr+nVAN0K6IBFhH9KQ54+EQL3XzCfm
	 J8fn7Wj6fUfWXppgtSLvWV2rzIzRyqnmCH2OlpYjN0L5dTujUYWScHOq/SJBBlHBjZ
	 Kz6jEruTrO8UVG8i49IW7NGv3BLaMYyTksDDYBSPouGW2nMRuKC43X+iyemBqOVtx/
	 z6TGyfi44iKTBqewvy2mgPvodmCwj+BjgtAHzj8s8KDvVFqyuHbvQqceEbrGhwFfFi
	 jCjIHCRRyFdZrcB32TibBZxk8H9wl+8vA+ur7JzikFkZzS3dyhBLPjzQTvIeJffnro
	 Xr//wzuq/QPUA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so475319666b.2
        for <linux-mips@vger.kernel.org>; Sat, 31 Jan 2026 18:33:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWg52d8eAkboOG8GlWlK6mVgLTWwdx9ME9hPSkaOFKZwujfcsk3cmLTBUJIosUWhrcYD0QZxBx8wRAt@vger.kernel.org
X-Gm-Message-State: AOJu0YxngkGxrVGH94PL4Jk+dKMqlXQJuGosvsWrx58722ypC45ywcFm
	9Xc5fef5ukClnMfkZzEUYmW8hIBlZn8COvxa25i8Vs/KH88by7utYZo8D4Uuk1RSJ0CR8d6SO2C
	NtCSnsIPPaeo44lnD8GE48/9CouiF7jU=
X-Received: by 2002:a17:907:84b:b0:b73:398c:c5a7 with SMTP id
 a640c23a62f3a-b8dff722195mr415349566b.41.1769913206644; Sat, 31 Jan 2026
 18:33:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131094547.455916-1-zhengxingda@iscas.ac.cn> <20260131094547.455916-6-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260131094547.455916-6-zhengxingda@iscas.ac.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Feb 2026 10:33:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6VT0tE-rE+3YAm-Tjz4TKxqtaQmc4Medsw_0VQEW-W3A@mail.gmail.com>
X-Gm-Features: AZwV_QgDTqY28h2jztUBFGOMBXwN06OkrWUBMEBAwRUW9RZDCVhRti3Y45wjuik
Message-ID: <CAAhV-H6VT0tE-rE+3YAm-Tjz4TKxqtaQmc4Medsw_0VQEW-W3A@mail.gmail.com>
Subject: Re: [PATCH 5/8] irqchip/loongson-pch-lpc: add OF init code
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13077-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,flygoat.com:email]
X-Rspamd-Queue-Id: 640E1C4ABD
X-Rspamd-Action: no action

Hi, Icenowy,

On Sat, Jan 31, 2026 at 5:46=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> As the (kernel-internally) OF-based MIPS Loongson-3 systems can also
> have PCH LPC interrupt controller, add OF-based initialization code for
> the driver.
I think Patch-3/4/5 can be combined to a single one.

Huacai
>
> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  drivers/irqchip/irq-loongson-pch-lpc.c | 28 ++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq=
-loongson-pch-lpc.c
> index 96489e031d34e..0baa93028abf4 100644
> --- a/drivers/irqchip/irq-loongson-pch-lpc.c
> +++ b/drivers/irqchip/irq-loongson-pch-lpc.c
> @@ -13,6 +13,8 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
>  #include <linux/syscore_ops.h>
>
>  #include "irq-loongson.h"
> @@ -257,3 +259,29 @@ int __init pch_lpc_acpi_init(struct irq_domain *pare=
nt,
>         return 0;
>  }
>  #endif /* CONFIG_ACPI */
> +
> +#ifdef CONFIG_OF
> +static int pch_lpc_of_init(struct device_node *node,
> +                               struct device_node *parent)
> +{
> +       int parent_irq;
> +       struct fwnode_handle *irq_handle;
> +       struct resource res;
> +
> +       if (of_address_to_resource(node, 0, &res))
> +               return -EINVAL;
> +
> +       parent_irq =3D irq_of_parse_and_map(node, 0);
> +       if (!parent_irq) {
> +               pr_err("Failed to get the parent IRQ for LPC IRQs\n");
> +               return -EINVAL;
> +       }
> +
> +       irq_handle =3D of_fwnode_handle(node);
> +
> +       return pch_lpc_init(res.start, resource_size(&res), irq_handle,
> +                           parent_irq);
> +}
> +
> +IRQCHIP_DECLARE(pch_lpc, "loongson,pch-lpc-1.0", pch_lpc_of_init);
> +#endif /* CONFIG_OF */
> --
> 2.52.0
>

