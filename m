Return-Path: <linux-mips+bounces-1913-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F5D86C5C1
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E3A32825D0
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2FF6167B;
	Thu, 29 Feb 2024 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cCAp56jN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD7860ED9
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199708; cv=none; b=I9s5M40uzEYRhJ5dIlOEUFQ4Zyt9HhtH60tHF+KrUv2vxOl/ydsXIImj8CzK3CrkVDjIffkli0EjrTVcEoUQjyvFONVG08EGC/8XmUfUBi8Q/GEOd/iM5ToCXIMLoIr6dGcqDVnbPa1XoRXoho+yqU0AODwYS2zICbhuHZxMG1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199708; c=relaxed/simple;
	bh=7QaM8qpy8M/oO3QKoCLuK/VdyOhdJWKlvjZHCHtRTFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GShWivvtEeh99fCJ1jXoeFS8idoTc6UGSinNSKU6/ef53+qRqtJK2fpq5fNbyh3LuDGxidkXsBPdaQpP+tK5vF23ZeAcShDio8p/IzGFHcMnoH4KaNzNlntFxKWq/nLv+TLb89iZiibi1FPmzxE2Kifpz/uaOiIMoCdvqUhVIt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cCAp56jN; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60943ad307fso6799647b3.1
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199706; x=1709804506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QaM8qpy8M/oO3QKoCLuK/VdyOhdJWKlvjZHCHtRTFQ=;
        b=cCAp56jNV3x55QMjXW4GHgYJuzn9yCKi1eRw0GDwzvrnJYhxnzK00yIeaIyof9Qj4L
         Sw/51/SWCCRSsADhv3H7GRDnAM2qEk18r18jfzMUH45hs0D6uvFC/GWqKq4jDuFTfJOS
         wk+FdrgbXqr15PgIOfxG6UdhJAbjSUQfrDTbX/zp0Sh/8mZXvSJBZQHr/Fe6QfFEvcCs
         Gwqa0/G1r/UvdJHnYO//2FumcNa+WWJoTaLJ807ewk8uMqNzVDhZV05nGv5Cw3u1iFjk
         bjfAK0w8BaC+Z9DOudRrbtzo1LYFFVqJzRozONbQb3N3mewDcBaJ6emWcXiryJ9ptKMw
         d0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199706; x=1709804506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QaM8qpy8M/oO3QKoCLuK/VdyOhdJWKlvjZHCHtRTFQ=;
        b=BPSKrcI5GqjaicEhPi27gj9Ah4JFtrJslJbw/SvwhfvcI/bC1vRfki/jICuo8n5ebJ
         kCTgQC5E0sSYSkAefCsHTxEhyjRrUklTPEh1VYDY+VLBbmrTItmeaEhIIzSokWXZfPHl
         K46VMnkbo4AYYJSKvPl29sOy18EWauHodJSBDVTRkKsYFRbCwbqLr68ayJR2eV/azDu9
         XzJOhM91G67YJTwmYwBN8g/j8ktaIVayKeY++7HuuZ2RC55AaN25r4yLN1AH6iLkwZ3c
         BIHUViHvX1VDX6+aPDBy80S8zBClDfVGvcMw4QiDP0dwtpBrvtI5KBoCuS2p4JbmKU+I
         Xn7A==
X-Forwarded-Encrypted: i=1; AJvYcCWS++W2pZwzo9jIuMGV7k0HMFgzpRlXfQSp0dgvMuCRBGcBMBUQZIhGHtRp0a9tXV47U5mVSO81mHHhhx5aDipihYyhro0LVB2/oA==
X-Gm-Message-State: AOJu0Ywe1Uu01dDtcn1tZ0p99RVVrbWaoyhPCYrnwp5aucVxpsdlVgUK
	ubMEY0QW9W0scGuLKyKXceu7KL3mx0BT2qxAiB9YNHQ9GB9isDzv8GETGjJ3tp9x6pP228Zm4g2
	oNtH8Z0Hbwx79EBArjTMp1d0quIOZkZ/ytihwvA==
X-Google-Smtp-Source: AGHT+IHTAuOz4wQKF+O5S1+0NwHXGguKGkidGUeJtCBTbj6pfIQGuoVun6C8itBJL/zdjlB7Ma/a5EbWx2TkdEe4SLM=
X-Received: by 2002:a25:31d6:0:b0:dce:9c23:eafc with SMTP id
 x205-20020a2531d6000000b00dce9c23eafcmr1704317ybx.1.1709199706188; Thu, 29
 Feb 2024 01:41:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-28-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-28-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:41:35 +0100
Message-ID: <CACRpkdZnGSOhtZMc7Y+UMtmPnmx_rM8_PQKBXd8W6XVunGogfg@mail.gmail.com>
Subject: Re: [PATCH v2 28/30] MIPS: mobileye: eyeq5: add two GPIO bank nodes
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> This platform uses the same GPIO controller as Nomadik. It however has
> its own pinconf & pinmux controller. EyeQ5 is the first platform to use
> gpio-nomadik independently from pinctrl-nomadik.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

