Return-Path: <linux-mips+bounces-3372-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 512418D29CF
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 03:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF6A628569D
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 01:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB311E86E;
	Wed, 29 May 2024 01:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqWK6XrZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E36C632;
	Wed, 29 May 2024 01:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716945357; cv=none; b=QoGJCmKXoSPVUL06lSV1pjGyY1HikuPkg3DjMnd5MLfDmHwqEi7i7DDA3/Egr2XgKWEMUItxUVZZZhKdIspRi5Gx/aBTmvHE7CWHzXPYPyyROFTeV40ZBaMk99sFVre0WKFhzh3UbTtjpJITdk8abywCPNyg2HxttiBWdW9Yu8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716945357; c=relaxed/simple;
	bh=fu5h1VLTePpmxGzHtWBWm8qsfXfU3OcS0nx2N9r/Z20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwFFKRE0YHWb5YBj5PnI1nqtH6PiIuu0sDoQrtrmfkwHszl2mUtMJk8oNyKqC9ckJA1DMlt+bJYfW/bdsQH4U4P1cmzfgIsVsBqaNWwIHQHfs3IWNe4AIEuBJGlwyOFFHEcSpbuWX+mXrxmJ7oxYSw3/jHIVx8CJ+wLQRhdTdmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqWK6XrZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5785e443cf4so1491128a12.3;
        Tue, 28 May 2024 18:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716945354; x=1717550154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkttBqYur5VmeYZbcuQ4bNxlcQKOfUsclUNLqJlUw/0=;
        b=DqWK6XrZNDKSX1BURG61tvVg3bDsW/Qp2YczHv1uuEZoHbZSJWpOXgG5G8K4fy+OFK
         KBGMpAQrkF0vo+oCXsNE2iLM90yaHvH0lRt2yX19wOiG1l5RG0bqTJV68qjSWe3R3xoS
         aYg+4g96rvFzB8mKjuI77vJw6tKpSKQzrwGHzHFZIi3OYIBAVbQ0C7GRFpOrtjHw5FzT
         Zvu8NwRJdCPXeJP4sumnS3kPJO5R/B7YwR8VIfTCjqQAhe87k1UL1CYBY0FlZ9qOI7jS
         Fa801gOHmJpxJFCpORLZRyxNqlNSSeEtGt8wNRbQ/QHPFpT0mCm23xZREJeFQfiq6fHo
         zbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716945354; x=1717550154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkttBqYur5VmeYZbcuQ4bNxlcQKOfUsclUNLqJlUw/0=;
        b=fvG6yujCOaue4hGev0Lx5MxHeIvQ8nneMkpMIhwWV67RAPQjtqvKfnElBXgxfWUYmR
         ezhQoMsDUbmUigtk1PyK7QNJpUyGII4FsReRYAUjOmEFTdDs8DUAiZOO0xdClL7k5HHS
         7a6q/XPsCFPKrpr6QGaFIVy/n6jaQNVUeLdIVvVETWnOg+UKNBjlIs8pCOTemGNLdJ2n
         zyd1uhf3t4DmxCM8xv2W66TqJO2lQF9ip5OC7CPSLSQTyhvT7/bib1B2RdFBiWcWcYFz
         utCTpFs0f6TAidLN8hMpXFv4AWnwufdk6YqlnRk+21fHFZSY+U4Sm6Wa/oOFsBHC9CRl
         4+/A==
X-Forwarded-Encrypted: i=1; AJvYcCVG8O/cWpSxlRyFPlVqgtonR5Yw158zmOuS+BA6mxNqu7/U1yVVwA7byDV2TGTIgPBTNeONy6Bcm3OFZrCfSHnPriO28Vr8EiGaqx8MLh2ARZVdTUFD3PUQFGKvz7uUwQSUjPdWR4GKJHfcIx511QRNspVvSbZ0pLLHC1MBwNj6JGKrDsg=
X-Gm-Message-State: AOJu0YzepHV6jfN1pA2gEUgHV0irzLAjgCalOaBzXjE4MxGNPcG3pwjY
	2rv6jXqTnFuWt8gr9WnO/7b6bAT+kjKRCD6py4tmMu2Yp/kF7aRLfhy0/MONZfu5tFZYp0EOB+c
	RYdPWNB8+0LkcbZ0P6za0GpADPWZAng==
X-Google-Smtp-Source: AGHT+IHyxyhKthaWgMwE6kMyfK+bLZ11R28UBPmFZV6BzjKc6hhsxMuv7nztpRo3OH+U9Y+ASwIkM7c0M+DokgYcKJg=
X-Received: by 2002:a50:cd4d:0:b0:578:5245:3296 with SMTP id
 4fb4d7f45d1cf-57852453300mr9164565a12.28.1716945353450; Tue, 28 May 2024
 18:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527022036.31985-1-user@blabla> <CACRpkdY99LACAUsg_S4ww4U7-KU_EtkLZ+c8dsa0M85i9eJZbA@mail.gmail.com>
 <CAMhs-H-3yM3sLvgtOn1KWPF-Ch52hqZZXbFPe2YP=xgFjZLDug@mail.gmail.com>
In-Reply-To: <CAMhs-H-3yM3sLvgtOn1KWPF-Ch52hqZZXbFPe2YP=xgFjZLDug@mail.gmail.com>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Wed, 29 May 2024 09:15:41 +0800
Message-ID: <CAPEOAkSH7hRJQ2duHDcUZY-0jRjcwRDks+u6KzzJ6wesgo8UCw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: mt76x8: fix pinmux function
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, arinc.unal@arinc9.com, sean.wang@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sergio Paracuellos <sergio.paracuellos@gmail.com> =E4=BA=8E2024=E5=B9=B45=
=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 22:20=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, May 28, 2024 at 3:54=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > On Mon, May 27, 2024 at 4:21=E2=80=AFAM liweihao <cn.liweihao@gmail.com=
> wrote:
> >
> > > From: Weihao Li <cn.liweihao@gmail.com>
> > >
> > > The current version of the pinctrl driver has some issues:
> > >
> > > 1. Duplicated "gpio" pmx function
> > >
> > > The common code will add a "gpio" pmx functon to every pin group, so
> > > it's not necessary to define a separate "gpio" pmx function in pin
> > > groups.
> > >
> > > 2. Duplicated pmx function name
> > >
> > > There are some same function name in different pin groups, which will
> > > cause some problems. For example, when we want to use PAD_GPIO0 as
> > > refclk output function, the common clk framework code will search the
> > > entire pin function lists, then return the first one matched, in this
> > > case the matched function list only include the PAD_CO_CLKO pin group
> > > because there are three "refclk" pin function, which is added by
> > > refclk_grp, spi_cs1_grp and gpio_grp.
> > >
> > > To solve this problem, a simple way is just add a pingrp refix to
> > > function name like mt7620 pinctrl driver does.
> > >
> > > 3. Useless "-" or "rsvd" functon
> > >
> > > It's really unnecessary to add a reserved pin mux function to the
> > > function lists, because we never use it.
> > >
> > > Signed-off-by: Weihao Li <cn.liweihao@gmail.com>
> >
> > The patch looks good to me and Sergio: patch applied so
> > it gets some testing in linux-next.
> >
> > If Arinc has issues with it or something else occurs I can
> > always drop it again.
>
> Thanks, Linus :)
>
> Best regards,
>     Sergio Paracuellos

Thanks for reviewing the code.

Best regards,
Weihao Li

