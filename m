Return-Path: <linux-mips+bounces-1897-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2FD86C524
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA89D28E0D4
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CD85B5C5;
	Thu, 29 Feb 2024 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYuNkIPj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1307C5B698
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198938; cv=none; b=t4pRwCMVgUGrvDQ5aOvPwyTMRR0JZ1JmwegYHZ1fbdDgI/MW3RHzSHa9hczV7vw8g77IqsmWAMLsk4ftYcGJzOf4kdB4RwQtTZ3KgK2EPZ2iq9tKC+ziqFmIsV1/zAQlAFlI3rVmJBT7yDxw8AnjSnzWIKr8D4nbcEXuUggwbco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198938; c=relaxed/simple;
	bh=il/+MTSUB+hJ9/Qk/zhTY8kE7bR8Rhe3rQiBlSatDYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKUgV+tX2olTaK30uKKqwJ8y4OSqwHy8i2Vx913OpDR2yFZQ3oosdmPGLa9IclUp2m2bV1KQv6pkuERGG4WydnRyHDdii8PN9eR9WXlREnCsJRxH8J6xjX74uziXI3lx0+zFhq3WdutAwjsuDwsl89+PkAqkp+jbaMxoASq34M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TYuNkIPj; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso813885276.2
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198936; x=1709803736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpnwZXvO+GxSiHd0a/DytgyertWwHVGU4iyf7Q6jgRw=;
        b=TYuNkIPjMwzDHQdknFcZap2VRp457jPMtJDlOKTrctAkBWLQi4bK2SGCP2BZEl1Rq+
         E0gA3YYj58ti5Duzm8HbzOG4gRNfoCtzM16hKtF+9B2WPMJVjkepl0FSh7J62ze0SOmG
         LaLgb4IWlYioWh4MATdLMcmwEKWO9VRCoRUGooefg45aWtBJH/Y3Ny58TDlunKSijXAH
         v5lAuOy2zJL9QdgQpaPwR3geDDFbwQWlXt5+aDJR48UrUXJDpUnB4a3dNlkJPIpHELab
         P0WizjuSJk9yuwQ12ykZnqHygcaW2sNnQC/ojEmDgp0kdwLsR5zs9c9MUUC25j79wlIk
         MTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198936; x=1709803736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpnwZXvO+GxSiHd0a/DytgyertWwHVGU4iyf7Q6jgRw=;
        b=KBsk98n5XJkb84Op8wKcD6y8YUHLbFbQ0jUAG40FY11NKL0R85EMoHf+JV1Sdp9FSi
         CCav81t3SMQD2lrQwKpVsADeeibwUkZjJY3FKa/2YStQfogPOaNc/V2bg2L5Wj1OasFj
         cyWJK/zna8T1/Bni/K9XjGSj+BEnNoZryDrhJBDCHs/kHa3X+bVEe+YdVFJ9n71R/AzB
         CXkcta+J4DU6rqrPdwaQxNpdq15d7F6K95aRzzT1AsxbnlwKyAYSY4y1zt07cnjVzcog
         dxjF8Xfnj6mXjEJXw47q+P552h/6eoB3Hk3Ig7Gjxv8xZt3CdBsNXT9YlJ0cF4qabWOS
         I38Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPmPwIOFG+Ficni4qwu6VFPDgtEsBM13xZNumDUNVN9eYTygKLN5vSxs2Fo2P55dwn/Hi1SjRoentVFX6u3F13kCPtHzpuvxv5gQ==
X-Gm-Message-State: AOJu0YyXAIFYQbOm7FxCniHhg682z+Lc//PsWUSGSPeuXxaBB0CJ6g46
	VN3QCARk5hLL8c3dfd0E7q4WS4bcmwPUUPRpBbQbtZDgRU24Dmd4WFZNoOmtO97bzG2pocklf50
	JGqmLmAPpOOWbNuG/iNQJabcRaAsf57SoAVk6yA==
X-Google-Smtp-Source: AGHT+IGIbl2TgaNavrw5wNoqVGLPJWdWimW4CCp6UKDlUrz43Cqlv3DtmfGj5h6AXkXD7KdYMCvm+9wtqdkrh8HvPfQ=
X-Received: by 2002:a5b:445:0:b0:dcb:bff0:72b with SMTP id s5-20020a5b0445000000b00dcbbff0072bmr1559369ybp.31.1709198936052;
 Thu, 29 Feb 2024 01:28:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-13-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-13-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:28:45 +0100
Message-ID: <CACRpkdb6cLAaAkYa=2Sz1G4t2yBRQcwPWsoQShdQ2JMcg+VaRQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/30] pinctrl: nomadik: follow conditional kernel
 coding conventions
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

> Fix strict checkpatch warnings relative to if-else blocks and bool
> expressions. Message types addressed:
>
>    CHECK: Comparison to NULL could be written "!nmk_cfg_params[index].cho=
ice"
>    CHECK: Unbalanced braces around else statement
>    CHECK: Using comparison to false is error prone
>    CHECK: Using comparison to true is error prone
>    CHECK: braces {} should be used on all arms of this statement
>
> Before: 0 errors, 1 warnings, 16 checks.
> After:  0 errors, 1 warnings,  7 checks.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

