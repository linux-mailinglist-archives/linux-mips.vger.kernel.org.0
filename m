Return-Path: <linux-mips+bounces-3634-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 627A9905A29
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 19:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEF931F21C1E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 17:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEDE181333;
	Wed, 12 Jun 2024 17:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRO7ksuj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F371CD38;
	Wed, 12 Jun 2024 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718214471; cv=none; b=YnZKcWBSGrxpE3kgkGGc9KDJ2O3b4oVDKyhrpUEgbZALpL/iK03CZCaPtIuUYpsmt3H7+aS6iTNKG0HFmE7SvTqMUIP1aeneaCV4LgbR7uY09khg7jcadP/udi58M0YoeR8LMVt8Vw5rrzCOcfZjbp8fDRnn/qBUhE/bS0A9Nnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718214471; c=relaxed/simple;
	bh=o7nMcAobM0fr+FE7YpoLA/9P61yx0cw3wLTk7ctxWdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Phv7tfkaZMg0Yg61PecStEN66ElI92ewqfUEDOF7hmhUYuShSkeSNvLpbVKLM9acwPheGJEAXLmRJCOG5KjC6Giv1+lQkf4+0lGW+tDES9GSbp+5OFO+VYzo+r6lXypch6dJAlxmI2SrsyVzK9mmTAaPqHvBJeuBgOFE/sbP9/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRO7ksuj; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7041a7d4beeso49594b3a.2;
        Wed, 12 Jun 2024 10:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718214469; x=1718819269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vt9UevBKC9qNAIKvJM91i6a6EnX6lWlczaKn9yOTblw=;
        b=cRO7ksujgBiLAmksCumhSpJIoN/P85+MZCY12etfed1e+NOcgkyLtq5n98ZbdYynZ7
         NBhakqsxAOiI5ABGVO6oGCPMvrpuxs8ZaopeqxO1YXThTkAiwh8LKUXJWc18iWKoGnIi
         KUzgtrcdVZbXcuLCoMuXEBkFhb1b/tQxdqDms7N04IyiCTCU5+s+HiPpVwCmWE6i9Bbt
         5XSI4fd5eYv2D7zHlCUVPf8mR6Qh4pZkTQhoa9R1C6sReUocvGPScZtAkTzhtwyReChC
         lXOe7OC5UDcIdGSvnUr+6AOr8KEjTC4LaMP6s9Tr2QJ59GhqJV4q9SHJ3MAWjMgzfawu
         MMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718214469; x=1718819269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vt9UevBKC9qNAIKvJM91i6a6EnX6lWlczaKn9yOTblw=;
        b=hb/N5OUy3W/J0nebkh/q8GRVUaRbHATeK8PNtouYIhhcsVTqB62prbwUSETv82auTf
         JYaDJXKN3Cj1VAP2sZkGq5V0bfr2eA1c5eURwc09zzeQLcCR28NdOFhVCDsOJyRTbz60
         AFBY1O5QIj5gRY0ce9I2gXf2e89+qNq0puD+1Cow17ZSmrdnGDwlfPgEkj0vhz/nS9Ed
         /rmKBgJrpsDRtiutQecXJh5OGsq2ig0uJSpaZ4Yc5AP7b6eJxCyq5fooVpuxvfcYkqe8
         sVgj8QkcuycEBh+6TQn3UXM8wAiCN0WHDrDrNc4jYgV+1QulLH5jgP0PlxSYG+OWcRrR
         +Eaw==
X-Forwarded-Encrypted: i=1; AJvYcCUzZ8ZVzwnfCWCiHAEIvVRGmytlqmzG57pQxFeovGsovWCN4Kur1JWaqclfttZIC3SWwJc6zzZN4hEMX4jpWz9rXxarcxL2l7rpaMTGXQ4y2c7kDwW3l0Ulwn2xm3YhDJ9/gjbM4JLqzD9+TA7uEgbEiNcTLTowHWzqqIc3cOL79w==
X-Gm-Message-State: AOJu0Ywx574ih6g+8PfJc+ZwAuXMudDCs5/e9UMdepzhiKNvi5qrlKy2
	63rrxRfZBFaaPGKNqveBHWLjSZhlw1Pv3WAooT7h7xmI0r9izBr6
