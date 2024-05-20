Return-Path: <linux-mips+bounces-3300-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 535798C9B86
	for <lists+linux-mips@lfdr.de>; Mon, 20 May 2024 12:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 749A61C219FD
	for <lists+linux-mips@lfdr.de>; Mon, 20 May 2024 10:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBFD5029E;
	Mon, 20 May 2024 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3f73K8b"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56C812E7E;
	Mon, 20 May 2024 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716201790; cv=none; b=rM3Vp5HxDH1P/QolNSQm5yQlNNVddqq29dyt9PrwhkSBsDeEGM8Y12i3HehdS5pX6soIwcG/C85PoHFjUxKvFXh0kGWLTXtUkz0xhQDw/PXWeoTsa//++ELHOZN9OAd08ru9p6E3BENPMH2dnxhmFQorQdfI0t1fTfm+PKqDcm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716201790; c=relaxed/simple;
	bh=5P/QzPFswG4vPT6hlhiGDRrWMzE0UliNttansbfAvUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHKZ/p7V01qUmKPG+Io6CazPA4XW5ezQeDV1F9mPE8Pi49YsUMGxKl/HeUCGZOWFYQ44r78BzPtPtZFPIGmTAeBaYQeGmQ/Vj2XqbjHcHlwBEHUTgNjqvHNrOZih++h/+Z5Jc+YPeLRbQSXxDr5hfnANi06uMjXIOneHxHHYAGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3f73K8b; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso10110839a12.1;
        Mon, 20 May 2024 03:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716201787; x=1716806587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P/QzPFswG4vPT6hlhiGDRrWMzE0UliNttansbfAvUA=;
        b=D3f73K8b7uYDVd9nRql4ai61ij+lFgA94EAAuEKyZyx57iGfYzwOzNDYIW4cE/aLe9
         vk61RJMqSbdCmYKfAcXGpsCDmS+RshDQVQKa5r07pqhCqcQNyVjNva0bEsATXf7PdZpI
         Vu1Il85W9w2+T4F658NJtntes7b3PrZPofEm6a0rVvoa+a0P6XgEO86Ej1d4Mr0CXeuU
         ClWPnJS7MVdVrccTx9qcnfsvU4PPeZRPb+0QNsZcsvZcLzwzRIp5k4H7dMFqhYD9lPAT
         OFSECXv2ykJo5y8apa/k/zWTQmOBu6vldsfMALWz8RoYeJoZYiOL0XPrVAK04baZdz1B
         8+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716201787; x=1716806587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5P/QzPFswG4vPT6hlhiGDRrWMzE0UliNttansbfAvUA=;
        b=f8Cw72GsL8ASwHSOXRRc9cprDKRWZ6nhJSyB3aWyO8KuK4bvwIzWw4mldF3jFlvK3M
         Ss5VrKquK902F1qtOQLOBmMsmfKAlT1FayCJ1CEqvYKoKaH5z43LMtyKlKv4gq4M5B0J
         mUiSfUAX9U2M5RHkYb23c6bSb+mYz900duoqhp0L9gv7y1dfvIqxrY+Y1QZeSPnesWY/
         alXoNUd4AVIF70HjEcEQKqE/XaWQ4RpsB5xgbHuWGkGscJfiO8z/LJfZPFtKkkLLMwNr
         ENQ1+JDPRi1a6I0xpEYm/jd/cmbPZG7aiBYLXozZ3UldWGKXmA318qO02VFbfoyRzslS
         FZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCXwNlBXt52o7hPGXUHfa7KwqU3iLeDB9Ho66HPWev2vV8yckD5Hz2afL2pv1zDLRSRk0owfmHtJEW2Rr18Bihij3AKQs9uDj6fqyF5h2lJoxKVC5NVvDaghCSUnHDvY72vw9hGILZMRpu6RY4V4ZKEXmihANB50cyP649Y/zvIH4h7eGDY=
X-Gm-Message-State: AOJu0Yz5+5fx42L3TsnkXePHKRwJVEjGbR3yy+RW+xtMEXLKKXtvqylF
	lT+X8/M2kbgu3+KYbLAiCZnCdJF9lzBvPDmcM0Zmv8crMZ4D3/Ee+mfPsLlEiRuWIcp96/xdC/9
	dyACJQ6RnpyWRK0xrqqbtd7jKL4c=
