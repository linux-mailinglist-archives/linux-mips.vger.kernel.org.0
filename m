Return-Path: <linux-mips+bounces-1235-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6884491C
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jan 2024 21:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C55EE1F251AC
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jan 2024 20:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D28383AA;
	Wed, 31 Jan 2024 20:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VO2ox0YB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD69374DA
	for <linux-mips@vger.kernel.org>; Wed, 31 Jan 2024 20:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706733895; cv=none; b=THzTDMJdTiQytijObH04r5F3K4rFpQuHl5eE6hxJodpHGMDPlqEmBSxpFlR+Q2r1/JWo+HLLJfstpNfqV5nAMbmQ6blvurpinq10oGyvaubp0LSN3eTu7yhLr7o+Llu8TYLXzP7UIhxo6XndTu0F3JvFgsCV+b0X+fG1ekU79DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706733895; c=relaxed/simple;
	bh=+Aepf8sdCd8G//RlCha5XYDrJRIchvN1hEFdOszOu6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1Tms+g6pi3bLPNcMTn26JY8UcrD6Vz2aMXSAG+T25gjaF6AHSwgkipIAasY1TGsKZCXNHCQ0PjST7z3GJEh2LykaQOQaGJlRwzgtEZ7VqW0hUsWfWUkR8PxDiQgHRiuS4/XPFikvZRa6TR8zwLqRM0teNyQljdjIT9Wxzb28lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VO2ox0YB; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5ff7a098ab8so1811347b3.3
        for <linux-mips@vger.kernel.org>; Wed, 31 Jan 2024 12:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706733893; x=1707338693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Aepf8sdCd8G//RlCha5XYDrJRIchvN1hEFdOszOu6g=;
        b=VO2ox0YBjiSG31RTVbeDI2z1IFZxNfm318i+xgL9o0l6lV1eQuIHpPdz7DgUERgFkq
         JesaQHiT+pdJ00vk7VIA9ZYSn7Ddetwo5NCyYLT4Oc3dTpAM4wnBHW2CnR4lBQmbeqc/
         Pp7G4hh1vNQSdUpAT0CpGcW09XxpiyqDwWZHkWXXh9mNCqkjfpOybDmPGqaLIv8qggiD
         k8g22wwpuCPKkqgA61s9zFOzazpMAIUG5JImyfkl34cfbt0foudlH+sOLcS74K9hTgau
         riDWmSyla8hspJQr6jB6S/rSpfvN/CxX7f0exXsHdlD4PcttPowt4MwhZOZ9Gz0Av2Rj
         xk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706733893; x=1707338693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Aepf8sdCd8G//RlCha5XYDrJRIchvN1hEFdOszOu6g=;
        b=CtHzXdmqoECeKtpPsw/saMiSbzAGlkGcvMCQtChwaGptlvfn8gerywF2SDT/C6Amq6
         gHV3IkUrpNcYMnKk4LiJzOiKAznrXNtRvLvjny2Spmcny8HiU/g0QSL+2oLBloZro5/T
         fN8P4bpxqzQLpEgHUuhOeHK1ibTK+No+/Urny+i33hnYJEB7FhaIQe2p1WMjuUf51H92
         MYFdOJrowldfSv9mj64yKEH23bO1cFOY2oar/+D3Xlmrwp1kSTbrJHrfEG8v7QSFd0x8
         ALuUg98SxyPsccmguhteHLaNeMQrl+hxVCxXbh4Iku35jEHvun44dK0plxb9rgWazWEc
         JmhQ==
X-Gm-Message-State: AOJu0Yz8Ry2bg0UNldDe8GA5tEl/CX6wTO2tpUilYVEAUfyl3NudvuvU
	GjjEOBF3OWuN6zgiO60oJlI7aNDeRzBU3cP2IQW7IqePMv8tyL2O6yHzJO9IUuD6Pck1oYAes30
	JS4F9UFrsr+u0ZV5NBgdOgeSOa6vPsoIjYSVH5g==
X-Google-Smtp-Source: AGHT+IHS/WgJih0pA4PCi6jtXXi0NvvqNNRcB0nvYJUMQTqgkNEy0vEgAEVs0YIeJ1unhWTazFjP4rw+Sm0vCsAVTlU=
X-Received: by 2002:a81:4950:0:b0:603:fd67:a5aa with SMTP id
 w77-20020a814950000000b00603fd67a5aamr1871650ywa.19.1706733893289; Wed, 31
 Jan 2024 12:44:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131-mbly-clk-v4-0-bcd00510d6a0@bootlin.com>
In-Reply-To: <20240131-mbly-clk-v4-0-bcd00510d6a0@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:44:42 +0100
Message-ID: <CACRpkdb+aWL-NU36dF6urL3T9gUROQX=9-L7aUC=+GM8x+bArA@mail.gmail.com>
Subject: Re: [PATCH v4 00/18] Add support for Mobileye EyeQ5 system controller
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Theo,

thanks for your patches!

A *new* MIPS platform, not every day I see this!

On Wed, Jan 31, 2024 at 5:27=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Pin control is about controlling bias, drive strength and muxing. The
> latter allows two functions per pin; the first function is always GPIO
> while the second one is pin-dependent. There exists two banks, each
> handled in a separate driver instance. Each pin maps to one pin group.
> That makes pin & group indexes the same, simplifying logic.

Can the three pin control patches be merged separately? (It looks like.)

That would make my job easier when we ge there.

I will try to look closer at each patch!

Yours,
Linus Walleij

