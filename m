Return-Path: <linux-mips+bounces-6806-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B009DA012
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2024 01:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73616B23CA5
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2024 00:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6371802B;
	Wed, 27 Nov 2024 00:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGZRGr/8"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728FF17BA2;
	Wed, 27 Nov 2024 00:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732668130; cv=none; b=HZS8UfZrgvuZzI1D9gxGNtaukbbi+S29l5G/P6xDQRtXv6aFqZNPxkE10WTSu0TNcqRyal/jn5VeV5198/Kayl7LhL1qmjXx97al+/g8srFG6bucrwBuVyKaF5Ps6aVkJaH7CoAwftRU5K+1D7vpm5eCF5/u0phMJwaaj3Lr8xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732668130; c=relaxed/simple;
	bh=65TqyUGyYup30EdteiqOrbUUgJUcHfdRtK4HQVmOJsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4T0xJjOwyyq0YTaYBazsuQfEdEhHtbvHn8+9yehWf/yBV7/N3Vh+8XQlY/RB1UqB/Ze5Bu8pQ3+AfjoYS6LzycuZ1lokR5JqcBoE79PxqUOpN9+Aq+UUXbVDmyl+P2JEM0Sh/JzHYpTo+WoHHgfx+juqrQTf60hYdnkwI36tco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGZRGr/8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91EAC4AF0B;
	Wed, 27 Nov 2024 00:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732668129;
	bh=65TqyUGyYup30EdteiqOrbUUgJUcHfdRtK4HQVmOJsk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WGZRGr/8jgoaaSlvA4FWeZP/gzuxgHHbrkCFQHm97g1N17XT0Of/9//2Y/wbCkyD9
	 EJBIHWx6wYscE8dcdcPeHLLbJGlF7FOLWIE0xPSQXsKhBBT4UQDP3JFAiKA9vYH1gn
	 vrw9w32I2vFwtF8gVLxgR58s26gZRgqmFqPe2uxuEppKdogeGcWHX9Rla/6JGfELpz
	 xKjaFCSfRIE4MXSLKZxpLwb43H/vd7fm9eLpVogRvDMiv/+nIoSlOyaMWF4dtZwetz
	 yv12bmsIWuIwuyuvX6ieSA8KRGLM6KygD6JbkEvvG/aJf06xGdNmkEHicWBfNV5lw9
	 iW12tPfNJk9/A==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53de6b7da14so2566054e87.0;
        Tue, 26 Nov 2024 16:42:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIfEgmdsIgk8g6VmP0pWA7Od/ELMsDtI1/wciOdnvyfqczvGDkezlvp2EUDLf6ZpUIucE3wTUfxICRmg==@vger.kernel.org, AJvYcCUZ0sS4yWErjdsyhB4UzxGUozkq1V80aZz5VpFFMS9wDZ+9sI3xH9RK0S0NSt8qm7N/M3shoZbKA0z364Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNgWNhuhze/9tBmzh3G9uvAt0mF2BKcqxhBj1v0pUh4WD9eVJU
	icvJFqAoZtmKmWqAsiThVOc/B9cMOrTVvJVjrXvlhmkEMlhU6pxHlJBAUvYmnsh7+zeIC7R38dg
	T7hcmDf7sdLseeAAHaixt3i0TKdI=
X-Google-Smtp-Source: AGHT+IGiw3Tr7CvwaYp7q6qM5mn/GnrmHoZgKQV+8vbb4HdF7D4OkjFOgOZ+zblhyo0LA0gjp9LjNuxhYhKFzIJ/s6E=
X-Received: by 2002:a05:6512:3b90:b0:53d:d242:6bb0 with SMTP id
 2adb3069b0e04-53df0112153mr252837e87.49.1732668128611; Tue, 26 Nov 2024
 16:42:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126173409.3728585-1-xur@google.com>
In-Reply-To: <20241126173409.3728585-1-xur@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 27 Nov 2024 09:41:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrEU5b5_SpmokYg9D031F4nvhjciHd5vPowFXMfLhezg@mail.gmail.com>
Message-ID: <CAK7LNARrEU5b5_SpmokYg9D031F4nvhjciHd5vPowFXMfLhezg@mail.gmail.com>
Subject: Re: [PATCH v2] [MIPS] Place __kernel_entry at the beginning of text section
To: Rong Xu <xur@google.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Klara Modin <klarasmodin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 2:34=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> Mark __kernel_entry as ".head.text" and place HEAD_TEXT before
> TEXT_TEXT in the linker script. This ensures that __kernel_entry
> will be placed at the beginning of text section.
>
> Drop mips from scripts/head-object-list.txt.
>
> Signed-off-by: Rong Xu <xur@google.com>
> Reported-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Closes: https://lore.kernel.org/lkml/c6719149-8531-4174-824e-a3caf4bc6d0e=
@alliedtelesis.co.nz/T/
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>


Applied to linux-kbuild.
(Inserted before the offending commit)

Thanks!



--=20
Best Regards
Masahiro Yamada

