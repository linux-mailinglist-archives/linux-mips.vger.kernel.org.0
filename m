Return-Path: <linux-mips+bounces-1960-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF59186D5EF
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 22:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75B1028B59F
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 21:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A9E145646;
	Thu, 29 Feb 2024 21:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IlBYQ724"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F6814405A
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240991; cv=none; b=HcsgdN6SoTkQp4n9aG8amMO9lPkuFhK1FKGqBWYUN2iThsrzp5ukopG5K08s7gCMlpSwDqHeFwFJ2SUQFrJ7Kq5fDnWXRaxv/qJBSZOZ//tEFcta7DGQCS2OmPR4xCW00StX90dTkd+heNrlVKnrlUqYwwCu1plpymYmpCZ6tSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240991; c=relaxed/simple;
	bh=+OMSuNcz0f+S1pNBRQGA7ZZNiFav/x2zJeSkOoc++p8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/kHaqw/TUi7XbCDq0PnkPZQ4WQ8bCFXiAXUN1CpQIJ3ngYUxFDqvWvnzaF4UW2LgSPP/SuXh0/E7Ip021dOoKsggmAkQaauZ1lrf2MrFAENJFzG5Bsl3X6+Aq6gmX6QnX/+di8XxzB+jFwRSk+llpAAedoaHQ06lemUFp49QDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IlBYQ724; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so1418858276.0
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 13:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709240989; x=1709845789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OMSuNcz0f+S1pNBRQGA7ZZNiFav/x2zJeSkOoc++p8=;
        b=IlBYQ724fgirchkN11P2a+0JNsB2fbfLPnOC5TlpOLT64fOxGS3b8SShCpc0tZZIFY
         yoA1n1Jk2uhFgMk5+2GQqlM2KBIz9YJLJCFSqo38Q9t30dFvFfz9GSG7/YRcddliHCsE
         AmXQ5SaOVcvbXytI/mbSZynlk6yhieTOtg+3Nf1I1NkAxrP4QPrI6bg1Tc5A2+AG7H7k
         R7jNKNfWukO2ZWSWiQZrKTrkJJL1Nm39vzmd4g3TAqJc95Rl/Tm1K02dlo201C4npxwG
         LTiCWV5J8vGckInQ9mTGo8qvXOagqV1ipuF6SR/rKXWdUhe11xUzDk1yIajvTOA79/nf
         kNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240989; x=1709845789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OMSuNcz0f+S1pNBRQGA7ZZNiFav/x2zJeSkOoc++p8=;
        b=p31ub6S/vFw8dEVIsZHbzwmM8/QiDAba+D8ByXc4ASZlEuLrTbMWfv2eujwb6vPcbx
         CVXORvVI4pWddRSH4iJvYjgj4o/XgFZOWlB4rspZ56/iRBu76RsqX4K9CcRKH1GkOKAP
         IU8GC0v/3TjAvXcB21aWvO8NwmN6mJK4XI5m4UWDaltbrTpEIb+AR6XT3YnbTwGbIbNl
         DvBBfxDyUkMDhAn8vx8j5APNvZA1+zvGNZ50ERrvPOhRuUs+54DQLSk8Mhu87IXKSt2k
         0c3lL0IhIllFujTF7BgO9JczIJEbgqLqvmH9MSpcU0lyaWoxn5p5RPimRdxjbkHIdzQp
         vfWA==
X-Forwarded-Encrypted: i=1; AJvYcCXRDmnvwh6hMPqE75HvCVZmRAykUO7vClMgGiHLgMfir8FrK0n1EYL1W2RSY3XFLZ0acdD0VpurUd+sNwxPiIWwBT0tQHm3MMCVPw==
X-Gm-Message-State: AOJu0YwjA/E+rqBkOpYd54pJZ+8fIea68AcmzqCjaVWaAq9W1yka2ceW
	sIRDk7FlrJaI79T8gPrhA+3CZbKeg5BM7yx+r3/rdNc0YwHohHyGQOPt4N8d6s3nyyHzk2RZydL
	jQmR6vd9HMqlcbC1VcrovgS3AP5kZ7KKz3/50GQ==
X-Google-Smtp-Source: AGHT+IHbva8VtENYJ0hw2FAcTEKgi5UH/B8oRvg5bufEYQcp/sju2WedSjn4h1t/PREb+YdBoA48AKTJb4go8f2x9Zw=
X-Received: by 2002:a25:8e85:0:b0:dc6:ff12:1a21 with SMTP id
 q5-20020a258e85000000b00dc6ff121a21mr2558461ybl.31.1709240989292; Thu, 29 Feb
 2024 13:09:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com> <20240229-mbly-i2c-v2-10-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-10-b32ed18c098c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 22:09:38 +0100
Message-ID: <CACRpkdbzLGViXJ-qFNYhZJ5x2d5zrRe_2sCpwnkjcTNp3C1XmQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] MIPS: mobileye: eyeq5: add 5 I2C controller nodes
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

On Thu, Feb 29, 2024 at 7:11=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add the SoC I2C controller nodes to the platform devicetree. Use a
> default bus frequency of 400kHz. They are AMBA devices that are matched
> on PeriphID.
>
> Set transfer timeout to 10ms instead of Linux's default of 200ms.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

