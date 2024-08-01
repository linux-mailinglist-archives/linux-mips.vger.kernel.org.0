Return-Path: <linux-mips+bounces-4651-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EAF944902
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 12:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20EFF1C21BF5
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 10:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C8E172BD5;
	Thu,  1 Aug 2024 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1duKZfa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A50E184539;
	Thu,  1 Aug 2024 10:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722506830; cv=none; b=hvy8wvUbe9yKu7rPh8SvDdFVwGmtS8XGWD/Coc9/BxwJeKYQ/TBVKqGeDJiuvEoDr4lsdRrMm83E46wcnfc5II4hBBoV60Uegc6NQ86uO2zUIDsikUKzXePVHiQTx5C4R1xj9wfkn8ElQ9hzvgzjRV2VMkLVyvtv4fko+9l6R1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722506830; c=relaxed/simple;
	bh=9vSY6lydLkfNDrrATRB5SSKr4Pg3eOn4NQvD8VeqDqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1G1puxQEeplSfLsSeXHkVtBtDmIFib/JkbeFUaLJfif9CuQO1wR0tR1LZ0VlFOv+32SdRvb1eBrcfxy1xgqN+VH8AXcdlhKb3dqMtZf+di4Ue6bg/2NzMnItksG2UKchlsAWgPIe7P0IeOET0cvpCYIkuBkd3XCdgwkhGH6WJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1duKZfa; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a1337cfbb5so11178055a12.3;
        Thu, 01 Aug 2024 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722506827; x=1723111627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vSY6lydLkfNDrrATRB5SSKr4Pg3eOn4NQvD8VeqDqo=;
        b=D1duKZfad4AFIkhnVxuYh68HJxA3Wb63QOKBqUrG9ykbVlqRfh+PmHlQ9Mrro3YfW2
         Qjstonc/GOVCkjhDHr9XkJpDiuNXZA+yhnSKfJ0UTp9AE2aNJ8yyvAFo7jNjyGLNqMUb
         MzW6fWPnP2lyUDIPHnyF3NgmwiS03LRWUql9bV4qZk5VlJsKJ/7X4246eiQG+h/05QkJ
         fD10xw3FoNZm/pjS5C8PVNOhN38pOLGA7rRaR/IXBmFoaQfy3iHEhOMzaBRXr5Vw+bQ0
         NK8+8B+BJaKUefBUKw5qUKempljIa8ljPFQ+tPTI0UaLU8eoi05+R6cOBG1MS9RO9Jnv
         x8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722506827; x=1723111627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vSY6lydLkfNDrrATRB5SSKr4Pg3eOn4NQvD8VeqDqo=;
        b=jCsXrDMyl7Iec++jQ1GfqghH1OrE5zm/MwNKAWa8HY7cAoO8NW1rBYpORV94TOcn7o
         0xUfUeyH42XrTjrcd3FOddcSETVFeqyYASrSd5tP1iMtGmgHD/a/7bNRmKwVYo/by9pS
         KK6SLgPdqm3NJcyqtHFjX5+ddxxNBqg/iWvhNmxFiZAXMKFUNS8BRZA5bemptBNhZDJu
         wxuJwBKaKJ3x1+6Kb86+wZFD/fIFNm1kwxkQx8ckh1RnCTIHGJ5zkmV7dCyliJbwHbrN
         p9TOfh/jwe1N9ATNMZf5kP69a+swrAgoCQV+GtNr5ieD7bhuZEXwh6JVY5j/u5qw8LNa
         jAtw==
X-Forwarded-Encrypted: i=1; AJvYcCXRh9g9iH/Mw1ioxtWzUrQU4RpxYRNWKP3XC/SG/7a23JJzc2qStqOSvULxYwkdx1HXsqF0QUh9mY3gWa+X4MOeSUxIUTkTg3qtmCl6ebiy3GBI9YV/cQA9rlYjRzPT7q5qQ7WqrA327WflP9VazASVzFCYASot6trHlW9HcTn3qgFFAqw=
X-Gm-Message-State: AOJu0Yw1XuRcSnaxEyr7SeQ7vQPGd4QFbq5BFzxubAo3+0pqRevONncW
	RkeDt+awV0c5uzTfTkhLp9DMlygwuaD/30FN6AzqllLf3//UCIQHwlv9Jw0S9ifBGsXBlwlBmBR
	GgLLO7GBnocxeQT1U4FaI2LRe8NA=
X-Google-Smtp-Source: AGHT+IEtvdEGMEdlpwj3fZzWkXiTreBRhSwXUsC3Ll4UR5KrAHhq3dJbqwzS/CodcHNC4Ebn20/zdzul4iKt8ZqGaUU=
X-Received: by 2002:a50:ec82:0:b0:5a0:d481:a22a with SMTP id
 4fb4d7f45d1cf-5b6fe82383emr1267700a12.7.1722506826299; Thu, 01 Aug 2024
 03:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
 <20240430-loongson1-nand-v7-2-60787c314fa4@gmail.com> <20240506091748.18c120d5@xps-13>
 <CAJhJPsVOx_AZmsRuZ5jy2-wJ+7-Wm+8RQAJ_LhKGLU3aFzrR7g@mail.gmail.com> <20240520173325.79fee6a5@xps-13>
