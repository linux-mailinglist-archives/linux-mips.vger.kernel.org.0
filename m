Return-Path: <linux-mips+bounces-7752-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F2EA32C36
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 17:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57205162F49
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 16:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F89121129F;
	Wed, 12 Feb 2025 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V41d/i4E"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29815253352
	for <linux-mips@vger.kernel.org>; Wed, 12 Feb 2025 16:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378763; cv=none; b=c+j5d4ezHMAGNAXg+VT7rZ/IKeIdT7JqwOPJnJfda70HfcD3WocWHaKiHUSWNvbQzLnhCRhv2CNIbzfO6OMg0u/WihBb//uiw2Sh55RDxyLKJGuQ+O2OuzEq5nZvxYSlinkMB8qOutOPTXJ88FOk9h1iFsntuR2S8Lwg6d1giTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378763; c=relaxed/simple;
	bh=BULMItlD7UmqT+FeS+xvhAotN9kxf42G+uPp6a158Mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZB3nX1+2DtBBlgyRRVUdkZx3iMNMSyJm3kk/ci4abzK3UKqPWIBlcTyv1S5ujh6+bfPMLcUs+RgSXk7ynohhMSK6OhBf5TnBKvqe8KtU5i+AAyVy2cAOuw84qiJPHcD2OcsCBHqA29CQcOIJaVmcF8KutoNRmN9T3tISrguW/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V41d/i4E; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7c14b880dso725204866b.1
        for <linux-mips@vger.kernel.org>; Wed, 12 Feb 2025 08:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739378758; x=1739983558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=V41d/i4E9brLfQJLCGm0Uprig5DL3vP1UlTisB2PHSQjn09+a9vz+9TFszGytJ4TMa
         qFLPNjexlKBWPoTBjOPXwl1wrUH71kxwJGGZz1iBoefHfyFLNX6VEgYsd0GCkHxw/Eai
         HvQByCzcEcOuyB96wdLwXEqJaNdMiUxtgH9IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378758; x=1739983558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=uQisnOBibcypDjx3P1B76pJJh7XZBkeRShP2Tf/22Nu3Wki8YAqw5W8IyqdhOHzYlB
         KFWUubQjoUBncFzo9h3QClA2zLR9L+suqNSbr4PyDx4YIkPXZA9yW9mQwiKyz8vFehvG
         joaTEIhPDnFaSBLLYR5K4KNlATiOtbjbkHkEQFkXiRLCwINxn81Ud+CNmvXfTkhgDzYz
         xmAwNmTK23r4ozj7TSxPFTCet8RNxGEKEIuYBMfau+eKKftXJYN1hnX2WtHi0VyghXWj
         /2WOgcAxs0JPeDzJ60ojpphrusyOq1sGqeQMfLBVbsJZp7pw8Qy34ZtSZ98SSH+8FoBY
         KdUg==
X-Forwarded-Encrypted: i=1; AJvYcCV3RLP8u9MSmmpR39KTfRs3URmHduIBSwSaxo0Vbpj+EmW/1N4/673A3VkU0UMTBUNwAskMMIU88aDY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3EBe3g9GSkp0yNWtBaIk1sHueLOf5GszmGIHd/fOhykgO2Cmy
	JzmBysNWN0rnXxQmOOAawPLj3CE7UdZc4dcJpNa8tLpT9G6mPVYrc+N/7jmQEriqQycizWEq0lR
	rN99z
X-Gm-Gg: ASbGncvZvIPrznoh4xQvksp0nMBdjQZiHKY5AahoPZsFGVSbMEkdphiqsUVteY1IbuT
	WUJREv4wR4OmyZTAAVO9z9yloMD5H+u3va6Y4p7fVVvB57k3/9yWRUpIXjiTVhAhV+RNM+oFnKd
	IDvr03igDG9GSzt0pBPHI/Opbsk4SLQTXeAUFd+6JO1meGT4LgzE9eXgXrZnZi7I7R7/1zOMg86
	ZtwNvkmaNc+vN5YT00fZKRBrtfyimLFjLcoTPyosdB9vm8d8mKWODQV5iuENtsJWm6Fu5QIoJZz
	DI+Y+S+fpjIf3pKXN/7k4nSmqpQ/N4YeGedYdzTZ8/aE+W7iTCimXLw=
X-Google-Smtp-Source: AGHT+IGCfhff39sMZhY7AseXUqqfhwUuH30vTx6J3UVTIjicQIMObqy4GSOVP3k9U76HmpNbRfSQ4A==
X-Received: by 2002:a17:907:1c1a:b0:aaf:1183:e9be with SMTP id a640c23a62f3a-ab7f3714990mr418696266b.2.1739378758278;
        Wed, 12 Feb 2025 08:45:58 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7f7ee8686sm135376066b.22.2025.02.12.08.45.56
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 08:45:57 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de56ff9851so9460280a12.2
        for <linux-mips@vger.kernel.org>; Wed, 12 Feb 2025 08:45:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXECXyYCqEkb3DI32XE5i6AfDPgzzGU6nDFWCwbJTyfWQp80yt41bnfgArVJ/CgqgSHaL++J/b3i2he@vger.kernel.org
X-Received: by 2002:a05:6512:1195:b0:545:9e1:e824 with SMTP id
 2adb3069b0e04-545184bc12fmr1571346e87.48.1739378317154; Wed, 12 Feb 2025
 08:38:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com> <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
In-Reply-To: <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 08:38:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
X-Gm-Features: AWEUYZnEAQCx0nU_sk8MYOvtfC7Gu1h5Zsl0lbrfbQPnQTV4y2laVQqsVCR6NTE
Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device
 creation helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 11, 2025 at 9:28=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++--------------------=
------
>  1 file changed, 20 insertions(+), 64 deletions(-)

Thanks for creating the helpers and getting rid of some boilerplate!
This conflicts with commit 574f5ee2c85a ("drm/bridge: ti-sn65dsi86:
Fix multiple instances") which is in drm-next, though. Please resolve.

Since nothing here is urgent, I would assume patch #1 would land and
then we'd just wait until it made it to mainline before landing the
other patches in their respective trees?


> -static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
> -                                      struct auxiliary_device **aux_out,
> -                                      const char *name)
> -{
> -       struct device *dev =3D pdata->dev;
> -       struct auxiliary_device *aux;
> -       int ret;
> -
> -       aux =3D kzalloc(sizeof(*aux), GFP_KERNEL);
> -       if (!aux)
> -               return -ENOMEM;
> -
> -       aux->name =3D name;
> -       aux->dev.parent =3D dev;
> -       aux->dev.release =3D ti_sn65dsi86_aux_device_release;
> -       device_set_of_node_from_dev(&aux->dev, dev);
> -       ret =3D auxiliary_device_init(aux);
> -       if (ret) {
> -               kfree(aux);
> -               return ret;
> -       }
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, au=
x);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D auxiliary_device_add(aux);
> -       if (ret)
> -               return ret;
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, au=
x);
> -       if (!ret)
> -               *aux_out =3D aux;

I notice that your new code has one fewer devm_add_action_or_reset()
than the code here which you're replacing. That means it needs to call
"uninit" explicitly in one extra place. It still seems clean enough,
though, so I don't have any real objections to the way you're doing it
there. ;-)

-Doug

