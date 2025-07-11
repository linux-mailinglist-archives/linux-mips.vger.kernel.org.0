Return-Path: <linux-mips+bounces-9746-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F17FB023D9
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 20:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54B0E160685
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 18:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307D12F4328;
	Fri, 11 Jul 2025 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YzeykREn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BAB2F4315
	for <linux-mips@vger.kernel.org>; Fri, 11 Jul 2025 18:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752259042; cv=none; b=Y98SO0+TP/Cj4QhiR5jVDe2nM1DEK0wbfD7q82IslQLG8Hi37eEdXh010MhnJrEIsKT/AUSmbxEyLnA8wONs9AE4skZYR0OOCWY7XLovuJ9UWpBXJc30KgSvS6ZmVUm1ismGp2zGKwU7ORvAYjdszddeHXtcIQgaSwMVbzVmGoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752259042; c=relaxed/simple;
	bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jG07hdYw6vAePHKOcZ3Pc2BCxav9jq5nuuDsJPJdnI2PaoeDaI73krMJsT6Ky+9bNnDLz1XX2EuqYR4ouAkRTPmB2oG2/2k8LpoKTXkJrX3+ga/UEUCSjetYcrPdroAmMi29c5timfMDLQ0zoMTHjyLMPk8yKDfOtq3W8XyV/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YzeykREn; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e8187601f85so2187123276.2
        for <linux-mips@vger.kernel.org>; Fri, 11 Jul 2025 11:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752259038; x=1752863838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
        b=YzeykREnSDumnHnI69/YB7/HpOqUqffv9kuxZjKKZ7zHR/qUEZ4RdTCLBFluf6Ysfq
         Z8AJUhw/0M1fkETJe8jqQl4raHuI26UmI7Gb3xsX+DZYpa14Mu9/mhtt9is6U0bCvfXa
         ehtu4PAeRG4NuM6PsfXTaE+JMROz0csJLMzK4Kgo8Gyqz1gLrl5EX7iw4ndjx3yDUHMA
         Bt/9oLQEdQ8MQxbTonaCMGzyf0+hv2Owrhw99s1IR5VRvAHr19/cKZBLgMTwPCelNMbQ
         mBzqS0Lo1lhkPRflRJiancMNILRNukqXxLf4X2dKsKFpfXGl0O9+L1LWymVW7Qcr5+JQ
         /mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259038; x=1752863838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCf8INkYZkwdneE2A9LSxUiQ+fJAXd8182xLW+8Tlv4=;
        b=Yvi8SFBTBXUP5d/o3huWTy+Bu7IIFu7vCiUruHLp0mI2qjTTvYL23PDpJV4t3b94//
         tS4hEOibCY6//KiO31qPuTDr8RhRkoFb2LA8GPdNznUYOJnkLlFxW120UCkRtYCHyOJf
         fZ8th1I76rJTUn/zuyUfrhSDm3zvZAK1mWL0ffyWeONljN5H3ZNm71qTMsAQm9ZH3dHY
         ra/hQ4aFEJU4Gyccrzajd8nEoViBXEHrQUhUOyHxQ0yoEhbi/8MCqVdc/PQG5QhwmoxQ
         3hliyj6QKoHyBDC6c+g9Ca8TViBudQlL89pkMC6OQYqguggCQJNwkbFcgWJELFeRchFX
         SFEA==
X-Forwarded-Encrypted: i=1; AJvYcCUI2hNxLJfwAD8gRNS84MPJngWTcdHqbN0pcDo/BRsh9OskjsM7Fef+kDxT1wKIEXftayC0bclx+vlI@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNJLhh6clqIJwUREbX4tk/syp2QdtpbuDF7BiMrFd426rWAif
	W719FBe6chDr9vZXfnrVbRi5avtUOt02/pkkY1j5uNkw+p3n5m2poDv0pJv5khTxvvq5344UV/f
	uLLL4yfLCo/7sfBxNs51k39kwYdaXOYdJHTQ95iN95Q==
X-Gm-Gg: ASbGncvpIO3otQPo5hxW3RrIXv4Zc3w22mEEIfHQ7qAUx8gYKuts1sLJHSBaJNuHElz
	q6TkqnCrTf+HG66ZWi5uObwJz1Z8sd6DL2ow6jL/fkOS3RcP822bLsQbxlH3/i1qUGEdJJXrkvP
	fgHl/6HBZ4Tn7rLCuO0xJeKKAgptqWenp1Ek4wkZn0KIS3SvNuKl0+okxchyE1CX45DAIK/leoG
	6D6QBM=
X-Google-Smtp-Source: AGHT+IHzkdQtsARg4tgkPF4WasK2Xo6Mfikt+zRNsUMsy8+DUZg6XHckhgK5mt593KfRZFbjIPg2gYdMMhURtB+dxr4=
X-Received: by 2002:a05:690c:f05:b0:710:e7ad:9d41 with SMTP id
 00721157ae682-717d5d7aa0fmr72034937b3.12.1752259038573; Fri, 11 Jul 2025
 11:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org> <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:37:05 +0200
X-Gm-Features: Ac12FXzfU1xcaSYLqYAP3dXdgN5KjaQup50oBj2gBIW6fBcQFAAh4KjvNIaCjNI
Message-ID: <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>
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

On Wed, Jul 9, 2025 at 4:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Use the existing infrastructure for storing and looking up pin functions
> in pinctrl core. Remove hand-crafted callbacks.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Needless to say I'm a big fan of this patch set and it seems only
this patch 8/12 has outstanding comments.

Do you think you can do a quick iteration of it or does it require
a lot of time?

I am tempted to simply apply patches 1-7 to make your life
easier past v6.17, should I do this?

Yours,
Linus Walleij

