Return-Path: <linux-mips+bounces-9453-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D5AE3E9B
	for <lists+linux-mips@lfdr.de>; Mon, 23 Jun 2025 13:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41125176794
	for <lists+linux-mips@lfdr.de>; Mon, 23 Jun 2025 11:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C19246BD1;
	Mon, 23 Jun 2025 11:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqhPuCML"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5685A246BB9
	for <linux-mips@vger.kernel.org>; Mon, 23 Jun 2025 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679620; cv=none; b=qCCRFhvuDixwU3K/zfsTzmOVa7SmyEf7+nvlnGV9TxgU3CBjPiojE5kXNOflDi/6qFY0Q3oDcx/mIWWkmXF+Zj1AxlxXQPBcYJOs1UW5JW6Ug2KPP95zf/gKrpfWd83t2aMXAG4c/eduaprOmhqA8IXaNsxzHpYRXhTf8itf8Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679620; c=relaxed/simple;
	bh=RDI8cBCzVZwn53XlfucxBuC50lClvnDZ28m1ys46gaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shSR7tWst9R497pseT6ChchLOzKGXRCQ1qnK8C0Q9aHFIKPZ8GlApZKjPGCPbS7Ew03jXusg732/ANBGEIS8wbjH7L3vqKqn6nAHy9aEuY6Rc59whvWIishKhzvaCUOKjiXynnCMYJTacEc8Swi4AwBnsli/9v3lkGRql5CRH7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TqhPuCML; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e81f8679957so3245402276.2
        for <linux-mips@vger.kernel.org>; Mon, 23 Jun 2025 04:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750679618; x=1751284418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZaYyZl4DS0u6LRC5+ULPLhB5YslLRXaRQhUnx/sEOs=;
        b=TqhPuCMLGlWs9C41COiwUMSqTwb3R2dlCdU0LAKvismv63CX3NNoQXbHuTzwFf2iXH
         PS8MG6PsQ136QbW9NCtK2J077lA00SM0odAxMVV3HboA73SA9hlN/bN5l/5rblPmjF63
         4m1wUKXPjMMe2AZGM+GIiCW1Nu/ekW/QdYQekypghsm2UcZ6v20XD+/PO9d+KaMC+Z38
         5TyqH8BatqlR/N5YIYBR8l2vK4eCHJLyHjLUuX2GLKBzH2V/f4Aoj8L8PwN3TeUjt2Cd
         9qt4VEliSHBmV5vEdjls6JiHeg79+stsAvwr1LGntoJoZmycvM7H4SSvpf7WRrxwkMsS
         tZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679618; x=1751284418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZaYyZl4DS0u6LRC5+ULPLhB5YslLRXaRQhUnx/sEOs=;
        b=c64AaFwdjGhgSO0F0m1rxF7HSr0RGNSaKdIHHO9H1DKy0U7OqhaLM0LFmGEDWP+xGB
         24UjYVzxAM4Ty9mBTqtEMIxlD815MFf07hBc3fpqW9Qe2Pken+ciOxgQ135XbVrnqvts
         ZAfvEpww4nqgHNNKFDe/6wwI/YRZa5Xdd48z1y7bQ1KLgUf6BcmSteh3ZZ2tgPTn7nSX
         MpnKGhz6hIHrv6sudNMd7x7edtlWh8VdeLQZAa4bmpsHnuYXpEJixjey3gPagt3WVnmb
         eyvtRDTPavQDUpCY6DE6Jxe5oELBkvAOWzeQtGHChIyHrCpQ73PUnkOlSxMfUHYW7f1J
         gwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo8u1z4zfqRXaLNK48GuTklM6s7DhbtPT0HrsAE/5bcTitL4QLQPA5ykbYjYZ6N1SCyNh7x7feY/W4@vger.kernel.org
X-Gm-Message-State: AOJu0YzBSS+E6A8DbRCdK691aU+aYS4zHgj/S3MnQuTI1OcuA5+jrBTn
	Yj4VD12ZeycIfDhQY+7WQomiVwdEyGH/jeHNvu86EgDEMm9/2Em6qw7Z5iBR7AIffCIUVBwQ3R6
	XQwMRpfW92Oe7ap7o8yJonXh6p0ADP/+BrQy7W2pwug==
X-Gm-Gg: ASbGnctrxi/ZtsOBvFA9LprTN7IApxndQKrMCyFjbJV0aYERYhNMkyeOe8qhyUz2FIx
	Rb8aGpActOFFPjfCXCyeI+oOXEoPeJ2JDInCdHyRFtFHxcrgOCW+3mtyYpigWs4j7fRl8SHjDHJ
	sygzXGHY8yLc1KP2zQ4+KS9lRmItAWAk4NSvgiB+ktr8IL
X-Google-Smtp-Source: AGHT+IE8T8YQqjuX2RPIqOvp84NFBEnBd2nf0HMGfblzPzNNFCpE1rQMJhmR6YAjwyaBmt1T2phZME3iCUpiJakAinM=
X-Received: by 2002:a05:6902:230d:b0:e81:78f7:5532 with SMTP id
 3f1490d57ef6-e842bd1787emr15542569276.46.1750679618337; Mon, 23 Jun 2025
 04:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750156323.git.benoit.monin@bootlin.com>
In-Reply-To: <cover.1750156323.git.benoit.monin@bootlin.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Jun 2025 13:53:02 +0200
X-Gm-Features: AX0GCFvg50-pG60deTth1xrFtJ6E3jTjfDgX9C52hAY0wmcdIa--eh2NYl1Ihyo
Message-ID: <CAPDyKFqy54LpU2HxKX75HUKNcis06C5aMC8NUOW37ws0QiTOdg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add MMC support for Mobileye EyeQ5 and EyeQ6 SoCs
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Adrian Hunter <adrian.hunter@intel.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Jun 2025 at 15:26, Beno=C3=AEt Monin <benoit.monin@bootlin.com> =
wrote:
>
> The MMC/SDHCI controller found in Mobileye EyeQ5 and EyeQ6 SoCs is
> based on Cadence cdns sd4hc IP. It supports up to HS400HS mode. The
> only peculiarity of the hardware is that it needs the preset value
> quirk to configure the clock properly at speed slower than HS200.
>
> This patchset adds a compatible device tree binding to cdns sdhci for
> mobileye then uses it in the sdhci-cadence driver.
>
> It also adds an emmc entry in the dtsi of each SoC and the config
> options in each defconfig to allow using an eMMC for the rootfs.
>
> Beno=C3=AEt Monin (6):
>   dt-bindings: mmc: cdns: add Mobileye EyeQ MMC/SDHCI controller
>   mmc: sdhci-cadence: add Mobileye eyeQ support
>   MIPS: mobileye: dts: eyeq6h: add the emmc controller
>   MIPS: eyeq6_defconfig: add cadence MMC/SDHCI driver
>   MIPS: mobileye: dts: eyeq5: add the emmc controller
>   MIPS: eyeq5_defconfig: add cadence MMC/SDHCI driver
>
>  .../devicetree/bindings/mmc/cdns,sdhci.yaml   |  1 +
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi        | 22 +++++++++++++++++++
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi       | 22 +++++++++++++++++++
>  arch/mips/configs/eyeq5_defconfig             |  2 ++
>  arch/mips/configs/eyeq6_defconfig             |  2 ++
>  drivers/mmc/host/sdhci-cadence.c              | 11 ++++++++++
>  6 files changed, 60 insertions(+)
>

Patch1 and patch2 applied for next, thanks!

Kind regards
Uffe

