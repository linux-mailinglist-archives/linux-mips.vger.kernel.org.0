Return-Path: <linux-mips+bounces-9001-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF40AB560D
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 15:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18B323AAA54
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 13:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC731EB5F0;
	Tue, 13 May 2025 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kR3p5wQ9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E1F1E5B9D
	for <linux-mips@vger.kernel.org>; Tue, 13 May 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142975; cv=none; b=fh8V44eeyIdpKqpg3KIkTocRSefVZmzl/a2ezhHLeVt2UThRpE9HrH8fw6JTR9lra84+ajQbbHk+Sk2o9BgrnExFMb3ZWsUqVVXxvgphZv09xJ1GV7LiWyMUhm9V+dj/a/xEf60uN25ug1NAZ+MlLuYda//triIv2aRvqFPGUPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142975; c=relaxed/simple;
	bh=pIZnqAbvKi6g6bM9xBkbfMYNKRFSU6d2NCIENbAWFOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvwjcNQwopQ2EeI4u4ZDo23CQ3m6nwajJbOtfTBcmD85Wl8hRlDcXbZR2FJnsBW6IoiiRZ+PKIF2zFKX00/e5lFGOSob0Jz47eOhhc2gJ0Xwu89IBSdSCkvSZUjWIt2SWmYoYs0Q+SgoPuQ4Iu+mWZypI9xvY1hffBQBPm8qF/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kR3p5wQ9; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4df6027cabcso1492054137.0
        for <linux-mips@vger.kernel.org>; Tue, 13 May 2025 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142971; x=1747747771; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LZEie1OhAZfjtagVfLYxTcaBKPW2X7YkdVD9WseQzgE=;
        b=kR3p5wQ9nxxZ0EVG5HcRztu35MW/ZMH0Z4Ap5aqYoCDbROItNisvMevG528ocbPQkd
         Ja4KRQ/9tSVsSnPXW68q4x+7rTwCd3sGTkEZB4P2dYtgjk9yVWelrQqqHVkkQ81UBC0y
         Gk8ZHpjj0r8KNzSrudIc/bB47aaFhpTkJRqCUCnLxkL+qZPfUxIqcov/xmgnPMtaeB0X
         H/GHyI78InR86RlUJ0jXHgJTs+zTMZe20A5CgDi9luYA/WHykBLdTPcE53s/WmVGZ+LG
         IeXmObmPFBorJOwPeeJkjzdZzes/uWXoCSZgBycuzBR0OtGftgifPQ0T8HU2jCurYrU1
         DE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142971; x=1747747771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZEie1OhAZfjtagVfLYxTcaBKPW2X7YkdVD9WseQzgE=;
        b=PcFlS0Gr9VWq3OzXbQmqeVuIJfG2xTFRyRRReIxju5AkCJOE3ZN1R+eJZ86f0ssLRQ
         fjoYnPnpHaOj9s8s/qpHxjvapYdJhHU9T8nQFXXQ0pK3UAjSgCGOyE0ny3yD877Yt148
         g3Jad0I9VpOXUhnn2RVcZy7qp76cvjpNOM6qjqVZ4G88EhRbYQGhZoueZ308tT8k5VW+
         zKwrAvGO/5bTXP5ppvEkvcajxXtLM/4kQDIBaQt/6i2az4e8PCLqNrIeDIJ4WlSCbkCy
         mGcnQLAoCJxCcxatOiI1X6Wy6ryLeXHcvmEeQy0zPlUCiilsXdeeW6mPdUUReqSmx/9Q
         743Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9SFd1tjvKUZuGKe0bmLTKQBkyQJd9Ux5OvpNyMO5MxZXtM0s5A+SZCOwzYk0qcM6frKebx5kEd31Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxFOveeyhD58kcOt5O9gSl38GnUhec2fzvNCiXgAZZkAJgXBEpM
	bzh/jLJs/CPH2HyqrMniTjyceMi1kWN2hwXTjICy6KCyVeCKk+vljpneIKOL4SFoqNOMavLYht0
	KZHvdIDmZDxoYHmAwZL9uy5iPifi4qg5lUolt1A==
X-Gm-Gg: ASbGncuwN5AibM+w/DoONtZV2VqcRrKTDVn1Y8wi2M87v0sMZvpei1GRYuh6d3LOM7k
	TWZNb557jSlzXYMzMXRZJ3+muawzTXV7KlwKpP3GqvHKy6QgyEu00WzoOGJkAkmkaNSehG26rG2
	HZhlZGy7LAedFm5kqdla67zRXMYaD+ScQ=
X-Google-Smtp-Source: AGHT+IHlbMMFq5nAfSA83CCKmxe6r5lw+vXbf9voMmrMRSDCezf0HsCPwNDvoXL3icNnJqJh9L6Y0Q0gPm4WwUngrEA=
X-Received: by 2002:a05:6102:2c08:b0:4c1:9b88:5c30 with SMTP id
 ada2fe7eead31-4deed3d3870mr14789892137.19.1747142971375; Tue, 13 May 2025
 06:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512172044.326436266@linuxfoundation.org> <CA+G9fYuO5m0EgOAbytJv2Ytp9uj-0jHVUGddaXHLckHk+ZLEHA@mail.gmail.com>
In-Reply-To: <CA+G9fYuO5m0EgOAbytJv2Ytp9uj-0jHVUGddaXHLckHk+ZLEHA@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 13 May 2025 14:29:20 +0100
X-Gm-Features: AX0GCFvoub22XkeGUwB2DkAUVguhCcizeWQN8lgksWkCPZabNB8ZW-3lo3CS3bQ
Message-ID: <CA+G9fYsGTqCxiXQOY3HEu4Z3CEwmyQoOb8DnpzVToWMW-Y8R5A@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/197] 6.14.7-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Marco Crivellari <marco.crivellari@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 11:40, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Mon, 12 May 2025 at 18:43, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 6.14.7 release.
> > There are 197 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.7-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
>
> Regressions on mips defconfig tinyconfig and allnoconfig builds failed with
> clang-20 toolchain on stable-rc  6.14.7-rc1, 6.12.29-rc1 and 6.6.91-rc1.
> But, builds pass with gcc-13.
>
> * mips, build
>   - clang-20-allnoconfig
>   - clang-20-defconfig
>   - clang-20-tinyconfig
>   - korg-clang-20-lkftconfig-hardening
>   - korg-clang-20-lkftconfig-lto-full
>   - korg-clang-20-lkftconfig-lto-thing
>
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
>
> Build regression: mips defconfig clang-20 instantiation error expected
> an immediate
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build error mips
> <instantiation>:7:11: error: expected an immediate
>  ori $26, r4k_wait_idle_size - 2
>           ^
> <instantiation>:10:13: error: expected an immediate
>  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>             ^
> <instantiation>:10:29: error: expected an immediate
>  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>                             ^
> <instantiation>:7:11: error: expected an immediate
>  ori $26, r4k_wait_idle_size - 2
>           ^
> <instantiation>:10:13: error: expected an immediate
>  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>             ^
> <instantiation>:10:29: error: expected an immediate
>  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>                             ^


The bisection found this as first bad commit,

    MIPS: Fix idle VS timer enqueue

    [ Upstream commit 56651128e2fbad80f632f388d6bf1f39c928267a ]

- Naresh Kamboju

