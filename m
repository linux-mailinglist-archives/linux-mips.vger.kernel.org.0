Return-Path: <linux-mips+bounces-9864-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58709B0B0CC
	for <lists+linux-mips@lfdr.de>; Sat, 19 Jul 2025 18:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA1203B1AEC
	for <lists+linux-mips@lfdr.de>; Sat, 19 Jul 2025 16:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8967B28641C;
	Sat, 19 Jul 2025 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LE2BqCM5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F472236F4
	for <linux-mips@vger.kernel.org>; Sat, 19 Jul 2025 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752940950; cv=none; b=eOlorMimB6T/k/AhQz0MHzx1cFZ/2/CrDg0CdcdJ1mEOzV/AjE5Y2dJ18JqPKEhka5FRZf+KXAJt8Ro7MhIN95Q71SbWsNCCWg8iHa/9BYYl7hb1StAmv7NLSQQObpthZdc7OLrS7NrSvRbxVdtE/pAYtmwdOpNHy8sOmvTzF5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752940950; c=relaxed/simple;
	bh=omxcvlFB5WsNU7W/SPacQy7pFjeWx/NXXRV3R/gNeMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0+76bRVwAgqtQcnl//8hQZmgQNbCvBqAAojNKJXmf8vaYTEBZz+a3lFVPNbZvZGrQPRGQOg6uvUFn+epliJyBtv1yN2Iu9Jm3DlXa/Haoa6FkLMBfy0FfsCNWA0sASsZzJMyy5RQgGENbwx6aV0DW1o9uIRFzo509ee8OXuulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LE2BqCM5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-555024588b1so3340373e87.1
        for <linux-mips@vger.kernel.org>; Sat, 19 Jul 2025 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752940947; x=1753545747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJxRZr7iN1QAKs2m80VW48YbRh0uObEphOGlhuo4nf8=;
        b=LE2BqCM5hp9mS1GmvHga7NVq3laPX2EZtx69qWEeidhXmOCJyc+9rVO2IOpA3QoWfT
         QVnut84cqtlhsWWrBDZ3x3BAzj3XlUkhVxA7VHWMvaeLpm5IFdqME/G60u3gl0SiPBpH
         xPXWqwP4VpHqscqBsQ7I09Ed0w6/SOTXE2TpfyhJ3RBxnPJxNp9VBouWVBnTaT9JfPqi
         7o+IaR+DdrgP+K/Avh90KxJQPkLoufmSqYGTkFY3B2ko0SxMDxiKEeIelC7stOdPTN6L
         cm9E3HR0lmp+VXmp+Su6hDg9AfCfScwJHgQ9RPtpfi0m+YC/DSfKHnmntKDQcl70Hzs/
         Pyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752940947; x=1753545747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJxRZr7iN1QAKs2m80VW48YbRh0uObEphOGlhuo4nf8=;
        b=aZxyMQ7m0AtuYGio5d320gsSxnujVLtquuhLVtd7NZ126FP+YKpm3JPF18+96QqUvm
         F00Z0lmC+KAHpjs2yCLRy9u9P1ubuHhvAIaQyZvNmQS1ldFT1crYWpKot5xcFsGxceSJ
         3xj7kCnIKUFcMeInBwgEy4t6PUAflTPNiMhZSNEdML7jrs4M4zWKueWSqSPi3+Out/tn
         1QK9fPiJA+wNM4plMrAm5iR8L4lNnBpzfaxL8os2ohzJy8j/a9pe/JnhsxmhUcj/78Ah
         p2i31mgxx3xPgeenh6zHWHhbBPjSgY5WkCM13dQQ8tmiwqU1dzznGNkEr2ZVxh1b4Y/2
         9Hcw==
X-Forwarded-Encrypted: i=1; AJvYcCW2vmivPW1ozho4LSNfzRjxYPbQjt3PxiZrnt8ApynpNf88ThoRuIeYObQ3vgloA19k7RMX49xsMp9Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IcougLEeQJ/EEhgs/efaOkYQ1RcQNYwWsl4BhLz7dx2KOuwJ
	4JL6HZgnvmNJYAzIHLqRFX1n+Uryn2tQnqAbyaEwXt7v6tPoxG8pjeoxqRk1F4OEtPUJzVf6Kwl
	5jS4/Tf6LjmXn5EjHLNI1aPh3lbhqAjfkeFVr0ox9Qg==
X-Gm-Gg: ASbGncsGKQY4rDGlupcfwcZzfmQdxGDRdZhDoP70Jt+x/2eWftvpW2Dep/rpxl6M/zo
	IAiPk4QHzIK98BKFWepRErj8Y7qVYYoW1YIhPOOBy3Wg0UVdTTpbq63g6yWSaHe7/0TsWrGB5/n
	ukyaNUlyOqrDXKxfVg9eQTvkuh8EmzJJKbaVN6bVG6B6oXriauhneanj5bbb4kdMk6uLcaPDSqQ
	i51+6A=
X-Google-Smtp-Source: AGHT+IEoUxfZHhjopPDobqn7dOjOmBm5Yh2lx21AMKQLkwO7yH4BlU0K80uOKrtvDizTOqyz64KGrJ56htRl33CUOe0=
X-Received: by 2002:a05:6512:3406:b0:553:241d:4e7d with SMTP id
 2adb3069b0e04-55a23f6dd82mr3887668e87.42.1752940946812; Sat, 19 Jul 2025
 09:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Jul 2025 18:02:15 +0200
X-Gm-Features: Ac12FXztrlt_TII82ZBIkZmMLTzLg24otRAxfGOCzM7K4BljVaj3bGcukozw-cQ
Message-ID: <CACRpkdZN3qAJdvDkzvr0_=7grNHWFQ6M+_b=BvREq+PyosBmiA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] pinctrl: introduce the concept of a GPIO pin
 function category
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

> Bartosz Golaszewski (12):
>       pinctrl: pinmux: open-code PINCTRL_FUNCTION_DESC()
>       pinctrl: provide pinmux_generic_add_pinfunction()
>       pinctrl: equilibrium: use pinmux_generic_add_pinfunction()
>       pinctrl: airoha: use pinmux_generic_add_pinfunction()
>       pinctrl: mediatek: moore: use pinmux_generic_add_pinfunction()
>       pinctrl: keembay: use pinmux_generic_add_pinfunction()
>       pinctrl: ingenic: use pinmux_generic_add_pinfunction()

Patches 1-7 applied!

Expect qcom to follow early in the next development cycle.

Yours,
Linus Walleij

