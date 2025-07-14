Return-Path: <linux-mips+bounces-9808-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF021B03D66
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jul 2025 13:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AB7617DCD8
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jul 2025 11:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F52246BAA;
	Mon, 14 Jul 2025 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="gFzHwEOu"
X-Original-To: linux-mips@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BE11C54AF;
	Mon, 14 Jul 2025 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752492551; cv=none; b=cg2hIWEsrdiUkmjB9Z/YZvZuMnysRdy4Lz8jIGc/KA1Mr07qcCYh/BVDBr0InLMUqo5wrBkiCvsvKv1yzjf+CdG7Ozbf7OJda5DhlmVAfV4g8Pg/NhHo4pDc55adPtiXFaHZl1Dj5qrgqqgCkzVSqKFyaL8fHn+CPmBD9NoRv70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752492551; c=relaxed/simple;
	bh=IHeaZkmR3o1h+r0vSawI9hhyMrY40fjBlCfxkbgtCHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WgNsNw2znpRks9DrerJfsSMIQaHvnnsQAS1Q9mk2RwKOJ2Bsycsij3cHOfIbGFAfF9jKl0DrjGSZwCPgPVvjpVi5veg8U1yS1HuB0RFHhyR1RbeFoM1nLHUr1vi955E5EnuCJd63NXXXJ0JShBIlRsXgxb8Q9M8inntbZcDdTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=gFzHwEOu; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Yt0pEgiOw5D20asS7w9+koIyg+3FrGpHgzGJycRNdqs=; b=gFzHwEOunPxcWiAMs5c57JGmBA
	1i9gdYcrvYX29m70SzdEFbb949zBkFdvThNwJKQhzyJ3vz63/HJ1jVg/SqRuGP6n4gWIfjUiccouh
	P6KnCGtkMsx1a1QQNrL8jQIZ49P75WLOx+rlYn0bQB+2wVwhdnl721IvhTuDmNYdNVe5pAbt9ry3r
	/RoZjj89dZL+hcZYQojrwClpv3YSiPvK4/2ywr4rKpCY38bVQj98vjQR3JbcWmt8iXRlTCD0vcUbS
	UQwyw9zH6H36xlLQYifZECz0isuti6nChKskuuzSIiEqCqAEDnDQFMnIb/oDf1WYaJgVwW4dg+ZXE
	kcLZNHaA==;
Received: from i53875a13.versanet.de ([83.135.90.19] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubHMj-0007NV-40; Mon, 14 Jul 2025 13:29:01 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Cercueil <paul@crapouillou.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject:
 Re: [PATCH v2 09/12] pinctrl: allow to mark pin functions as requestable
 GPIOs
Date: Mon, 14 Jul 2025 13:29:01 +0200
Message-ID: <5911205.31r3eYUQgx@diego>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-9-b6135149c0d9@linaro.org>
References:
 <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-9-b6135149c0d9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 9. Juli 2025, 16:39:05 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Bartosz Golaszewski:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> The name of the pin function has no real meaning to pinctrl core and is
> there only for human readability of device properties. Some pins are
> muxed as GPIOs but for "strict" pinmuxers it's impossible to request
> them as GPIOs if they're bound to a devide - even if their function name
> explicitly says "gpio". Add a new field to struct pinfunction that
> allows to pass additional flags to pinctrl core. While we could go with
> a boolean "is_gpio" field, a flags field is more future-proof.
>=20
> If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
> to it can be requested as GPIO even on strict pin controllers. Add a new
> callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
> core to inspect a function and see if it's a GPIO one. Provide a generic
> implementation of this callback.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

> diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmu=
x.h
> index d6f7b58d6ad0cce421aad80463529c9ccc65d68e..6db6c3e1ccc2249d4b4204e6f=
c19bf7b4397cc81 100644
> --- a/include/linux/pinctrl/pinmux.h
> +++ b/include/linux/pinctrl/pinmux.h
> @@ -66,6 +66,8 @@ struct pinmux_ops {
>  				    unsigned int selector,
>  				    const char * const **groups,
>  				    unsigned int *num_groups);
> +	bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
> +				  unsigned int selector);

hmm, I think using the set_mux function arguments here might make this
usable by more drivers? Aka func_selector + group_selector ?

While the generic pinmux might not need that, when pinmuxings are
arranged in functions + pingroups in them, this would be helpful.


Heiko