X-Google-Smtp-Source: AGHT+IH7JfGiYuIz5nkfrgH04y3iCv5Ne4VmkNY6L600tIuH7CYcze57i7ddYDRdsllnvilT/+jsPg==
X-Received: by 2002:a05:6a21:32a8:b0:1b3:8232:2079 with SMTP id adf61e73a8af0-1b8a9c8e246mr2947048637.52.1718214468169;
        Wed, 12 Jun 2024 10:47:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3077:52c7:3e56:8d61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70426c9f2bfsm7745513b3a.219.2024.06.12.10.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 10:47:47 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:47:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Martin Schiller <ms@dev.tdt.de>
Cc: hauke@hauke-m.de, tsbogend@alpha.franken.de, rdunlap@infradead.org,
	robh@kernel.org, bhelgaas@google.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Message-ID: <ZmnfQWFoIw5UCV-k@google.com>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607090400.1816612-1-ms@dev.tdt.de>

Hi Marton,

On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrote:
> Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API") not
> only switched to the gpiod API, but also inverted / changed the polarity
> of the GPIO.
> 
> According to the PCI specification, the RST# pin is an active-low
> signal. However, most of the device trees that have been widely used for
> a long time (mainly in the openWrt project) define this GPIO as
> active-high and the old driver code inverted the signal internally.
> 
> Apparently there are actually boards where the reset gpio must be
> operated inverted. For this reason, we cannot use the GPIOD_OUT_LOW/HIGH
> flag for initialization. Instead, we must explicitly set the gpio to
> value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag that
> may have been set.

Do you have example of such boards? They could not have worked before
90c2d2eb7ab5 because it was actively setting the reset line to physical
high, which should leave the device in reset state if there is an
inverter between the AP and the device.

> 
> In order to remain compatible with all these existing device trees, we
> should therefore keep the logic as it was before the commit.

With gpiod API operating with logical states there's still difference in
logic:

	gpiod_set_value_cansleep(reset_gpio, 1);

will leave GPIO at 1 if it is described as GPIO_ACTIVE_HIGH (which is
apparently what you want for boards with broken DTS) but for boards
that accurately describe GPIO as GPIO_ACTIVE_LOW it well drive GPIO to
0, leaving the card in reset state.

You should either use gpiod_set_raw_value_calsleep() or we can try and
quirk it in gpiolib (like we do for many other cases of incorrect GPIO
polarity descriptions and which is my preference).

This still leaves the question about boards that require inversion. Are
you saying that they have real signal inverter on the line or that their
device trees correctly describe the signal as GPIO_ACTIVE_LOW?

BTW, please consider getting DTS trees for your devices into mainline.
Why do you keep them separate?

> 
> Fixes: 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Martin Schiller <ms@dev.tdt.de>
> ---
>  arch/mips/pci/pci-lantiq.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/pci/pci-lantiq.c b/arch/mips/pci/pci-lantiq.c
> index 68a8cefed420..0844db34022e 100644
> --- a/arch/mips/pci/pci-lantiq.c
> +++ b/arch/mips/pci/pci-lantiq.c
> @@ -124,14 +124,14 @@ static int ltq_pci_startup(struct platform_device *pdev)
>  		clk_disable(clk_external);
>  
>  	/* setup reset gpio used by pci */
> -	reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset",
> -					     GPIOD_OUT_LOW);
> +	reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset", GPIOD_ASIS);
>  	error = PTR_ERR_OR_ZERO(reset_gpio);
>  	if (error) {
>  		dev_err(&pdev->dev, "failed to request gpio: %d\n", error);
>  		return error;
>  	}
>  	gpiod_set_consumer_name(reset_gpio, "pci_reset");
> +	gpiod_direction_output(reset_gpio, 1);
>  
>  	/* enable auto-switching between PCI and EBU */
>  	ltq_pci_w32(0xa, PCI_CR_CLK_CTRL);
> @@ -194,10 +194,10 @@ static int ltq_pci_startup(struct platform_device *pdev)
>  
>  	/* toggle reset pin */
>  	if (reset_gpio) {
> -		gpiod_set_value_cansleep(reset_gpio, 1);
> +		gpiod_set_value_cansleep(reset_gpio, 0);
>  		wmb();
>  		mdelay(1);
> -		gpiod_set_value_cansleep(reset_gpio, 0);
> +		gpiod_set_value_cansleep(reset_gpio, 1);
>  	}
>  	return 0;
>  }
> -- 
> 2.39.2
> 

Thanks.

-- 
Dmitry

