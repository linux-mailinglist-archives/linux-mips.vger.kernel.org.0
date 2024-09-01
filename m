Return-Path: <linux-mips+bounces-5276-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 282EF9678AC
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2024 18:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3E461F2123C
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2024 16:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4232317DFFC;
	Sun,  1 Sep 2024 16:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcauwPsS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D0C1C68C;
	Sun,  1 Sep 2024 16:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725208462; cv=none; b=ImHCBkZTwiYV2w9PzTYpxNoNCoIVssnCc6IZl88zbw+zb2dLx4HPuEu6jckAcZhNL4mhtFCAtQNAl/i1DbdV1E7wInXkWAz12ij1E1jYesm/8JIQb0JrzPT8Lwc+J9R0Ykk7dKt8Bbcc9+7n1TuG+A/eZtHydv2tbJNlJU03fa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725208462; c=relaxed/simple;
	bh=LfOHCToqCJQpzCFvErXcUgw6uiFYg4xX8oDJA6tq5S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifnG4KwYSr7PAJt9SC8r9ue/+vHctugzquCd1oYzx6ZsnrvN9AvVPiW1PhZUZJH+aQMFrhEiFnEQYJdMt5UPjtbdMivsfJXs9NkAY3sP2TYipasc7HEigoyuFbt+BjBr78pbMu5+9aln705MPLp1MGZKsz86BBYgBJvCQCTfPA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcauwPsS; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71433cba1b7so2440424b3a.0;
        Sun, 01 Sep 2024 09:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725208460; x=1725813260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfOHCToqCJQpzCFvErXcUgw6uiFYg4xX8oDJA6tq5S4=;
        b=IcauwPsSYMzRgq0sR96HywY1DsQEFtuXP19/UloAL31eAhXdDE7BK+NzXQ9LKleBTV
         GaQfVqNdDcJ8Gvphewf56u6xXlINOtVHfUCuomIOb94ao38slYhsueBoGnpMWhZYtuEk
         uXMWm8XpDLxUUkVeyxvgJlGL6rr3VU+pdQW27/62bsRzCh56BIIBy/ow994xPj147ADq
         DUCLN2ejA8wRfl+lGB+syqWbofCEmAYlrMdohGyWQjzo2z3UTIJMyqZ6UeNn0pBRSSwR
         6fGjXR3Qnq9VFIY6cAxX7Y7+2DEqagYfplfOjBdjYJE+akpBUwY714FlqUjGaitwAETb
         05Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725208460; x=1725813260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfOHCToqCJQpzCFvErXcUgw6uiFYg4xX8oDJA6tq5S4=;
        b=nB3UgVwlYmd+cDrXpL3erm5t4J0twfWoCzdW+R5dvaEbre/5rwhlJ5hgayhxrgyHxk
         Fn7Qf46upwyR256RUoMsf501jdWs2SJroEidomdLGFT96VSz8kwal0OaKhcaJuprBV4l
         iCh3I5xAWj91wkX0hAv7NXzJ3oJzo4vPal8ciG89sjcbfApIh/K/Xr+Re+FKZXNBY1Sb
         yq+E+OhFySdchF68ke/RhRukqNWdvsMWjIcTKRtJODWypM/VHdJHqaZnrVK0Lf9uHkt8
         cZ0TY4b//i/sKzA1Etywy5YIUC0pXF8w0S1y8W9mh8JyZPX5mPuwh/LrKw4rm54NP4UL
         SoVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyYKlaPrtqwbCQe0//JJH4/zRUlMdQhDPnCsdEN4F5aLxWBi0jQslzXxA7qePOqmavGYUEhtEZBF0aQqI=@vger.kernel.org, AJvYcCXvaZCc5+ZpuDk/guB8cupx4ccEHbJ4JlidmZAaivVD9Rtk3BSzK2ypT5xaUj1t5GNI59KjaEHGnoT47A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+gE7zqs7VUo+rYC4m1yjx3BarJHqY10qGOp5DreU+tLNObdTO
	FFmvyBeD97qPPrVcScx4MmjouC9krHf7zSObJMBtcG/aXqu3h0h+RsLyZks8PZknVCm4xfZDMBB
	j2VXlrFws2p87yZytI4LLKGCXpKs=
X-Google-Smtp-Source: AGHT+IF+YjIJUgZgTKVl/F6xoWlrij8Mno8NSN3vwjD6SW/WMix5BukBuDBnXmP02x+pPxQYkgnoJqql1xVKS6m/E40=
X-Received: by 2002:a05:6a21:3a44:b0:1c4:a49b:403 with SMTP id
 adf61e73a8af0-1cece5e24c1mr4431330637.46.1725208459923; Sun, 01 Sep 2024
 09:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEwRq=qhHBh5jKdLGb1r2Qem0jia=xcVdevihYfjdrLSYiZuiA@mail.gmail.com>
 <CACRpkdZFQSN_t-Vx7xOXq0aF6Vf-XvsZKGF6yNMn7_dCeaZi_w@mail.gmail.com> <35680bf8-d4f0-4b7a-b358-f71eb39e2a94@app.fastmail.com>
In-Reply-To: <35680bf8-d4f0-4b7a-b358-f71eb39e2a94@app.fastmail.com>
From: Vincent Legoll <vincent.legoll@gmail.com>
Date: Sun, 1 Sep 2024 16:34:09 +0000
Message-ID: <CAEwRq=qNqbXRPCqd-ukW9q1uNNJL9x42dBk0pHMEB_VCoV4W2w@mail.gmail.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, "Jeremy J. Peper" <jeremy@jeremypeper.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linux Kernel ML <linux-kernel@vger.kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Nicolas Pitre <nico@fluxnic.net>, 
	Nikita Shubin <nikita.shubin@maquefel.me>, Ramana Radhakrishnan <ramanara@nvidia.com>, 
	Richard Earnshaw <richard.earnshaw@arm.com>, Richard Sandiford <richard.sandiford@arm.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Arnd,

On Mon, Aug 26, 2024 at 2:55=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> What you see is certainly unrelated to me mentioning that we may remove
> highmem support from the kernel altogether in the future, but it's
> possible that OpenWRT turned it off because things work better
> without it.
>
> https://github.com/openwrt/openwrt/issues/13151 may explain
> what ios going on here.

Thanks a lot for that hint, indeed there is a solution, which does not rely
on `CONFIG_HIGHMEM=3Dy`, linked from this issue.

Just setting `HIGHMEM_START` made space available for that 64MB
RAM chunk.

Thanks

--=20
Vincent Legoll

