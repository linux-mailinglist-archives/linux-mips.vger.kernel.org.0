Return-Path: <linux-mips+bounces-9795-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B10B03039
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 10:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3671C17417C
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 08:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BEE23F424;
	Sun, 13 Jul 2025 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xbxAcRYU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40BB21FF50
	for <linux-mips@vger.kernel.org>; Sun, 13 Jul 2025 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752396207; cv=none; b=crmIiJlx21XsGzGhgBffOJQfEJWn1am09wS32pGJYexO8nTStTUmeOXl/QIfowQLARai+0tSWWTlhMCaEzlx9l0m5Kp3pKxRGpj5n0IIojNo9FNzZzst4fR+GGepQ7SgJ3dyOu4btyAizDkMlC/FlS82zdi289IoXrNTEG20T6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752396207; c=relaxed/simple;
	bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTJNDgpSwmrQ8WiPIvdalZevsrpUcV+e2J34B3UWk5yVqK69UtJaARzpW6Qxv0Fn1uaDBum4TkVuQCPs/7jP5xGWbuNKyBYsXG4LMmD7xb/P5Bgwp0wYcqAcLoBN0UFSvESekASMEnVh4lm2S2aVwAUk0gF+a9MR1/EQvbaEYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xbxAcRYU; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5562838ce68so3153635e87.2
        for <linux-mips@vger.kernel.org>; Sun, 13 Jul 2025 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396204; x=1753001004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=;
        b=xbxAcRYUidJVofzk3N9o884D0j/xmj+1Mntya2TAmL5rMyomrvxwJYe8GFF9QKNOyZ
         aQm2gAUmEih5QTagIMA8js6hCnpRco1TlffNb8gj8FayfHQPFfTNyCjjcdys2QPf3rzU
         vn2qkQnvFTeeR+p8NjRiWsbcItVACaTrshEo9DgFf78b/Mm1irZ11p4QoJvtnXHT7EEU
         H+XN30jyWGbDDDfnZtlhZCjjV6OumnoxLLDHMfUOywy/A0AYdcypMslyi1WoLXqtQyvH
         /w4BBM+XMlPz8rvOi28k43tNGgtElv7T4G+rCLF1osJbtqnjhPa6efNGPsggMiVwKATG
         2cPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396204; x=1753001004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=;
        b=qhE/NGX1a1mwd3Ky2Uo3MDqLl9ao7foFdREZ8FvxG80E8lQZQFFHEbaT0732b7XKXv
         f5rl/O8ewyj7+KACTqYmdXuK10LTLpshjd+c69gyeX6pErBFNIONktgDSAXT2+Lp4OJb
         R/gpIJKejQrseL0XJRvrComd20EaktZ7hq+NDJFgJV6BWerMCe3H+A+Nz4snSvwKZC5f
         VTcAqCVhxqzneDkGPo+RsNeAASewFg7Mm4Q4UlKHlB6NazgC3UjtWdEgY2dIA0AuZMWV
         rXS6jL3P7RvrUiW1WeYpRG091XE9M/ByEaSOMKby98OdjaExyzy0tAKzi71f2UqHIQSV
         ZlOg==
X-Forwarded-Encrypted: i=1; AJvYcCUiNb8UTF9J+q0xBE7fnaN7Z9gg5Oog7KeUTDVN7Mg4XioYRLzUw9Qstr+Kb/khE+1ORHa5ooqZ3gdc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/dM6NtqCmVuGsrXWRWI+LkYoMdn3CB+1oznZnvqIsTH+kbVQc
	ACTGGHI5/51m5fF2P4+96y7haU6iSagPA/rh+02qW80VPXtlgio4FFx4574eykoHnG5ayVHetb4
	kDvq4WlnNRLtff2WNQ65zNesRZzD2yNU0W9//FOzzi5JQAIPSytJ4
X-Gm-Gg: ASbGncuGxRZ3oHisoPdK++gBrXREHblkpRJS3LfIf50IQcufaEFaWIbezx2N0icbzRo
	Hti2PyTKFSXjIjEejXph68RT4sPK937bs9P2BG5gCM7iY7A76+2deDYs8Jn+0uSmmh0y+IoF7Db
	iALZrur2lHRLHyn/RuXrjp6M0GO5axHzbFGQV8MuV5zHDq+C+iCLOh9zoztUvFzR3PV5u8NDqPD
	JJ1lK2DydaYUTPCqR91sDMXPwBepymlhcdeEYYblLHc/SXIXg==
X-Google-Smtp-Source: AGHT+IHBAbCKD5IYxg9QHbex64TGGdl/hyMZx/O9ZBosB5HyqtSevaVoy0zG6SyjrmS/Wv0vBuuPHSN0g6Rcj3+48Xc=
X-Received: by 2002:a05:6512:1114:b0:553:d884:7922 with SMTP id
 2adb3069b0e04-55a04668194mr2741453e87.48.1752396203838; Sun, 13 Jul 2025
 01:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org> <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
In-Reply-To: <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 13 Jul 2025 10:43:12 +0200
X-Gm-Features: Ac12FXyIRZr_PZFqMr5GkGp0O9WQSutVaydnaLLulDe-fCJJJZygxCd1lTC-X0M
Message-ID: <CAMRc=Me561DEHio+zN6oX9oqD6ue7z-y9E+cO_7_Z3L4taQd_A@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 8:37=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Jul 9, 2025 at 4:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the existing infrastructure for storing and looking up pin function=
s
> > in pinctrl core. Remove hand-crafted callbacks.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Needless to say I'm a big fan of this patch set and it seems only
> this patch 8/12 has outstanding comments.
>
> Do you think you can do a quick iteration of it or does it require
> a lot of time?
>

I don't want to rush it. Let's make it v6.18 material as I want the
changes to spend some more time in next and not break anything. It
affects literally all qualcomm platforms after all.

> I am tempted to simply apply patches 1-7 to make your life
> easier past v6.17, should I do this?
>

Yes, please, they carry no functional change, it will be less baggage
for the future.

Bart

