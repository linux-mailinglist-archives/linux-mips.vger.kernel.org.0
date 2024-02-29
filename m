Return-Path: <linux-mips+bounces-1890-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9EB86C4F7
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 818E91C20D06
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3B15A4C6;
	Thu, 29 Feb 2024 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6vBqw74"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B9E5A105
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198695; cv=none; b=eXA0zcOuRVAcDOb8TOgG1+CqE4Dkwp02t4LCHXM0Pclmv3YDJI1CIF0FNlcc7Ymgio974r6nKMgVUZRXLJKggil8K+WAkMfhO4LC+rHD2y6Ok6mtE8/AF/cCURaiDAhFHLuGppsm4K2vxGrvpWawSMtzuhpFNJd/ybufnj+MTTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198695; c=relaxed/simple;
	bh=XgXKQRyPRkOd5imcOO1De6VPE1wNBifTMp3skwabjRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auQJEyj7WpVRkovPz6ffjrMFm8LAjTMS4cdtz4p2eESBXoh3zO9gdxPP5q43BtPOnFqahwPwC99oRCRiwlY7+ODF6kAMUoRWYI4q0+5libnFIe/Iab5R4Bv+sS2/Bad2t85s2130wcbhipGu0Z/69ooqgZUMHy6cLIlaDY+AwrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6vBqw74; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso705780276.0
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198692; x=1709803492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgXKQRyPRkOd5imcOO1De6VPE1wNBifTMp3skwabjRc=;
        b=v6vBqw74d53slVj6eUS5oP4PDIc7FrUrmVD3iWhvkfxsV3I3zDoqQJkcNaRyRLREZ6
         RhjWGwvhFL99ywRdARPbXUBlb7/XcArkLTUhpqy6AEKI8FWjHVe0HyhS/m8x9TyRN4cY
         C/sP3ySRvmnuj/WoECf6qSKQ1RRZy9IanYSZ35yiQt4wNWjvqzuS45+JdBrgGWx6fZQu
         fL5m724TmHt8neG50fsHohOhG34QRmdddE0qIt1auUTGvYiD93KK5j/ohbH79LMB/+4l
         FwjBtZ0GtFiPPWp5keoJBRo8dNTmSnD3vDjXvTg8owOVUxB0psQy5eNtcObc9q4SLaHD
         +3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198692; x=1709803492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgXKQRyPRkOd5imcOO1De6VPE1wNBifTMp3skwabjRc=;
        b=RxK+BJP/5ahTPnoFNaG+vTwaaGujtVPuOzZbfAvSs/vBJ+WHJYjf6phMr4X0rDPdf+
         QmYqUhlGDskqofQkNghzXFC+/a3Eco0owItkMtAC8rDqD0JJrRJIp8HiiiUyCXNe1oWV
         EovM7ae8hedss5Vcn9FrMEZYvh2ysJwcc3syvtBTlBdx2wynTVVS8vN3s7uYJmZ2VicJ
         gMd/j86Ol4xsUxTnFl9e25fBKj6bF1bg1CyweW+I8/PKGfYF8ypD2qJi5yhLB9YM9le6
         kyeqtcjCRkT2G+ZQN5ADG1jZ9BXH20G3XziCXQpplm6vD+4oAlABAlAs5mdH4GRWbepz
         S0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtkVq/K7D36V0YCR47ZtH1kv/N7AU/eupNPsce+rJBNhu3zCpk+dELhF0hC+BuluGZlMsbtWsiSZdCH7j3baRgtlsdxsmWxFiniQ==
X-Gm-Message-State: AOJu0YzXrlZQ/92Go0S+LmFm8/CJudw1x5J5XentMClGViZqUhnBJ8OP
	m9tBCieaphqvRqGJtNb/Vx3M5Bj7bU8yCIlwqSseKkw1Q6I8yuEpevfrUbBff8YHhU+0QCeV+n3
	fDpoBeXIlWKLFz1h4UfEEsozQ8GGllt/7qcR70w==
X-Google-Smtp-Source: AGHT+IHnSluj8noDkCdA/Cr1alfd3L//OLqOP/CsIY5MpMGMSAYZTI1jAe+ZOvEXeVS7SN/cMHdb2IbecrkNGXkvUmU=
X-Received: by 2002:a25:3343:0:b0:dc6:b779:7887 with SMTP id
 z64-20020a253343000000b00dc6b7797887mr1579268ybz.20.1709198691706; Thu, 29
 Feb 2024 01:24:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-7-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-7-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:24:40 +0100
Message-ID: <CACRpkda6hnuaEhpdXJ-S-60EdLVi4nay9bEb-Hf0sw-=d_XKVg@mail.gmail.com>
Subject: Re: [PATCH v2 07/30] pinctrl: nomadik: Kconfig: allow building with COMPILE_TEST
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

> PINCTRL_NOMADIK, PINCTRL_STN8815 and PINCTRL_DB8500 depend on ARCH_U8500
> or ARCH_NOMADIK. Add COMPILE_TEST as an option to allow test building
> the driver.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied to my immutable branch.

Yours,
Linus Walleij

