Return-Path: <linux-mips+bounces-12650-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D6FCEA137
	for <lists+linux-mips@lfdr.de>; Tue, 30 Dec 2025 16:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 215A4301D0E5
	for <lists+linux-mips@lfdr.de>; Tue, 30 Dec 2025 15:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A17317715;
	Tue, 30 Dec 2025 15:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MgyNrhY0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0402E9EA1
	for <linux-mips@vger.kernel.org>; Tue, 30 Dec 2025 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767108860; cv=none; b=jv/FJjq5ZEpVs/APzRd1mk6z1oAusGZSzKNcIruIhPPOLcc0+BUkpdzcvZsrq+BUaoejB3+ohommOWG8KCjg9kXvnFvdmHUG8O3M6trFBv9DWgbNpjm2AFhVwqjIS1Zh6/a5ENE8dCsIhyBdUomJmGCPG2md3OOJi3SAyXj/QWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767108860; c=relaxed/simple;
	bh=aqzRyBn+Y3OqK77qhoorBraA99Y38CJhGBTauNcLIyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJoFYq2y3ZAc43JIMvRKJp4iNIite3hRyNHOdMs99mx3Ey6X/3jUiCaJL6jVKkjJ8vmu+obrh9ym7+3fhmKnoW/EPiJBtu1FIb+EESIS1jiPj//OnNC1au66st4MWiUJ6CidKDxjmSAje5tST94GwfCVEvuJWoYSpRz3z4vWagQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MgyNrhY0; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37e6dd536b0so95593341fa.2
        for <linux-mips@vger.kernel.org>; Tue, 30 Dec 2025 07:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767108857; x=1767713657; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nXCQAS3HJRf+jQxCM70PqHXnYYGKX1vopCn4f1WZ9cE=;
        b=MgyNrhY0BCBGp3PD7viIJAtb3a+uPXoUiPJ2Hfj4UUeoH/I8ZCklNj89xoOAxlK8fN
         J1MC/kC7yAhnMSXftWNXjsOzMMj5SkbMwdZ1yYgY3TAmFYjTnRe1N1j7ZHixYGKzR11t
         pzTk25AyPsr+HvVUKZPGO7wtSs9W01xnZztHUiLuZSCY5tk8ya2pWTnCbZnjqivoYKgm
         /Fef0OgwIcArI5GQXtINlvD2QV14ozOgO/f6Kauo/WLV8zqpEpQMgtNXtY9gxmSP/Kds
         2ZAO62EtLelFosBh+42WRjWPE9E3Nxx/2Hu7hs9gnoNfcW0ek5yvclbMqe2scKP+vOau
         hVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767108857; x=1767713657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXCQAS3HJRf+jQxCM70PqHXnYYGKX1vopCn4f1WZ9cE=;
        b=CMCagABRNMR+dqQqoCeqQ2LGepaQEy6jcnKyTuSmet6sMDpiT/BGE3CYWE4tDBVwkW
         jz6YE9X5Xu+dlDVF8qlccyQ7tH9183U78acCqIl/H2qfnzvkTmPL5Vd2OB3HPsOsE85+
         mbBHFQotRD5nh/0hI4YA+HTHGSb816qDh9IGDRh4slcAX/dKR1zq0L9F9+sInWYq04C7
         2lhbLpEv3gUKEEJhGPk1+LcxnQuCuu4r3iBvsSU4b7tqFleph7tqRcO1eBU8/T/iJCXt
         HCOA8zo1UQkk3CxHQ/YKpnEsp5hB8wHrLBLNaVoWeMA+MKYq9/o4dQfnxG+8ELxGvX1x
         Lp0g==
X-Forwarded-Encrypted: i=1; AJvYcCUTvd31JUkVeC3fmxU3rckMOvS41Euu0/xoQl6lQRO03fMAVPfSPHLE3Vn5q277I5QYf1aS6PBBuqLE@vger.kernel.org
X-Gm-Message-State: AOJu0YyjXweWCi0j+8vmsMEmL/DoaUkwwOypMorzuMluebULJjT9BDp9
	KDxHNQr2z6FSBmIG0LpABDdP72srrC3WN0yJXNj7htcp1IK4K3nh3CXIs6kRdoLebbDYqhIlN6Y
	wIOFOHGo3VT5yzvIMch0/2aadYA56NXbD5leKlUO02g==
X-Gm-Gg: AY/fxX6zvzUod2fhb7HY0LGM0Lv+2ABSwQLPozQa8tEKWFPu4USHl/8Uvcfwa1UekEd
	PL6lTxn0DtqfisQKfjNEPv2cRv+esfWE9gG+rPmK4b83cGl3Z/k37mtEFP4QwFbSCRkmKDLmgyg
	dAAEpj1GzmU/aMK+UcEOf8r+hNt9eamflitkqHw317Uwf/duMbGREyfdYKFsVuitRiG3BuOlqZv
	srIB1TxcetJQ8TA6L671oiI/eUi3Gc/FCVp4b3mHaog+iT8CnisdaWNUY/j67URi+7YT19MXJJB
	wbA3xs0=
X-Google-Smtp-Source: AGHT+IF8m67UtLFJYo+1Sd/5xP1asTd78BRhH0xaCX+pqytxUScESGkOS8OTTGNkp77INxT4etPPBh36TlR00OdBV7U=
X-Received: by 2002:a2e:a801:0:b0:37b:b952:5e2 with SMTP id
 38308e7fff4ca-3812158e6d1mr92229501fa.16.1767108856717; Tue, 30 Dec 2025
 07:34:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com> <20251224124431.208434-8-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224124431.208434-8-krzysztof.kozlowski@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 16:33:39 +0100
X-Gm-Features: AQt7F2oKPch5XI3ozINSBYMELnoLnRJYzcAZlrhoJTH7OcGc0z1qpY0CIewnVRk
Message-ID: <CAPDyKFp3X0EeiGRHLQqzE3vkVoLmOwi=1813S32sLTqXab43gQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] mmc: sdhci: aspeed: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Robert Richter <rric@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Adrian Hunter <adrian.hunter@intel.com>, 
	Joel Stanley <joel@jms.id.au>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 13:44, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

All patches in the series applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index ca97b01996b1..4296def69436 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -519,7 +519,7 @@ static struct platform_driver aspeed_sdhci_driver = {
>  static int aspeed_sdc_probe(struct platform_device *pdev)
>
>  {
> -       struct device_node *parent, *child;
> +       struct device_node *parent;
>         struct aspeed_sdc *sdc;
>         int ret;
>
> @@ -548,12 +548,11 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>         dev_set_drvdata(&pdev->dev, sdc);
>
>         parent = pdev->dev.of_node;
> -       for_each_available_child_of_node(parent, child) {
> +       for_each_available_child_of_node_scoped(parent, child) {
>                 struct platform_device *cpdev;
>
>                 cpdev = of_platform_device_create(child, NULL, &pdev->dev);
>                 if (!cpdev) {
> -                       of_node_put(child);
>                         ret = -ENODEV;
>                         goto err_clk;
>                 }
> --
> 2.51.0
>

