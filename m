Return-Path: <linux-mips+bounces-3302-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA68C9FB9
	for <lists+linux-mips@lfdr.de>; Mon, 20 May 2024 17:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CB3E280CD6
	for <lists+linux-mips@lfdr.de>; Mon, 20 May 2024 15:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB35A136E21;
	Mon, 20 May 2024 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="osh0pZEi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A776AFC01;
	Mon, 20 May 2024 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716219226; cv=none; b=KFdSgIusr3pGk31ScFqMswyXu5QXUnXcf1BC4trytm0bWw23G6IOuN6mHtLAc/eIm/3Zi8JxGIGYlZXlO7PccgBaFgh4wO4kOz7feZTLbg6G02eVou7h5zRhPLpNoP9Ypkkjp4g7YQKhwd5hMIiwb6vlYB0mwbjFqzBlqj0rZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716219226; c=relaxed/simple;
	bh=rQMWP962e6Sxt6mbk/SRohCyTNQpGXCJTddT2Gn7Ftk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZRcfcqpzv9WUjzFgdY7XSuSNYTVdMwjopfE1UihPjwR0tfjSzU4es5und1YMMKkJbeDPXzvL0cS1Rkrx4GuvJ5tNhRpSOarHDYa63aUqtdXqtJZBixm2dWFSX1NoWwLqXmqXYTiiXtYxl+svG/JMxUklZ9OKLMPVDOIGxYehWvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=osh0pZEi; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 027D7C16D2;
	Mon, 20 May 2024 15:33:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 311121C0005;
	Mon, 20 May 2024 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716219207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQMWP962e6Sxt6mbk/SRohCyTNQpGXCJTddT2Gn7Ftk=;
	b=osh0pZEiKz2NLzJhXOamqtbb7XdoPCcycfzd4Iwdlgqym12zVGghQ/4577puKxdno8AiFL
	UItSjOjdlus1zIt0IPRhtfE5PicJBuTuh+omti0iVO+mseJ4ZHrdZ+Ch0KzBRHiHm9iFSU
	/vjEum4wC/Tj7r5XPHnMwU8UOrXwLbbnHu6iL3zm+jcO8EQbNDD7qDv7jNOjUMHJ+cZP/b
	4+sgesKYE1zz/vhBXJj48Jd2OQTc/FJ3uTnEzrm33QwQGGnqJNhaq0GOGnPYEf2wV2hIUm
	vxVMI/b43FHaxAKFF9wSXM+Nj5eHoJQtLpBn8Ayf4LQLTa8PYfjdsqKljwOklw==
Date: Mon, 20 May 2024 17:33:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/3] mtd: rawnand: Enable monolithic read when
 reading subpages
Message-ID: <20240520173325.79fee6a5@xps-13>
In-Reply-To: <CAJhJPsVOx_AZmsRuZ5jy2-wJ+7-Wm+8RQAJ_LhKGLU3aFzrR7g@mail.gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-2-60787c314fa4@gmail.com>
	<20240506091748.18c120d5@xps-13>
	<CAJhJPsVOx_AZmsRuZ5jy2-wJ+7-Wm+8RQAJ_LhKGLU3aFzrR7g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Keguang,

keguang.zhang@gmail.com wrote on Mon, 20 May 2024 18:42:30 +0800:

> On Mon, May 6, 2024 at 3:17=E2=80=AFPM Miquel Raynal <miquel.raynal@bootl=
in.com> wrote:
> >
> > Hi,
> >
> > devnull+keguang.zhang.gmail.com@kernel.org wrote on Tue, 30 Apr 2024
> > 19:11:11 +0800:
> > =20
> > > From: Keguang Zhang <keguang.zhang@gmail.com>
> > >
> > > nand_read_subpage() reads data and ECC data by two separate
> > > operations.
> > > This patch allows the NAND controllers who support
> > > monolithic page read to do subpage read by a single operation,
> > > which is more effective than nand_read_subpage(). =20
> >
> > I am a bit puzzled by this change. Usually nand_read_subpage is used
> > for optimizations (when less data than a full page must be retrieved).
> > I know it may be used in other cases (because it's easier for the core
> > in order to support a wide range of controllers). Can you please show a
> > speed test showing the results before I consider merging this patch?
> > =20
> With this patch:
> # flash_speed -c 128 -d /dev/mtd1
> scanning for bad eraseblocks
> scanned 128 eraseblocks, 0 are bad
> testing eraseblock write speed
> eraseblock write speed is 2112 KiB/s
> testing eraseblock read speed
> eraseblock read speed is 3454 KiB/s
> testing page write speed
> page write speed is 1915 KiB/s
> testing page read speed
> page read speed is 2999 KiB/s
> testing 2 page write speed
> 2 page write speed is 2000 KiB/s
> testing 2 page read speed
> 2 page read speed is 3207 KiB/s
> Testing erase speed
> erase speed is 72495 KiB/s
> Testing 2x multi-block erase speed
> 2x multi-block erase speed is 74135 KiB/s
> Testing 4x multi-block erase speed
> 4x multi-block erase speed is 74812 KiB/s
> Testing 8x multi-block erase speed
> 8x multi-block erase speed is 75502 KiB/s
> Testing 16x multi-block erase speed
> 16x multi-block erase speed is 75851 KiB/s
> Testing 32x multi-block erase speed
> 32x multi-block erase speed is 75851 KiB/s
> Testing 64x multi-block erase speed
> 64x multi-block erase speed is 76204 KiB/s
> finished
>=20
> Without this patch:
> # flash_speed -c 128 -d /dev/mtd1
> scanning for bad eraseblocks
> scanned 128 eraseblocks, 0 are bad
> testing eraseblock write speed
> eraseblock write speed is 2074 KiB/s
> testing eraseblock read speed
> eraseblock read speed is 2895 KiB/s
> testing page write speed
> page write speed is 998 KiB/s
> testing page read speed
> page read speed is 1499 KiB/s
> testing 2 page write speed
> 2 page write speed is 1002 KiB/s
> testing 2 page read speed
> 2 page read speed is 1554 KiB/s
> Testing erase speed
> erase speed is 76560 KiB/s
> Testing 2x multi-block erase speed
> 2x multi-block erase speed is 74019 KiB/s
> Testing 4x multi-block erase speed
> 4x multi-block erase speed is 74769 KiB/s
> Testing 8x multi-block erase speed
> 8x multi-block erase speed is 75149 KiB/s
> Testing 16x multi-block erase speed
> 16x multi-block erase speed is 75921 KiB/s
> Testing 32x multi-block erase speed
> 32x multi-block erase speed is 75921 KiB/s
> Testing 64x multi-block erase speed
> 64x multi-block erase speed is 75921 KiB/s
> finished
>=20
> The throughput of the former is twice that of the latter.

And what is your NAND controller driver?

subpage reads are used when you only want to read a subset of a NAND
page.

Otherwise the core may use the RNDOUT command to change the pointer in
the chip's SRAM to read from a different location, but I don't see what
is impacting so much, unless if the driver implementation is really
sub-optimized.

Thanks,
Miqu=C3=A8l

