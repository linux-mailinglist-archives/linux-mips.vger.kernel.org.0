Return-Path: <linux-mips+bounces-9915-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4ACB108AF
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 13:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15294584CC5
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB9B26C3AC;
	Thu, 24 Jul 2025 11:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnMiIuef"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6729E3BBF0;
	Thu, 24 Jul 2025 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355505; cv=none; b=rfbnsT6CcPtxCOybCpIHUxQdnODXkvq4s3hHsEMLecpp8s2skYlWbqhvp7VINN3AWXUrUrmMPSB8HIdOujJwhePq5XnRgZnixTbOiNqrQ2BZFcXR2+ri7waaaI3JoWk2VoOn9Y8KGYyKpgesjOwHRnGUzMFugGzZYzi4irprBU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355505; c=relaxed/simple;
	bh=LO3S7VvW0yLWS/aA7Ztz2n2SjnGIc3GFyf0h1H0tplM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o63ivUXI6V+S25JrRZk6gDEQ2Aku1FkGvPjP6rRCGZEtNSrKT7AxYNC5Vx2Fpqj1kYHC/pubvAQuSlLNUzoDlqgHvkaU0hfTuyiShteCUveBwc8jdDKyR98DO5CRnGmXwDLLs6l/l4nLM5ydd4JL6/BcOK49pTV3QZMBr5bwE4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnMiIuef; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60c93c23b08so1735861a12.3;
        Thu, 24 Jul 2025 04:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355502; x=1753960302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1M55MjNHLP2A27D0IMUuTEokYqJMg2OTuUCTRKpy8Hg=;
        b=SnMiIuefE3u5BeaCN45RIK5LnACyuxDl1t1jyi8q6WhyQKYmshZOTH7ttjNLV/v35i
         5fZmtgrQxWT76yWe4YdWx33ZVgUkSsVXgxfTyQG64waN1JiJ9//tDIAOPy/zdrkVHEa9
         UUS2r5BQO9WKFezgkJpgfN2osP2n0H/M10EhogPqLyixRtn/yUiMMobhGHkKMl231Tb5
         zmq+a5RXcjZBRoU5kO3dk+05UO7ZhNu7y5++Spk063rhFGq6Wpe/DaXyXP8qjcYgKV/J
         48Zh50vaL1fzUPZOVBBZQcWIQ8TRl9O2IExiSMPX3bQd8zvwZQC90aDmCRhewSXwayBK
         wzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355502; x=1753960302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M55MjNHLP2A27D0IMUuTEokYqJMg2OTuUCTRKpy8Hg=;
        b=qpPFYSIq9gC3WNAmHlpDipvWt83WdkRstPnsoNFfDGO7dejXfWxAeha/NjVrzOC9dx
         8eZHbBC2BJsX7xn9ogTcQJ/nr5khejswq+eauhA2TaQVrlBumYJTr5r+Sndr+piGRuvE
         QXSu/Ok215FiJhNHkXd1kmOkfHMJb1sFflvBpckqhLvcruRTvvkOmGrq/ht8UtCuj+YV
         vhKFAvEtx/7gwpr7e9GMa8Mwb/AHcNlxli1Ad55rouK/NjeZR1jJQL18R2e/GTLQL3zq
         g2ouNQzPI/KkKax4xKsX89U+dz8g+pBuAYs+zyfvOgI1Qn6RM08MU55R/clY5OrzD0Ty
         9fBg==
