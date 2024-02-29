Return-Path: <linux-mips+bounces-1958-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C2086D5DF
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 22:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 064B0288FE0
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 21:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D2116FF51;
	Thu, 29 Feb 2024 21:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpmSeTlB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3459E16FF33
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 21:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240680; cv=none; b=RU/+w1GP/BMj3OOLIln13eJPuaS9ZnCahnaYacEtoyS7P+pYTC+GRTHZXqwNGe4GQY+/r0AicIl5r1cRp38FfOqZdSCsTcepPJ5A8vw+Fjv0/Hy8ZVausRI40MGZpo22TxDQ5o/4Mm7uLwDNAY9qN+OvfHq2hWZsxmkH+L72J0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240680; c=relaxed/simple;
	bh=8uPVylV9EO6m0KYXwD9bCM+qusEzKV7OpBt6B4Y/Y+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJMik+80V/MvP+4EtdCq0uj3UKhf04b04rcfDTv6v0Jzkox28J/9v27UwmytE1FZMUtCkOMTngdpC20L324rgXK6LDeZy/tG5hy4OP9IhL5chPop4t6AHkeBhOrxTbcJni5GZxdLBg2/C5RtA9mjVxxxzyx+i/K/XtS2ngjmimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpmSeTlB; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6087396e405so21354387b3.0
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 13:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709240677; x=1709845477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uPVylV9EO6m0KYXwD9bCM+qusEzKV7OpBt6B4Y/Y+Q=;
        b=QpmSeTlBYpnn9mqBMS99KSQoZHAmlh6zlGdw4USU97YoQ+XX3pZp67WWm46223FX8E
         0OfZt5HLZBO8Pu5KzQziX+rCqF/8sTLEPjQHydYjaCsMwcPqwuKoS5NtLLh1UtxMBeQF
         KgnqF8j1+ZbS2T/jI5OKRHJP034PAmx3TvT0AVXyfm7uQpSy0p6CyPeQ2NvtRi1JW6+3
         YoLDRiQdHEuk7WtViN1J9YTZAUSOjL1sjYC1n5/A57Kb0etZ0YMUSRkpsJhmn4QtjHWW
         gSB18Nu6KqAbmV+1j31K3lkdiyW2E0SBTieklLw5yzjVU/AYYoomZQdBGYI+fwMmHxUM
         amFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240677; x=1709845477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uPVylV9EO6m0KYXwD9bCM+qusEzKV7OpBt6B4Y/Y+Q=;
        b=V9QsfBB824NHZDEyD4K1vOdSuYyqu0PeX+uZTOqOTyFE+IsBu+ZNaus8PxF2JjfdHS
         o8xaNRsHbE2joXxCz3XX6WgmfxFdg8PYuFMwPsm1chzrBEVXSjtuOVqVewwUKuCEZ5Ph
         pRUceh3gQelfJJ0TaDFsXHshfS6/V5rW+vZkDH6gD9ViOyHyQTeBXON5LchI2S4uC4sA
         AejL7RwTLBJl3s7kiJnwpILiaGOR/joKgDxS4is3zofM6y3QAFbLXYXTKcOnsi5bk4Rl
         NXUk+qWq7ypscpGvNJc7Qwy0a4gVY8/THbxKxdjU3Xp9OlHyLYC9HB7mUFUChsAl5oGy
         Oohg==
X-Forwarded-Encrypted: i=1; AJvYcCWrAKpRNoXV+7WqXsT5EfJ7AjLvOa+fDAoTORKxVB3biS/7vVUhUyWuFW5RRd+xqFsdlUyltS4WvqUO6VoeCQMUG7WtEpoF40qmyA==
X-Gm-Message-State: AOJu0Yx75XGkTEMk/qpniV1Iwh9MsfLXjoPmwmOvT0PwLBoBcoq8aaIZ
	ynp7fFeZULIg5+JzkT5QTy2X8YPu2+P/LJAD3bCKC7xN8sOj6Wyfze/M+feegJDmpwrh6HAV9B9
	cC2jlJxSpHSubJ4F/t6VQbVPWI5EwVLyMPUo07ZXPGEnnUxDf
X-Google-Smtp-Source: AGHT+IF6WpL6uXLdz5RRC4t8N2wE2n4WdvI8YyClMoKto9MRFbIOM8wSfgQJvA/IZCtI3mWM0tMsS/RNNVdPkijGBSI=
X-Received: by 2002:a5b:9c5:0:b0:dc7:421d:bcc0 with SMTP id
 y5-20020a5b09c5000000b00dc7421dbcc0mr1924276ybq.32.1709240677236; Thu, 29 Feb
 2024 13:04:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com> <20240229-mbly-i2c-v2-8-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-8-b32ed18c098c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 22:04:26 +0100
Message-ID: <CACRpkdYRPNq0diYUyQoZ54pYb6Gz22rj-WoGwPFALiuvgY71jA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] i2c: nomadik: fetch i2c-transfer-timeout-us
 property from devicetree
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

On Thu, Feb 29, 2024 at 7:10=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Allow overriding the default timeout value (200ms) from devicetree,
> using the generic i2c-transfer-timeout-us property.
>
> The i2c_adapter->timeout field is an unaccurate jiffies amount;
> i2c-nomadik uses hrtimers for timeouts below one jiffy.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

