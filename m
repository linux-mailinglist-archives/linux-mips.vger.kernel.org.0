Return-Path: <linux-mips+bounces-8738-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39AFA9B592
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 19:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EF195A43E2
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 17:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9A028935D;
	Thu, 24 Apr 2025 17:43:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CA71AC43A;
	Thu, 24 Apr 2025 17:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516608; cv=none; b=K/TsX8dk+yZOfsZz0cqeBWpZgfAoviy4932ac979PfVSZP/DR6Ij7E2l5jbCsMwVaPQScLhDeQ4l7pYMl4yKojFtge/Bziy5YHzMFgGdRWnYBMwGqhBakHv9GTswSvQVW8x+WJI/G3MW1nq9mX5mILHaBPOUsUmeHEmNyqQMBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516608; c=relaxed/simple;
	bh=Q1rWsjGwZfqwAIAQoTWSKSH3d5oKZMxaqiONRAi9gsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOAGTZY2Bm2ms0g+iQzHlvcYfTpgCT5DH5vy3QYhWZlBDmmYkcFbZV8vOZ9W1GrgYwRM64eDEYk/i0Ot723MUecBTV7MukERKBXUeEM7a53yecOEpfx2fsYoJVSvGp4QL3WRVd6nllSoaFFCIG1vB/Uh0C9IhZ4iM/eEGnW6klA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54e7967cf67so1492460e87.0;
        Thu, 24 Apr 2025 10:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516602; x=1746121402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PmRnlbEicfo57AAZvezn0z0uuZ1cfiLTFbR9RI0t2I8=;
        b=kL8sSovfGj/thg+HW+O9SG+gjyIpwc8C6xzfnDIS+biA/MqBHmSRlwP1rkKvX+MkbW
         GsBTl0YMa9wFe7tA4eb2d5etJk9riRo0F0CxtMFa8IgkFfwmvY5z1h3lp+s2mc7MUcZJ
         i5o269BTzLwC59bHImnRZIWOpUOj1REcJZ/iinqp1AeVmyrfyCdO0MAW6t6weDhq4EJH
         QT4xItWLmHXVZ6NFHD0hOpodWdiQIIOUKQ9mpBtzASx5db0EIVrxUx8/8iMDq7tcGvuG
         bcr8tpZblAh5rcfxOcggy+zh/G8SuyEkQTelOkPVTIcbOsm9keEIJ6E8tyt7xArsm7Me
         afoA==
X-Forwarded-Encrypted: i=1; AJvYcCUPFIDzej8mgS1+Z7c0RJDalPaeUaUO1RPQ9e1u8BTpDhCEqytyZhgXF/gcgOjYjYNxERJ3Fz6F/1RitA==@vger.kernel.org, AJvYcCUV6C1QqCS/hgKi/MjvKShzPjFDS4FkS5VUDIB5yMnwkLdRIIOSc3ESC9B09tctIB+avjhnR1qBdR6F54S0@vger.kernel.org, AJvYcCVAvLB7zG0IMVjUWSOLQ1kPMoyrxLF3m+Tb5xtMBdppfVOFyEdjFzNWpdl6wJq45CVfgBf/pxWPN7bB@vger.kernel.org, AJvYcCViLtv+Hta8mj8l2BZjixnTRn0ItUuAIOH2tvFX1KaHTByVuWDR8aJInc1H2zvQ8A3G++9088srRTloX3BHLFkgYoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8l+X3LccXYxqBO3/3vf9Idg84+MoUOrbIm2g7l5lWRgXuv9WF
	20qRjEXcH12IIJGCqwsHFlGPzmRoakUnJNd8dQDVK5ItKkuDbHsSc7n7JQ18
X-Gm-Gg: ASbGnctSF4+QCFG8J78BubSgLXgwYzJwsK5Joh1j+6B6Ec5pGLCHgDsLEuqUY9sGjIw
	Ti1NKdDk3mamJnMSITNdoO/DcTpLUWy9PksRn8cHdMTDzFid6VOZ04D/AbJR35JW/xkILE5ULa6
	NoqoFRj++bN9cPAcT5R/kKVDHjS1zpMk9Qn3+8yqX+k9C4HFzwmd0NoHw1/WSVHehzCFR8RZKfh
	Q1fBKXru58iYY2LxnnypMApaLwao6kjk1X7w31YdKe6Ooho4gAAKiaPuXKJxCNn3x2v+5YOGLFH
	OPqB2nTcUpoI+nt6UpS1fokvpw7IV88H/TpYp6fNJecNHVzLQMPL5qbWOEF8ILCA3jPsJQ==
