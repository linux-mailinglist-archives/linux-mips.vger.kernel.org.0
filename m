Return-Path: <linux-mips+bounces-11191-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F47CB50F62
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 09:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6718D1C81BD6
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 07:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455E33090DF;
	Wed, 10 Sep 2025 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S3ZBQqHi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1987308F0A
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489355; cv=none; b=BJz9V36qOI8zc6cl6zFberew2aDzMCgV4Gy2M7EjHpDU09rVbq0tJpVuw6FhLpyobkNJKtP7AYV4du9DyN+AneL7l5DVhumGq4pF4vY0GVlsdtKCTFSDVZWRQKXwNLzbVrpbRngPoOcY7zSma4luEsEo1/1v6l//HMmU44154OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489355; c=relaxed/simple;
	bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIMZCNKojW2kd9WGSCrZo2CjInzHrbK9uhx+D6Z0u923weic9X3aSSUUudR1NbTQWVI1ryZ9UJahPZgUMv7ZskKtDILPEJUSD63KOqkELYHxLmTHRCzpf5wfdAy5mcmpVn3kfqNb39TB1zw7rPuFE+VnkqSv2RDuf3CqUll8dEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S3ZBQqHi; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f98e7782bso483184e87.0
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489352; x=1758094152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
        b=S3ZBQqHiikNskd8ERRrm+ddhpCoyKNLWEmgM/pvHM0bJG+CpqUZTk7WciMYTQm3v5Z
         N2rd7hIqOHrRSKANT2hUVCahtf5YQ+Leo9VMtX5ryuHzLMWz51KanPEmS+YHVG4eoUpA
         1gUNgSnTfLcOmA2acD2IFBhr2gH8dMFJbMAkfNRvHmsde1UZ0zyQcDSPvCY2F/pnmjya
         xvkeNorLrYeT7bOXDwHUCPUujc2tCl19ih48UyUA42lASex14+TFifLPOy9/83vS64st
         M3vz8JIO4izSQ9ffKiWIKMV1Qi98/+kqaRkpyUXjpBiudQUaFuFQ4eBFHWeiwwd7QRlT
         FnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489352; x=1758094152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
        b=TM5opa/4CWGoKwttM0FcGhGcVl7cgbuwGl4SraH22pinYBVrhDI/dcntnZ80RK8xgd
         ph8CLa8JJ9X/9LxCZojdrFN4F5QGS+N0pk4pvUltVm3MwndIlh0oqXrpvRK6/iKLozgy
         oZy7lr7knq3S0OhQefsMXcPjid0gc5DIgjTY8weuW/ll17Iabx8FNNp0lfOlKULX2X9M
         hbbCJUuPShiOz4e2YC2urdg4Ew9/fw/zg7V1AzSbWL2FuAkROvMhXjSFIOsUQZGwT901
         0z1FzJZoroVEDu7emUTV/A1BOoOfPi+JrvnygY2DyDvW7LAYh7YlO6salMwurcbdnr1u
         PAEA==
X-Forwarded-Encrypted: i=1; AJvYcCWGjYxSzWMISsusp6066+GgIUzGuC2xQ2Oo1wXzCTtspJRTJXqXr/oEcbZvRDfWTdA8v0R1/37ho/ui@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0XlyTDtbqcFzqR2pEpz4qclbgRTdnlw2e4VFwu6jxJrZGqEgJ
	DsSR7fHVomkX0bC0JMoz3KDioeX00XY6ZdAUwteKjopaBSCdUbehsyEsyRKw77g0XGbMgf6xbZt
	VgHqi3KPpX2/F/xDWssXig9qjLmWnSYFdtIIi/+mYig==
X-Gm-Gg: ASbGncv8BYpVFyR0UJtzmBRqY+k8o+4uss2IJHMQ+YND3SquFOBNUdCRSnEYEdyUQIt
	/vpPqaZ23DvKYIbrzH8nMwLbDEj2eGYeZhOlEt/I1VwlWLMV+qobk516LCcALemoqI2DPQFZC6q
	Qzvhu3/t8I/JdTJ72nWtcMXYgTCqex3h11MUTBw6ksXq2mchI2rrfOTmj455CoVms1pAKE7EKFa
	WoCus+iPmLETKrEZNGu6Vk2KPqLz8BI4oQaeds=
X-Google-Smtp-Source: AGHT+IEqPJ9kigcz2GLj3mP+JOGINamypRE0PiCaaHlUwxbs7HlrGNQFZsWt9jHWryRE9N3BOTU+Nqgodo1ymFIXUx4=
X-Received: by 2002:a05:6512:3c93:b0:55f:552c:f731 with SMTP id
 2adb3069b0e04-56099453ef8mr6704484e87.7.1757489351780; Wed, 10 Sep 2025
 00:29:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org> <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
In-Reply-To: <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:28:59 +0200
X-Gm-Features: Ac12FXylJ9GUUlvsjAHDZW0ZjH7_XucWxGNpk3CSzJ659744jxYcf8C0LoVlvQM
Message-ID: <CAMRc=Md1kLjELc48-fvjsgpZH+t+kE00v0uMDztubooM_AJ2oQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Wed, Sep 10, 2025 at 9:19=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Sep 10, 2025 at 10:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
>
> In case you want to take it
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Otherwise I can take it via my tree and then PR to you.
>

I would prefer to apply the whole series directly, this way the
conversion will be done in one go.

Bart