X-Forwarded-Encrypted: i=1; AJvYcCV680Wwvc3KnvHP3CESVtmC+BX5RN4CHmhsXs40fI96IUKWbN+BeXK/26H0jNmvFMDnq7iDzgHT6IQn35lJXvB5DDI=@vger.kernel.org, AJvYcCVD5i5UhR9RlHVisnhEi3wPpLbLttmhRd//5iwE+FRuLvENt05sbuhIXStaabILLyPZWQKcG7U9yiWG0g==@vger.kernel.org, AJvYcCVRSgZ7qMoM2PWRsbdDrl0ynQruncxI4gwyNBd3BE0CJIam0MhXyxndduIllBQ/A7RzYaRuELh5w5N67Q==@vger.kernel.org, AJvYcCVsTzAIbaQDbgKnFVh8OywcPhlD0X/xqSDTlCXNmg1Xl/cdTa+jHyTSt5QsGvzsgzdMXhwvukFOF+x7xwsOMjpK@vger.kernel.org, AJvYcCW6tms0lRxPfpVFA/32shMB6csbBLoKI/sbWUmZ0Ro8Iot0akogrvFqSd79uDjgpfEC+ol0Cx8SM+budMB8@vger.kernel.org, AJvYcCWlq9Lht9yJjvw08JjdS3h0uqw1AiNCuYrtA+e4U/Y/qBRU8xXKEODK+RW6Q44qtOWUoSSbu/NVG4R6Nw==@vger.kernel.org, AJvYcCXIIM5gLt5M79N7lE0hbnRtg29x6X4VR0WvP3vtHHj7zNvhD/uuUivZnZP/2DZg50csGBL4e4FibZzIL9yE@vger.kernel.org
X-Gm-Message-State: AOJu0YzjJhCQs/5qzefKUzegYNp7WicPYpkQ5af0/1xst0IXYwjJh+mI
	XYAkCn/OD/XrsfITlObDTm94VN0Kn+1VOjB/IWtLKZCgYLu1Eur/XiurAcmVyifujLTSiaZ524k
	rCAxMj7T9SbqdtqubPA+/PdGCswFKXh0=
X-Gm-Gg: ASbGnct6ufrnWULytC2jFFJ9Mtu58lRL+Lbp+AtGeAIM47dL1S6tq5At4Utnki7yAeK
	8BzS/AF4dHgphqXs5hgphcT62nv7DBw4OqWkWddox2TOWlKEOpCsUjzHA8Lpq++QRq3vvoCSJfB
	99geqILlrop55AMx8egTtQRtQ7yDmDEFXxGNYYQ5R9pwn7w3vjGW/Grm1PAXeZNIASfQaVgRMoa
	MMyjtGyLQ==
X-Google-Smtp-Source: AGHT+IGQZoX+LT1IzNpJkxMjSxSTE0HFrqyLNxJY+NiaWstSlkBVLBDC3jnocxQOgR/J/b6wSO0Ggtf4mqZ5QLUuoio=
X-Received: by 2002:a17:907:724a:b0:ae3:6068:235f with SMTP id
 a640c23a62f3a-af2f8d4a15amr677213666b.48.1753355501419; Thu, 24 Jul 2025
 04:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-8-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-8-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:11:04 +0200
X-Gm-Features: Ac12FXzgEQ0Ku4jr2sgSveo2Ph25gzNpv1tdxFI9mpW2KmHkqCwhSh2Uki2L2dY
Message-ID: <CAHp75VdMmfV=z75K9AmB7GsWV8C1bZPLGi33duTCt+CM79spJg@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> struct function_desc is a wrapper around struct pinfunction with an
> additional void *data pointer. We're working towards reducing the usage
> of struct function_desc in pinctrl drivers - they should only be created
> by pinmux core and accessed by drivers using
> pinmux_generic_get_function().

Any link to the discussion and perhaps an updated in-kernel
documentation and/or TODO?

> This driver uses the data pointer so in
> order to stop using struct function_desc, we need to provide an
> alternative that also wraps the mux mode which is passed to pinctrl core
> as user data.

...

> +struct keembay_pinfunction {
> +       struct pinfunction func;
> +       u8 mux_mode;
> +};

My gut's feeling that this type of construction will be in tons of the
drivers, perhaps better to provide an alternative like
struct pinfunction_with_mode {
  ...
};

Or even with variadic arguments... (just saying)

--=20
With Best Regards,
Andy Shevchenko

