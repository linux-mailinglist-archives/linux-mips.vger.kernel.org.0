Return-Path: <linux-mips+bounces-8418-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F594A75F1C
	for <lists+linux-mips@lfdr.de>; Mon, 31 Mar 2025 09:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B863A7016
	for <lists+linux-mips@lfdr.de>; Mon, 31 Mar 2025 07:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BB712CD88;
	Mon, 31 Mar 2025 07:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jt+aet+B"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4854C258A;
	Mon, 31 Mar 2025 07:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404432; cv=none; b=oMj8eCmvN0xAZVql4Ec4OKQSf/KXWhhjovFOubBjcayqM5bOY646pGcFFk2GFL2l9i5qlk6CqWhpU1JtmuwFHd0w6sngNWa0Vb7CsKoo6udwX/dQPUHKO4adBupyVCtnAOE9lZ8CuZgYD1JdHwpXDaWHOdU1HJeFx743lu4ieBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404432; c=relaxed/simple;
	bh=lqdUoYLMGq1XxPIIR92iaihAlvsbsEW+dCwoaJlT6Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmNdinVwflHRmGIcLSXcl1HWBVguyUtsgWA7xCwOjUWeAZzlA5qh2by/FnXk+zmZ/zgaVLOhGuLChXgMJoKvmc/3qkRmkFBZ8f4c2JVGJv4qkV2Av3UJDtmvb074BZ11nSBOzZd8h6YNRX2IB+FdnZ1NtrlYtPUCs8LBCDDzWSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jt+aet+B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B5EC4CEE3;
	Mon, 31 Mar 2025 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743404431;
	bh=lqdUoYLMGq1XxPIIR92iaihAlvsbsEW+dCwoaJlT6Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jt+aet+BtMYPfw7P4TJiXyryenyyf2bC8TMGmVnacwrfINrpAtmF5pbk4/xxI3ltn
	 Pc3TUNtyIQrlHRytKp/UeBmhP3vUnBExGF+aJ3oQWEgOBLEahwbpOlaRZYC8eAbTE1
	 BRmBiBueXxYSGnLR5Fst4uSa/POS62toKac1LtXNPw4UZczqAsLZ0JI2TIaNR5c/GT
	 zWJajYp1eTkO5jzUyq8wVnLyAKS8FxvTHZl3j8WTZtMNiUe+YBktbgAkt/HeSRbBK1
	 2/rQmjZHUrEYkWy7GAp8NBnMzeu3g1tF07rEkVN+FMSMrfXiXNehZS0r8YguYroU4k
	 K7+az8Chbjyjw==
Date: Mon, 31 Mar 2025 09:00:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 01/10] dt-bindings: vendor-prefixes: Add EcoNet
Message-ID: <20250331-spiritual-beige-lion-b82c82@krzk-bin>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
 <20250330170306.2584136-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330170306.2584136-2-cjd@cjdns.fr>

On Sun, Mar 30, 2025 at 05:02:57PM +0000, Caleb James DeLisle wrote:
> Add the "econet" vendor prefix for SoC maker
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


