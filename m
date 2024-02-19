Return-Path: <linux-mips+bounces-1561-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEE185A677
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 15:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAD4B283C92
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 14:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F445376F6;
	Mon, 19 Feb 2024 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DqDohTbf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF1336134
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354409; cv=none; b=b0ExP3LBv5TLx1zNpbSsIfXJkJsgE5Y4VZvcOZduXqWG14F36McgpNJuFk42FSpVNlglTOuWLPaOEm/5RVQhbjth7LPtch9ALba3aJedGSPnzcwmhp5LT6JOuAf53IQpnC95jCo92vw7x5MrF0FKafWqaXDJRLV3WZansbtcWcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354409; c=relaxed/simple;
	bh=zMctZEwS487clYI69wTjBZbHwKLOIJfqLcoi9P7jP1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZ28vgWCJwkHq/Wd+iPkBJ2rnqY7PDUqWBTJou2sb+Q/kiT3s1ZQNEGB94mefsAGv/VEvSocO6/Zb0g8aNV0sMbbAdz5S52bQcLphromF8bETu+sYuiTOhk+rRCDUCxapVvAp7LVtMulRU4TxTGIZ+ZyQQ6z80x2zAilWX3DVFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DqDohTbf; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcd94fb9e4dso4464845276.2
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 06:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354406; x=1708959206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMctZEwS487clYI69wTjBZbHwKLOIJfqLcoi9P7jP1k=;
        b=DqDohTbfO9dq3v2fymtmMv0A7OPJ2Mnc1HXqKmScqdsCV1QikH7VM3HAmsuFcdtZA2
         bTJvPadbXostf5R1og7+VmVurwlfdPFR0ynt51b9nSrdqRPUGAxOlVMAPbQgOMu3DeLG
         NtoSDCu8jjCZkkpf4A4b42qMzP4gIoPAzBKge5G4laxVAo3jO+Y341Yc+OAcr2e1/iUa
         jTAOXC9wNzXdK+ZhYa3ihcwv9aFJwBBJ1aw33sKvOe6k9qyNWliCFfaN158fWqxku7b3
         8RbmXke7NnQsEymwBK+WxeBgo+4qIU4ltDvAsVORbL5u2FJ953mkF05FrckueNRuxoHO
         r75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354406; x=1708959206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMctZEwS487clYI69wTjBZbHwKLOIJfqLcoi9P7jP1k=;
        b=qvZEoBvB0Wpe0xtwrk9I3t6e4F1vLRy6ucMiqe5eusnemDlEblxss1pZVgyKL/vn0R
         5UTB5/kWaJixczKbXgDms0q54YwhjPMh+8WKWgRm8Znp1DOyKZeCYEEjc3HUFvZzC1ry
         1tMiAf7MHpnjoEGGn8WAO2AB8c47r79o2oxKqeKT5SA73LVRB0pgvAAtC4/f8r0gOS+E
         f91bKDqPbzmpgbVPA4effC96Q6yAjwMYJ/AqqYaxj88Sed3OFenbk7If2XWI1orGWZPu
         rRW2qIoJi0+54sXhzZMRLHgKNmMLAW0tJUHDcWNR9S8qRrhksi7m+jeGqyr8ICDR7eiw
         4bhA==
X-Forwarded-Encrypted: i=1; AJvYcCWunCQWXcXfwYpwC/B8T6F2kxNsKZQGt+EP85PuczQOkCuuPLmF9r1TGhZ7RbHVVGtT5YMHviWKPeSlrn8DG6QZIgTAV+K3pPNN4w==
X-Gm-Message-State: AOJu0YxkDkpaQvxd28HsRCxMgzB7ulk4QYYcOFq/yccw+kdsFoCiWeWg
	C+qdPoPY2+QjNdPxpzKgrOWWvOp8xLWVFrxjRl1uL45F7IyFwsNMyAMkW3aRKR5/kWJS1whsh5r
	+gQmS5x9Y2EBP5quTwaonAUhvJaTFcWoAXiM0afIukVSuQUMqisg=
X-Google-Smtp-Source: AGHT+IFjLqSGFbIDvH5cX7ed0opXwPcuJwCD0Xc+ptPIjerX33CSAOO/7gjxJZTJd7jLjzTB0GTLbynGAuFaWNVORRQ=
X-Received: by 2002:a05:6902:2405:b0:dc7:47b7:9053 with SMTP id
 dr5-20020a056902240500b00dc747b79053mr12979596ybb.15.1708354406642; Mon, 19
 Feb 2024 06:53:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-8-19a336e91dca@bootlin.com> <CACRpkdbuTX50syD0CMFcZXBmAHw4nwpcSc-C1OOUQEA9WHqCwA@mail.gmail.com>
 <CZ94S0SE0WFN.1RS0SY3KNMWQQ@bootlin.com>
In-Reply-To: <CZ94S0SE0WFN.1RS0SY3KNMWQQ@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:53:15 +0100
Message-ID: <CACRpkdaVCOB_C45KTEtuoZRwb66x1saGHN3A_ZpY7T=a8YtV+Q@mail.gmail.com>
Subject: Re: [PATCH 08/13] i2c: nomadik: replace jiffies by ktime for FIFO
 flushing timeout
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

On Mon, Feb 19, 2024 at 3:38=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Somewhat related to this patch: while writing it, I noticed the total
> timeout of flush_i2c_fifo() is 10 times the timeout. Without this
> series, this means 10*200ms of busywaiting!
>
> If you have an opinion on a more sensible option for this I could add a
> patch to my V2. I don't know enough to pick a sensible value.
>
> I'm unsure if it makes sense that the timeout of flush_i2c_fifo() is a
> multiple of the transfer timeout. Does it make sense that those two
> timeouts are correlated?

I have a *vague* memory of the timeouts for flushing needing to be longer
but I might be mistaken. This is probably a Srinidhi or even Sachin questio=
n...
Sadly I don't have their current mail addresses.

Yours,
Linus Walleij

