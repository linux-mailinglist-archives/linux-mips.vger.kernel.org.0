Return-Path: <linux-mips+bounces-7477-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E4A1370F
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 10:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 750A71630B3
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5A71DC198;
	Thu, 16 Jan 2025 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgFkV9wG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D660E1D90D9;
	Thu, 16 Jan 2025 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737021242; cv=none; b=cybnTJ0y/tUdC9+zuxyoGY2nK/ORdHyjv4Z5I2EKnM527zP0UAyv5xxHmP9PgNa2obZLbMnUp/gNltEgLWj5+LWQMGxmUA4d33Tln5tJvbROzAtFbiGCBKkQuDpkal0EXcv4sO/Jl8LNw4jk080p7KhOEvcoI0wrzLmhec7qtM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737021242; c=relaxed/simple;
	bh=JyR+wfZxK4lFWyjYj8o6RQk3gFO818WK57mIpCorr+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJqp7mjx5Yh/P2P3OfG/hRCSa/XY6JBEIzagm1WUDrHwkE350BPwVl6ZqpbHG7FhkG82t8Th5HHdu7ds24YM2ks9/PGwIuXUy8jvcRZ42eRHck+iiUtAnwFDNd/oG6bdx8PFsPGMMYig4jIX92gL4MjIZfqeqnyJc8MN+zUc1gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgFkV9wG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21670dce0a7so14816755ad.1;
        Thu, 16 Jan 2025 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737021240; x=1737626040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuSFYvZXxn8PXhpxdA1gEOJ0uoDbrIqgVeNP8SF6NIk=;
        b=ZgFkV9wG1KXJfFflpekSsiEAD533oGaReCHdKJMnwUV8/dXf4/tJI/UFaUHvTPJ6Gk
         GZoUgXYVi2JSJ1QjxoDD6Fxs6no4Woc51nf1kqy997e6guAwqOiPAw1YzvjnUH+ibClv
         2ANzrkZndcc++FQdx9vRHq5cFp+sH3Lse1PCYd3UETTX6w48x4GCb7I3sutEsWp5fTf/
         y3hPE86znevt+aeoOVxvybHpFKQIgT4O22NeA+7gKJYiVP0r9iFdleEg12NBduyD4qfe
         x9HUcUitcf+qkOgl+Q2zJFi6gP8yHehcBFtNGmEHDKlsYfj31yjeieE/KQd/I2Lxe7Zd
         802A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737021240; x=1737626040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuSFYvZXxn8PXhpxdA1gEOJ0uoDbrIqgVeNP8SF6NIk=;
        b=f/uGHw3shfYQZpL732O11gzbCKXPqrOpCw4uZaX2Vl9E8HfE58ktFVUjc2BeqhWHXx
         SaO/O2TfE28hinma/I9IAnbVwXUZ5CuCt9ffL2zDvBXPJZwFcz8KIOyMkMwD+Ibawk0Z
         0f2J+w4it/TCl6WrqRwb9Pd4xO/mksUFEOe3eWQ+7Tvi5SenJKFhB5AZ39/IwyjUrLTK
         ZR2lioPsDw0r7YlSCbROEGLBpr2IvUCDuGSweBToqZuTVxK6i1xoNu8iBvY1ZdBDrJ2l
         A5AfBkX4PHNglQWQiH5TB0FoR9TgRm1r0V4vuWE/HsPS1rZzbpOCOHChlXgrSzSyU8dJ
         zPQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNxYy8ZE7g8tZ8WlF1nDGxh3+uOQlZnxRyBSIShIh+z3TSCUm5+SZoIEp/5pVMtqSsKDBWfh5O1wSkLUrq@vger.kernel.org, AJvYcCVA3SBWrLKpiEn0qDu80SxHD5RavfCgbfoQURw3KyJio6dp/kjfovA55CxhYnYLBe7cIrhLPTL8C/1u@vger.kernel.org, AJvYcCW9YDAD8oD8Orv4WP7m6gpKbnON/Va651AbVrZ0Ufaj0sHnywrVLY/XB40+CQ8V3e0PPpfMDoObxXEjsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3nNRaXaDxuc8pt1J/R8h5skoJLIxu5Wv4H3n9XI75knMUTg3J
	P4cLmCDupryc62AjUaKyW+ZD7QeO28540tCZIeaZjiIs/qerNxVKNySyxMWZE9AMR7TXyz/HD6v
	YVgaoumZpdjWNObEGVyXhHwBwF1I=
X-Gm-Gg: ASbGncvNDdemG2JJsHxge64Bes1ODGMv2tRoo/wWlCgeXuSOWVKb7sXlc6s24qOnqGo
	/HU1q/IJAhN7m2U6ZTe+unuogyAIqnFtqFtlf
X-Google-Smtp-Source: AGHT+IHJUi5g018lpL6Zq51vEPokuiss77XRe96APWiARuIHSHU1/juMbkj8A9aonEs/OCJKGfpsFAnysgnHgdVnoLY=
X-Received: by 2002:a17:902:f685:b0:215:853d:38 with SMTP id
 d9443c01a7336-21a83f76588mr477738765ad.25.1737021240031; Thu, 16 Jan 2025
 01:54:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115153019.407646-1-sergio.paracuellos@gmail.com>
 <20250115153019.407646-2-sergio.paracuellos@gmail.com> <228a0b1b-68ec-40d2-b379-e9894a34cb57@kernel.org>
In-Reply-To: <228a0b1b-68ec-40d2-b379-e9894a34cb57@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 16 Jan 2025 10:53:48 +0100
X-Gm-Features: AbW1kvYsVD1jjXqVXp-Y64PTRW3YHoI-7-yGZVDrH2weGOBtNwi3K2gw1cpytRw
Message-ID: <CAMhs-H-AiYULr8Yd2Cg2qqnvriq3YGrCqnfeKMMGqZyPM3XzeA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: add clock and reset definitions
 for Ralink SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	yangshiji66@outlook.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 10:16=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 15/01/2025 16:30, Sergio Paracuellos wrote:
> > Add clock and reset missing definitions for RT2880, RT305X, RT3352, RT3=
383,
> > RT5350, MT7620 and MT76X8 Ralink SoCs. Update bindings to clarify clock=
 and
> > reset cells depending on these new introduced constants so consumer nod=
es
> > can easily use the correct one in DTS files.
>
> I asked to explain why these should be in the bindings. Usage by DTS
> alone, if driver does not use them, is not the reason as I explained
> last time. The reason is that your driver actually depends on these
> specific numbers because how it is written.

The driver uses them implicitly since the clock index is registered
for any single clock and in a specific order matching these new
constants.

>
> Or I understood it wrong and this is purely for DTS?

No is not purely DTS but constants are going to be used from DTS since
for clocks we are matching already the index registered on clk_hw
structs (for example here: [0]) and
for reset the cells indicate the bit within the register so BIT macro
is used [1] with the stuff passed from consumer nodes.

So if I understand what you are asking me to say in commit "Update
bindings to clarify clock and
reset cells depending on these new introduced constants so consumer nodes
can easily use the correct one in DTS files matching properly what is
being used in driver code".

Would this work for you?

Thanks,
    Sergio Paracuellos

[0]: https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/clk/ralink/c=
lk-mtmips.c#L750
[1]: https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/clk/ralink/c=
lk-mtmips.c#L1038

>
> Best regards,
> Krzysztof

