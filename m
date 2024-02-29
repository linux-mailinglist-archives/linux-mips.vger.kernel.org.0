Return-Path: <linux-mips+bounces-1892-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690CE86C501
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FA371C2083F
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8980D5B5BB;
	Thu, 29 Feb 2024 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dkLFfWfm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D193E5A7A3
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198727; cv=none; b=s4U+awf56kkDZgfoRxc+aRv5JQB098OyMlxXbCPu77SSyfvKnKgimh1k9gk88vDBgXLTL/TAkRsilvM1JLSuqmc87hoq5Kua9h/3SsuP6rA2s624kHOp6sDLp5V3VWSJM4o31T/TgSBgMP95kHsEqSS/0pQbJE+w49ZQToPjcl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198727; c=relaxed/simple;
	bh=K93TGNrKb0GkgHOKTSz+x/4+8Z36bEWaT4XskVS6+L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4BGCczHPYtogjBs0fd6XB80fpln/xD9JQgg8jX0fcsP+zmbu1B29uvW1l2Is7zmAsICJcWEP1sBt0VppLl1l0er7jirlEA4+ZjwoU5anFy71PgxwYGdb2hN5rj0UUiX5a4+ixULIrxgzl8wohqMUtakLCia8Pwt5nqqTBYKD68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dkLFfWfm; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so668198276.1
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198725; x=1709803525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K93TGNrKb0GkgHOKTSz+x/4+8Z36bEWaT4XskVS6+L4=;
        b=dkLFfWfm1XP9AJ4myW3/MMQysFEi7tW47i3ElfsC9w/QWwarIsDxpbINGpie+1D1Xe
         q82oFXBFf+8I3wCWcn5bzFqeNUlU+G9EiZjrBuVqNJju0C1BQo4q/MfIKZtgeVPXenpY
         D/2HE3TA83Ucncq5eYAE5ynlJNFMUeosoBFfY4MdFB6yshZZx2RKmsj9usLmAjNoMG4f
         EACfg35TeHAbMEdHJ3lX2sh8DrnveSto4ddaePkI222wVXw61ZoQCr8vP9oydpVFeT2B
         BhEN7XCkV6ud96+1fx+FRKmnVXDJXEFJJaQDFOmoY3O2Jl2h7zlWLd+6vlphFg53P9u0
         7r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198725; x=1709803525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K93TGNrKb0GkgHOKTSz+x/4+8Z36bEWaT4XskVS6+L4=;
        b=KIPv5xwCR0jBDHOmkSSPDuF9Q2VBZ8rQ7c6Q0QjtBWY0NrCNgH/k3dnUqTyZ4OJkG8
         ku9Xwwyjzmu0hZkW9gIfzqd8T+b4N1zbau8CVsY9eKRMDnhpftK1ZtwMDtGjRLGFj7nl
         l8u+ncM9CPeejPSpLHJ6W8454nbI/hPGtoxgoK5Q+JXrH7n+54WS+ogWeAc2wFlRRIW4
         es1wsJkSpt5jvN9N7vQeGmdGkGTSpH+KxLjdFnxk9cuL+OQMlfNQCiTD9zqDEPeZ+sPn
         yG8Tx42lnFvuF2rkORLo8cLSv6PPjSzZy0NKGDWEOB6glVddzGkftpusT21vLD1YCqd+
         x9bA==
X-Forwarded-Encrypted: i=1; AJvYcCX8M6XI1ZGALge/8BgodCEmgTbTz+iMnXtNImx5rExyldfi4D8w91J/kTs/nI5d/CY2I1DWlQfkx+nXBXUz3UWyJjzfS4lwXqq8PA==
X-Gm-Message-State: AOJu0YyNU+hQt7pMVrkhJ5CJQKeQ+Rhi45Rm0NOZCD5yuFs7ZvaFAPF/
	aoev36gSPtEBZx8fFIu7sabOwN+qaHGybtiTd+yTVgjdZ8yGHtzSd12BWUz4c64fLdBYD9ulio0
	Q5z+giAk19LQ5vUxoXcYdN8mcGxPwyA6M70ltzA==
X-Google-Smtp-Source: AGHT+IEm2eq7h4OqpB9ZsuKpVyUbJqGCJ4nnMCzBfRnKHAXqac/WmT+lH3KUOMad2Qwl2YwaWx4J9gXGrOYlqlEqOis=
X-Received: by 2002:a25:3387:0:b0:dc6:b812:8ab3 with SMTP id
 z129-20020a253387000000b00dc6b8128ab3mr1619363ybz.26.1709198724817; Thu, 29
 Feb 2024 01:25:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-8-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-8-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:25:14 +0100
Message-ID: <CACRpkdbi_DUACLTbYLc06y1qepjL8XtEvWgFsXbJwTeXTcMupQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/30] pinctrl: nomadik: fix build warning (-Wformat)
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

> Fix compiler warning found in the pinctrl-nomadik platform driver. GCC
> message is as such:
>
> drivers/pinctrl/nomadik/pinctrl-nomadik.c:855:21: warning:
> format =E2=80=98%u=E2=80=99 expects argument of type =E2=80=98unsigned in=
t=E2=80=99, but argument 5
> has type =E2=80=98size_t {aka const long unsigned int}=E2=80=99 [-Wformat=
=3D]
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

