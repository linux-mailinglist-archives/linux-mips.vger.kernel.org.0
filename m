Return-Path: <linux-mips+bounces-11245-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5528B52D9A
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 11:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FE8EA84127
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 09:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE161E5219;
	Thu, 11 Sep 2025 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QV609RYC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F841248F68
	for <linux-mips@vger.kernel.org>; Thu, 11 Sep 2025 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583947; cv=none; b=qeSJlGl1melz85ctf51kQZh0+fpxkkfuihZUFRmBrpe0W7jktFYJ1PsQTQxXLI3/h9WapSD3YAZX/uvNguGzOkpCR3HAZllddp9veOy18F6QCXqGYulnNwnImyYGok6uCm9MvNeHTxZqepoHfhr8qclYSNyRDvq3l2iAL4eYJdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583947; c=relaxed/simple;
	bh=MHXNE8zlrdOl/5ERPQ4ETWpKs5fXAkubu4eUasi2MJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YKALUrFPdLPOYhSWRXEUVQEtYlcxqnyDgZFtzrk6NsJlVW8nLdaFsIH5FuQuergPJ+ZKrpTrA96nrINw5xeVGsPKnHR5m1GsodaQqCke4Al3Y54XmXNTYC+Aw/t2SvQURzWjiWV6bPiNdJ2CSX3pfCYsFkWgooBfZOvhydYqjn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QV609RYC; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-75512f5a75cso4474966d6.2
        for <linux-mips@vger.kernel.org>; Thu, 11 Sep 2025 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757583944; x=1758188744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qnoq1sH/+JsGWFUbNrxZ5NkQ9Hl7jVr2bsCXWY9X2Yg=;
        b=QV609RYCbikPan9kZOYTYzKngHfFnmmjqiyEJpoUy3FuW4+uRSm7srgU2OyCoVR2rJ
         21ON2kkwGbjFx9UGL5AC0TbYk86yUhgMHpW0zigeaWqA/+Bf+6iZUMqYAjUpFRqx756Z
         IQrJet6LblYxL37rPH/exrxP95neH++dIFz1/xJXQP2CzaBIU45p83enoWdk93AfuzO7
         vd8xCC05rOiT6I77+KuVzWVzGhxExlasClq/ifXINa6ibIKxuXFby4coyHVOdZ3PiXE7
         6VSpFmCE3ix9MMr/599XtEV0CaJkvEAdnXkZrN5Vss4mtsX+dAhujexFz+Lks6tEhx5J
         ki2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583944; x=1758188744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnoq1sH/+JsGWFUbNrxZ5NkQ9Hl7jVr2bsCXWY9X2Yg=;
        b=HCbvZeMeUPfju4NMT4aZJHFvyCQf7rdTqNyv0084P4tTKQTaQp2OKiysHPF1jeVUxa
         7EujwgVrkAnJ43h7qNZq8hql29XIaELy38ukaejNbdYjzXhocxz9FcDpU+yDwc9Tj2Ry
         r8mLS+qeaO8h5m1OiaykuR+oW4M0raE+InHc2BJHnuP9RIIFd19/IHGsryL5gFxUaH8G
         Wutam8Mj+yQ9FH6K1i9yHBXWeXhNs9x7POcOwDri1Qr3HmoMLIeuDYHP3g6i4UUsGyAr
         IK4VPPh6Gipp2RCCVEHH9XxAqu4HZu+wa0jfGf/zZzWGRn8/gos2+HKQTwYACI5a1h3c
         DwnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTqAxOJDL2y5xLi7HVCYvp0ugB/36CklsZw40dHfT5XbboLB0d9bAukxlFJvPkE0uBZAWpsBbDFPXc@vger.kernel.org
X-Gm-Message-State: AOJu0YxlSTrc8/zQgPF03EGE4SAHDVzMdXfWJVjkQXk2mw2AN8sEdzP5
	uIYmnVOpivjAu4Ao/tL3WacKWqJk9HTzIllJTxcjF28uglS6YiJzUEaR
