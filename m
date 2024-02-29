Return-Path: <linux-mips+bounces-1882-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAB886C486
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 358A31F245C8
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E1657878;
	Thu, 29 Feb 2024 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VYyyGafn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E245733B
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709197815; cv=none; b=KxxsNphfxNUiv6/EgTrVXOjOW0Y+dPzm8Vx7PoxM+zjGKxE76Qt7BYS2W2LZE9S5QLFYHpcMeT5/vPXyv4wXYYdMkzhBd58qUw/fJsWJInJmqAbAEWEJyjcnmqIPq8cSxN7KFy3/Mm18pKc8bIepa9PYiKYrslI4rI023d5I/0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709197815; c=relaxed/simple;
	bh=tYdJ+lGX899NpFpW1u0FUrL3zEubIxJzBAKKeOGPMZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGVMwY/mgi0N92+xzBQbIft9Awg91OjyLeBMx0dSiPaY3TilQRMeG5jU+bj0yxjBVNDNBiJvwR1cKyghYZqSObve95X92z/2Fhse+Oeh4K6f0bRrKBT6uYhEx6fAHwPWdhgfplGPYjuasrXJB461A8NCEY3YEl0ejfwkkj5MBd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VYyyGafn; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc74435c428so772430276.2
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709197812; x=1709802612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYdJ+lGX899NpFpW1u0FUrL3zEubIxJzBAKKeOGPMZ4=;
        b=VYyyGafn8fYGXuQTh2xN5c5sQsoO4w6w3ncvrXbvv04Sj5JaJXCb2ooJugwbKjCxKH
         Mhk01/9IhHaCijLawXqFNJnBA95C8jGDJgcrJtRpodS962DD7MLXK8rNCZwaPG/DDYGA
         UHUDCBwG1ejM8SBLtN1eBQorWj7hLPNQNZlXa+dR9SIbjS525p9fgoNrKLW3U4wHrcx2
         Fd02ykhD43s/aZsIO1cSHs744aKGRMU/KlfbdJkmBf22/Dnujc3zSXQw4TXhjH14mybV
         nMGq30zi7x0Ps21bqgq6UpLaPHO3Qmlk3t5Ji4b2DNDVNPphQJdKgKct3k5q30plN+jz
         q4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709197812; x=1709802612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYdJ+lGX899NpFpW1u0FUrL3zEubIxJzBAKKeOGPMZ4=;
        b=ksaR06k6AVJYKfKAOUSHby2zTagbzHG34TrW5ydNVMWrYXBkPZZRH2zX38fy9/1Zrz
         btEu9sUIldGE+x0FwuWH0FCbW5qqgenuZejroXVAQexSih9fessmNldHNwUMf4+im+Vz
         XAC+GdzgecG2dpCESnGoQcSRWjZgOh0sh8Y3AP6k6Qhgj8SYcCCdr5d9AkKCxDvS2Xv3
         EdTbF4QuAbVc27slMwjDw5sifXNqV7bAcA6dW3L5gE3FYoK9ORdmoZAK01fGnLdkw4uS
         eRjIoiVRFHvmaJ04mAN0+P+IGhr2i+AQmvufFZradJ4Gz7B/JdJugd+6BUISE7btBetr
         A7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCU4/1xdlry+7cO1qTYYZoZYlDW0hSYrK4oriUzGIm/vpSnn1RDQ4sACfh3soiHFYCQhjmgCk474KaIx1nTkPL5FVW+2eJqWl/49Ww==
X-Gm-Message-State: AOJu0Yy3hoo8ft6qha1Q0+1pBmxFQsm0kajllDIYmrDEVAZ4P4e+XpAC
	8HUgYcJb0xHxVxDDrHFYEo0ZBGuySWrsPSQ2oe8sB9EQSHzAyDGJB8x1Vdq9mUMTwqRKbk3dD2p
	hFNWJEBPyu5WQBHUB072yZFo/Mtfpf9eqC+pvvw==
X-Google-Smtp-Source: AGHT+IHXJtcxUypOTtLEATMHHzOH73b1Xs7hatFkLIIKeftmFvPSBf+tk6/aFwSpb+kgIHj44bbTi43CvloDA6E8K+M=
X-Received: by 2002:a25:ce47:0:b0:dc6:c32f:6126 with SMTP id
 x68-20020a25ce47000000b00dc6c32f6126mr1820937ybe.22.1709197812659; Thu, 29
 Feb 2024 01:10:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227-mbly-clk-v8-0-c57fbda7664a@bootlin.com> <20240227-mbly-clk-v8-1-c57fbda7664a@bootlin.com>
In-Reply-To: <20240227-mbly-clk-v8-1-c57fbda7664a@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:10:01 +0100
Message-ID: <CACRpkdYT_A=PAn83tJvKibLAjcXekw-WABERgKQQFoFi0dxSEg@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] dt-bindings: pinctrl: mobileye,eyeq5-pinctrl:
 add bindings
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 3:55=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add dt-schema type bindings for the Mobileye EyeQ5 pin controller.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Let's start applying stuff so we get down the depth of the patch stacks.

Yours,
Linus Walleij

