Return-Path: <linux-mips+bounces-1549-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794BD85A5A5
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 15:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC8081C21F5D
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 14:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6B0376F1;
	Mon, 19 Feb 2024 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTv2Tzzd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ED5374F0
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 14:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708352216; cv=none; b=g9mf1+fZQDpzbvkIFUMvrPX2tAGQN0f6LzkWatxJl0nRmdLDselBRdFPM/rR8wtUlV7yqED3A/m2Y6u2ziE0vQOeIlGq4qwzkyrYQABHEvWVx/fCQhTNRIpEILifIHVByWhmzhV6QCTPGZvKPnMXB/fGGe3vUDA3ihX9oSPFi1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708352216; c=relaxed/simple;
	bh=8NtoIAADVPgZfZLTu67UGU+6DVV3ajBVgGPX09bdDig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQOEqFVAF+uv27szfwQNaEt5UEmGyj1a2Iip410EQAQMGwaZ7IBcF1Ls/2hoBzrOYvYfGei6TzsC9ED/qgbX9Yp3/e7yYuHe7jdGZuUefihGYXprnbiJvRFVxzTzmHcdX5e+az+tMqfyoyQypgUPTTkICuymvvMQ5YgsJCal9Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTv2Tzzd; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso3022940276.2
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708352212; x=1708957012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NtoIAADVPgZfZLTu67UGU+6DVV3ajBVgGPX09bdDig=;
        b=MTv2Tzzd2/VA7oqnWwbz7W2mSvD1P0Xm2hX6E33qmD4jsA4JVl9TLcvElzZDnxGpJ1
         KMbzO+SyjetWDcFovc2LMOG3bO4KqygaXRmpuyX4MCbNNEjSEGEbr67tsOiDctvnKBSs
         cka6Q8vAoh48DbRQFiOzYzyxX9PTQzGlQcuTSZw22/64TPzm6CVIAqfIDLnR63acoQVT
         NYjpVUw3nFq3mcgbwpH8Uwp6LQy1YJS2edqC3SApJuEtqu8kusqH8VbGyui1o0AIhBkt
         rw+WfqKQ0R7sHoqxyziSmMf4hhKmLVlui4cpqCgzk4JzMnvbKZ0aODGjI7ZHithOYPz9
         RP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708352212; x=1708957012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NtoIAADVPgZfZLTu67UGU+6DVV3ajBVgGPX09bdDig=;
        b=OT06lJkt58Y6xMDyKqiZ4ke4mvFwBFWd3Mvuy02MsHCVZUfOlRSD1vg4R+Lw0gj94Z
         2Ik/2vG+wFM3UzRwhH3Wudv3CuvyogWI4fR3/HZ2DLSdP3nQN4Zoak8UmpoR8EROlttU
         WT82pK8luIqBXbu0RpIzI8GZd7SyWehLdBxHikYeIABqXdyh1anDuTMs+bILJxqU1o+Z
         Q3tLttxrCwDBIS0ecOcAFKQRcJ1W3RxrJJDcA/1VYmOtn3CGcEH9zdRKP7jFjxXxRrco
         jgwULFCJv1F3Rnm+YZ6iJVG4TxGWF4V0OOvqzFF7AEL/nvZfEZafyFFooJDhOfHLhrSn
         uUZw==
X-Forwarded-Encrypted: i=1; AJvYcCX/gaQVsv2dqcT5sG+b8740v2ZloKwng+alwaZWNPejgO2n9rVCJOYAHWAbluNMmHm+f9tTsbflOOFuIGe5pcCNeMWs+4sebErRtg==
X-Gm-Message-State: AOJu0YwEApvYwDY6Zm2HmRVD5J9hDzk1lXj/zQsUffE5JCFSdSc3ISiy
	sdrUA2Z1J2JIEChHjFrmMFUEMsw8SZLA8HAZrNtmizNRKBCqCDPU4j0HD3ct7jAs3yFCBxLJncE
	IZ4/CfNRXLUi1x2IxjvKeADj6zYIQEvTMkJjTMw==
X-Google-Smtp-Source: AGHT+IH8zoIF6nwlmjqS5YKC62u1494qWLmxwhbcebn26N7GSaVYv8uV1vUneZZY53AiRhaVHNae5A7n3HAWkkeHKYM=
X-Received: by 2002:a25:d64a:0:b0:dc6:af04:2e05 with SMTP id
 n71-20020a25d64a000000b00dc6af042e05mr8299772ybg.7.1708352212135; Mon, 19 Feb
 2024 06:16:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com> <20240215-mbly-i2c-v1-6-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-6-19a336e91dca@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:16:41 +0100
Message-ID: <CACRpkdaUJ6tM51o5tDSMURFS3u8J=dfMN+p4j04QNXdGUPzCXg@mail.gmail.com>
Subject: Re: [PATCH 06/13] i2c: nomadik: use bitops helpers
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

> Constant register bit fields are declared using hardcoded hex values;
> replace them by calls to BIT() and GENMASK(). Replace custom GEN_MASK()
> macro by the generic FIELD_PREP(). Replace manual bit manipulations by
> the generic FIELD_GET() macro.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

I'm a fan of this style.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

