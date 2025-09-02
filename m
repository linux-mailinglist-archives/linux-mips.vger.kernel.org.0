Return-Path: <linux-mips+bounces-10976-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6405EB40EBF
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 22:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A7087B551E
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 20:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B2E345733;
	Tue,  2 Sep 2025 20:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8Y7Gnac"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343622DECB4;
	Tue,  2 Sep 2025 20:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756846018; cv=none; b=obDxSM3gyLOWPJ8mVgQAx4isqFEYCnnjvl3AFMJMU6hnu4m2Ahbkol/+oY+eSs5vUsq7QMek5cz2bdyOuf4dRqlhVn8fkXNAp4uZhLz8y9i1xyZikmMyu9pqZSX0Fh1x3vq7LvIuKTHHORQyifz7WyQAXxSsB0bqb7duHrbmKn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756846018; c=relaxed/simple;
	bh=kutjVkpcvEETb1qEj2HY122cngSwuEsceeDMIRlTOiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlDj1sPeQt0ch6tyzhVrGFGtbT2wHzg8Ykpx+k8C6337FfzOQT6QN3gzSU/5wx91MdWJ6S9XDdpizGjiLzoG/pH54O1aameCZV4Q6i7Vz/uRQmKrn7yymQbUbr5j2u5TE22sSDZbAnr2nKTFXfbDmBXoGoBQnGv15wbw5O3FYPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8Y7Gnac; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7ace3baso440904166b.3;
        Tue, 02 Sep 2025 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756846015; x=1757450815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kutjVkpcvEETb1qEj2HY122cngSwuEsceeDMIRlTOiM=;
        b=T8Y7Gnacmq4vOiGY8YqsBkmMTB3Tq4pHX6BLsj+eL8A7Yq0rXmwFbT7amtInhH2IPO
         Yl9eB9W0SRTOM3yCvwMh8/TEVmmapxjCyGZlJOJ5mVWhUCOm+EHC96sPLSRLz0mf45hr
         ml1me73jxUtHCB/aNPOip7svo8Frg+JLQTi4E9FysfNaIg8uasZ87S/+67txw9e9Lkep
         qZEjHgj5EWbSQDBui5vlZh17Mn87AUud00YFD3yKrFywJ9NhVqKNBeyClKNYaTl/Fv7n
         Rw6giI4jUeL5w/kEIBWz4vJfqJtc9MZ79Itb/GKpnooXI9lTZwK6a5lxp5S/aWBGyqNu
         F5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756846015; x=1757450815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kutjVkpcvEETb1qEj2HY122cngSwuEsceeDMIRlTOiM=;
        b=MeXiP+dWOvp+Qvn+4P21IayjVCclGsSWtSrppFuw8lMmZwkqO5n0U68+qM/QZao6U0
         xfBzj/fuB/AjNIZ8B6744IJx7ECSQgfwXeKixaIDk32CKrIlZYXMGHf9VZu3/s5Ytb0Q
         ibFTS08cBLhxHn6aYJXBowzx9lhdXQRVBdyk4MLt1Gbcue6B2dYC8NwvsE20PITyMLmS
         V99LL+5Z5LLNlD7u2mg4pVZIllvjIIdXXanbjxBqjtWNzNFn8HDpWfqsQNL+D0iTpU3v
         DVifrilFttYrDPgenb8Gfl+c2jUMFJ3gzryuXiEeZzbJ7ZC7bYp1lbkaFnLuakmtSj6V
         iUsw==
X-Forwarded-Encrypted: i=1; AJvYcCU1TvCmK+n7id47Z415vcSXbK/8tf7XIG5+Y6nt3V+RzWKGgtxIMb8CDsHFUpqBmpIVgYETfxThi0c02l57@vger.kernel.org, AJvYcCVOX1dHAk8aIZIWF8UfE8AzM3dAQ82sjDmR582LD/TXJcgUAzLyUpkJPrB0dSdzSCLd05ox2zTlesrsEg==@vger.kernel.org, AJvYcCVpacStE7ESxxu+OLaLrNSkp4Y/7HeorGOKsQoTXWACcTE97LNn5p0yZ1r6FyThuBaXkGNNxyrsiP8Yww==@vger.kernel.org, AJvYcCW3K1eKLORm8BIahs8gFOcvpYxlqzipmXGB+KioQwn0aI++2kT7AhZB/E2/6CRAHVHxoqcgIWFrXyFv23q6@vger.kernel.org, AJvYcCWJDjcgX+lR/Yjk5CvZxBdaBKc0hSODdIgYao1RvTq0lg/JnMqi6tXjrBLjxdl5R0QPLONY2gWGRry9YGNkuZrS@vger.kernel.org, AJvYcCWzE2hR8/HtmQU7JNzDCGZ+qOi+WSbU2HNWovH5HuCgB7hdAx7JxcppoRols3BUGsHvdo7nRZK5lMv4z9p5akQq/T8=@vger.kernel.org, AJvYcCXhYLdvVXghPyBZ4bXGdhP6Xi6EFTmIqcNrjPbKexUlsfpmgx1DH0SfYPfml+Yi6tb73sgxdah4ol39Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8Hm2y3HRY9md8l5/peqTgNLAxdNL301e/CsrijbLxSUEB29f
	FUj8pVRqotcgoyNN9QxHVxtdbGIFo9PsyIHPhoOktUeZGSEJNbgzxmZIUf0cxbI6fAvCjC3b4+f
	bVt8Jc1ImuLaPECVyM3KzQjxfWCmnSrw=
X-Gm-Gg: ASbGncsoYLFieQjMd+7fkkaXNtrVv8BNuZH9au/9u3+5xgQqknnkg2CSGgd7ZxbJezj
	h2FZrxTDfUTaVyaqMI3jrIGqbHDc7/556ASrU0dg0XFtm9pQfOYHymgYwG4SxZoP9EdZTNQ3U+w
	dPdVas31u4BjPivkpkuAhO6xBaZKbJMHNyrF4ZkPhoAK+JfOLqw3LX78gGzJFy0X0U6+JqVPwMs
	RMq4rd7aBaGjRVUwQ==
X-Google-Smtp-Source: AGHT+IG4zlhdZMe5YSuufGeqwlIQK8acaeuuvg5xL+VVOl3StpGEjjD0yfcY2w04cC3rT7k1Cl4bbDXfAthjT80xlmI=
X-Received: by 2002:a17:906:4fca:b0:b04:6546:347e with SMTP id
 a640c23a62f3a-b0465463a5bmr50237566b.51.1756846015338; Tue, 02 Sep 2025
 13:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
In-Reply-To: <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Sep 2025 23:46:18 +0300
X-Gm-Features: Ac12FXzQiEATdvX4DXbIt31zcGrGliq36XoLvlgsSrCLd-DIw99Mu03fZo98CMc
Message-ID: <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The strict flag in struct pinmux_ops disallows the usage of the same =
pin
> > > as a GPIO and for another function. Without it, a rouge user-space
> > > process with enough privileges (or even a buggy driver) can request a
> > > used pin as GPIO and drive it, potentially confusing devices or even
> > > crashing the system. Set it globally for all pinctrl-msm users.
> >
> > How does this keep (or allow) I=E6=B6=8E generic recovery mechanism to =
work?
>
> What even is the "generic recovery mechanism"? That's the first time
> I'm hearing this name.

"I=C2=B2C generic recovery mechanism" (I dunno why you put away the I=C2=B2=
C keyword).

--=20
With Best Regards,
Andy Shevchenko

