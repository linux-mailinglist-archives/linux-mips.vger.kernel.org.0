Return-Path: <linux-mips+bounces-11190-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 510D8B50F20
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 09:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BC911889716
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 07:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803C4307AD6;
	Wed, 10 Sep 2025 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3ZTwg26"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DEC31D368;
	Wed, 10 Sep 2025 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488787; cv=none; b=EdWxg5tMC9RNmz6sZ74A46+4EobENGXAFbm6In18ROCh2iEoeOZMzjGXh7RdMLbKNfsxEGzas3n8gWZ+WeVcPbFgiHlKVFlDDXLWfN571lW4/egkL2yFb15HL77GH9itnT2O8fc8zY+/SINL1ZRnw476WvrbukX2FMnuQ9fXrl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488787; c=relaxed/simple;
	bh=K6G74mBlZ/fYakaHeDD39PtqJwH/riYmWWQl4lVzsu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGAHFodMlCUVEdcYzykOA1a8bJJD98+IPU4HpAeKnIVlT0KhEcGrxYtJPQ4c7i6+aUY3VO/xxQlaCxeei+QEJ+mIQen9zkU9fWZwzkCbQJfMKLrHs1NRIzFYMDLkNq1gJCA25fPJFdYh+6pdiVyJtnv+jtGLtoTr9art1RqzTUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3ZTwg26; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b046fc9f359so1137963766b.0;
        Wed, 10 Sep 2025 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757488784; x=1758093584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6G74mBlZ/fYakaHeDD39PtqJwH/riYmWWQl4lVzsu8=;
        b=l3ZTwg26D4gRknsqWb10h/hNqHxcaMXuIOom6BjExYaqH+pMb/ovxRJhtmlT82wKMv
         IqpyuWUPGL7SJj3KltjVIJhnZ288mSkzhauoS5aQNXviQ5AaFXQbTDcyNDSGq10pRpM4
         cTa4bUSK23w2qHo4ITGSF+Gi/JRrOQ0N08AOobNJCc+xVqSu8/C6l7hLNXTRIxgm5Qjn
         6xFhxHps2TGXsRi4CqxvpvO9/8BwRrWphIKZBLmzy7lJgBNgXQfs0RoCfS9Zk8jXGcAp
         v20skJu7wSlW1P2m3ABGHb1/alWbZQDfKQZZ1rej9MQX38fJDzaRTimGqhfGeMUvjRbE
         ovqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488784; x=1758093584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6G74mBlZ/fYakaHeDD39PtqJwH/riYmWWQl4lVzsu8=;
        b=UaEOG1rzf7HW7RBDVSrsMJVrwsYhyJAsLBsdCaZQH202Hk0ukJ1jOxXlnAPxYKdgMK
         GDte9amnH45qjKTZhDJMRrB/zub6rLHFZzVWag0eh82Vl77bkOBlISlJyXFkQwTEoh5X
         0nrHwXaFzrO/Yw8LgSLwLsxfAlfS47rXBR+BRFwbzo2Z4rsRxCZ5E6FcLPdj2H5SL2ic
         2z4d5tsVKcmX0QJbg/xdFSTpSBWdEfurcInx68PAH2nFfyQg79Qx6MWmOhGgDMmVdZA8
         y4dfacb8ii+YCCpKSWfV18TgWWdQS4CY9BcCbsvk/r9SLWzaw/90xp5qG1NTyU3kjDLp
         IRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCULZFmqvYbeJiejGCRUCVR9c3voJ58TPmayHpXVpw/7vFZAkT6mDSgQLliUR2yBaIyJHe9JpiILAC0P@vger.kernel.org, AJvYcCVxywDd6t09A1K+K+bdbQM3yFnEiXF4h1k8GwcZY+vvYuz3kP14klDRrV75SbW3LJslgdJr/lcz7A6Az8UP@vger.kernel.org, AJvYcCW5RKxwVoqq6B09o9BizBXXv1T+LmJN/V4wiu9/KbUj6C+/I1d6e5j/M8zB4qRvn8FTKM1ajyiugRqnsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4qsih01akq1Yynr6NZnFJ/s+WifGzrlUd6CHaRFAjhSnjpRBO
	1zgXhKS+r3abw1fF54R40zYBAehLABu0tyxrJH+jgq5O/Fz9BRwVLIlvl0w9bctF7BQ0Srmv6th
	GfpZIeby7TUBkzSyGYzeACVUHQicnjWM=
X-Gm-Gg: ASbGncuhPaKgR1c3mnrxhz6YvyrtzI9kxmB3dYygNb885LMFIa5w5OfNabJdjKU0odw
	JpHBODIJ8fPd2RzkQm41uhKOafm8EgJGJ4VXp//XsE2ZZmYtNR1WxMDdUvPseHkrrTiCJzYZg89
	uCsD6KRuaan4b+zkUNexxaplTWdGDUrsLB3QEPg6Bw4deeRQuzxjjY1zPVwhHzRMwwFzsZ47cV5
	iGgpOw=
X-Google-Smtp-Source: AGHT+IE9VwmF/PsukJbTlBYgmvFE+e/pACvgJIHgxZN/6gBmWKACe4q7JDxVYTbF8agSRUuPrIlTk5gxzt1ml6Re7Ok=
X-Received: by 2002:a17:907:9301:b0:b04:75fe:e88 with SMTP id
 a640c23a62f3a-b04b167e229mr1292677866b.49.1757488783973; Wed, 10 Sep 2025
 00:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org> <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 10 Sep 2025 10:19:07 +0300
X-Gm-Features: Ac12FXyVb169fyF2MyyUio9X-rBr9gKbOxdItUjj4Nc2RkmldZAztWEoPmp-bgQ
Message-ID: <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 10:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.

In case you want to take it
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Otherwise I can take it via my tree and then PR to you.


--=20
With Best Regards,
Andy Shevchenko

