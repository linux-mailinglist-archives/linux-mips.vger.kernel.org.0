Return-Path: <linux-mips+bounces-7189-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A899FDAD4
	for <lists+linux-mips@lfdr.de>; Sat, 28 Dec 2024 14:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D6DE16095A
	for <lists+linux-mips@lfdr.de>; Sat, 28 Dec 2024 13:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910AE1607AA;
	Sat, 28 Dec 2024 13:55:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E8367A0D;
	Sat, 28 Dec 2024 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735394118; cv=none; b=SqMxbZCLbAAQzQizBgXuD7EisUX5gBerj6+K09uS/nfm6I9jcVZVRALK/PwSo6k11sB29khuH0wxn3DHyePMbJmzGVdGWlau9TcbQyaGGjrt3Mk8iA31suHHTfwXAe4ljjS1YqTs9DwOfm+1xkD+VSnG8Pl/V/Ks89TQYomyvGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735394118; c=relaxed/simple;
	bh=N2Y0tdP2ya5cC2WUSKApfz754N+JS5n0MEifSr0gup4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HooLp0fM7s9x40FwTK5qMRTRFQ5TZjUukQrkfwuXLu8/VbyoC/11djzjS6OMDO+zOoxVSb5t6AvZ1Tk4RTECf4BqASjrctqcrsf78/eFxLv+arVmESw6KqONKNJAMrgWNvXhRK0JOw4x4vyyRba4GE8XZWr3F4nFK5VRhC3aWmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4aff5b3845eso2750513137.2;
        Sat, 28 Dec 2024 05:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735394114; x=1735998914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ulB3Yf+fkH5MLC4jt3SEiT76TCvud6P3XUQaFnmoGs=;
        b=wDw176x6feGRqPfHNg4ShwKrjYip7PMSnvBj6S5pibCzP7BmwFq41IhoRv8BCUyQw9
         WfKwIxg3Y4kIF9S08nlWS01ZgYc8zxRQSjTU4z1c1K/6QWg/pxAO3549KWrZDe65Oirf
         B/0GPqqfpmXmstTulDnGzMTJBXEf3q9oTax0ekoq73HWWiW2JfAETWGwdy1WWCnL19Y8
         aaG2YwrhGgm8+xBtDlzsKK6UHnfDB7euanfg7Rd9ozx7FIGUxGMh5L8GPWgvRWyQ/wZw
         qveKDIeMuMWZH+KeIhZVJX8PZ2Van3aiXhjxoQcKuCyROSAkpQoK7sS1T8t7o/M3hCv9
         MoYg==
X-Forwarded-Encrypted: i=1; AJvYcCV5ODcAq3d/xXrfY4TL00MfRkWloKCsZr83gUiJHxSZpAixcnqZXFxfObqbn4L6EdhaY9epstV5mB9HxQ==@vger.kernel.org, AJvYcCX3PQz8FI8iJuZdtzo3TrKF2mQwE9bHIrU0n9SHcBMZQQWkDQjnC87DerBQS+i59vnFxHfmQdFxBuLidW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0gp5uAbyPIbLLxFGg9nQgY4f9ZFsO5B0UHE6mMOyF3zDpmt4
	WFfGRTXQTwiCOXmQ+hKRff69luelMEGKmMy8fmL0ko3P9TktxiJsreSmBUsy
X-Gm-Gg: ASbGncvxSccwEZdx5JmpB38UUni+D5dqYE5dqJ0kYrcgGtwJl7+f34z31hzr7/wrD0b
	8uZL70o9ip5Gx2GLkmI1FJDP+qywF9hdOX79rgROgYkz4ZqG8PJsWrgBMkCW91XPRPtYTVuaJpY
	Yxha4wAuPieN1SuremWrBWhzKVrR6uET4Z/xWWrxLrVI1pbpldVfwaNUFzP0fIDBeF/mp69HD4R
	6UvHzusFOYhDGHu1rrg6bBSee5YBgQhPSJuAQpHz5d3jt8HcckNWFB9aMvMSfRfjnwCO64iL5BO
	jo8lPWOb8oSE5LpXuqY=
X-Google-Smtp-Source: AGHT+IGbeNhpt+74lydy0J53Jpm9mETFGBPPAN56aYSLzYNhiHTvLfXSiCIFh6rAsrI7YyPuTxBGSw==
X-Received: by 2002:a05:6102:cc8:b0:4af:ef85:dae4 with SMTP id ada2fe7eead31-4b2cc313a2cmr24048870137.5.1735394114559;
        Sat, 28 Dec 2024 05:55:14 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98d122sm3296722137.7.2024.12.28.05.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 05:55:14 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4aff5b3845eso2750509137.2;
        Sat, 28 Dec 2024 05:55:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3Engqhf/xHv7zOXKRpJ+sFeVgOuKOFkWqkBnbAZH9Xw96FCE2OurrTdz4NJ1QPnXdDg9J/DE1L8OVVg==@vger.kernel.org, AJvYcCX+gmKvmh978nZ4kl88SMRj6vDQkA/GBIRaHP0uQ8uDHhaDWBjw5vzvkXvtyY7+zqMqnlEenSvcWGF69bc=@vger.kernel.org
X-Received: by 2002:a05:6102:3f0f:b0:4af:df15:7d6d with SMTP id
 ada2fe7eead31-4b2cc45f0bcmr22952488137.21.1735394113966; Sat, 28 Dec 2024
 05:55:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202412282326.0DSE4HbR-lkp@intel.com> <CAMuHMdUTtdQxyTUSd_NBiPvL6irb8p_2+=hk5PjUrXC4J=VrbA@mail.gmail.com>
In-Reply-To: <CAMuHMdUTtdQxyTUSd_NBiPvL6irb8p_2+=hk5PjUrXC4J=VrbA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 28 Dec 2024 14:55:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHGz=0d_bGOu7RtF7-ssgnNmHk=MwEbTK77=+UgKGmYA@mail.gmail.com>
Message-ID: <CAMuHMdVHGz=0d_bGOu7RtF7-ssgnNmHk=MwEbTK77=+UgKGmYA@mail.gmail.com>
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2024 at 2:50=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> Hi Kernel Test Robot,
>
> On Sat, Dec 28, 2024 at 2:36=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> > First bad commit (maybe !=3D root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
> > commit: a9770eac511ad82390b9f4a3c1728e078c387ac7 net: mdio: Move MDIO d=
rivers into a new subdirectory
> > date:   4 years, 4 months ago
> > config: sh-randconfig-001-20241212 (https://download.01.org/0day-ci/arc=
hive/20241228/202412282326.0DSE4HbR-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 12.4.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241228/202412282326.0DSE4HbR-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412282326.0DSE4HbR-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefine=
d!
>
> The real issue was introduced in commit 1eefee901fca0208
> ("phy: mdio-octeon: Refactor into two files/modules").

Silly me: commit 2fd46f47be0f96be
("netdev: mdio-octeon.c: Convert to use device tree.").
But even before that, the driver used a different non-portable construct.

> Drivers must not use __delay() directly, as that is non-portable, and
> doesn't work in the presence of cpufreq.

And looking at
https://lore.kernel.org/all/202412282326.0DSE4HbR-lkp@intel.com
all of this has been said before...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

