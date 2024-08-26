Return-Path: <linux-mips+bounces-5108-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB795F445
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 16:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7DE01C21F1C
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 14:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24209186619;
	Mon, 26 Aug 2024 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNNRUpr4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0133146A71;
	Mon, 26 Aug 2024 14:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683593; cv=none; b=F9Rvnqpz6PeuvBzFgQ9QyLtmJM+kvSGFMkN7+yQN4Emy7kaf6AfLEwgxn1cLpiDh8Lj0pNh9nm4fCw0hm/rcGPxJ06ZC20VSTA4m9ZUUshf78/n7vRwsBhx3Tv493q0P5jLzI7hUxBwvJS/qp7vfobnJjJpMB2Isfv6mjZru+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683593; c=relaxed/simple;
	bh=YzS6gB98ZeelMVSN6d/5mjtpnjygRulORC0qA7J1UUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH4zCB9oESwUhFhH1PgB/1OG2lTrlD43K9xDsP1tMu//lW/202ds2HvDVSVEBvu1699rLds5snI0fNx+t0bLvlb3LvFwLKsPHer4FIRb6YjO9C4IVAmlBAXpYCR7PAWZ9C1125FoNu8Pxj7TFqg28CL6HwwW2ZVOzeQMmwGf2xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNNRUpr4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805DAC52FD4;
	Mon, 26 Aug 2024 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683592;
	bh=YzS6gB98ZeelMVSN6d/5mjtpnjygRulORC0qA7J1UUs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HNNRUpr4n3wewGjcDJFQlZq5WAplRZa1e2So1SAWtZMWbZYAztYRKOtdAjFONMWzc
	 KijwdqeAP7Ywa7zjq+0jtC33Q7onHZRmPywoOz66JhFfo9uIVuwHRNLZfouGgoxwj8
	 wQfQdIcx5M1RpkUiqbXqYQKwX62IT+9A7kYB1yHtxNxeBf5BBsYp7+63KSRjx1y+m5
	 5bjJdkNPirxMSg70bf6ZPXNwC6pkZ8rSZ7zgkwCxJY/bruLoj9VodcmTV9xeDz2hSS
	 jy/LxY18w+fJ9s/7ahLpnJzba9VrbLtV7GNWnjFyMtrIKEV4i4LtMKg+zuNuygLDV3
	 s3h3mjBpXrfQQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f025b94e07so41008851fa.0;
        Mon, 26 Aug 2024 07:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVi4Z8LaanX/mZ9Z9Ho5e6VVmnKsFrCa0uDKloqt9EmgJrZeKbpE3t1gybdbOkjU7VlLVnwktqE/LV2Zq4=@vger.kernel.org, AJvYcCWfEfsHfFomYdgyIYKRDyB9+g0xRjr9fzIguJUyPHO11bIzrf3knFef+nmuuMwoSnbCcZYWD3HFGCx2rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpEclcgDGnMJQM1sgtDxOfB0EiyOo3n6Wra6mPxbo+SeLYYidR
	LgbeqlZ0RN7Dcwg1KVbSUxZanYogmK6/v6elkVO7IioACJ2sGeAZ4i2Zfr3xwX8Z9synlXd34/R
	9oL+ECUkpYfTCNFAVrjWEWxdJZoU=
X-Google-Smtp-Source: AGHT+IEsK4+/pRQ7WMQvKX7rE430khXmjyVlzpXPQ80gxfhiMeT9RLXVdXtgcErItruf8gd/LeG013ZFT7wncs1V5XI=
X-Received: by 2002:a2e:bc14:0:b0:2f5:839:2982 with SMTP id
 38308e7fff4ca-2f508392ad6mr36137861fa.12.1724683590850; Mon, 26 Aug 2024
 07:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821101153.2262290-1-maobibo@loongson.cn>
In-Reply-To: <20240821101153.2262290-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 26 Aug 2024 22:46:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6tMB9ASYFTdRBEFL0tG1jpjaa-iGRGBuUKUu=sCqxJ2Q@mail.gmail.com>
Message-ID: <CAAhV-H6tMB9ASYFTdRBEFL0tG1jpjaa-iGRGBuUKUu=sCqxJ2Q@mail.gmail.com>
Subject: Re: [RFC 0/2] irqchip/loongson-eiointc: Add multiple interrupt pin
 routing support
To: Bibo Mao <maobibo@loongson.cn>, Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jianmin,

What's your opinion on this series?

Huacai

On Wed, Aug 21, 2024 at 6:11=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> There are four times about EIOINTC_REG_ISR register group access in
> eiointc irq handler, in order to get all irq status about 256 interrupt
> vectors. It causes four times VM-exits since eiointc register are
> software emulated, here multiple interrupt pin routing is introduced
> and each 64 interrupt vector is routed to one interrupt pin.
>
> With this method, there will be only on one EIOINTC_REG_ISR register
> group acces in irq handler, it will reduce VM-exits.
>
> Bibo Mao (2):
>   irqchip/loongson-eiointc: Route interrupt parsed from acpi table
>   irqchip/loongson-eiointc: Add multiple interrupt pin routing support
>
>  arch/loongarch/kernel/irq.c            |  3 +-
>  arch/loongarch/kernel/smp.c            |  2 +-
>  drivers/irqchip/irq-loongson-eiointc.c | 66 +++++++++++++++++++++++---
>  3 files changed, 62 insertions(+), 9 deletions(-)
>
>
> base-commit: 1fb918967b56df3262ee984175816f0acb310501
> --
> 2.39.3
>
>

