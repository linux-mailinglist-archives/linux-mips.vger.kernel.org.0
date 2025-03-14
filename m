Return-Path: <linux-mips+bounces-8195-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9451CA60ED2
	for <lists+linux-mips@lfdr.de>; Fri, 14 Mar 2025 11:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D85DF1695C1
	for <lists+linux-mips@lfdr.de>; Fri, 14 Mar 2025 10:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCFB1F4275;
	Fri, 14 Mar 2025 10:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jq0KWvbC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E81F416F
	for <linux-mips@vger.kernel.org>; Fri, 14 Mar 2025 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741948097; cv=none; b=TmglkZ0P2nEdwTWXk4BRLimDNnMwaxr0Z2Xwyc1Pphu95Xwjpe3gaOJgsmr+dqg4fP9WYAs6czh9/p9eMfpGFePEH4ev6x+MeDrnbNfLj4m4aK8fEPENd9RXgyOM/bnXXObmi3mzaHz6asYzZchlCrTpF8LahwwCt43htGw6usw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741948097; c=relaxed/simple;
	bh=7lhUJ6eiiWP9IJ/FYhzjbXh+LAJRJWyTLSUXs2Uq9+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ej88ZCiegXEsXkcCeOVzufq3hea6bQr2/UFmzYIpeSlJlV+L2F8Vi8sEHnrkUIKr0GLuX31nXRU6e/7wqW1F54ZY55+lJ9aH/7nF3DT0kQWABtg1G3qA/c72cNMf62XhPitv2K3LwhjZwPWSefMDFZGndlO+rwtilC95DYL4HaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jq0KWvbC; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so2047212e87.2
        for <linux-mips@vger.kernel.org>; Fri, 14 Mar 2025 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948093; x=1742552893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lhUJ6eiiWP9IJ/FYhzjbXh+LAJRJWyTLSUXs2Uq9+Y=;
        b=Jq0KWvbC+RGapBxE/79RV0BIeD9VvGdw1Fpe1TB3FQiE3Mx7M1ug74I43skmk/ysed
         pW0eyKCVeuPLLFbAr8/7rZaVq+ypvWIqqp98ONbAm/K0er06k802QP0sKmwApc01jN5E
         LJkRPCM7GjMxbAZVdkkbB+WFpnQ3yeovdkzSGgBhRM8hxbnIqo7S1fIfuHXiO9Srwm6f
         0krXnLDsipucb1cr4hOpq8EflJ5+JkQWavCGVohox/GL31nKFJGEb3tY1JskSboySuXw
         evvwW11mE8FMNJVAwglnLWQuelsD1w2tLYtm1nHAHAZQlQ3gbq3yJ1khhhuBRD+qlb/f
         Bh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948093; x=1742552893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lhUJ6eiiWP9IJ/FYhzjbXh+LAJRJWyTLSUXs2Uq9+Y=;
        b=MIJZ1/N6BBzWe7/Jsm/hUd0VqKU/QUWwCyfpuLK8jl0zxG63skyKF5flU70Zyiu8aH
         gCQc9CGFy84KPi9BF3KvrTOJVw+qVLwt5lB5yL11JgI0QP99eq5t3xp4WsZRGWcgiZ7S
         GW9SvuWH0gLuzA9M25GC+fMmvuVdthBE69uxocBY/C8up8VsyVDQv2GBNmUzw6MozrEk
         39PKp42MrmReeNtsh+HVfDeUoPR7EZf9RknrjZ9vjhU0rmpCQ+vQw8W+EJ8TlLizzRit
         Ylv8ZdEsTllvAydZ9pa6UFn8OR0+CHulNWXRJ2a95GlVFgf/LgKLj6B27ikxtyJ8mI22
         zi9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXk2YojwSeb1sDapyxU8M6EskvP449ZO4fsbRav8AxKxT7WOYkGrTte32P3uWfbxcwk0kx8WmlbwsCa@vger.kernel.org
X-Gm-Message-State: AOJu0YzlgzuMgJyHTzLBCkeUMDfGibsHhaWMjCYScgUDBfNet3U44mbP
	l5cDpr01l49nsA+MouDTnbRjTIKP9y4Mnv2vZCHB8u1WngzbdaQxwWn1SIZ55I2v95vwAjTEtem
	Cd5bk7WSeOID7bY8L1941p7XRA//NJFNsQP/k5A==
X-Gm-Gg: ASbGnctWw1nRUCWVLlBvkMmRJGXIFvVbgkkYhY4DXF79la0Y0LfRR2Yr+qSRyFX6dBs
	T8xzkv/f0pWPyrAZ17+bgcSSV2hdNIoyR7jOPkvkD4ZliDJSfmAGrKxHWOJuKaEepGaFeJim7tf
	QCjqp3JdPTCW+r5Nf30ol9erY=
X-Google-Smtp-Source: AGHT+IEn/Zc2evX7ABWKYXK/Rs9IfMZdPR9tSjfOKy1a8kRLZcgdXcqx09hfLow4+l9JiJIqttYJQGRGb5b/H78iKJ8=
X-Received: by 2002:a05:6512:3087:b0:549:7330:6a5a with SMTP id
 2adb3069b0e04-549c3913d63mr621103e87.23.1741948093287; Fri, 14 Mar 2025
 03:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309193612.251929-1-linux@treblig.org> <20250309193612.251929-5-linux@treblig.org>
In-Reply-To: <20250309193612.251929-5-linux@treblig.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:28:02 +0100
X-Gm-Features: AQ5f1Jo6nSq2AFqXUDepXvu8J8Xduf-drgRoP8FzPPUsiMaA2xVOQZlsv65trtc
Message-ID: <CACRpkdY2oZtu4vtTwHRMFxaoYWu3B5bfPN==thz=BT2F6BHQQw@mail.gmail.com>
Subject: Re: [PATCH 4/9] mfd: pcF50633-gpio: Remove
To: linux@treblig.org
Cc: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com, sre@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com, 
	danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, brgl@bgdev.pl, 
	tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 9, 2025 at 8:36=E2=80=AFPM <linux@treblig.org> wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
>
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

