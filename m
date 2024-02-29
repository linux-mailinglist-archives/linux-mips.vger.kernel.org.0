Return-Path: <linux-mips+bounces-1904-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58186C54C
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8965C28EAB7
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA3A5D90E;
	Thu, 29 Feb 2024 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFkqfJvQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7405D8F9
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199196; cv=none; b=TVxj7vwzOlZ3s3MJqzz+cPH+krPKaVSWzuw28E9LL45/6mHOccLdw9yUlDPkfLySfA8L4yhQjaPTP6WAJMsv3iE9k6eThsWHyW6Vty0MXhfu4OLOX1hVXXQbf1w5EB5+nho5cga6ujYzLCerNdLIgRvFSCh5u+ogE4mAgg52Jqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199196; c=relaxed/simple;
	bh=TA5XDR0sixwyfoYxqxJ3AVyk4Nya6rVcdVMTi766fKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fr1sVAt40k4xDkdbjLU5T0tRzdrB9Unsp+sXH+MUsIvbbxkZAIaI6x7vkwiXz/weuSRvj8e+WduqBAKo02KyOz+E6MWvfoaoWIF+7yblD8rPuAd9lyzYcrsvVHpvKxxuV/4p47eWeeZ6geanvF4MxEUCk3eblLFkDqkOti+lUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFkqfJvQ; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc236729a2bso673109276.0
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199194; x=1709803994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TA5XDR0sixwyfoYxqxJ3AVyk4Nya6rVcdVMTi766fKQ=;
        b=nFkqfJvQwFs+cxOrekeldas6aoDkkenIwcmU6e7vjZu9qZ/Xt01YdsdMlX5PJE+wF1
         FKC9RHavdw7abnQhAQF9nF9cqLj5LuKrhCLGBUIluqeXWrIPqbeiV8COJ6eQHfaYiJi/
         /e5g+q92Iz1j5AxoHXRfXlsxBlWEfqZEmNzwJiC4b21+9Egwx7i//D7rwHH8Fo12lING
         HqlUsg7fIMUIHrpFhUCOgvnpRmlk/jurq5+XvQwktDfwnOkBTfeoKVMO4YHE25s/vYW/
         OYub1WhyeV8XYVG/vewgNd7EHn55TihvNMg5TTXL2FXq9/ekgqnNJw4Ube2x15649p0K
         HPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199194; x=1709803994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TA5XDR0sixwyfoYxqxJ3AVyk4Nya6rVcdVMTi766fKQ=;
        b=J6f86UTHzaBbylNHh9/clbZRK64wWILwUDIZBSe+LyQaRc0VguCH1klRz+X+rbJzaJ
         GFsphgllmngRZMy5v/wta4vCSxhdboEwHmunrM2tdsobzdOhjO+vH8Qh03aNmF3o7UP6
         eKs/GDPwTPFGfHe9YSnKuA9SDSrq7n6LO9UJ3oVfn0WRWWpZto6ih1OiEfMBBx1aaete
         DkqgFgVqQhYSeuo4QsQGPMWem+r+7iub4noka9uXNeNJUtDF63LUZneGvAOgN8EUUwLd
         lP+Xhsre4umcgWlIl48RbEchGhpj2xA1v0BCuuiCM3xghn71DJjQaSRvkOfebqSGuy9R
         R4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWV6PAHHv3e/MOCsd7fVaTvoskyymE+gv2hcbV+69SRK/fnRe/Y5otreAP+iFLOmIWIOgJarI/HEZZLuefRaSc9X8GO623Q3qGzKA==
X-Gm-Message-State: AOJu0Yz+14j7a8YsOaw1we82NnJj08jDBZGjUnlEHkRiHlH/ZDzhsJav
	61U6dX1nK6IfODeMYPMaE8dy7iQYBlRqNFeocgzubVrqy+VispBhygmx69do6vJGchar9WUqiAo
	rg+xVcEBWgwwOOPdsCEnaGJNhoQo2A2k8Nx4BCg==
X-Google-Smtp-Source: AGHT+IFJx7qNkajaqQQOEZz9bg4d/0XSAClSsgSr7+DWG04FeqoP5n/XZvXvx+LASciVRHXOSFjzxgkNPnaVjJuZjkE=
X-Received: by 2002:a5b:f05:0:b0:dcd:aee6:fa9 with SMTP id x5-20020a5b0f05000000b00dcdaee60fa9mr1802025ybr.53.1709199194095;
 Thu, 29 Feb 2024 01:33:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-19-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-19-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:33:03 +0100
Message-ID: <CACRpkdboVcO2+RT5r+FkJ6t-Uru3vrwOodRPn+vmBvv7LFtM1A@mail.gmail.com>
Subject: Re: [PATCH v2 19/30] gpio: nomadik: request dynamic ID allocation
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

> Move away from statically allocated GPIO IDs. Switch to dynamic ID
> allocation. Static IDs are deprecated because they cause issues when
> multiple GPIO controllers are to be found on the same platform.
>
> Add a bit of complexity to do pin number -> GPIO chip + offset.
> Previously, bank number and offsets were retrieved using division and
> remainder (bank size being constant 32). Now, to get the pin number
> matching a bank base, we must know the sum of ngpios of previous banks.
> This is done in find_nmk_gpio_from_pin() which also exposes the offset
> inside the bank.
>
> Also remove the assumption that bank sizes are constant. Instead of
> using NMK_GPIO_PER_CHIP as bank size, use nmk_gpio_chips[i]->ngpio.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