In-Reply-To: <20240520173325.79fee6a5@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 1 Aug 2024 18:06:29 +0800
Message-ID: <CAJhJPsWczs4o0Fj9+77r8jPcd4C9Hih5kxy=3X-3Tyz-0-3SDg@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] mtd: rawnand: Enable monolithic read when reading subpages
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry!
I admit this is taking a shortcut.
Will drop this patch and implement subpage read instead.
Thanks!

On Mon, May 20, 2024 at 11:33=E2=80=AFPM Miquel Raynal

<miquel.raynal@bootlin.com> wrote:
>
> Hi Keguang,
>
> keguang.zhang@gmail.com wrote on Mon, 20 May 2024 18:42:30 +0800:
>
> > On Mon, May 6, 2024 at 3:17=E2=80=AFPM Miquel Raynal <miquel.raynal@boo=
tlin.com> wrote:
> > >
> > > Hi,
> > >
> > > devnull+keguang.zhang.gmail.com@kernel.org wrote on Tue, 30 Apr 2024
> > > 19:11:11 +0800:
> > >
> > > > From: Keguang Zhang <keguang.zhang@gmail.com>
> > > >
> > > > nand_read_subpage() reads data and ECC data by two separate
> > > > operations.
> > > > This patch allows the NAND controllers who support
> > > > monolithic page read to do subpage read by a single operation,
> > > > which is more effective than nand_read_subpage().
> > >
> > > I am a bit puzzled by this change. Usually nand_read_subpage is used
> > > for optimizations (when less data than a full page must be retrieved)=
.
> > > I know it may be used in other cases (because it's easier for the cor=
e
> > > in order to support a wide range of controllers). Can you please show=
 a
> > > speed test showing the results before I consider merging this patch?
> > >
> > With this patch:
> > # flash_speed -c 128 -d /dev/mtd1
> > scanning for bad eraseblocks
> > scanned 128 eraseblocks, 0 are bad
> > testing eraseblock write speed
> > eraseblock write speed is 2112 KiB/s
> > testing eraseblock read speed
> > eraseblock read speed is 3454 KiB/s
> > testing page write speed
> > page write speed is 1915 KiB/s
> > testing page read speed
> > page read speed is 2999 KiB/s
> > testing 2 page write speed
> > 2 page write speed is 2000 KiB/s
> > testing 2 page read speed
> > 2 page read speed is 3207 KiB/s
> > Testing erase speed
> > erase speed is 72495 KiB/s
> > Testing 2x multi-block erase speed
> > 2x multi-block erase speed is 74135 KiB/s
> > Testing 4x multi-block erase speed
> > 4x multi-block erase speed is 74812 KiB/s
> > Testing 8x multi-block erase speed
> > 8x multi-block erase speed is 75502 KiB/s
> > Testing 16x multi-block erase speed
> > 16x multi-block erase speed is 75851 KiB/s
> > Testing 32x multi-block erase speed
> > 32x multi-block erase speed is 75851 KiB/s
> > Testing 64x multi-block erase speed
> > 64x multi-block erase speed is 76204 KiB/s
> > finished
> >
> > Without this patch:
> > # flash_speed -c 128 -d /dev/mtd1
> > scanning for bad eraseblocks
> > scanned 128 eraseblocks, 0 are bad
> > testing eraseblock write speed
> > eraseblock write speed is 2074 KiB/s
> > testing eraseblock read speed
> > eraseblock read speed is 2895 KiB/s
> > testing page write speed
> > page write speed is 998 KiB/s
> > testing page read speed
> > page read speed is 1499 KiB/s
> > testing 2 page write speed
> > 2 page write speed is 1002 KiB/s
> > testing 2 page read speed
> > 2 page read speed is 1554 KiB/s
> > Testing erase speed
> > erase speed is 76560 KiB/s
> > Testing 2x multi-block erase speed
> > 2x multi-block erase speed is 74019 KiB/s
> > Testing 4x multi-block erase speed
> > 4x multi-block erase speed is 74769 KiB/s
> > Testing 8x multi-block erase speed
> > 8x multi-block erase speed is 75149 KiB/s
> > Testing 16x multi-block erase speed
> > 16x multi-block erase speed is 75921 KiB/s
> > Testing 32x multi-block erase speed
> > 32x multi-block erase speed is 75921 KiB/s
> > Testing 64x multi-block erase speed
> > 64x multi-block erase speed is 75921 KiB/s
> > finished
> >
> > The throughput of the former is twice that of the latter.
>
> And what is your NAND controller driver?
>
> subpage reads are used when you only want to read a subset of a NAND
> page.
>
> Otherwise the core may use the RNDOUT command to change the pointer in
> the chip's SRAM to read from a different location, but I don't see what
> is impacting so much, unless if the driver implementation is really
> sub-optimized.
>
> Thanks,
> Miqu=C3=A8l



--
Best regards,

Keguang Zhang

