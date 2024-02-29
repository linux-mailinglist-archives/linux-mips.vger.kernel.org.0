Return-Path: <linux-mips+bounces-1912-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D6C86C5AB
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A78D71C2163D
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77D260DFC;
	Thu, 29 Feb 2024 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOk+H5zi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB6E60BAC
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199670; cv=none; b=Bevz/0pW/J/mj08ZiDpsP0/1BweC6Qj37m8omAxNn7pRz0geOrFIAo04tcKwTDMd1I/Ub8h9LirLq22+jklEsOR6cmBamO0OQ4JYsgPTwtT2Wia/Kc/snlbsKhf7BobBe0oTb2rIPM5dzuWRDOM6PtXt39WmQCb8KsI+SVH9tm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199670; c=relaxed/simple;
	bh=1LAjz4Y7MgTjDbSVjJS1Nz5v3QtYCcLeY1fivGF7h+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqlDeXxFQ/1r2UwuaQVQyv7+efZebAEsQLP9piPq5gbQTIeWdpzhhyLfzJUl68PxFNNM6Vhe2w4sqiROQPp0Woi0Zpw3GJtegh+LknbPaCpP9oM+DecJEtJTpyld0pU7+7GYDIYreeDrHdGu8NJObGmwOB+rx+EqJKdmTc0PrYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOk+H5zi; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso800264276.3
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199668; x=1709804468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LAjz4Y7MgTjDbSVjJS1Nz5v3QtYCcLeY1fivGF7h+w=;
        b=bOk+H5ziLVv2qsDj+Y0/8M3K5xKkqqZkB/ft0u2fz7w3rDUUcY7qCHPzFdNm0y6YCQ
         gAyf3FJeaGrm9dl+3Rtbg+vDVCZNz07txVAEnP/Qg95gaBippBM8O828J3D97U2sx9G5
         IQICd0L/mgPtkhyZxvhb9gSpbnd7AFn/69uKd9tY+pn/bClI3CkcDUg/3pOotcPKQu7A
         +blM5RaHykl4XkyijHFfVe6i8qjKrB4SC6Q+RyRy7XgZgB5eRGJkybN6A6GdHjrkS19K
         9wkW6vYDDOWwh1QsTGB9o+3oiEqc6ywbUtImLxVBs3OGLAagxgYZekuElRx46w0CveyG
         YUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199668; x=1709804468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LAjz4Y7MgTjDbSVjJS1Nz5v3QtYCcLeY1fivGF7h+w=;
        b=Yf5TQwqxzC4t3cNckjT264EyK91JVqiNEvvzPcKHBjXqtA7JuobFb5LxhDk4OuoqeO
         k9O2Jrjf15aobrtPsU/e0UPwMtBCSUXrZElTh2MDrObVvIcY5zFOP3cn6AuXxX+DKpE6
         96BhbCc90mxyXTwf+xfTNvzlFtaEev/QLoUPPncu65oYzK4ul6u6Inn4KlsRiaObemBT
         eit30v/RTHJWxIt5kpACSCP92Rcc/8ZdpgCqOKrTjBYbAsVF4p4yMPPkaLuuffJXaBSP
         L00z5+mKb23kMcdl1WPIQq4f0GMHIMrtsrYvOFx3SrSitXkQDwntTMFL/qJm6MH/Xlmw
         EP6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0Lv5sLxZA6zYDEBqh8PEYozv/qP8v7Z/k2MhlcPospEEUiPm79OSrNE/KMgUv5eset64d0e8imXmQjWa/BWSa9xa8n7+yeqTTfA==
X-Gm-Message-State: AOJu0YwqGYhNA592TUcs9vTk0JXn7SIBSKhYm/XC9IJtVfuZBGvuUSUf
	4AFQAvTUuy4E/VMiKzBiDCh40ZAfBZNFRPS9EyEUcGyYv1jKNDWWXEUCJHJv8g7Q6fW/bXwJCzi
	y7RoQZdutxFC6Ou4mzAfhlPCFzFYymHrvNpfoEw==
X-Google-Smtp-Source: AGHT+IGrJ/cHOI2YcStaE9WyB7ggGo5jiMT7KH1xbTtumhV5wTi1F5y6GwDXF7TJS+ZMtxBW9IfMabVbA7T5C68C6Ok=
X-Received: by 2002:a25:2e02:0:b0:dcd:a9ad:7d64 with SMTP id
 u2-20020a252e02000000b00dcda9ad7d64mr1651564ybu.48.1709199668109; Thu, 29 Feb
 2024 01:41:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-27-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-27-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:40:57 +0100
Message-ID: <CACRpkdaZN_siGUDPBNoiRXej=X1ygMh9ce7MPWsi=GzS-UzTew@mail.gmail.com>
Subject: Re: [PATCH v2 27/30] MIPS: eyeq5_defconfig: enable GPIO by default
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Add both CONFIG_GPIOLIB=3Dy and CONFIG_GPIO_NOMADIK=3Dy to our platform
> defconfig. Default config is CONFIG_GPIOLIB=3Dn.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

