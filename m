Return-Path: <linux-mips+bounces-9007-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B061AAB6835
	for <lists+linux-mips@lfdr.de>; Wed, 14 May 2025 11:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52030189C488
	for <lists+linux-mips@lfdr.de>; Wed, 14 May 2025 09:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B20725FA0E;
	Wed, 14 May 2025 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="belB5YVB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F096325E827;
	Wed, 14 May 2025 09:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216512; cv=none; b=AOxvzlqS0ntHxaYwUpYRm49jOV8r05WVoeY3mLrwS20jhUezDktTYRJMcP4e+CDSWizfPTYX5e4V8fMWPKf4iiPHrE4TPVo8RnYzCJLtDdsLKyyrIAbN8k/UnNn/FTWqiaAXmJIHCZbDWnq/aBozi4x6gXd/AZIpXIxvBuxL35g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216512; c=relaxed/simple;
	bh=NU0/laBLJ5U/Z61R8LdAMhWaqpI9feJPmdaQdzlsQqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vB3Mf4Y+igvLoEMk0vdyqxzAx5vSkviGoZCuLNhgHBWwqSch4IXylE0AkJhqs1rH0d26F3TcQ/AYYqPF5znXLI0waaEn4ghVAZqKmi0nsAGaHOE0Vk7Fdotwt7XiLhT3P6/8qA7b0Lv8e3RwaI+BD7Yq6R6OIxZGpTBQRVxHt60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=belB5YVB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A49C4CEE9;
	Wed, 14 May 2025 09:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747216511;
	bh=NU0/laBLJ5U/Z61R8LdAMhWaqpI9feJPmdaQdzlsQqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=belB5YVBvtc5H3/w8UjIZtr7Ri7Fe0orS+bV9pxjvY2IKtEBsSqdynxckERS+mIDo
	 nZ8By2eA/s7IehP+5jFrpV3EgjTy1aRm6EtX0Qe5UeMaiSe56Tm5GogTQFYGGqz3UB
	 w9+Du91MUj57+iGJ4bh334CDWjlAKxuNRdfA7rl0=
Date: Wed, 14 May 2025 11:53:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
	clang-built-linux <llvm@lists.linux.dev>,
	Anders Roxell <anders.roxell@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Thorsten Blum <thorsten.blum@linux.dev>, linux-mips@vger.kernel.org
Subject: Re: [PATCH 6.14 000/197] 6.14.7-rc1 review
Message-ID: <2025051415-unloader-likely-b0e6@gregkh>
References: <20250512172044.326436266@linuxfoundation.org>
 <CA+G9fYuO5m0EgOAbytJv2Ytp9uj-0jHVUGddaXHLckHk+ZLEHA@mail.gmail.com>
 <CA+G9fYsGTqCxiXQOY3HEu4Z3CEwmyQoOb8DnpzVToWMW-Y8R5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsGTqCxiXQOY3HEu4Z3CEwmyQoOb8DnpzVToWMW-Y8R5A@mail.gmail.com>

On Tue, May 13, 2025 at 02:29:20PM +0100, Naresh Kamboju wrote:
> On Tue, 13 May 2025 at 11:40, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Mon, 12 May 2025 at 18:43, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > This is the start of the stable review cycle for the 6.14.7 release.
> > > There are 197 patches in this series, all will be posted as a response
> > > to this one.  If anyone has any issues with these being applied, please
> > > let me know.
> > >
> > > Responses should be made by Wed, 14 May 2025 17:19:58 +0000.
> > > Anything received after that time might be too late.
> > >
> > > The whole patch series can be found in one patch at:
> > >         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.7-rc1.gz
> > > or in the git tree and branch at:
> > >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> > > and the diffstat can be found below.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Regressions on mips defconfig tinyconfig and allnoconfig builds failed with
> > clang-20 toolchain on stable-rc  6.14.7-rc1, 6.12.29-rc1 and 6.6.91-rc1.
> > But, builds pass with gcc-13.
> >
> > * mips, build
> >   - clang-20-allnoconfig
> >   - clang-20-defconfig
> >   - clang-20-tinyconfig
> >   - korg-clang-20-lkftconfig-hardening
> >   - korg-clang-20-lkftconfig-lto-full
> >   - korg-clang-20-lkftconfig-lto-thing
> >
> > Regression Analysis:
> >  - New regression? Yes
> >  - Reproducibility? Yes
> >
> > Build regression: mips defconfig clang-20 instantiation error expected
> > an immediate
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > ## Build error mips
> > <instantiation>:7:11: error: expected an immediate
> >  ori $26, r4k_wait_idle_size - 2
> >           ^
> > <instantiation>:10:13: error: expected an immediate
> >  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
> >             ^
> > <instantiation>:10:29: error: expected an immediate
> >  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
> >                             ^
> > <instantiation>:7:11: error: expected an immediate
> >  ori $26, r4k_wait_idle_size - 2
> >           ^
> > <instantiation>:10:13: error: expected an immediate
> >  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
> >             ^
> > <instantiation>:10:29: error: expected an immediate
> >  addiu $26, r4k_wait_exit - r4k_wait_insn + 2
> >                             ^
> 
> 
> The bisection found this as first bad commit,
> 
>     MIPS: Fix idle VS timer enqueue
> 
>     [ Upstream commit 56651128e2fbad80f632f388d6bf1f39c928267a ]

Thanks, now dropped from all queues.

greg k-h

