Return-Path: <linux-mips+bounces-5098-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C96A995ECA8
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 11:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FC771F21083
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 09:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FC713A26B;
	Mon, 26 Aug 2024 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ayWo4hMk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5683984047
	for <linux-mips@vger.kernel.org>; Mon, 26 Aug 2024 09:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663163; cv=none; b=gvBOEbvtaatRzq9toE+APSDZSHabTvzI9qRnvuTX5nsk3cTm6ILrwIICnoiMxfbDgUbpGm5e/xp1i/+7/DNNLEGN9rCiREoWvGbMw2AnjQnHVJIxfslP1lSuw9cfXP/LAg5a10euIwD/b7S8tnocrpEPbgCdWLDratkx1bQyAzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663163; c=relaxed/simple;
	bh=qW8EijmVm1rza+kNNB97HdDBr7sQU1x4Yvhm4lOhCX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XkNIp4wZuKGrTAS0ABWgj/SlPkKjsXB8zeDmFXdH679jrbBK8r4Onj6lWE1D0ILR5Tn10YjPze/y11dghaI3yumgvBiKoRuLAbojEjEIb5+Nx3g/dErHtRmnT2/+q173FacAp3+XLHvp0fCLxvXud/ThG30UM2e20sl2uompyb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ayWo4hMk; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53345604960so4317926e87.3
        for <linux-mips@vger.kernel.org>; Mon, 26 Aug 2024 02:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724663159; x=1725267959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW8EijmVm1rza+kNNB97HdDBr7sQU1x4Yvhm4lOhCX4=;
        b=ayWo4hMk78fDPJG1y0DRcbXNx1kerwKllexBp1J0WdfUrBzF05Ne7jio2EPujnEkPM
         5CkWiLjz0Uzodhy1ujjMlWPvzReQ1sMFjPkfJ9Yg54HV94BRW5UtMaLQt3UhK9w0N9Wv
         VvuztZ7S3S3iHp1ULFiRj8yU8tczmMjzdqmYAiP1ra9nNqNi8o4gjdrb4jk3QaU9rtJO
         c70rnmt59lBRMb+TLx3JXzD7vAIprWZBSPVbVmG0fc3HoiU3jXjHGBHwyx++WBIlIYy3
         MhGGoph/Agb+xGyXpmRf2u1Qx106JoUdext/FG7iey21gJWXC78SHKy3YlLr86B+JkIT
         8cBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724663159; x=1725267959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qW8EijmVm1rza+kNNB97HdDBr7sQU1x4Yvhm4lOhCX4=;
        b=CgvVk9akThT1/NB49xhoP/PXz5ITpKTWuW/jm2tokBVXeTSuBvGh0XOeYo2iGDtWi8
         oMrRRVjW26oYMG4Zj9LYaEofGEfrXx5Jq4nvyfvN0eSutNZ/wNVEBhftvVOO0nG4KtpL
         55QVWAHHTJzTl6+qHfBcL2Ej1XY0u6WrstTlb3oHNZs+VtFppsomAvgrgEEw+vT0eX/A
         vur6U1j0rKZJC0VUstuNLyjN1vX518tzPs73oaWdj+xsvadfTa3pM0mKwmsngjGSZzac
         QskFhNc+VSzfbM2AfYLmfPT4PP3jJh20fYK1z/Qm9ze3v8AreOE4+avRD+dU0Wrt83lQ
         rg0A==
X-Forwarded-Encrypted: i=1; AJvYcCWnA+XzRsXkangJTExNZdt736YvufWpHrEB2ehJKwUcNc8C54EnhfwjWRX+Qc8LUccCi8QuxyE5NJ6s@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrov2ZQVuWy/hHKLolAnvUhQ2N3lofS/tBd2qpzPFgG791R+E/
	S61PSAcEFM7rqo0ftE0Y34i84mBBL15h8+ZBsaHGkEtE811KvulUNZ6reRaFpVSXYopGOojZlUN
	Iy16Ec17QhD5y6em8V8yViwRrwvcCSuJm57hElQ==
X-Google-Smtp-Source: AGHT+IF/3IUNaHnmorHMH5XepQP0dhFxmpJOrgPR3PtJ3vmSYH5kfLJ8JW9NGorL05eVqsfIP8s7xNubchE9N82j2mw=
X-Received: by 2002:a05:6512:3987:b0:533:4e2b:62fd with SMTP id
 2adb3069b0e04-53438773badmr5857030e87.18.1724663159221; Mon, 26 Aug 2024
 02:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEwRq=qhHBh5jKdLGb1r2Qem0jia=xcVdevihYfjdrLSYiZuiA@mail.gmail.com>
In-Reply-To: <CAEwRq=qhHBh5jKdLGb1r2Qem0jia=xcVdevihYfjdrLSYiZuiA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 11:05:48 +0200
Message-ID: <CACRpkdZFQSN_t-Vx7xOXq0aF6Vf-XvsZKGF6yNMn7_dCeaZi_w@mail.gmail.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
To: Vincent Legoll <vincent.legoll@gmail.com>
Cc: arnd@arndb.de, aaro.koskinen@iki.fi, alexandre.torgue@foss.st.com, 
	Andrew Lunn <andrew@lunn.ch>, broonie@kernel.org, dmitry.torokhov@gmail.com, 
	gregory.clement@bootlin.com, jeremy@jeremypeper.com, jmkrzyszt@gmail.com, 
	kristoffer.ericson@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>, 
	Linux Kernel ML <linux-kernel@vger.kernel.org>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Nicolas Pitre <nico@fluxnic.net>, nikita.shubin@maquefel.me, 
	ramanara@nvidia.com, richard.earnshaw@arm.com, richard.sandiford@arm.com, 
	robert.jarzmik@free.fr, sebastian.hesselbarth@gmail.com, tony@atomide.com, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 10:47=E2=80=AFPM Vincent Legoll
<vincent.legoll@gmail.com> wrote:

> It looks like the highmem feature is deemed for removal.
>
> I am investigating the loss of some available RAM on a GnuBee PC1 board.
>
> An highmem-enabled kernel can access a 64MB chunk of RAM that a
> no-highmem can't. The board has 512 MB.
>
> That's more than 10% on a RAM-poor NAS-oriented board, probably worth
> the hassle to get it back.
>
> I built & flashed a current OpenWRT snapshot, without any modifications,
> wich gave the following output:
(...)
> The lost RAM is back usable.
>
> Is there an alternative to CONFIG_HIGHMEM to use that RAM chunk ?

Userspace can still use it right?

The approach we are taking on ARM32 (despite it's.... really hard) is
to try to create
separate address spaces for the kernel and userspace so that in kernel cont=
ext
the kernel can use 4GB of memory as it wants without the restriction of use=
rpace
taking up the low addresses.

This looks easy until you run into some kernel assumptions about memory bei=
ng
in a linear map at all times. Which I am wrestling with.

Yours,
Linus Walleij

