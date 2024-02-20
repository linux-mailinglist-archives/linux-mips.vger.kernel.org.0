Return-Path: <linux-mips+bounces-1581-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F0985B47D
	for <lists+linux-mips@lfdr.de>; Tue, 20 Feb 2024 09:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADD5AB213F8
	for <lists+linux-mips@lfdr.de>; Tue, 20 Feb 2024 08:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE685A10A;
	Tue, 20 Feb 2024 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dD7hcwNW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B575BAF8
	for <linux-mips@vger.kernel.org>; Tue, 20 Feb 2024 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708416437; cv=none; b=Wm1zM1HBHEZJCHlyzX9zaQTyh5vWHgYVMgXkrYORMx9iW+40QBjZa/+0+vzTibOVsi9XwyH1HCcA8GJWfzwoDdLxxSZR7RejAFoasTt7PT1jbMW2FX1IVz0ijLnkEk+3m9alTMOboqKDP6vqjNXHrTKGKVWorgQR2vDFtRFnN8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708416437; c=relaxed/simple;
	bh=awT0zTo78ApZAKonWlAU5EVPZWIHDSpLrfEEEfQsDEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olmvpeHwGtOuXV33MJ3YutiP02CNLCBgo/aND9nsGsJpPoAsBEcbtdBJXqd4aCJg/kcyzvCicEdC7WPaTQTDm2rblkWeCwe03/+HTPJiorADwIiDIIbz+FpkVcPCwmd7Wh6/bVQ8CHmRaw4BdWz7RXrOFFT60ZLNsNlN/1H96ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dD7hcwNW; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so5263593276.0
        for <linux-mips@vger.kernel.org>; Tue, 20 Feb 2024 00:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708416434; x=1709021234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awT0zTo78ApZAKonWlAU5EVPZWIHDSpLrfEEEfQsDEk=;
        b=dD7hcwNWXJ2cGycOPtjBPwQuJ/2M5NhcvRJYvnPy5wBdtAGbHtreN47OB6JuDI0U6I
         a/+fh/jDenLkJb3GEU+KC+NM7LFDroyYh1eLUNkMPS9wVXmT8O6J65aIbXdMHc8EvZBI
         F7ZQZjtyqPg9fD+H/iwKCb19PH1kPRLCKQo00uG76bK6VUB44Pfd6+NJdwjnAWm/6nGP
         zh6rT20V4kU0w+O4n0ZAS4tuDqePlGizHCSjMLsiipqffNp70it/teKeBS2XhjYeJeJL
         684O+g9p93uA2ld79sfdgCt7g2Ej/DI55jpbbgefV1XApgztbz3C5V377jkhQc4oQAu5
         7qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708416434; x=1709021234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awT0zTo78ApZAKonWlAU5EVPZWIHDSpLrfEEEfQsDEk=;
        b=IEsOoI5XtSMvnqB/zsIfXUDaZvYLfIgK5UnP0hLu3wZibKCMyK/9hY5VB/8SrfsI9h
         iAliefY/ZFypY8foLbcykSvK0hAvGy1ohqBcDUNkZoCSPYYx6MoKRufgfFB/skw4EUK/
         Aatywa6XkgWyWr5hv/aN2Gd0MUa6kTY2EyYXtYcwFv5GIPMACl8Nb0UDTnsOUUA8UgCN
         JopwZ4BJVQ4SgDUsCLlliJMfOcMMMmfY9UTANPWhX/Bo94OMAvLqW4Cbz6yTDfnvJROf
         pYWptPilv+RwkvtCBQ9DOa0uakv3PwxzT+wvufAdpi6NMp7Ex9Ea16A6QCDsF62/WTzT
         V1xA==
X-Forwarded-Encrypted: i=1; AJvYcCUCMw42u28mCxQ03+aotxUQ87V3Wmnf+Pp+IdOOBLTfDA54UlhHqGg2QbR/PFgLEd/rSiWdlsHLq7minVYSg+nKU8h/3ROSV7efQA==
X-Gm-Message-State: AOJu0Yzg5jiYa50E1FvOrzmvxKfQCL/smCY83M0/YR8bKehIeQVodnQs
	7kDvCI4zLycCucPYJxODZBGa3L61I4zUhd2ktvRFgfDMDgGXICWtCs2wVXWovKiMV8spPR1Qnie
	7t//PEyvMYzhqVrB+eZMN7CSyzeNeP8txb6y6mA==
X-Google-Smtp-Source: AGHT+IGHpSsMIuEotxmsPqtQrf1oD0WZ/UCXgvkP+pOGh/bZIF0X9vZSLoc/4KAh0bvAGCVpcXQldb9yUsn24UnzWZQ=
X-Received: by 2002:a25:bc4d:0:b0:dc6:de93:7929 with SMTP id
 d13-20020a25bc4d000000b00dc6de937929mr11460135ybk.26.1708416433908; Tue, 20
 Feb 2024 00:07:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com>
 <20240214-mbly-gpio-v1-16-f88c0ccf372b@bootlin.com> <CAMRc=MdFBFFTYKHgDfOieNZJ+-x7ZZMiYty6buOp2J=eFUjt0Q@mail.gmail.com>
In-Reply-To: <CAMRc=MdFBFFTYKHgDfOieNZJ+-x7ZZMiYty6buOp2J=eFUjt0Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 Feb 2024 09:07:02 +0100
Message-ID: <CACRpkdZ5qJY6qQRaq=4y3yf1_ppNMDo5EfDPV_fuCHMe+C+tnQ@mail.gmail.com>
Subject: Re: [PATCH 16/23] gpio: nomadik: support shared GPIO IRQs
To: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
	Grygorii Strashko <grygorii.strashko@ti.com>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 4:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
> >
> > Support a single IRQs used by multiple GPIO banks. Change the IRQ
> > handler type from a chained handler (as used by gpiolib
> > for ->parent_handler) to a threaded IRQ.
> >
> > Use a fake raw spinlock to ensure generic_handle_irq() is called in a
> > no-irq context. See Documentation/driver-api/gpio/driver.rst, "CHAINED
> > CASCADED GPIO IRQCHIPS" for additional information.
> >
>
> Any reason for not using preempt_disable()?

I think this needs to be discussed with tglx if Grygorii is not available.

Yours,
Linus Walleij

