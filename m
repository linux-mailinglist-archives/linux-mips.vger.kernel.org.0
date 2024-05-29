Return-Path: <linux-mips+bounces-3377-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7001B8D32B9
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 11:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BB301C23750
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 09:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C50B169AD1;
	Wed, 29 May 2024 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzSd2GdS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DEE15FCE6;
	Wed, 29 May 2024 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974235; cv=none; b=gvCfPBoGvf1O2fu4drFiMzW14bQLbyGb9j9RE55NEzbgq46xWpUlce7ppYBWhQy7o4bDpVzDFpUoHCf+Q5ALPO6CQq6n4lTmvwBewPKQmQpUS8NuOZ7vPRDcdyekq7Jowf2GAoX3GKNJCpv3kOyCMaBXI4qWLDNbwxDrVF8fSkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974235; c=relaxed/simple;
	bh=DhhdnnOXh6qGL5/6zvdk/VdVZmsP1nLae35wo137JWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQCeiDb+CaJt/y4MaNgo/b02/zkklGdCfUXAEiMHay4vK0+uOx2ThYXrjDHFt6c2w/h3FNnXFLeAnCVtkYUPTsNKHv4mUb/JHrCpU7v7jP/nmfEz3N4Sy6hkL+ZSoTal2x3MPxUX0Ac2IZzaE7F86+jxzalWFvA0HDVrAcEtBFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzSd2GdS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59a352bbd9so110558266b.1;
        Wed, 29 May 2024 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716974232; x=1717579032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhhdnnOXh6qGL5/6zvdk/VdVZmsP1nLae35wo137JWg=;
        b=jzSd2GdS7PwUVoxhb2O8GyKE5SNUArFCFIrwUpoecw9s4OO0WMgf0VumJI2jryW6eL
         gq2VvU7/F4yg7nhHqIiEbn3pdrhxGXlbkLSKRDX4fxKa5c2W6hAxBaXI2SkjVACcq4bu
         VGwnTaBW65LX7A99Z5aLCpIYelY6SDRTGHMQ0M+b88gb0GKG5RjQIYAlGvenSQuBepXD
         FlG8PSy+TMDwqvJoLg70aMMPeoA2o9GrRk78+GrLoRrQW9hXh5CO7s/qvQO2824kHhjm
         m0s/VUCr6UNbAfbzEX+MPsybwq/FYqMsJk0qIjE3IChn4YkES9X0Rs92kX7ZIfvQlCUS
         bzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716974232; x=1717579032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhhdnnOXh6qGL5/6zvdk/VdVZmsP1nLae35wo137JWg=;
        b=nvj9S5rdzvPqcrbXBT4ygJeJ1jkAr2xyKHprA8AmrUW1HwsHD9mqDILYN6RhV+cuv7
         ttRCi4VAoD0f24M1a5jZxx1u9DU0P5/LZiUFiD7+DPFblsCBV8dP3B6/8s5tXq6sMuMu
         K9C+egUfIU26fI9R6NSIq89IeDX8S9u8nwkcbNYN7/7tFmA3Ys0a7XwtKDleXxnIbMgu
         e/287HinCgfaiFhfwwcu62zV5gVAz2pVcrmCd9n1K/s6VSftHeGpxkyfq4AOH5xVBNDu
         mfifMrRsvfvWetj6KLUMaLNNdSPShryzrg7laFRFHpvuZ801aPljUPPiZSDocXH9jCm1
         WLyA==
X-Forwarded-Encrypted: i=1; AJvYcCXtDMjUZm/tk/13gI0Huuth1iSbk1NDrYT4Hc8BCsi3JuTHPeMEHQdPIWjnUbkWAFAuaQ0fg/Ps4PAAxJssHcH/7ULDNVrqUPCc7SwXs/RT+gghqldm8gZK1AutA3eknRr4a3xwA2FkTBGuq+6xp3IZAjXvTn2by1ThQDP+dMpz8TzEnqE=
X-Gm-Message-State: AOJu0YyAgFNLnfpxk2ZgNOUTQQZwJORD97+Qa0UL02A7TlSE2paqr/3v
	MjD+9bm2RhpN9gAbwmsV+QxdgUssWkN6B9ULXz5eW16J9s61AMuammU0TQktDVs6LI9f/XP21Yn
	eeZ5iRKwbX8vgxsJ5ReQu1YxEz9I=
X-Google-Smtp-Source: AGHT+IHGdwBKFS281WJKM1LepXLS87qJk4CkOo+icUfU1WShxVz0GmuGPZsuGmboZ5p2ros9zrvRRiQCXqmzCeTNR8M=
X-Received: by 2002:a17:906:718f:b0:a5a:7493:5b68 with SMTP id
 a640c23a62f3a-a642d95819emr140252866b.24.1716974232163; Wed, 29 May 2024
 02:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
 <20240528194951.1489887-11-andy.shevchenko@gmail.com> <358b6488-3f7c-4378-a811-175b6c77290f@collabora.com>
In-Reply-To: <358b6488-3f7c-4378-a811-175b6c77290f@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 May 2024 12:16:36 +0300
Message-ID: <CAHp75VfG__AA7bHd15-dg1UphkvzwpMN6eXzJXhyUDNW0a1_1w@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] pinctrl: mediatek: Convert to use func member
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
>
> Il 28/05/24 21:45, Andy Shevchenko ha scritto:
> > Convert drivers to use func member embedded in struct function_desc,
> > because other members will be removed to avoid duplication and
> > desynchronisation of the generic pin function description.
> >
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> pinctrl: mediatek: moore: Convert to use func member

Sure, if I need a new version. Otherwise I hope Linus can tweak this
whilst applying.

> Then,
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Thanks!

--=20
With Best Regards,
Andy Shevchenko

