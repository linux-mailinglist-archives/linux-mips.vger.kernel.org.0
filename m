Return-Path: <linux-mips+bounces-6324-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50EA9AD4A7
	for <lists+linux-mips@lfdr.de>; Wed, 23 Oct 2024 21:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBEAC1C22214
	for <lists+linux-mips@lfdr.de>; Wed, 23 Oct 2024 19:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249581D1E62;
	Wed, 23 Oct 2024 19:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FNGbsmLX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE5E1D0E18
	for <linux-mips@vger.kernel.org>; Wed, 23 Oct 2024 19:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729711522; cv=none; b=Ib9giFoXVO6ewPaUpuEl48gJBoFx51BgIC5ARgZ54iafMZnQKhG5q+4Blgg4eZ79KMjHBRW7r/MlgWbY9X1neQ5hZz/WC7ttueV2gxDAWQfmENWyAj9u5XeLbMXqBT+D7UeSliGBTqE65WqKGqn1YJArUUHIhZkPvRlgMINeWaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729711522; c=relaxed/simple;
	bh=jVfaEMDiqxEbMojHP9PBFB3cC/z3et13Xb9WEIyCI8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6CenZl/AEwIyA61k7ydvTzJx2/8Mk0yLd79n2q8jFs/zxHH/2cldvUdYDNUVs9Tj0HuWRh3IbS4BqvOsL6hO73Sf7jjVH4hwk4HYtbIBXAtAUIdH2vX18l0F4xA8EgnTEzbaBXS2v3kl0s0aOa6tR8dtcNyUdcPE+mzEnRd2Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FNGbsmLX; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso7548966b.3
        for <linux-mips@vger.kernel.org>; Wed, 23 Oct 2024 12:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729711518; x=1730316318; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=FNGbsmLXPZI6Avc0gmC3hTHsRiHcV+GnQITmWelRuQdGbuRhK3J0BDxgP9CXzuLCS6
         zZeYTy/3Mr7ViWEELOY+PRI1naDJOVnETmHvQH69eSAcT+j4stcxwtehALGYLt7+g424
         kFHKlc5TCYKekkhz5h9b2AnwFKw6o6XZD7u0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711518; x=1730316318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=klnCC7M7tF+D6M1xvZDyOhyzJOpgSxGeLZ7kBCr+bEpRf00TUOe3CimMkzP6Uw3Iw/
         A5YEUuTLaCn6Mta6kVHHbwtWo1MMW05YWL0RqFiG/4VneldtQrB897c3qaqi+/qqAVSh
         2I4ppni000ud90WT8bSF47tZO217lgFcG/X/0e3hM6PqSkkfZpCdvOdPO4veFx1gYamr
         nqxBhKydQKSiEADqx2y9ARdAJZuVqtUMI94bbSqNtEElU+N6XB4XWec5iw1RF5Vqmje+
         hQVVLkjIeGvVQ35pbd5fcVsD9Je5073OpfJ9t9n8YTWRezCoeXpKaE8F9Qaks4jHldcn
         teVg==
X-Forwarded-Encrypted: i=1; AJvYcCWqCDf1gMkgCGpugfBfDZYDhSbfFg6IbL7gexr82QmzyW/P18MLwlNw49Bu6a4y8XgCEYPS3cgHU73i@vger.kernel.org
X-Gm-Message-State: AOJu0YzGlxEgXiYcA+ytIsS/+ZYyQ7EWYzhBmjw/4khUDj5gV+Qygy+Y
	AoxvLIbR+yFMbr/m0NNggZKwqJ43eH80Cds8UBgUOxBZmlxCvYp6Z3s9EG7G4zpByuE4w1WIL/H
	bX+cvKw==
X-Google-Smtp-Source: AGHT+IHZgSzoKJ8qLZEHvAiszcaOHL0V902y9QMgMX2Inq/2bLRPBG7gbD/U4k43GWZhf+iYusGMuQ==
X-Received: by 2002:a17:906:daca:b0:a99:61f7:8413 with SMTP id a640c23a62f3a-a9abf86af4emr283803466b.23.1729711518392;
        Wed, 23 Oct 2024 12:25:18 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6579sm514763566b.41.2024.10.23.12.25.17
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 12:25:18 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso10263966b.1
        for <linux-mips@vger.kernel.org>; Wed, 23 Oct 2024 12:25:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9c1ub7WkzmPEJb7znrfrjLT8eCGNsDFahWCFCtV8GbXCx0URttrHtsjEktl3WWScoNDpJNuCTxhIm@vger.kernel.org
X-Received: by 2002:a17:907:72d5:b0:a99:f4be:7a6a with SMTP id
 a640c23a62f3a-a9abf91ed4fmr407338266b.47.1729711194415; Wed, 23 Oct 2024
 12:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org> <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
In-Reply-To: <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 12:19:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Peter Cai <peter@typeblog.net>
Cc: Tor Vic <torvic9@mailbox.org>, Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, 
	gregkh@linuxfoundation.org, wangyuli@uniontech.com, aospan@netup.ru, 
	conor.dooley@microchip.com, ddrokosov@sberdevices.ru, 
	dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com, 
	geert@linux-m68k.org, hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org, 
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru, 
	ntb@lists.linux.dev, patches@lists.linux.dev, richard.henderson@linaro.org, 
	s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru, 
	tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 12:15, Peter Cai <peter@typeblog.net> wrote:
>
> Again -- are you under any sort of NDA not to even refer to a list of
> these countries?

No, but I'm not a lawyer, so I'm not going to go into the details that
I - and other maintainers - were told by lawyers.

I'm also not going to start discussing legal issues with random
internet people who I seriously suspect are paid actors and/or have
been riled up by them.

              Linus

