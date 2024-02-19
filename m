Return-Path: <linux-mips+bounces-1548-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E785A594
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 15:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59D1D281123
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 14:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A7337165;
	Mon, 19 Feb 2024 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oYQ7QyPK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9EC37162
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 14:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708352149; cv=none; b=l4QlHhtvWxBKJeIWrTVF1RZo7hvshtEOD4XICr89x5cejrs6mFpgka1Q0NH10r1YKcDF5sNr0B02D/HN0fv3v1AeDfi77x1S3tqIVE+PUnn/k8YMKjRexvsaXHatlEFsOKoq/Akf40osO1GpbFCDfWmBaXiFaHohbIN4WGmHniQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708352149; c=relaxed/simple;
	bh=4DPLBwTn1xD36bWpSPaGvzOXf4/1hjvap+dI7URkrQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U68qeddc7WlLeblN09UjSpsPJdSZmAdT/9ovlnZlJnZ5rxwN/3uYdR4KJawNxCR8RxxgyIEa6h1hJ02B4p8bIeikVHbbxDW+dI4b0KUPNC1dJ+DgOaF+W6B116KG1LonwyTE/9tDw/leuVVESO25ndcyB4zXzNOJRUekNvDid6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oYQ7QyPK; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-607dec82853so37823147b3.3
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 06:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708352147; x=1708956947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DPLBwTn1xD36bWpSPaGvzOXf4/1hjvap+dI7URkrQM=;
        b=oYQ7QyPKwZrJxc/1vWnh+IdWeVJWVKMLO9KhD2PtbYvEiDGEIvVKCSoTEFI3hvTEBe
         XTcAWQ6x1AiaQRpo0wzhihVhYAYYv30KhR0oVYuozJS83n64XybRQskSrzLwqt1VVKRW
         +DTACQ1MdDP1xuTKa7BTfLjOkdNK+4eSGpp4eRYMgu26XiX/LCTnj6sKbhg27n2IgCHP
         4I5hnn7Eicz6fbMRKixnOh1Df9c2TeVPNKaXxGv04RRCb3pMZfAJ4NUElButyrt87k8Y
         c8QNjroMSLFESAkVJX4LMWAvnjyB7gVChuPMANpGgkfzEG0nkcQmhU4gw774K0gMtIrC
         hZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708352147; x=1708956947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DPLBwTn1xD36bWpSPaGvzOXf4/1hjvap+dI7URkrQM=;
        b=kku9sywC5e8gvYBw+GZtPpbQr/jI3euHMjeB4AtsLy2jZbXo8RQnmwD+9hi3usTXD5
         Rc5Ah7CaJJZJpmHkS88kmXaz9Mfr5CPD4Vn7zrr0rfSo+gFI3TvFVxjApJdLIc0CPPj6
         rDw8Ekvbr//PPw84BymLFDRxo39Yad0H2K35aokBpj1eM0OHRIN83wCeCFPZ2xFIXLYj
         +XN5mhK8tYM4iEGbt3UaWvrzYhMYMq66QQfiHXWe4y1sw+8EkKPU2CLLLFAFuBpMUOzi
         onij3hEjkAOg4V34dxuvwlAUJF59DRkTfSFwauOyRfAMLq/7bSQXUd2rybzzf4jHHwQy
         5NAw==
X-Forwarded-Encrypted: i=1; AJvYcCWo06YDP2wYVOBjjbdTUAi0Y/FSahV4wLOTjDHt021SlS33U1c3Yu08JCYnjXHOOvYH0+M0VhxUIA+01dKAG8LCx9PwXZxA/8Arqg==
X-Gm-Message-State: AOJu0YxGYvV9m7LDrE4Gxepb4////vgjJLsB/LlvqrRX22hRnEj5QIIV
	Y1dlQ+V5b7CGJqqM5K8Rk1tDP1RYnlAqpcxhBPth/AAeLYuCLWW+DjhtdLKQ8x5dEYWZ2OYdelT
	xRStX/iiX+ufOT7YbEV2xtdRX1aL5vYpq7klEng==
X-Google-Smtp-Source: AGHT+IEGRelqWe2dTiOY9iPHsVWt5SGUzoFQvr/GztPD4++Mw1yGR+nXAuOs79zdC55kYgkbpeTBWZqjsyVHDwYA5+0=
X-Received: by 2002:a05:690c:a81:b0:607:b85e:2d21 with SMTP id
 ci1-20020a05690c0a8100b00607b85e2d21mr13022466ywb.24.1708352147092; Mon, 19
 Feb 2024 06:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com> <20240215-mbly-i2c-v1-5-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-5-19a336e91dca@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:15:36 +0100
Message-ID: <CACRpkdYZTrEKdGfN-EiOTWtQhhMHVqk5zCjmcAuUZq9aWesqFQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] i2c: nomadik: simplify IRQ masking logic
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 5:52=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> IRQ_MASK and I2C_CLEAR_ALL_INTS are redundant. One masks the top three
> bits off as reserved, the other one masks the reserved IRQs inside the
> u32. Get rid of IRQ_MASK and only use the most restrictive mask.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Yeah, more readable like this definitely.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

