Return-Path: <linux-mips+bounces-7539-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E0BA1685C
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 09:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB29A1888CA6
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 08:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E025194096;
	Mon, 20 Jan 2025 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgAITaHj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885EF7E1;
	Mon, 20 Jan 2025 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737362787; cv=none; b=d91ioWN824CJQ4yO+qNomhNESqrDgILT4lpnoaP7SxUYZjyNqymh0vuaGzAF83go2/jkUez3rLTNOursNfJvF229hcX+stBQ33hTytfJ7eb7ZPOG/fC/W6dd9SQm1gQ0ev8UeqBy1+3Gp8ze+lQ1i/PKjKbRedJqjFjXyS6KGcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737362787; c=relaxed/simple;
	bh=I6VYdCkvVp6Id+7Z9kSbDZ31aJ/qnRE1whPBf1zCdqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLbYxmN9kXmQls16Z8P8jtdcyYkcgDYF3yWS7RYiOaqtGCxdet1N8BpgAmxf6094RVN4Av6x6YlrrZAYXpkrUZTIMYhL4dZJayy4EsI6kkpDcdEEj2gpHhbtysEFjA+/PMG16UDq6Fq+s6yAFQZB9BK1l6ffIC4LQZpBMdV6eQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgAITaHj; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so5345588a91.3;
        Mon, 20 Jan 2025 00:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737362786; x=1737967586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYv+axPnGZz6oNqmw8V96Dy3RmKP9Ehg7MAl9Q2i8GU=;
        b=HgAITaHjeLc8/BHH1rEBW6b9m8gY3DRXAn01INAVBHyjNJcJ+bfUbp+ula462GeB5N
         MvN4cLF/qCHk8V0FB2ZgDInOYQ+Yrs9tbIYKRaEGYTU/bFP2RHox0wfatA8TbR3ITMmM
         JBPrZm6fk5fMWAgxlSyQFNx/5bGyegZW7ltuigUxplQ2ciwn+dHYDvd2YVvu6SErIXLM
         p5lxelRrWJHn22a8YUqLafw9hqmXj03bCuQeCnhiKNGjjZBkKyY2HXQENDZTPD/thG5p
         il2BTvvVSJMwKo5+E8jU8A+mx5d9l6j416Yr96OPMzyVlucanHfTLkATByo239v2Oywd
         B8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737362786; x=1737967586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYv+axPnGZz6oNqmw8V96Dy3RmKP9Ehg7MAl9Q2i8GU=;
        b=ryuaNjn7YVsBRTuLP5fQc/821/RCyBvqtgpHUPWKAQIJcp+at9aHbAKVcB7+/02Z5q
         /YMTLMEVpKdq/UD5jsGqjstKfFtaBSixbRduQjlFU9H8lK+pBCBncFsnU4D2Nyb3ajnm
         T+TpAgz3a4TUCt2D4KV3p3zGLychtWtYDhQDX66zbyjkuINwZyCjAP1NBlk0UDZriEUr
         jmEleLtM9wuJS0aPRDffvTtSvJYGZCC0UZs+5+gzRetm7O+lAQFtcUeHaoZPtQ2BOsB0
         uN8SiNk2s45TxdnmMgyceta0Gi0Hq0tr7higOEmOMcwPfsl+LYMJXMdT0UzD/+9gOfBK
         UtIg==
X-Forwarded-Encrypted: i=1; AJvYcCVQWfUk+aszxxTBr2Ix5cQZjRdgLcGwTOA/Cy+L+WjgZK1XcUKvsQqmZTny7KWSGndIclpuXufMzcTT@vger.kernel.org, AJvYcCVowQBAK4NAflvZAt5WFd0k2BKQruuj4hwDx/7pjGNRV1WEjHGdqHH72n53DajvsNrCjwQYWUUqtNEWTpGX@vger.kernel.org, AJvYcCXpadowP4IyeGW1Rbcrp9B+bL82BDdz+EuYIs60AqZsFEylkdixB8mUuVVfcZKW7jYb8JYOoKbkXg9gUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Pjdoww+hOziuKtOOw77iH6ul+SWzMRfg5lFp6grKQfy76Ba3
	CAd94oyQ04tbMAEASjObjfvKzeoM6ZAv6nH5V/oCjcGkD6ilRKu4DvDpjKQEBvWn2bCV99GTtN1
	wpZe5DHt11Q8/gpnrxsARKob5NUU=
X-Gm-Gg: ASbGncvOaMoNF3tn6BsULYGqO3Ds92OxjwdWGO/kelQ257t4HeQIzKjGYeW5Uj5y0vM
	qcA2MiHe0m5Zl/W1UfNjFVcfcVg29aCNOscXrCing93OOd8X15g==
X-Google-Smtp-Source: AGHT+IHa03UWz7nHbos0urTgmAQdrgNRVid/T8tle2nvKN9JHJg3fUXyCQgMmnGueIGf2++IxvNLDV6fYAz1TfWZS/o=
X-Received: by 2002:a17:90b:1f8b:b0:2f6:539:3cd8 with SMTP id
 98e67ed59e1d1-2f782ca2291mr19433543a91.18.1737362785664; Mon, 20 Jan 2025
 00:46:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119154447.462857-1-sergio.paracuellos@gmail.com>
 <20250119154447.462857-2-sergio.paracuellos@gmail.com> <20250120-expert-fox-of-argument-c4dcde@krzk-bin>
In-Reply-To: <20250120-expert-fox-of-argument-c4dcde@krzk-bin>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 20 Jan 2025 09:46:12 +0100
X-Gm-Features: AbW1kvZLmY07mSomBZjLQ_sAy4yq2w_CVWCU0vSF7ZMxwjulnJJB74-pKIRVauU
Message-ID: <CAMhs-H9bFka-U5F4qX-FsJtnKcZ3eYf_ZPy=READa=HqrzoOQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: add clock and reset
 definitions for Ralink SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	yangshiji66@outlook.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 8:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Jan 19, 2025 at 04:44:42PM +0100, Sergio Paracuellos wrote:
> > +#endif /* _DT_BINDINGS_CLK_MTMIPS_H */
> > diff --git a/include/dt-bindings/reset/mediatek,mtmips-sysc.h b/include=
/dt-bindings/reset/mediatek,mtmips-sysc.h
> > new file mode 100644
> > index 000000000000..1bc6024b1f22
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/mediatek,mtmips-sysc.h
> > @@ -0,0 +1,152 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > + */
> > +
> > +#ifndef _DT_BINDINGS_RST_MTMIPS_H
> > +#define _DT_BINDINGS_RST_MTMIPS_H
> > +
> > +/* Ralink RT-2880 resets */
> > +
> > +#define RT2880_RST_SYS               0
> > +#define RT2880_RST_I2C               9
> > +#define RT2880_RST_FE                18
>
> These do not look correct. I understood from previous discussions that
> driver relies on these for its internal operation. It looks true for
> clocks, but does not look true here at all. This is register bit passed
> to the hardware (and I explicitly mentioned last time: that I expect
> these not being register bits passed to hardware).

I thought you were referring to reg addresses and interrupts since
there was no comment in the reset part in v1. Anyway, it is clear now,
thanks.

>
> None of the resets are bindings - these are just hardware constants.

Understood. Will drop this file and update dts.

>
> Best regards,
> Krzysztof

Thanks,
    Sergio Paracuellos