X-Gm-Gg: ASbGnctMkykXRwnlj/2KsgLHxwRnl0lqqHANvCJsHXTiXpoaNzO9LiOmGfzMnEcMND/
	JrlouX9jSxDkTPCK2AAGrqsnGl01JWMW1A9Ek5gtjyMK9nPE0+/usiQzeWe3V9yykWFU0RcO1bV
	yum6XgByBCzZjg4J5N1Vh1kori9fy59nSm0SsYvhFATKi/7irjEu4CUFbSkLdx5uzQjaCWB3UZJ
	7XofE1zMR4V0V93KyTvYy++FjZdyYMxu6TFEpw+2qGRGQY4PFVNPv8aRECGP/tFg8vLhNNJ7fA3
	XPBCPNhuxNY3G+ZSnlfkFg13zFKan1ipFkGvKFOTfyBjGQT0hyKh4lcqqc1sRCe801lNNUJa7wr
	kOlzidTSGagvL5bQGsmk5GMYuDihb
X-Google-Smtp-Source: AGHT+IF/qNF6kHMbxtt6lZa1Xs7x2CFaNs1iTBAFhbOiFeMIBZiADx07C0NCGdGRh55KRViIimiJSg==
X-Received: by 2002:ad4:576e:0:b0:70f:a04f:232f with SMTP id 6a1803df08f44-739344a96damr222770416d6.30.1757583944066;
        Thu, 11 Sep 2025 02:45:44 -0700 (PDT)
Received: from [0.0.0.0] ([2001:19f0:1000:6e8b:5400:5ff:fe8a:4c2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763b3f48f81sm8150226d6.11.2025.09.11.02.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:45:43 -0700 (PDT)
Message-ID: <61dff58f-b425-4af5-b5b9-76d9981ccbd5@gmail.com>
Date: Thu, 11 Sep 2025 17:45:38 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] irqchip/loongson-pch-lpc: Use legacy domain for
 PCH-LPC IRQ controller
To: Ming Wang <wangming01@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250911083546.649949-1-wangming01@loongson.cn>
Content-Language: en-US
From: Robin <robin.toplinux@gmail.com>
In-Reply-To: <20250911083546.649949-1-wangming01@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/11/25 16:35, Ming Wang wrote:
> On certain Loongson platforms, drivers attempting to request a legacy
> ISA IRQ directly via request_irq() (e.g., IRQ 4) may fail. The
> virtual IRQ descriptor is not fully initialized and lacks a valid irqchip.
> 
> This issue does not affect ACPI-enumerated devices described in DSDT,
> as their interrupts are properly mapped via the GSI translation path.
> This indicates the LPC irqdomain itself is functional but is not correctly
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

I have tested this patch on a Loongson 3A6000 platform.

Tested-by: Robin <robin.toplinux@gmail.com>

> 
> ---
> Changes in v2:
>    - Address review comments from Huacai Chen.
>    - Fix function call indentation style.
> ---
>   drivers/irqchip/irq-loongson-pch-lpc.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
> index 2d4c3ec128b8..01fe4325ff84 100644
> --- a/drivers/irqchip/irq-loongson-pch-lpc.c
> +++ b/drivers/irqchip/irq-loongson-pch-lpc.c
> @@ -200,8 +200,13 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
>   		goto iounmap_base;
>   	}
>   
> -	priv->lpc_domain = irq_domain_create_linear(irq_handle, LPC_COUNT,
> -					&pch_lpc_domain_ops, priv);
> +	/*
> +	 * The LPC interrupt controller is a legacy i8259-compatible device,
> +	 * which requires a static 1:1 mapping for IRQs 0-15.
> +	 * Use irq_domain_create_legacy() to establish this static mapping early.
> +	 */
> +	priv->lpc_domain = irq_domain_create_legacy(irq_handle, LPC_COUNT, 0, 0,
> +						    &pch_lpc_domain_ops, priv);
>   	if (!priv->lpc_domain) {
>   		pr_err("Failed to create IRQ domain\n");
>   		goto free_irq_handle;


