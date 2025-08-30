Return-Path: <linux-mips+bounces-10857-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BDAB3C93D
	for <lists+linux-mips@lfdr.de>; Sat, 30 Aug 2025 10:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1DD35813A6
	for <lists+linux-mips@lfdr.de>; Sat, 30 Aug 2025 08:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE2A263F5F;
	Sat, 30 Aug 2025 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFdO8Tty"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115B23D289;
	Sat, 30 Aug 2025 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756541998; cv=none; b=pT9az0lN1TOdygsitLHwri2zPpuw6Fz7TavQrZb5jiYOK5bhgUNW2khKryPieV58zUith/c2BEqUrYGYnv94ftV1tz3mYwGf7VyY52pv0Ox066r3ZFbFfzYNXlg0yRz2bDwVEqwxGOTmou8VS3l6kP43JuYEnuNiot7vuaI1ge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756541998; c=relaxed/simple;
	bh=VJVktYbtJWttedpN2IBIAHp9NC8Jjxgesn2RhZArsks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nuQ2MluADFZROrkAG/6iPEoeLvOwCKCZ6KgEx5Odx5+BFuYL9SFqkr0sC6iUb4oXdKmIMWTRnsYsOLXFSX1MqxDLbHr9qteEZoQXaPNwfBUc6XNh61gC2PC8JWflfyXuYXqatgkt3muDbhEudDqSMhRcm0oz8nhryTbkUF4JGK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFdO8Tty; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afefc7be9d4so253245166b.1;
        Sat, 30 Aug 2025 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756541995; x=1757146795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yz+gNr9wnP1FuUv8NASxp4fC8wPUaxLjhsHiXAOzrk=;
        b=LFdO8Tty3gUHLAzXcZW1zpY1k+aBFmSZ2AOh6hFX1COXyze8PvW0vuIGCBxGScXflf
         IVRrnwNVl8VvJa02d8nAyNqf54Q0WjGylCcRfjLxEF7j3ggCXzoF0VuMQDJn9cu4MvhG
         8jXS2gkUjkVHEYAlHmTtVlJFPsPOBNff2hgAVKMkxYc16HD0VpkcO2sJ/d9ok/hQVNXz
         bfksyuAB2zHqWrhEDDlnF8efyt2QnyA2Fj0DQSsHMPHKy+cFIk3lob8mNM4qeCMCh8ar
         z0qhCqtmRRyYg8t5GZKUlD8LFrwfdQqxIFFUVdxWYFynUTcJkRN//dMkGsBVooatm3sO
         0Yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756541995; x=1757146795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yz+gNr9wnP1FuUv8NASxp4fC8wPUaxLjhsHiXAOzrk=;
        b=pgM1GkC9BG08N65egOq+9nVePZxyWpoLEToS973kN07u4yaNfmH+JzljNg2kR6F9DS
         DNm6hC1iZtYxL4CUL5GJ1H4DQ7BIT5bKW+A5MDA7Nc6y3eGctmfIJrS2WaFVAyKqwn2W
         O0Le3b0SRURIszM0xQzVCmsoJ6EBenPYlQtXvgCGRjRdCGEmK/z5aNFo6+8v6IVXlG0+
         r0Vg7k5Azw3yhzhR9EJqibSxaapSg+zfQvezzIcR4bZudwzzvUJKx1733FZQgrnDCHNQ
         i8eyaHaoP4OjlCR1CovMQL3OlWYrpWwAA4uma41/2+S6vYuQvnP681tKPmV36RsAjGpc
         gmYA==
