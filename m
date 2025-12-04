Return-Path: <linux-mips+bounces-12400-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBE7CA4984
	for <lists+linux-mips@lfdr.de>; Thu, 04 Dec 2025 17:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B340310562A
	for <lists+linux-mips@lfdr.de>; Thu,  4 Dec 2025 16:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC8C313E39;
	Thu,  4 Dec 2025 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OVvsT/qR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D398313E07;
	Thu,  4 Dec 2025 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764866173; cv=none; b=IZB4K5wPoOanU9Befx+jQGpIcQjWy8sW1CNobGLL1kwOwT1dvcqw3qq01fEHJiimXiwSr09nS5guDpJ6M/2RWHjHg0mnm+7z/TN8RUv/1MS9Y5uLdmw3VPP/hKIVKTHJ1jk5Nm8lj7LfvQAdrvbL+EH51fMjdj/Gdz1LzWnGo0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764866173; c=relaxed/simple;
	bh=QLA4FZzgbXjsYI+l2C36P4TGIK8Zp5+dxYpW28/AI3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBNV/nIqrxbUhbhUrE2WwTe+CE0za1VyFqCSjbaGwGnFAh6nInDfu6QDCfw0N1fzYfFOiTugUuLdOsfxCtzDDu74N8IXrMd+Qvofn3jRfsTFHxyi/kRGdC5u4NoA1rWRzp4p0l9NpQ7LkCsZnzB0tLKJF3VHS55qVfNhQNqJfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OVvsT/qR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955C6C4CEFB;
	Thu,  4 Dec 2025 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764866173;
	bh=QLA4FZzgbXjsYI+l2C36P4TGIK8Zp5+dxYpW28/AI3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVvsT/qRwMLLko60/eJAuCFaJbfoMhmF08IrWhinJQIFVfoBSYtAltxLtDskYOR6M
	 Kfi6FiExQTIC4qUNeyXmEJjG58nnGGvCoHEG8cyVWl3AyHYWsaqL77CQrcG1jDrtMl
	 kM0KgwOU4sChXd3oN0qu+gYgY5L5E7TH6Fsl3SJU=
Date: Thu, 4 Dec 2025 17:36:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
	sr@sladewatkins.com, Vlastimil Babka <vbabka@suse.cz>,
	"Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>,
	Ian Rogers <irogers@google.com>, linux-mips@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 5.15 000/392] 5.15.197-rc1 review
Message-ID: <2025120428-manly-squatting-f3eb@gregkh>
References: <20251203152414.082328008@linuxfoundation.org>
 <CA+G9fYvmhQs9qx-XpLiaOUZQKj=gR=-X5MoJ1auRmbC7cC+AXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvmhQs9qx-XpLiaOUZQKj=gR=-X5MoJ1auRmbC7cC+AXw@mail.gmail.com>

On Thu, Dec 04, 2025 at 02:08:24PM +0530, Naresh Kamboju wrote:
> On Wed, 3 Dec 2025 at 21:27, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.15.197 release.
> > There are 392 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Fri, 05 Dec 2025 15:23:16 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.197-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> The arm, mips and powerpc builds failed on the stable-rc 5.15.197-rc1.
> 
> Build regressions: arm, fuse-tegra30.c:250:10: error: 'const struct
> tegra_fuse_soc' has no member named 'cells'
> Build regressions: arm, fuse-tegra30.c:250:18: error: initialization
> of 'const struct attribute_group *' from incompatible pointer type
> 'const struct nvmem_cell_info *' [-Werror=incompatible-pointer-types]
> Build regressions: arm, fuse-tegra30.c:251:10: error: 'const struct
> tegra_fuse_soc' has no member named 'num_cells'
> 
> Build regressions: mips, tlb-r4k.c:591:31: error: passing argument 1
> of 'memblock_free' makes integer from pointer without a cast
> [-Werror=int-conversion]
> 
> Build regressions: powerpc, mm/mempool.c:68:17: error: 'for' loop
> initial declarations are only allowed in C99 or C11 mode
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ARM build regressions are due to,
> 
>   soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups
>   [ Upstream commit b9c01adedf38c69abb725a60a05305ef70dbce03 ]

dropped.

> MIPS build regressions are due to,
> 
>   MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
>   commit 841ecc979b18d3227fad5e2d6a1e6f92688776b5 upstream.

dropped.

> Powerpc build regressions are due to,
> 
>   mm/mempool: replace kmap_atomic() with kmap_local_page()
>   [ Upstream commit f2bcc99a5e901a13b754648d1dbab60f4adf9375 ]

dropped.

thanks!

greg k-h

