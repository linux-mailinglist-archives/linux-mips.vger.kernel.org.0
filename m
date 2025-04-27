Return-Path: <linux-mips+bounces-8817-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BBFA9E45D
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 21:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17FE117822C
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 19:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264371F7904;
	Sun, 27 Apr 2025 19:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pCUtoO0J"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401E8169AE6
	for <linux-mips@vger.kernel.org>; Sun, 27 Apr 2025 19:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745781474; cv=none; b=AUcMcdmvXR3GbSIKnn+K7niZg+WK7nJwKWHWeVcR+Rr3g/B4SI0CNKTjnXeRdAm6Iv+FarUvASCStRNlfoc2i8Jre+CevWcnnTtYJoLdlFBgg9+vojb34bGAe1UO0v2er+NdM5wNLwIkwv6BmDXSgsiAmjaYejHn+ObMNBmMVxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745781474; c=relaxed/simple;
	bh=6IC2F8aYqTVehjmi3m8+mzcbglCyO+wk3F4hmLvIM0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JUZaW/t0nYav5hZ0VGBC+h/JeaX3x2I/R9LIAhsJvbvgHOJpO1Z3a5n+Jlgqp3M/yTwwr+ifqhbtZydI2pMPr/o27hUFnCOzU9Uk0viXci/IuFrV1pHFn/8M2wCy6tijUZBmNGW2GkqGZXxwGm0aky6FAPO3mXSzO0sDIgnbLSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pCUtoO0J; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e61a18c05aso642048a12.1
        for <linux-mips@vger.kernel.org>; Sun, 27 Apr 2025 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745781470; x=1746386270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiImoVKJXxF5Kkx3zdXXXFlWOb+F7YBai/OtGKstv94=;
        b=pCUtoO0JwGlhkX3yxHX55k59+tKUxZQobYv69Q+jzGU0aoRwyiAWthYBYOMpdvcy79
         ME23KPbgERwXMCfYBuudfxYOztUfIudKYfIvG/bDCHBmHLAN38uUludkr2jOAZ1R8hpj
         Jb5MQE9ETkm6pIFH9PZJlSrduXzedANQM84EUYGg/6hyrTsUpyZEk6eMD01U9Qd9BHXT
         rwLZ1046xrChZS7Not6KDrRgQ/IqNWmSIubZ2KE4n/hoJE8PGHyDBu/7ZuFuXpl1ChgF
         ZpqMfU8Bw2xs6gRjBiWGQeoQWth/QzMq2Ekeqgp+Gsxk6gvE2KTcXM/T8uKB0/1hzOr1
         sxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745781470; x=1746386270;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiImoVKJXxF5Kkx3zdXXXFlWOb+F7YBai/OtGKstv94=;
        b=c2kqaA5+TYnl3KIeLUnzEyZuC/7kXpKxylIodqdytQHR6an+vksRl4MIG9sJwVtCVk
         vAhUGaVtWYAp5B2WdYXqFOP0xY/MvYfSr333WRE+XktoGOC4G4u2czzzxxX2qgOB593i
         e3JALaMQcAtkDrq38zUvO0tk+fRctKIs3XWJGgCr5XFOJe7hnd3v9BH43et2PlUxCCb3
         78aBgGLHE97Jzkrl7S4sObF7UJ4elZLH8ViuD4SOiXwzTgca4YaQJ5sbJ7qDHeoPzoxv
         XmNVMjAKacraOdixU/5S9aHib88/d7pqAHTuokZ6SVDLgxfBS59SpUFskLtPq5qzYwRd
         OoaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfe9rCyPwjzqZ+dzSPALfBA4OCO4HFEHXNMOxT8gy8ylnNfiFCuKB0TxCZX/YarLdgbPBjnuy1yqeV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ZAFnVLjAp95X/c5o/HJO4Jjg0z/IvjQUdGE3Zsxsf7U6h2RH
	ztK5WxaQhKsyr3mKm37M2RABbVjqS2v9Xe7cV73hFD2emCXPs8e2wFsuDMOULs4=
X-Gm-Gg: ASbGnct7vGopNxL7KK7R5layyaitizZBfXHNkvx8J6I6Pxiz2IMKCVWdF5GdiKycuJv
	baOgkNdeAvckBFOtdEwHkMeWOmNZvuiCNtz2RPzo6eA6AXI1ZFympU5sbHWOKgwvjk6NvggzjMB
	vtSQtZDapsUrlFLVWptS7LodtVNCXVaakOFv/Ekh7nsGscsfvzhV6F/D2pH8IDN4PvYkN+Uak0o
	1AtVRSqHBpVvPIdIJI0HACMdnT/Q/8tBjYQUg+iCoOwW28s63yaDrcY1rlogyCD6rwIZGFAN4Nj
	x79bIFcL1QL2IqHxyOh3Isw4OFkc9kFYGG4s6TCoxfLF+t/A9e4ZH9lJaLc=
X-Google-Smtp-Source: AGHT+IGubP2iCTuCyZ6yE7PZ7fqh1WFD1EalA/6wRofWBfLKR0gPhAxQUDuoA/JPJLBw75qeR6aCjg==
X-Received: by 2002:a05:6402:1d49:b0:5f4:cb60:b1bf with SMTP id 4fb4d7f45d1cf-5f72297d704mr2493639a12.5.1745781470559;
        Sun, 27 Apr 2025 12:17:50 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f70110791bsm4547238a12.13.2025.04.27.12.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 12:17:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-12-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-12-504f91120b99@linaro.org>
Subject: Re: (subset) [PATCH 12/12] pinctrl: samsung: use new GPIO line
 value setter callbacks
Message-Id: <174578146801.16256.5835084697538702793.b4-ty@linaro.org>
Date: Sun, 27 Apr 2025 21:17:48 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Apr 2025 10:35:35 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[12/12] pinctrl: samsung: use new GPIO line value setter callbacks
        https://git.kernel.org/pinctrl/samsung/c/0a5b9be31f78898c7d6e7778377e8ab6ab0399d2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


