Return-Path: <linux-mips+bounces-6494-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7DD9B32EB
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 15:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F9FB1C217D9
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 14:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BF01DD550;
	Mon, 28 Oct 2024 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKKPzqIh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202AF63C;
	Mon, 28 Oct 2024 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124862; cv=none; b=pZzbRcxJQjMZQ/1fYGflyGNKkg49IkX3OFfDQ3/OidSrm4grF5O3lnxrd9+hiyc1bNioeR7Kg6vyk6tb4ZZQbUS9ptEgDwGsntSEsGxU+OCIX21Z7pk1QHpOdEVcSksq7MWNCcptXtDQJdgNkjlm0+dFNxTGXwH15baJr0EQqUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124862; c=relaxed/simple;
	bh=GQX5Pb+IETNUOivIhCGCaePu+zRAB58rqRlXvBf8agI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMENnu4J1jAcqmDspxXZDikUlwNnbiFYhRZKqk0bsxLsqXGX3hsVDDqcneAHTbKcPcSPM0JavXzT/j5FBaueE3fduKLOUKX1YM+wgdigF/yluSXDB2cVBzMtHk7opLEeVzGPuQv6BjirFAo1kcXc+seT2NZYGvVsyuLzM0ATd8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKKPzqIh; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ebc349204cso2222000eaf.3;
        Mon, 28 Oct 2024 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730124858; x=1730729658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQvmx8XCaZ5BumSb5F5FIZndVO4LQIIYW3NW5YxKSVU=;
        b=SKKPzqIhveO1DmrOAE2K5vDX8nR3djNphV16f5/VY44cJ3NeBR2mJ+I96mzaFOCoJf
         wAcvjcwGjea2s/fCHbekl18HQEpIjGmgu0VILR0RaS4g4lGisSPixjadIAGzWERhnUlx
         Tx/U/qxSfyYaZjsiZGZvDpal+QXgN5PqFTGHxQmxKAvBjLrCGmg9OzM5KTT0XrbQ6YCK
         ZGgZThRdS+c7WkVXXOMKzLuyjpTZnqGympPWY3ZzOx21S/637mv1RqAzO0CLvwcBfVYD
         8TOuuIlxcpHlq0UGg4dL/j32gUVbB6rJ2wmQPP7K+o51qcy9p84CthgzZ4cPEyZGIunn
         p+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124858; x=1730729658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQvmx8XCaZ5BumSb5F5FIZndVO4LQIIYW3NW5YxKSVU=;
        b=H9Uph2B1EgtOzXpd4WyL+UV1WkLYEZj7Mauoas7PEmtR+yUqt5Omp5WGp2yXEquGxe
         rPuPlYDFn/xvYjUJ/BU2+ztJomzYZsPT2R2XNmu3D54vKuCVfD/IbWWa/2L16scxqrlO
         8GSLKAuiSNQTMkpFMbkCVMMcK2gMZJInwqyitvBvPnJhppOwkgqAraW9yTpGQbXraM7o
         16hn5ThUf8v/cqX4ohyfW7nH+xckkv1LsS0mWmUtz9UArCKRXUMEw6Fl3MeqfyGKvgCs
         qDFO/vqmJecHoA3mKHhXX+WNaQ/3We4J8H+gwprvxM/i0xT/vGamYfnooD1o0NvIGVF2
         DKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCg7Q1d05KieMi55pf/2gEUCEO5Lxvw/jkLBYpiAxMeF3oTL8qYhlXrvAnwGquH7m4dk+wL5/eXvPznXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYtbcKOhdcBAR/EHb2TtiHY+BVBktTaQS/cMu7vVISJ6XnOyl7
	7hkbUtNGpDtP7ox+jrqHkaZliFUCLRse1gWoWeK+WmdI8G9Z1SHFp8A8CIg/2xLIqQVPnqYl50c
	H9VprsMjckmb/8sOsMUK6dk0FmdWNFQ==
X-Google-Smtp-Source: AGHT+IHE30IXMwXuui4C/52gos9SY0fbJFI9FvqkR1z7gTNCRNEvJAkL2T+Ut8UfhfOTDqHwHG9kNbtGfEiUQhAHrCw=
X-Received: by 2002:a05:6820:1e02:b0:5e1:ea03:928f with SMTP id
 006d021491bc7-5ec23a6e68fmr4772280eaf.7.1730124857707; Mon, 28 Oct 2024
 07:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920075306.704665-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20240920075306.704665-1-sergio.paracuellos@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 28 Oct 2024 15:14:06 +0100
Message-ID: <CAMhs-H-ChXQSZ_6EBiTKtD7ve2j2QsVvgVm0B5O1O7BfGwKFmQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] clocksource: move System Tick Counter from 'arch/mips/ralink'
To: linux-mips@vger.kernel.org
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, tsbogend@alpha.franken.de, 
	john@phrozen.org, linux-kernel@vger.kernel.org, yangshiji66@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 9:53=E2=80=AFAM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Daniel,
>
> System Tick Counter is present in RT3352 and MT7620 Ralink SoCs. This dri=
ver has
> been in 'arch/mips/ralink' from the beggining and can be easily moved int=
o a more
> accurate place in 'drivers/clocksource' folder. This makes easier to enab=
le it
> for compile test targets as well as reduce LOC in architecture specific f=
olders.
> Bindings are already mainlined and can be located here [0].
>
> Thanks in advance for your time.
>
> Best regards,
>    Sergio Paracuellos
>
> [0]: https://elixir.bootlin.com/linux/latest/source/Documentation/devicet=
ree/bindings/timer/ralink,cevt-systick.yaml
>
> Sergio Paracuellos (2):
>   clocksource: Add Ralink System Tick Counter driver
>   MIPS: ralink: remove System Tick Counter driver
>
>  arch/mips/ralink/Kconfig                              |  7 -------
>  arch/mips/ralink/Makefile                             |  2 --
>  drivers/clocksource/Kconfig                           | 10 ++++++++++
>  drivers/clocksource/Makefile                          |  1 +
>  .../clocksource/timer-ralink.c                        | 11 ++++-------
>  5 files changed, 15 insertions(+), 16 deletions(-)
>  rename arch/mips/ralink/cevt-rt3352.c =3D> drivers/clocksource/timer-ral=
ink.c (91%)

Gentle ping on this patch series :-)

Best regards,
    Sergio Paracuellos
>
> --
> 2.25.1
>

