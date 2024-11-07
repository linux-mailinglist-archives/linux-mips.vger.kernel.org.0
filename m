Return-Path: <linux-mips+bounces-6716-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A9B9C0A9D
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 16:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEA2A1F24E94
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 15:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E374A2144D4;
	Thu,  7 Nov 2024 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgBBwYSn"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE340212D2F;
	Thu,  7 Nov 2024 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730995165; cv=none; b=Ov+WTshb27RYFASga8ogxYvH6+/RreIDi2rvIPXcqFzxBtVCV6S4I5cF8bioi/lLvG0x2Nf7ZM6DnoQL7ShSqM1HwpOqDKstdtG/pG+UvptuQ5sTocF2UfugzbSMV6Tx/pRou+nd/gt3/iANZj5g//PHGVgKY540ttfW3NMptvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730995165; c=relaxed/simple;
	bh=EY9bRUE7pktK1ylVK13Q0axY1miNx65wET8k5SsvSYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pB7JdX+6ArOfa4fSny/MDgcuIZYpLrmGytrf7rznTkLSuQ1EaD/Dtqv0Ex5a6Ze8xWUNRigKm8//WSGkv4vaazdu8gC4Gi/tZPOVYpNCKY406IkZGvWk16pyAO1WBNGty69bpS5+V/hDJmxAmaCgF1oSVk4WE5AxYHaJ+xVnMX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgBBwYSn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60631C4CECC;
	Thu,  7 Nov 2024 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730995165;
	bh=EY9bRUE7pktK1ylVK13Q0axY1miNx65wET8k5SsvSYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgBBwYSng15I1Sj9CukemsB8r92eeFNBu9UjOzjVelqyl+on+q7BOE9BfGXxrCg3C
	 cFuhr/Dg0Bc8ndaWjoD7aPFzlYKLHrY9aIseyUra+dYylkrfgUrfPFCuOU5BMa6A7F
	 Aqe3rIOTDqgXniwsdQXWPTdEv3aCMPFc5DUVJIhA2mCGEf3cnLkpM3sTg0iTnGEMEP
	 ZW6/cH0bEH0V/fxft/hZ3X9DnnN1TOLaoud22Od5ccjuUjr67GoCNA0ZtI3EPumnre
	 YMJtE52eqaqSvTur9DqroifGPDIsJuRuT9apQEdSA41ms/lzfu+OgDQfUpIL9EmeJM
	 JZ3MEVrEMofMA==
Date: Thu, 7 Nov 2024 09:59:23 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Saxena <xandfury@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/2] Documentation: dt-bindings: Remove trailing
 whitespace
Message-ID: <20241107155923.GA2770783-robh@kernel.org>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-3-xandfury@gmail.com>
 <gjxevyovxhymwm2ps37hfq3vmpmmr4pqmohq67llxrb2plb5zz@pvsmkqmhemx7>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gjxevyovxhymwm2ps37hfq3vmpmmr4pqmohq67llxrb2plb5zz@pvsmkqmhemx7>

On Thu, Nov 07, 2024 at 12:07:46PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Nov 06, 2024 at 11:11:24PM -0700, Abhinav Saxena wrote:
> > Remove trailing whitespace from devicetree binding documentation files:
> > - regulator/regulator-max77620.txt
> > - interrupt-controller/nvidia,tegra20-ictlr.txt
> > - interrupt-controller/msi.txt
> > 
> > No functional changes. Issues detected using checkpatch.pl script.
> 
> Instead I would prefer these files to be converted to DT schema which
> would result in their full removal.

Yes. I don't take fixes for .txt bindings.

Rob