X-Forwarded-Encrypted: i=1; AJvYcCUBzCvwx4PiucpbyZlSNtM2nc312fIyPqJRCVyThB7plGtVzMugm5ndiVbUheyBxJkvCLGmXE28NZYXVUsYs2Sr@vger.kernel.org, AJvYcCUDdc2RYLLXvqcJb5f1fKz7d4PcY6+LWLIt0QOfSYxFbUf0nsjvfHoTzW7OSYBWMPqoQERzC2OjGhxU+Q==@vger.kernel.org, AJvYcCUXfBNpurnurFL+cuQTU84WtFsrIBWllzErMkFnHNKKPBTmIPhEaplbTBDsI8MfHuuTilrz6uJS+VnUSJLxreJ1v+s=@vger.kernel.org, AJvYcCVp2cJ7gHO02+8ALWKT2gBcGJZ/b+Rk49QYSy/+ttnnGlKX0ZKEIZIvW0KnCSxl255gdAE2v+h7EeuqTw==@vger.kernel.org, AJvYcCWXNyfBau4/FE/XFNILdkU1ENmeFPPZ9mAKR7ukI+xogDdNwz5ErseXDKfyhTNIkpC83/M9PpYB7GtheZ3q@vger.kernel.org, AJvYcCWlYN75wzqyAbUNsZo7BXnqyb754i7cN3VuKBGXYVd4I38gqNcgoQWxdIhmoyt66U6iGmLwv0QFxZoZAg==@vger.kernel.org, AJvYcCXAAHdhi07F/Wd+pUXV5PCFeZPDnSS1wffTW58iJEbE40WEDQrBJOoKmoi6rbINcXdC1CwTleWCo62FsTwh@vger.kernel.org
X-Gm-Message-State: AOJu0YyYaURFSemV6gQcw3YomRw5YPUhpqiAjlulVv8y/5SRzYCWhZ4n
	pr3L3SoZM/VVHefs9gkms1b4nyysCt8EnDLqv+UbWpQAZ7ROjCwV4ESZpORWuhsJrog12mKmxJq
	+I0m7Djgy8NDAvWgPwVZJBJAKPJ0bwC4=
X-Gm-Gg: ASbGnctlAk3pCQUsyot/4598sC5iNXm80xxKYzgCXSlOKLp+SnKRthviTxFldNMuMEm
	R6ycUjwdqY+yqX+OJcYtMvHrwRX10mLShYVSpFmiZSVd6Z6ilrSwcjsJtB5bF8WdINddcAB+GYn
	aoMePyGTamHGSq22gSrR8mhMa0RlB6pnV04sxv0YZOkoeO/FyAaBldEH+lXqnBOu7jdnA2+0dUL
	2EPYKSwPDYze7vcZA==
X-Google-Smtp-Source: AGHT+IFZ0wex4nlRzxOc5BG8ARrUjGz7n83ilxsIj2vkPtuKrq3/+IPw3T+K7YRUGhLq8JMm7BCY/eJH8jBRTGRUUSA=
X-Received: by 2002:a17:907:d88:b0:afe:764d:6b24 with SMTP id
 a640c23a62f3a-b01d8a6a72cmr138313266b.14.1756541994858; Sat, 30 Aug 2025
 01:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 Aug 2025 11:19:18 +0300
X-Gm-Features: Ac12FXwW6CW7deBsm3Aef2wv7I2Olg4IsebLLUGVz2bUvR7gVeqwu6XUXgRk6VE
Message-ID: <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 7:00=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Problem: when pinctrl core binds pins to a consumer device and the
> pinmux ops of the underlying driver are marked as strict, the pin in
> question can no longer be requested as a GPIO using the GPIO descriptor
> API. It will result in the following error:
>
> [    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already request=
ed by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
> [    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100=
000.pinctrl:570)
>
> This typically makes sense except when the pins are muxed to a function
> that actually says "GPIO". Of course, the function name is just a string
> so it has no meaning to the pinctrl subsystem.
>
> We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> other platforms as well) where we mux a pin to "gpio" function using the
> `pinctrl-X` property in order to configure bias or drive-strength and
> then access it using the gpiod API. This makes it impossible to mark the
> pin controller module as "strict".
>
> This series proposes to introduce a concept of a sub-category of
> pinfunctions: GPIO functions where the above is not true and the pin
> muxed as a GPIO can still be accessed via the GPIO consumer API even for
> strict pinmuxers.
>
> To that end: we first clean up the drivers that use struct function_desc
> and make them use the smaller struct pinfunction instead - which is the
> correct structure for drivers to describe their pin functions with. We
> also rework pinmux core to not duplicate memory used to store the
> pinfunctions unless they're allocated dynamically.
>
> First: provide the kmemdup_const() helper which only duplicates memory
> if it's not in the .rodata section. Then rework all pinctrl drivers that
> instantiate objects of type struct function_desc as they should only be
> created by pinmux core. Next constify the return value of the accessor
> used to expose these structures to users and finally convert the
> pinfunction object within struct function_desc to a pointer and use
> kmemdup_const() to assign it. With this done proceed to add
> infrastructure for the GPIO pin function category and use it in Qualcomm
> drivers. At the very end: make the Qualcomm pinmuxer strict.

Note mainly for Linus and Bart:
I agree with the patches 1..11, but starting from 12 needs more
discussion. That said, I hope Linus can apply the first 11 ones to
make it easier to continue with the rest.

--=20
With Best Regards,
Andy Shevchenko