X-Google-Smtp-Source: AGHT+IEpn1WHtoIaDoNqFG/8v7tZ9VwgJSzpx0ICgi2qAca5uE0qqQvvx3vnm2kGqPzEX9Dap3IHuQJDLr9/FDiEc3M=
X-Received: by 2002:a50:8d07:0:b0:571:e272:296 with SMTP id
 4fb4d7f45d1cf-5734d67ee8emr19467598a12.27.1716201786895; Mon, 20 May 2024
 03:43:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
 <20240430-loongson1-nand-v7-2-60787c314fa4@gmail.com> <20240506091748.18c120d5@xps-13>
In-Reply-To: <20240506091748.18c120d5@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 20 May 2024 18:42:30 +0800
Message-ID: <CAJhJPsVOx_AZmsRuZ5jy2-wJ+7-Wm+8RQAJ_LhKGLU3aFzrR7g@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] mtd: rawnand: Enable monolithic read when reading subpages
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 3:17=E2=80=AFPM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hi,
>
> devnull+keguang.zhang.gmail.com@kernel.org wrote on Tue, 30 Apr 2024
> 19:11:11 +0800:
>
> > From: Keguang Zhang <keguang.zhang@gmail.com>
> >
> > nand_read_subpage() reads data and ECC data by two separate
> > operations.
> > This patch allows the NAND controllers who support
> > monolithic page read to do subpage read by a single operation,
> > which is more effective than nand_read_subpage().
>
> I am a bit puzzled by this change. Usually nand_read_subpage is used
> for optimizations (when less data than a full page must be retrieved).
> I know it may be used in other cases (because it's easier for the core
> in order to support a wide range of controllers). Can you please show a
> speed test showing the results before I consider merging this patch?
>
With this patch:
# flash_speed -c 128 -d /dev/mtd1
scanning for bad eraseblocks
scanned 128 eraseblocks, 0 are bad
testing eraseblock write speed
eraseblock write speed is 2112 KiB/s
testing eraseblock read speed
eraseblock read speed is 3454 KiB/s
testing page write speed
page write speed is 1915 KiB/s
testing page read speed
page read speed is 2999 KiB/s
testing 2 page write speed
2 page write speed is 2000 KiB/s
testing 2 page read speed
2 page read speed is 3207 KiB/s
Testing erase speed
erase speed is 72495 KiB/s
Testing 2x multi-block erase speed
2x multi-block erase speed is 74135 KiB/s
Testing 4x multi-block erase speed
4x multi-block erase speed is 74812 KiB/s
Testing 8x multi-block erase speed
8x multi-block erase speed is 75502 KiB/s
Testing 16x multi-block erase speed
16x multi-block erase speed is 75851 KiB/s
Testing 32x multi-block erase speed
32x multi-block erase speed is 75851 KiB/s
Testing 64x multi-block erase speed
64x multi-block erase speed is 76204 KiB/s
finished

Without this patch:
# flash_speed -c 128 -d /dev/mtd1
scanning for bad eraseblocks
scanned 128 eraseblocks, 0 are bad
testing eraseblock write speed
eraseblock write speed is 2074 KiB/s
testing eraseblock read speed
eraseblock read speed is 2895 KiB/s
testing page write speed
page write speed is 998 KiB/s
testing page read speed
page read speed is 1499 KiB/s
testing 2 page write speed
2 page write speed is 1002 KiB/s
testing 2 page read speed
2 page read speed is 1554 KiB/s
Testing erase speed
erase speed is 76560 KiB/s
Testing 2x multi-block erase speed
2x multi-block erase speed is 74019 KiB/s
Testing 4x multi-block erase speed
4x multi-block erase speed is 74769 KiB/s
Testing 8x multi-block erase speed
8x multi-block erase speed is 75149 KiB/s
Testing 16x multi-block erase speed
16x multi-block erase speed is 75921 KiB/s
Testing 32x multi-block erase speed
32x multi-block erase speed is 75921 KiB/s
Testing 64x multi-block erase speed
64x multi-block erase speed is 75921 KiB/s
finished

The throughput of the former is twice that of the latter.

> The monolithic thing was not supposed to improve throughput but to help
> with very limited controllers.
>
> Thanks,
> Miqu=C3=A8l



--=20
Best regards,

Keguang Zhang

