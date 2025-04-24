Return-Path: <linux-mips+bounces-8740-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1786CA9B6D7
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 20:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52EA517BF19
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 18:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9E02900A1;
	Thu, 24 Apr 2025 18:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oOadD6Sr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C436E1E1C1A
	for <linux-mips@vger.kernel.org>; Thu, 24 Apr 2025 18:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520948; cv=none; b=KJL0lDPcAvWzkrqgQAiOYLaFNdXOEsL9FPROUcR9hfRNSQwqRmJt/iti/PHMgRmy2YDvrKcU2a/UJToj7TcNN1hM+3ESD7ImwqlHwAa0/Iu7/ZJASPbN7tlR1sLX7j3v9Rgn+UcbpRShNdVO4p+p/2iXxyMjFdeorj3VQOnD7Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520948; c=relaxed/simple;
	bh=rZUxyELSfnVXwreNQjwJQoaXQJWZ9fkMyqWksLWMfUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+0pE9RI8TuAENw1WQzXJn4TLVEMt2x4fFrXJPGVvMoQfCMTNGZZpdn9kKAjytERV31Mae57Wt9YHO8PL2sICCZHcwdN9QRiKapwqY9Mq4zX8Q2XWYEofUyGBHT5uiQI+H/GjDyFX0WDCeqJ90PGkJC+YrxyfbQjLi1Yr2TBHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oOadD6Sr; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso13592631fa.0
        for <linux-mips@vger.kernel.org>; Thu, 24 Apr 2025 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745520945; x=1746125745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvz3PmaQFn+0EBBAKUfs2w07bVJpHkRF9qQc8oVPxCg=;
        b=oOadD6SrYOVFwX3+5Y/nBEQ75lMAcd2yH7FAWOvxmqnt72wQttKx3za/ShKG8zuUtu
         +BgZ+4D2eYfAWxZUZKLcQ07UDxHZNaSzgtPHMo9wniXRY+5aLY29WVQF8yXW8Wz+XXm7
         FObeRCk94n07XxsX+kH1KoyVJYtSOomeFCt+P92tN6yjta8ZvbMlq3p/GuV/JMS8l/UV
         Hk9EyJHxZ1NmBDZvJkcoDjBpmCEc/Y+7CW1JN2fMMRObLvMv5GTWeBeD0iPjbTiiDp1z
         MQ1KVB+3w0TcD2ScrARSQgzuzMnOu0zfLEarYO/SrPVZKs/D6DYjLtaDs6hdCrfMrKvl
         Waig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520945; x=1746125745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvz3PmaQFn+0EBBAKUfs2w07bVJpHkRF9qQc8oVPxCg=;
        b=In4XTJRBRCW11mERoXFchbmyJDuxhnEkOm+39fBcAjTDlULV/J7SZTzD+t6L6YYlzA
         ezPFKs7SEZlJX6JQd2PJGFZxuoOXNwCqWXKarsuXTYkiygxaIkSfUU+jkzQ54YB6lcMH
         7tVJRomXE3VyAbbYYSOsYTE/q3xx1c5OoEEtdEA4lJ2wLEj3taUjwBKINlLKsmAZHRZt
         vCTXC1qk5eDJM+1WqmCsMG0WIhNX7S2mi/yIplYRWYCWtM9/dhy863OonUboBKIerF7p
         6lusXgFWhPvpkvsGUUt2uOg4EIrZQKkMXujP7xVKUqhxygufklCFkEWyDy5JnJDm9yW/
         UupA==
X-Forwarded-Encrypted: i=1; AJvYcCVTcinbwZGWQ+u4iH5A5dDcsZRL4Rkb7akxVzkBm3nv1tJ9srb8vlS9rPEHiiAm8HRojl3iGL6fdUUS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ah3fT1txaMpEWQbVXRgGFqFG9UCBy2vtXZnrqWirkgZhshKj
	Cc/7HKO+56lfqhXKkp75dsw+0AJxzezS7hvg8s5IbOTmWmr/HiVr6+7MAZMAb8elMzW5cL2HgK8
	jnZOKPIE/S/UDgPBdPbFaHFYgLkUPiS9Y9Vg+Uw==
X-Gm-Gg: ASbGncuBuGSWPySSdeIkB/R3GLTV1V5lOOZrDG8T8OnYBZxJQZQk0b/X9q2CO3ilQn+
	WwScZs21SGvYtVvavFfQdeZ6jMFiDe+b4bfki9TYc3JCVn9jV0hTQzY4lTfTnybAQ4ug7ic6aH9
	KODLWTSSpFjVRjd/aTLDndZaIExaCCvIbxpo1w6LjfneDDBo0awS00ZQ==
X-Google-Smtp-Source: AGHT+IE0c8VGEk3/LwHw0m2axs8IZ9HjpeBp8o188g75mkoErRBNX5c5KptrxgTjbE1qe+vTvqn/BpVZsaupGVwBUJc=
X-Received: by 2002:a05:651c:210f:b0:30b:bfca:bbf2 with SMTP id
 38308e7fff4ca-318a7b0b7f5mr2808701fa.7.1745520944675; Thu, 24 Apr 2025
 11:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org> <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
In-Reply-To: <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 20:55:33 +0200
X-Gm-Features: ATxdqUGQRJTk1Y9jikLuWRcOSvqi5BIyaHo-9YdHMReWW67MF95w4__wq5ceBqw
Message-ID: <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
Subject: Re: [PATCH 02/12] pinctrl: axp209: use new GPIO line value setter callbacks
To: wens@csie.org
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 7:43=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Thu, Apr 24, 2025 at 4:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
> >         /* AXP209 has GPIO3 status sharing the settings register */
> >         if (offset =3D=3D 3) {
> > -               regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL,
> > -                                  AXP20X_GPIO3_FUNCTIONS,
> > -                                  value ? AXP20X_GPIO3_FUNCTION_OUT_HI=
GH :
> > -                                  AXP20X_GPIO3_FUNCTION_OUT_LOW);
> > -               return;
> > +               return regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CT=
RL,
> > +                                         AXP20X_GPIO3_FUNCTIONS,
> > +                                         value ?
> > +                                               AXP20X_GPIO3_FUNCTION_O=
UT_HIGH :
> > +                                               AXP20X_GPIO3_FUNCTION_O=
UT_LOW);
> >         }
>
> I guess you could also drop the curly braces, but otherwise
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>

Right. Linus: can you remove them while applying?

Bart

