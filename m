Return-Path: <linux-mips+bounces-1547-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C3285A587
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 15:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D3622859C8
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 14:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFFD37162;
	Mon, 19 Feb 2024 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wYjXTyUQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CA836B16
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708351992; cv=none; b=ld+06ydwy6gn969SZhop+tF/vAQvhy+5lHJxncm2eVNQ+YRUEJVg1K3kvNIWVahBmPb42do96yMmcsQ87lwxw7sRNfo+GFwv7vaulPcCDqy7F+e0Vo1T5jXedhU8JrPxX78mSvf56cGpUyIdZXylmWevta9XR+7mJQqlxRIJgTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708351992; c=relaxed/simple;
	bh=yakgxatxnJj6XQND1mgzVdcVV6fqvQwXLMjVua/FQAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euoG3HlEiHFA4lJ4w5dQOzQhFE1UmPjT1ESzBN4/rRKS+WkVz8NgXG2GFKfv80xSVoQMD3qQ2/JXFBGHFJdCQD2VSiWKLaFAwjv/EIbRdc5bVrz10kWLBxhJ5OynJeN8Nc/LRILfATVe99qMIc0iVfpN9jXRR3WzwVWraafYpUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wYjXTyUQ; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-607fc3e69adso32110407b3.0
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 06:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708351990; x=1708956790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yakgxatxnJj6XQND1mgzVdcVV6fqvQwXLMjVua/FQAA=;
        b=wYjXTyUQzQFHYJXgyqu4Z4vi7xwEWZZ+hu8Kiga5hpzYDOx1pTJdRMNRfvYfEH04ck
         SJkY4ofsA1mYs5iguk8IhjlQwwvoYbBQYXFnaTND8d4lJShHllt843PGRBoe9WYJj1At
         HNw0uV8AYHhOlzeIApUt16BqoFMr+ErR1ew0hVQDXnlliadUemi4iKmjp/pTT/ML/1vt
         NNy3wlSfnIZ4s142C3Kt3hfUiz1fhLKM9uL+B7sbqTiRDTcFWfjYLXGYCUIQdXgYknh7
         1sr4UWPRarOB2GcotIwTlTd0/VTChOCTLwewj3AfR8Oat0GzzvA2ZDUi5+44KMjFwLlh
         9KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708351990; x=1708956790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yakgxatxnJj6XQND1mgzVdcVV6fqvQwXLMjVua/FQAA=;
        b=ND4Fy2yptzE9XipJjDpOTQBaki/pGGUhZ+fINOpBhdL3wHjcNZCgDAV5aLA9HLbE4+
         TFa0ZTg6+5PGScOf7fZiWw+8zogtAXynf0ZLm2DThnh09GmgvOEV9AjQCMa9lLiK8Kc7
         Pe4OA5+anF4atHrX366qZtf3RSjATnTnGdnrZLzusWEC2wZSyUtaQ+fdqQirJE82MZdS
         LyHvlt9B5Dt1R6ZKm0wyNkuLZjErXOjpwws9kPDnVxTw0Uy64tE+ff7r8hGgWptHRfFu
         WPK3IwF6XVNfQT7A4In77ydYdJDJHt4dW2K+BL5k6xIiZlvjExMlTqGAuN7qtJHx2DG9
         VjuA==
X-Forwarded-Encrypted: i=1; AJvYcCVxhvXvwd6LX/aA3IvfbOoC46VuGoIl78+oFSV1yd2mTHqCv5KySBg85tQopQDNYfdZy3yOF76UkLLakWO0zrR/QiFIZmNkfVrDZQ==
X-Gm-Message-State: AOJu0Yz4g9+q4FUhJ5EOjugq1WBvoY1Hgzw3kksfZRmraOIeadFwBK7D
	7OnEnwzJCHK85Xp4NvMWuVrS6sKCu0VH9nH2mgv1C7npEaNJ1QrXKSJ4kN1pcCNdHuJe8Wl6A8B
	TpX2W7fTGQ1/QvVUOBetZoExEEZH/iIz0tvC6wg==
X-Google-Smtp-Source: AGHT+IGjbvj/MUOy5k/jrn+sArC4bxPErIKvoZVJoveJFaQaake5ePStBM8UhZaxSmC2jmkv2sTNyhEbwf0oAzkLVEk=
X-Received: by 2002:a25:2e42:0:b0:dc7:43aa:5c0b with SMTP id
 b2-20020a252e42000000b00dc743aa5c0bmr11657477ybn.21.1708351989672; Mon, 19
 Feb 2024 06:13:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com> <20240215-mbly-i2c-v1-4-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-4-19a336e91dca@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:12:58 +0100
Message-ID: <CACRpkdaZVOpR8twgOiPifUgQeUKcertU9kdpH_vCYBaE0UhziQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] i2c: nomadik: rename private struct pointers from
 dev to priv
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

> Disambiguate the usage of dev as a variable name; it is usually best to
> keep it reserved for struct device pointers. Avoid having multiple
> names for the same struct pointer (previously: dev, nmk, nmk_i2c).
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Fair enough, it's more readable like this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