X-Google-Smtp-Source: AGHT+IHKzBXq9qRzoDToL55ggomyo8yrSMxRDduyR7cHd7WuZAHGHt3x798+Np/sTzAQ8qHWrFhh5w==
X-Received: by 2002:a05:6512:238f:b0:549:8b24:989f with SMTP id 2adb3069b0e04-54e885d4806mr91454e87.0.1745516601448;
        Thu, 24 Apr 2025 10:43:21 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca83c6sm297733e87.113.2025.04.24.10.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 10:43:20 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b10594812so1380468e87.1;
        Thu, 24 Apr 2025 10:43:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVM5z8IPfIMS8vfZRct7NLiFVKrmjDW2VvSuVsNuSPqgal80M+/WjFhFehpkih2OmOynQQOgr+VDRhmpO2p@vger.kernel.org, AJvYcCVx37Rk4gShK6A94MidyXmFxApLxI81Q/Ew0JMuayF4qxp0qdTrS1v+HXP8gJavGmSuUic5pc4rkfFGGeeI9PTTo+4=@vger.kernel.org, AJvYcCWyPZYtv8ZMHCwQySm3jCxmSBWgQ1FP/lDXuWDEKjvkFXkz/sIRjnOP5BImPZ0FH+sUNbpIBHbCFglHgA==@vger.kernel.org, AJvYcCWzRRlfO1mLIZxVwZ60jCPFcpStQx4grxsecDeA5vVjXWqX+BYEoIynKgQ74TS0F9Io6gKrDyLSosY9@vger.kernel.org
X-Received: by 2002:a05:6512:2310:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-54e8977aeb9mr70103e87.16.1745516600353; Thu, 24 Apr 2025
 10:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 01:43:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
X-Gm-Features: ATxdqUHeMGKXwILdemaV4iIduxoy9n-SC7kRH607ob8j4Z0cm-iXg78WkqCwkx4
Message-ID: <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] pinctrl: axp209: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
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

On Thu, Apr 24, 2025 at 4:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-axp209.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-a=
xp209.c
> index 2b4805e74eed..28ff846d263a 100644
> --- a/drivers/pinctrl/pinctrl-axp209.c
> +++ b/drivers/pinctrl/pinctrl-axp209.c
> @@ -192,34 +192,31 @@ static int axp20x_gpio_get_direction(struct gpio_ch=
ip *chip,
>  static int axp20x_gpio_output(struct gpio_chip *chip, unsigned int offse=
t,
>                               int value)
>  {
> -       chip->set(chip, offset, value);
> -
> -       return 0;
> +       return chip->set_rv(chip, offset, value);
>  }
>
> -static void axp20x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -                           int value)
> +static int axp20x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +                          int value)
>  {
>         struct axp20x_pctl *pctl =3D gpiochip_get_data(chip);
>         int reg;
>
>         /* AXP209 has GPIO3 status sharing the settings register */
>         if (offset =3D=3D 3) {
> -               regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL,
> -                                  AXP20X_GPIO3_FUNCTIONS,
> -                                  value ? AXP20X_GPIO3_FUNCTION_OUT_HIGH=
 :
> -                                  AXP20X_GPIO3_FUNCTION_OUT_LOW);
> -               return;
> +               return regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL=
,
> +                                         AXP20X_GPIO3_FUNCTIONS,
> +                                         value ?
> +                                               AXP20X_GPIO3_FUNCTION_OUT=
_HIGH :
> +                                               AXP20X_GPIO3_FUNCTION_OUT=
_LOW);
>         }

I guess you could also drop the curly braces, but otherwise

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

>
>         reg =3D axp20x_gpio_get_reg(offset);
>         if (reg < 0)
> -               return;
> +               return reg;
>
> -       regmap_update_bits(pctl->regmap, reg,
> -                          AXP20X_GPIO_FUNCTIONS,
> -                          value ? AXP20X_GPIO_FUNCTION_OUT_HIGH :
> -                          AXP20X_GPIO_FUNCTION_OUT_LOW);
> +       return regmap_update_bits(pctl->regmap, reg, AXP20X_GPIO_FUNCTION=
S,
> +                                 value ? AXP20X_GPIO_FUNCTION_OUT_HIGH :
> +                                         AXP20X_GPIO_FUNCTION_OUT_LOW);
>  }
>
>  static int axp20x_pmx_set(struct pinctrl_dev *pctldev, unsigned int offs=
et,
> @@ -468,7 +465,7 @@ static int axp20x_pctl_probe(struct platform_device *=
pdev)
>         pctl->chip.owner                =3D THIS_MODULE;
>         pctl->chip.get                  =3D axp20x_gpio_get;
>         pctl->chip.get_direction        =3D axp20x_gpio_get_direction;
> -       pctl->chip.set                  =3D axp20x_gpio_set;
> +       pctl->chip.set_rv               =3D axp20x_gpio_set;
>         pctl->chip.direction_input      =3D pinctrl_gpio_direction_input;
>         pctl->chip.direction_output     =3D axp20x_gpio_output;
>
>
> --
> 2.45.2
>

