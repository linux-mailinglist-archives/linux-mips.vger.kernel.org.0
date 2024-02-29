Return-Path: <linux-mips+bounces-1886-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A4686C4C9
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DA1528835B
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7013D59179;
	Thu, 29 Feb 2024 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LUXV0xe1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CFF5916C
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198370; cv=none; b=A7BFEw9GtyzuCEFvc8u02IU32xaz9RQE+YExJ5nwtPndhQlK4J2N2vLyu+hIZBJkVoYCPNPJQA/09GJfqpIcUaxFvMV50Yi3kVp4HTJ3Db+hmXiDORvMcmQsjpaYYG2glyB5vZbG6fXpDlkuTUsepSG8iC9fdu/6CvSz+0AUVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198370; c=relaxed/simple;
	bh=pd7O31OoVM5pjtqR6jWDKsWHxIHkwVJ5MmL+qrRcT54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+oO5w0xdfJ3dvCmLD2CUKYwOYJSVw072Ozl6wVMk8/3pD7XBgRTOkPjcD1bDCmHFlDuKes5V281JfiFaF348hbfi6of2bKXNoSHUyhyq8e+VMaTONpM1BTkVBx22StyOWUo97I2dctxIqoigoCXl54hT6BtDv6VjJ1MbjlULdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LUXV0xe1; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60915328139so8146587b3.0
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198368; x=1709803168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pd7O31OoVM5pjtqR6jWDKsWHxIHkwVJ5MmL+qrRcT54=;
        b=LUXV0xe1r1AqE6ly5WOsEdHJZ5LHl1guQvrYPda0LMPjteHes4dgukD4Lrg0hsR9zU
         8p/DUWbg7/1gJyOAjJHFFsnMcj0yuVVn2bSfs73ryf0NeNG8cDQ00rMwXXc/RIUn/ehh
         92bPN8YXcDWaD+Xf9OdNFz/KekpHy63+jDZ4SfRl33E9xMes5AWavUeB0w9otJM0t5o6
         QoxwqopNUk1PtPbXzi0owq6cgphN4d2e7lfTODFU7Q8C4PBzvOubrhNsnyawpiQpHvNn
         /cygLB1TQeAhW79dtQuMSHLCaQXyipZlUjaeFOV5lMFEMf1CDpxW9SBWR6v30kbjD3Rb
         vJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198368; x=1709803168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pd7O31OoVM5pjtqR6jWDKsWHxIHkwVJ5MmL+qrRcT54=;
        b=X2KH+t7srnpBU74oBssLm0t+925XYUg4glsr0qVG+9Y+GSnrJ5GqKIbvnKz/EqFOvU
         gA64uwqDaIo3v+OFaiNBnnCAqbOHNwnz3xIYfAsTTRW2i3S+u08gfSmCmkMfPKHRx59E
         j4ym01JzRrkY4CKxc9T+24h4+mZu5TCMX8QPqZpsNnvc5nqtwVA3h1i0mpLvuPSGyAJm
         2fH+hNwOZV+mIj6cx3qBe6nJVZxL6OCn3c+u9HNGWJugNTnpxASkj0XgsemQg96k21aj
         2G2Fm3RmHH6GRqp0p1nfC6PSGVuXZv2C1GXfoag2MxZnfGm2GFp+ZmGZNRDF92MgtVQX
         tRIg==
X-Forwarded-Encrypted: i=1; AJvYcCVCKeADVldYU8Z655ij5LIvl29IbeSOteZybEbQOwsjELJisgoCUJ0CMe5O50iIawtE0zCymy+UZdJTcZeGiazgSPeISxVsYRd5zw==
X-Gm-Message-State: AOJu0YzFvsCzE7spbj4l7xtHhXcY16S26VGMdGjj2YGsdKhvFg0+5EuC
	I9PzT7vSZXxmldRM8hD8/yFuojCXa6/8cAub0atOq6lXdnaPy0q8J3O8rmnUYxpetZXLWSXStOo
	S82Z0QU+oK9lETJo03bLBYlkE//dlmmvYftM4uA==
X-Google-Smtp-Source: AGHT+IGUUUHyg9k4vKfAIsPW9cd1IXQd9qIZJFAmJvzhRw0WTFVStIY4EDLh0PcIjB7t9aRLQC/qFzrG3sS68keJZuk=
X-Received: by 2002:a05:6902:2193:b0:dc7:4b0a:589 with SMTP id
 dl19-20020a056902219300b00dc74b0a0589mr1984253ybb.55.1709198367880; Thu, 29
 Feb 2024 01:19:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-3-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-3-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:19:16 +0100
Message-ID: <CACRpkdYVNCL29rwjfsepSyB9vHmLfTcP22yagM8B0UGLSXpYtQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/30] dt-bindings: gpio: nomadik: add
 mobileye,eyeq5-gpio compatible
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

> This GPIO controller is used on the Mobileye EyeQ5 SoC. Add its
> compatible to the dt-bindings. One difference is that the block as
> integrated on EyeQ5 does not support sleep-mode.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

