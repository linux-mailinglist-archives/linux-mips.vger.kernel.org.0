Return-Path: <linux-mips+bounces-5275-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE490967828
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2024 18:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83D0D1F21997
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2024 16:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D078B181B88;
	Sun,  1 Sep 2024 16:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W62HUtk0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655B028387;
	Sun,  1 Sep 2024 16:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725208113; cv=none; b=oBoycV6R3Djo2sn+4MdHZafSTN3CSvf7zdamPB/nAVO7R7Wz9SbCngEp4RIJr8gAV1mus4kWnStE2XmWpT3VE4Gs49mzcPSaHKZHjViRr6B1dYsaH14BgQ082ThdRz3+MAvVnc9vYsODjCFj40FrlYlTaBf1Kg8clSjDruZ05CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725208113; c=relaxed/simple;
	bh=4MtfHKuq/+UgpLDUC71roRztQ1MKn8y5DcemB7IM/oQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcOHrAFAWOqF1HtYK6j8BO8ua5Yyyhvr54s6GkWBDdLObeoSDDf39HmSd34Cj2MBNISHIQvUceKVjXcjLeTmspK87Xfb06SgGJ60H6jYp3i0zFb1LVIdFHeKALd/B6iRXHmIT81yViAwWex0TWFBnKApnV/MSKBcgFG90SYJfp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W62HUtk0; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-70f5cd2fa39so2439511a34.0;
        Sun, 01 Sep 2024 09:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725208111; x=1725812911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MtfHKuq/+UgpLDUC71roRztQ1MKn8y5DcemB7IM/oQ=;
        b=W62HUtk0qteL1m/tYZgDD1awuTxIiIqNBk7A80MLFqDAJvgfEBypCHmnsFzc8Gtfzn
         wV+0msvp5jnPJWaQZx25xM0z0mB4MhzlaKfbEhEeCYZj73S4TSxofYiH9e/ZesmaGOGt
         LYlAQ71WIpj1pUG7sQa6Ho1LNXVakcuFW6bEBNwO58FIL/wveFQUlwYsz7bj4vxyjFDv
         mKTAO+NoIrllnN1rQTsSLTgdoZNsxxGaH+V7ospAVi6HKvUKe4Bk25RUpVDnbscg55Qf
         R3ofYWG9wrEkCKX4toqwRBvHtBuQInox51g6lTfU8VaBqywthtKGWZFSSyXTIsmEde3o
         6WGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725208111; x=1725812911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MtfHKuq/+UgpLDUC71roRztQ1MKn8y5DcemB7IM/oQ=;
        b=nH/jwbpxrze/g3q+8w5MlDlMHSU1CbWKT3Jjq8bq1YIZ3Iec595ZtPj57bXEzZsheg
         Q4TMBpk14mDsdsseR/fMNOA6dR9hURTz6WawhtnmEApUNmfFsJoxwjnHQwd9nRnBSTSk
         feP8ct+Ja2tIuEAMKlzt2cs09K734EFnPijNc5xRh4AKX2zS2iSuugms0X2RttRx/om1
         27yKKuPwflPaQ2X1RvhkoPFFh7Rn6R9YH37JGYimo6YoL0PCn5SDVixNoe1v03k6uabk
         ojV/oFQmfoiAEaT+ZPv4X5N2gIsGjAXo/EoFuE83/OWbOB0hh1pxs3qt2BRQN/dl9Qsb
         V85g==
X-Forwarded-Encrypted: i=1; AJvYcCWgVfrzeCyKHhgc11A2w7Az473tTlvKzyzC/Z+biRfV4rhWPRXE0YYU9rBBbL6CPoxIPeNMt+MHa7Ge4bQ=@vger.kernel.org, AJvYcCWgb0ATEqWmm5B/3OIrggYJz1oXem0PWdpst3+AuSnvPblk8wDhbNUNVIaObp2ZdpA4m9vhDmxxzk8tgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yylx0HeAwa1npEmLPjLM++fraGw2BBrmIq3JZ28VdyL5pSKJlEK
	NiFyV+BxZgGK/HpcJnZsVBkz8Ea8uSEeCKBGyVWcaN+ZVlQVDtzG/EA9il9EDawQpWbHzyHUkf+
	23HYKDZiDOQeQweqKoFBelvcCnHQ=
X-Google-Smtp-Source: AGHT+IEQfj03uznQOgOoBoDTBGTT/mQBYdI5mTPwk6+iuz/Osa9kwYcahL7M/xN+cMmlXsGL+0KbCwY4D83hR/EuykI=
X-Received: by 2002:a05:6358:52cd:b0:1b1:acd5:dd98 with SMTP id
 e5c5f4694b2df-1b7ef64ec0cmr798348655d.7.1725208111259; Sun, 01 Sep 2024
 09:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEwRq=qhHBh5jKdLGb1r2Qem0jia=xcVdevihYfjdrLSYiZuiA@mail.gmail.com>
 <CACRpkdZFQSN_t-Vx7xOXq0aF6Vf-XvsZKGF6yNMn7_dCeaZi_w@mail.gmail.com>
In-Reply-To: <CACRpkdZFQSN_t-Vx7xOXq0aF6Vf-XvsZKGF6yNMn7_dCeaZi_w@mail.gmail.com>
From: Vincent Legoll <vincent.legoll@gmail.com>
Date: Sun, 1 Sep 2024 16:28:19 +0000
Message-ID: <CAEwRq=p+=hBq3oP5u-Z=i2Qo6vwjagvf9wbPFzydO9nFuqixTw@mail.gmail.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
To: Linus Walleij <linus.walleij@linaro.org>
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

Hi Linus,

On Mon, Aug 26, 2024 at 9:06=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> Userspace can still use it right?

Nope, it's made inaccessible.

But I've found another workaround, thanks to Arnd's answer.

Cheers

--=20
Vincent Legoll

