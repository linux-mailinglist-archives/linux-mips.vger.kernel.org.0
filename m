Return-Path: <linux-mips+bounces-4956-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 479759573BC
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 20:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC6061F23E97
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 18:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B894189B83;
	Mon, 19 Aug 2024 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tf3yuuM1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB87418991C;
	Mon, 19 Aug 2024 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724092832; cv=none; b=sCnf+Dtf7BhEQzWqAgLpQccpj5VGt033sq2pkL9UEuTEp77RQliUW1kNBGS2iSq/yx2ITMKe8cQ1pM9AbsiXabirAEo/9fexFjPG2bHCndvspudzuP3nO+G28r6tbDQ9nQoccpIoCToBwxv68E4O78ZZvj5rRAQThnaZoUyF1mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724092832; c=relaxed/simple;
	bh=ZMbADLpUAELxGABAgnkEdvEemGcRN8dlaJqTQh3jz20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzss3rAzZU99THSKMWbe88RxY5PP44Qzui7/pknI8/uKbbpscBpAb3HcYLNwP+LMBc52G19rMtdF6ECN9lk5bEmvw0+U+0SohFea8K0EXXlGZhJ5qfD2si9E6j5F6hbnvbiaZixroBIl2XOlUEeANW4Vm3N6wke/OCVO+bTcckI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tf3yuuM1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383A8C32782;
	Mon, 19 Aug 2024 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724092831;
	bh=ZMbADLpUAELxGABAgnkEdvEemGcRN8dlaJqTQh3jz20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tf3yuuM1xaQV1GST44D/askCKHwx3RLYMccgOWofU5ZQowzzd2wkHcAKj8q2/9jps
	 dWoDaTIPRud5AuoFw1vcPgEABHC5VQ6LtZPVWI+Rd+61P7xfAM0XghusGTHqqGAXwa
	 ZuWS1bQ5p18MAH42HP2ERd+ay+LdSVSO2DNyXUOlGZRZU+BWq8SAQ+pD1CzCsQNt0n
	 Yl0QmavVLBDvxe1bnFz8uRC1/IMU9GRj+viqsIf26HyBNL+1YlG61oc5g45sk30HhE
	 2aLe7pJ8xurVdeYOentskQg+vTtgtPrxjluAjbRzcxHR5eOHS8Yv8Xc/d6VU8RgR5J
	 AKJCdvos/PpIQ==
Date: Mon, 19 Aug 2024 12:40:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, Anup Patel <apatel@ventanamicro.com>,
	linux-mips@vger.kernel.org, maz@kernel.org,
	linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	saravanak@google.com, paul.walmsley@sifive.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Message-ID: <172409282414.2143677.12162426898759329021.robh@kernel.org>
References: <20240817074107.31153-2-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817074107.31153-2-ajones@ventanamicro.com>


On Sat, 17 Aug 2024 09:41:08 +0200, Andrew Jones wrote:
> An 'msi-parent' property with a single entry and no accompanying
> '#msi-cells' property is considered the legacy definition as opposed
> to its definition after being expanded with commit 126b16e2ad98
> ("Docs: dt: add generic MSI bindings"). However, the legacy
> definition is completely compatible with the current definition and,
> since of_phandle_iterator_next() tolerates missing and present-but-
> zero *cells properties since commit e42ee61017f5 ("of: Let
> of_for_each_phandle fallback to non-negative cell_count"), there's no
> need anymore to special case the legacy definition in
> of_msi_get_domain().
> 
> Indeed, special casing has turned out to be harmful, because, as of
> commit 7c025238b47a ("dt-bindings: irqchip: Describe the IMX MU block
> as a MSI controller"), MSI controller DT bindings have started
> specifying '#msi-cells' as a required property (even when the value
> must be zero) as an effort to make the bindings more explicit. But,
> since the special casing of 'msi-parent' only uses the existence of
> '#msi-cells' for its heuristic, and not whether or not it's also
> nonzero, the legacy path is not taken. Furthermore, the path to
> support the new, broader definition isn't taken either since that
> path has been restricted to the platform-msi bus.
> 
> But, neither the definition of 'msi-parent' nor the definition of
> '#msi-cells' is platform-msi-specific (the platform-msi bus was just
> the first bus that needed '#msi-cells'), so remove both the special
> casing and the restriction. The code removal also requires changing
> to of_parse_phandle_with_optional_args() in order to ensure the
> legacy (but compatible) use of 'msi-parent' remains supported. This
> not only simplifies the code but also resolves an issue with PCI
> devices finding their MSI controllers on riscv, as the riscv,imsics
> binding requires '#msi-cells=<0>'.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> v3:
>  - switch to of_for_each_phandle() to further cleanup/simplify the
>    code [Rob]
> v2:
>  - switch to of_parse_phandle_with_optional_args() to ensure the
>    absence of #msi-cells means count=0
> 
>  drivers/of/irq.c | 35 ++++++++---------------------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
> 

Applied, thanks!


