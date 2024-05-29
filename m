Return-Path: <linux-mips+bounces-3376-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEBF8D32B5
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 11:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67DB9B2169F
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 09:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C921F161906;
	Wed, 29 May 2024 09:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQnIYy15"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CB66F079;
	Wed, 29 May 2024 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974165; cv=none; b=Mlh8ZlxzxkdymHTx5XnSxT8xgDl1R3rnIHpONoBGJniU4STHGm8/lvofsGEuLGDBOUPzYd7FYu7tGum386GK9bekSk3msGSHCQiGEP2V6EqsjCBcB2I9cmhz+zNpltOq/QM5nLr7qKPSdfWhy3jBHqwV+9a60fXkU7s+lDWGvuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974165; c=relaxed/simple;
	bh=P/11FGodoFA+E+NLZvrYREmdgvCahBEkTi/n+hGxNYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G75s2lcyeqJqy+b2KeWIIGRnUZj1l46DcX30XEkDqNJaBMQcaQ/9mbrc6J1NmODc5KEgo04BaDLXGoVR8f7eEgzaH/PsWhOWuANDGdvJ2EGYNJf+BX0yKPDEw3PodvwtpiwisooOKAFQLE7BK5HqHcHLVCpy6t/rx9jbdDdDd4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQnIYy15; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso168184166b.0;
        Wed, 29 May 2024 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716974162; x=1717578962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/11FGodoFA+E+NLZvrYREmdgvCahBEkTi/n+hGxNYc=;
        b=kQnIYy15klmNyrl4OTWgP16OXoU5X4nvPWUlh9GlmG4q0wwRWCUXYr0R+Vum1QyxO8
         9dhHVL6siqowd3/G8SRW+TY5L9hf4Hx3ZlQZsQKy5GycikewRO+IjxxYKNl2e4j3n0oY
         pxxrTOtl2/FR5CtjT1UlVojIeGPa9bgKDm7tFAvOnEyX4530GWGfa0eLBgC476WZOn26
         isyZmUvxuI8P/ZEHtDl123Bi0CbPWtHNxSSOYeVF5URjBkIhklQg1/iLWYdEG1forWQb
         KXPtQ3VcP6OIar6Mc0X++t8JmwLiYnIlv/3ky1aoqk95hrdZx3E1tWnEUPXBVTQJ27d4
         p66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716974162; x=1717578962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/11FGodoFA+E+NLZvrYREmdgvCahBEkTi/n+hGxNYc=;
        b=EjGT3/mxMfz95A4XBTQODhy3wwObwtgv/TFIUC8KWZ2n9AbNl4vzHwkjUSzNEWNCa7
         2BtnhGtkXuxWTFZtPWU94eD1QxM0CsJCQJlmd9GjKcXZ+LJtNX/a4/Tw6uoPvLXT1GcG
         YQNtOit03V4BpJczXjtyddXyF3ygwg57ygWw2uL0iiQ6KSCfiwe4Xk7WL0C+scBrwrnk
         WJ9iSCDPo4i7qMSxKbXwWx70+q08fc+Uj8MKAsphZfCTWbbS6NsP3K0X/26rYUBZa9nz
         zxuKc05/+y1JG94CCkYY/z05P7BlaNUOfDvtHcNNJOecGZNkFN8F7lKuvZKN1GFcnOfL
         JvPA==
X-Forwarded-Encrypted: i=1; AJvYcCWBhWy9cEhIvd/txDK+qtlN9NVRyc4r2OWZIOwbpwD6B94hjX9wDc+C/HJmywpOWEroooIUOp/VdxWI/do9HaRh8wGsmyxlok/fymuFtpT2ydOvY1DdBjupAhgQRsfiUnFoEGSBy0Ii6c7Q5/PKuF4Nnly69bGtlgbu3Hmfi2o85GZNsyc=
X-Gm-Message-State: AOJu0YzspeqDt4MngWR3T0lAtQPaMvv/ds+2G+ajZymbPPrO/QxMoFID
	rk8K4sXwYxFc3ImoadjfVmlmkqYHHOA3z9rMV5yq95JVIoMPI1m7zsyI5cglVlFDQKOV3YAG/oW
	9UOn8t11DuQJ7yVPR5jN4AiykpFM=
X-Google-Smtp-Source: AGHT+IFzCGL3iHzr4n/qBEh0rBcTkXqfRF+a6gRaRMQGh5+of4CGG73bxuOyvd2Zs59FzGTTgkYC/QKjn7uf1k5x4v0=
X-Received: by 2002:a17:907:7e85:b0:a62:de58:b362 with SMTP id
 a640c23a62f3a-a62de58d30fmr640122266b.55.1716974162356; Wed, 29 May 2024
 02:16:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
 <20240528194951.1489887-5-andy.shevchenko@gmail.com> <c52ff392-703c-482c-a297-c12d4e0dbd38@collabora.com>
In-Reply-To: <c52ff392-703c-482c-a297-c12d4e0dbd38@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 May 2024 12:15:26 +0300
Message-ID: <CAHp75VeurNjWSLsM_cEphZZhqSM9TNc_ozGYcJ-vvefHg8NY2A@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] pinctrl: mediatek: Provide a helper macro PINCTRL_PIN_FUNCTION()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Daniel Golle <daniel@makrotopia.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 11:24=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 28/05/24 21:44, Andy Shevchenko ha scritto:
> > Provide a helper macro to assign the struct function_desc entries.
> > This helps further refactoring.
> >
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Not a strong opinion but, for commodity, I'd like to see "moore" mentione=
d in the
> title, as only the Moore pinctrl IPs are being touched here (where MTK ha=
s two
> different IPs: Moore and Paris).

If I need a new version, sure, I'll add that.

> In any case:
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Thanks!

--=20
With Best Regards,
Andy Shevchenko

