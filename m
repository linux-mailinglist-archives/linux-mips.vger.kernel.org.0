Return-Path: <linux-mips+bounces-11263-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC685B54D80
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 14:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3AD0463FAC
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 12:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5727C3043BC;
	Fri, 12 Sep 2025 12:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw28qy1d"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9AB301018
	for <linux-mips@vger.kernel.org>; Fri, 12 Sep 2025 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679462; cv=none; b=R5l1IkfBoc9LZ+GI7VqmI8jAmgnyMXecBuLhiwoVIordzV4Xyj4QZ23bujYnCKOQ24B0buVNm318vXrIciTHYseMFHcNKlNOWR3epEDhlgNAEzhJQz+/8ByEQBpNj1oI3uk5Fv7Z1sxvmCQJNN0IJ2AUxV8Q4MF95hFT6sfjbmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679462; c=relaxed/simple;
	bh=pd4aahjlhiUPcExV+Rbm+9NlrXRPwfzHUZwRcgIhFKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1uUV1jvj+f+M+WjW+u2GMJ3xv+JeGJnPqE7ECqzttE5p9Hg1C6ILkfCgo4QHZsv8udZXBeyWPKOj/0byoE9V3BOqlHkGRgMLavsLHZeETTp9TuZ0+HwbUQBd6XkwBei3KmvLJkDTODxdejRbmImV1xfVtVo/taIcslOFXdOl9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw28qy1d; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-244580523a0so18369825ad.1
        for <linux-mips@vger.kernel.org>; Fri, 12 Sep 2025 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757679460; x=1758284260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=Cw28qy1dAaBkoa8v0Xg2OuQD//xdjKpHRDj9G5d+5BjTCVRNwjyarNX3N1bDvMeS/n
         w4sku3I5c3B7yfoqaagvm45OC2hr1EGNNfRbSkGr4FOWJ5MeqO2vtOKDh7lllHq67mwJ
         9A27Kc47A9HdeF8j5LY5UkPPspVChN/lrlmjNTvPJE1e1lHzo50BdIWfLOohtjSQRNd6
         UNROOvGpk0m72wUpzkXLsPqYtk1fb5NhKb+m6a/E8iguOXJpmK6x6QBR45oIm9yBCqQS
         z/x74GleHSnD/n6rvK8YMovS1vQg6HxsLx8kLK1J762UViAVpCo12Dxjh0Ucvkd/75qg
         dlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679460; x=1758284260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=aEGYpPsh6vCvj2jH+LDPDlgdzwvYiF73qEqvxLVGpP6LPDL9aewJTV1h/e0YOoYyaS
         S/TYCF5RpstA6YP4OdFkFSSuWRcS2I/OYl1OhWqdzAB0SDe1yUeclQtFmkxR69jfeOS9
         k+3HpM5ojIPE8JdpfCyw4Ew7fbEyTjYy2zTV6xXA0RLE5YeUnhfmLOeZBfmZN+UrnIlS
         iWWQKtJvEQ7pvaM6JyV4lOokcOHuw44XHLEWmssJz3D8ESFrnUskhUd0weCR7GezOAEQ
         FmCkWf0kORhMK91qbAvwNhQW+mqF9WR4HihpQDB7a7IiVw4EKoDtqSrpZ8DP/D60OeJl
         sGWw==
X-Forwarded-Encrypted: i=1; AJvYcCV+8UxKVSqdLbrv0AjwZJ1wEAN8xM23FPn3OBj2lU4Q7Y1xYV5x6/POtyxpKYj3KtqPePK9Qw+MPATm@vger.kernel.org
X-Gm-Message-State: AOJu0YxCrSUBxZS91gyZe9yMupv33+frhCjXsmjjeg4eprmaL2eccuQP
	h87aPCRNrKQ+Oa82hCLd6ATefK6V+XOlV2Bv7bvyYbfPjht+7WKWn3F+k2YFHOUM12nvTDxASa4
	uPi3UVOmvdhV86qolWFh7UgBqfPJnsQU=
X-Gm-Gg: ASbGncsw1EX5yLV4otwAOU78M20XLiu9kQl/WT6MwGgn2orXW9u41+Wc6D5l6t+snWy
	PPQCWjooquldQsA9d0OcNIBajlvfVLOeQYcr4z+3OmsHMuaKiCIpsO+KDnqtD5o/qj4D7CdHgFf
	j0Y6Zzg8q/nv3KbE4zIc5N8CG7aYuXflHhvc1OExSkz6ZYJkRWhsqxglguxe1MRREzbPyqMfA5m
	ASvpw==
X-Google-Smtp-Source: AGHT+IFwtZ97HGjsQnwDLaSscYiXyUyWaZRXiTzaM5M046FWDXCWxB8k2YOnMd3VJ+Y3cvmtimQrX/EgHhgmJ4CE7Ho=
X-Received: by 2002:a17:903:1207:b0:24e:7a4a:ec59 with SMTP id
 d9443c01a7336-25d25678b88mr27471845ad.22.1757679460088; Fri, 12 Sep 2025
 05:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org> <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 12 Sep 2025 11:49:01 +0200
X-Gm-Features: Ac12FXy3daR3VOEp5n6tNwKkhCq--fDPiLYS4w-Toaa60ZTGN2VkMzc0b_ryiUA
Message-ID: <CAMhs-H-1VrKiknwoukGY2i0ox2VNd=pmFrMcR50mn7tEZ0pZ5w@mail.gmail.com>
Subject: Re: [PATCH 08/15] gpio: mt7621: use new generic GPIO chip API
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

On Tue, Sep 9, 2025 at 11:50=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-mt7621.c | 51 +++++++++++++++++++++++++++++-----------=
------
>  1 file changed, 32 insertions(+), 19 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

