Return-Path: <linux-mips+bounces-1658-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7432485E752
	for <lists+linux-mips@lfdr.de>; Wed, 21 Feb 2024 20:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14FF7B23044
	for <lists+linux-mips@lfdr.de>; Wed, 21 Feb 2024 19:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCFF8612E;
	Wed, 21 Feb 2024 19:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7+GTiCd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E785949
	for <linux-mips@vger.kernel.org>; Wed, 21 Feb 2024 19:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708543910; cv=none; b=C6ecIV6eQvA8EaNHXl31Hz4ML1nRsrvqpHm375cavGnvvnw46XPjuCJEFJSA3aNzPaBkzOCSIk5Us6lbezn7MRdJXjbTeCB9UAghHO3sKool8UUZAwf/Ft4qeJI7zoid3yFYaHQDxFn3AadCtXWI9/Nk2hIzxjDjV0V4IlpSawQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708543910; c=relaxed/simple;
	bh=cK2/COg8bX/QO3/+g2BnMI+IJZZQdraLUne32V/1SOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XucOGSt3rke0FH7jMeJFp5FDyaqhYLtyDfOpERVZ+qLS+ufYiftzTUeVnBtDpJLfRQBJmjnBmv6WvI2eQmjfYxdXJoaKFwyc7Eu5OFmt6C+/H+b0Fwn5/6T876cZDItE4CSF/d4QKwxVooYwavNBwgpiCtx4Wsz5kFIOXAhBb44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7+GTiCd; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbed179f0faso93705276.1
        for <linux-mips@vger.kernel.org>; Wed, 21 Feb 2024 11:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708543907; x=1709148707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cK2/COg8bX/QO3/+g2BnMI+IJZZQdraLUne32V/1SOM=;
        b=c7+GTiCdRWKQvnxt41SKtNDVgLOv0fa4s//w3bo9Cp4g905uUMkc9wJKqQieY/rdEc
         5CObeHnNzKn0TniFY2H/3vkWRu9SX4TF5KXmyjCD53SAJFvHkhykAbVsSxpKlhn/XUqE
         Q+8u0CUuE/9YNVMPlaUi9d4sfmYPSgDSRvR6nrgMAajhBQ2KZfgRALB9jBvDlVco/KRS
         77x2hs+fNJDj+VqWnTb/q6A1ZdGue3djNpqHfz+FC9e9dOtiFbVCjO8PaWS2Q/acEdHj
         SxgT6AkuY4de8pFkTG9ZpX5P58LBCDKQi5iv0j5rNTTLFjk5fuvJzu7Ew3ljgM4p3kkP
         kqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708543907; x=1709148707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cK2/COg8bX/QO3/+g2BnMI+IJZZQdraLUne32V/1SOM=;
        b=mFRLMORvU/Sxx6V5pdLHA/mFzIpUC8DJxwQZcffO/9nK9vXqjpr8c8LzarcorADM11
         8xVWiQamrhiySnVz3MorC1e56QPLIO1f25/NONwAYQiY+SdgYiytdbpOcuOgsfiJw9tg
         F0cVVj4CR+zku2T94/MWWtXYeWoplBTq0VlyBWDL479/T0O8Vo6Z8dCpRG+xOY5sDSs2
         2exrS2A5BOrbILpZZMjMWsRhpyqz3PpUo2kSzFAlhYnRp+GnRhJkF6WqVG12D8hHsNyL
         fsu0qrn/4qlg3P3GxkvOpvKEs5uGsZDm2az3P8i6qX8RCOKhuj+lqCVq3WkEXhBcc05a
         uuTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3si4lRAj6XezzrKKISy8AhJ6soq9+GNCu0qAokdMmt5Ms5BqlRoZivmpDJE1BDccHzDfRI0gfQzgLgxukYWZ/OsTNw9nrhdRmhQ==
X-Gm-Message-State: AOJu0YzZjDoch7kYg0yYgtFtC6U8za5cFL/ZsunVyLp8ydS0KNBfa0jB
	WQu53+wynhpd85YH5ZkietNj/XgDC0FX9FkQiirfD+6b49Ck5f0KXofal375Owj9MPm46FdkSv9
	8UY/ygU/55zuzDTP+FnHzJdfH1oJSrNCvHhH6+Q==
X-Google-Smtp-Source: AGHT+IFcNRrRbBuX5wsB2mLMJqV3vUMnApqNCuxOwYg8cuZgXEc7ou5NmxS57HKKyJVhHK/1bsLXCWFiYfB9DCqFvWU=
X-Received: by 2002:a05:6902:20d:b0:dc7:45e4:46f8 with SMTP id
 j13-20020a056902020d00b00dc745e446f8mr92660ybs.6.1708543907471; Wed, 21 Feb
 2024 11:31:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com>
 <20240214-mbly-gpio-v1-5-f88c0ccf372b@bootlin.com> <CACRpkdaSMJBFrmbTu+C1Ls8HkLH4FZsAQ6t7dC76+sVTXXHEyw@mail.gmail.com>
 <CZAW6UTMON6K.34LW7FDGNO1XC@bootlin.com>
In-Reply-To: <CZAW6UTMON6K.34LW7FDGNO1XC@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 20:31:35 +0100
Message-ID: <CACRpkdZPU2EuBjTA3_ZQN=apSSpUYg0sOZoskSnttkVBixAnhw@mail.gmail.com>
Subject: Re: [PATCH 05/23] gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/
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

On Wed, Feb 21, 2024 at 5:20=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> > Could you add:
> >
> > default PINCTRL_NOMADIK
> >
> > so it is turned on by default when we have that, since they are jitted =
together
> > so closely.
>
> Would that bring something more than what is currently present? I've set
> PINCTRL_NOMADIK to select GPIO_NOMADIK.

I missed that!

OK no problem, all works fine.

Yours,
Linus Walleij

