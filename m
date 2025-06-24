Return-Path: <linux-mips+bounces-9475-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E19AE6F24
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 21:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB18117F511
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 19:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE77F2E8DF7;
	Tue, 24 Jun 2025 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="greaUKvA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888542E7F28
	for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 19:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791905; cv=none; b=uCTI9DGCNok3+PPZRTd/r+Wa8N7IzkcqsIR/wXwyC+vnFRg+xG1DcvNUX88kmKQ0Fz9ScgCg7cZBHTJ+7ON7p2zIdTISiEmgPxESHHKKorW9AapE/Gh6deuFAcEfotEINOtYsTMG83hCxPeZbzTChifu/SCqI2hczHi0x/J9p5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791905; c=relaxed/simple;
	bh=mbsb9+fWnbzsLx5rxji39vFSDusnvdjQ+VlMMWao5NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPraDtIhTBJTM1UibnUeuw19wyLVbsft27kWGZLS0dTODtJsAHVErtt8efrrXFqbSXEwun6W4Dtu2SP1PowFMCaukpdhv/yRvRnq/yBg9pxOWNbHCEpvhZx4EX1N61ZPnCI9zI37HiyR9ofgCKO8Zl++Y6GuHAWOeqiBivLg+w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=greaUKvA; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32addf54a01so8425951fa.3
        for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750791902; x=1751396702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgrYreYVLH8FvHoQvhsa3zUNDQAJAjppKx7XORV5c4c=;
        b=greaUKvA3QPRnMukNkOtP1Rs94G9Ik3Gynpo7TPJAyRdeEM9OjvRLrU3i2BCZwhSdL
         Xf6FZTMGRCZBRaXrjV7KEvJxLjCtam936SnmNhEbi5zGwqsQ8870DKYTZnZGjs/3ATZI
         vXQkYyIL+CU2XRdapzIgeH9hWKovuYpX/ceNUtEXFAlYSw+8uCj45VudVx9pKnyLReAy
         s6JbA2D67mA3mo1H02O/adj99e34r8NpL6nnuugv8FQJc8KHJU12ZvBjVbycR+tuu9ud
         l9vWfZuSSoBh0T2sw66WaF7RUGEIvjFNrbTbwpBFr7HUtKCIwZ+o+R0gLNaI9SukfQ66
         Fgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791902; x=1751396702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgrYreYVLH8FvHoQvhsa3zUNDQAJAjppKx7XORV5c4c=;
        b=E2PMMzuGHBWUOupYTG/ZXd9K2F3wUl8gtQ0/PfUGzFH6DQQUUFke9L6A2Dy3UgzlK7
         LfCqec4xGjNTfBAVfB4l0/OlqLXAWXp8mokjalW6PX+wXqvSO2ZYfeQ0pJVMA2CMViuL
         fwAbHJhARyT0H57ks+WQczoV1uoudMGpcnzSc78gC5VzH+as0Fce6WqFW1gB+2sm4nBF
         L9RbYrhdWd9Pt+h/W4Be91cZGBD5j1QCc15YZAUKsh9GwHmh8aTdn+aRx9sUKlfdPK/m
         A/m4vpUqGARzYJK1/JcyKWQdWnaMgiX9apctaGXBoLqSZB5WSCBKZaMQFV+r1jZ0R76b
         2ZDA==
X-Gm-Message-State: AOJu0Yxpbd2wRuMf4UU+radhWVlmebhMeuJCFFTQ5t0rzwPRIchvC6HR
	H3o7vkqrxCwZyFJmYzL60KsMZRF1QVP3TRNg50ycdQG57hL2RHaEbWXzGnOpcKNEv/7HghvnlEN
	8Pn8kxnVBJnLM4GcYscVkTt6ECJbeBZW2riFj1CTBCw==
X-Gm-Gg: ASbGncvLPUOPyaqrpYGVNoczyiZ3Fvuyz79NQvY9EX8TL7DnVzRdnrhrdfgHMzqr0cV
	KtW7qGpaJ7atFxQDcjc2f1jkMlfFd/3qjgiDrAaRW1Wk7Y7h23bbpnNHZ/U4Kaq9HUtrgbfIOIT
	9HS7fu2mki+Iyvz+1/nocT/jGB11R5Peal36jM0eoNYos=
X-Google-Smtp-Source: AGHT+IGRAdbblRlD3BsEideIncBbEmzKvsoZaeWYiP0C3/Bj6arnBv99h8pdXRsP35lURKgQ2I/vILxQ5IGPRudpng0=
X-Received: by 2002:a2e:a54c:0:b0:32b:72c8:9a5d with SMTP id
 38308e7fff4ca-32cc4d3d6f2mr2458331fa.0.1750791901594; Tue, 24 Jun 2025
 12:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <OSBPR01MB1670163BDCA60924B3671D45BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1670163BDCA60924B3671D45BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:04:50 +0200
X-Gm-Features: AX0GCFtEg0ndXbqdWy7FvRv-qpkhJSjku68IPxwnvAyNolU9JWUszgMqSgQ21Yk
Message-ID: <CACRpkdZhHVBc+aGA91Y3hHOe13C4TYwM1E_mH526dTECBZaP8Q@mail.gmail.com>
Subject: Re: [PATCH 00/16] MIPS: some compilation fixes for the Lantiq platform
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Crispin <john@phrozen.org>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 4:54=E2=80=AFPM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> This patch series fixes some MIPS Lantiq platform compilation issues
> found on the 6.12 kernel[1].

Thanks!

(...)
>   pinctrl: xway: mark xway_pinconf_group_set() as static

I already got a similar patch from Bartosz.

>   pinctrl: falcon: mark pinctrl_falcon_init() as static

Patch applied!

Yours,
Linus Walleij

