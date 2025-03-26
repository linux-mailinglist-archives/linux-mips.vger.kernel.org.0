Return-Path: <linux-mips+bounces-8364-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E03A711F4
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 09:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 330E33B7002
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 08:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C7019F10A;
	Wed, 26 Mar 2025 08:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuWb6VN+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61C417A313;
	Wed, 26 Mar 2025 08:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742976107; cv=none; b=bZCLUzK2fhndEt4UNnahpYj33OT01+5Lvaogooi3Xe/gp/+7HiVi33VONVzXi0nVI3ItQWnZ4QicL9AmpwKUZ9pPToVDu31UHSwuJ9dD9/wDKT44R4mxJh8Sb9ZVLsOBvUpizbdkdcTH+CiiSkWrGqBd64dbCzXsabuoQCn2S6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742976107; c=relaxed/simple;
	bh=Etl9aEhblgVRF1MeAfcmULLdM9Z6Us/ik8kuYiANhrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDaUO93ZdnInFg3qDoCbCqmw+LzaMsxxcidy8NTPxJ1r74LF7KUQzhKYioGVTeAQ3Lb7sYBowsYyW04Nwt3PzGzpL0hoV5ajgOYEo7lgQO3jv1cpmk07eQkpkxG2c1LYdzQN3IFnSRRRAjgXB7y3CeSrgQmnf5ji/JdavLmQwYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuWb6VN+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22715C4CEED;
	Wed, 26 Mar 2025 08:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742976107;
	bh=Etl9aEhblgVRF1MeAfcmULLdM9Z6Us/ik8kuYiANhrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JuWb6VN+iZ63Z5BFh6sAMdlrwX9epHo5glgWvQlZaSj3x/2irN3MGOnqj3EN2OVHI
	 xZtJuZwcC6l3JNgHuUr52uk+/1htzwWalD5A4WTNRAcotqKYwb3F31tsm9Nl4Jc+sR
	 PbZXe+RUBwmU6C7ZFGQCB5oYP8C5Qo7U62RUUVyBDK6A58d+yatTHGplC56w7LW2Vt
	 0jkw/Fx5yC2mL2DFItwdfxhK+4V94mI4l279o4LP/dTg/B42eNJyygeVbDK5YXYuRi
	 1DOgkxdi/IlfAlg9J9zQRlDsxqc5GRPIhkX4IUcqKX5AFqy98tsGxnb0lZx6YNNjDN
	 WHnB8VqtLPH1g==
Date: Wed, 26 Mar 2025 09:01:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.larsson@genexis.eu
Subject: Re: [PATCH v2 08/10] dt-bindings: vendor-prefixes: Add SmartFiber
Message-ID: <20250326-masterful-hasty-chicken-4e3217@krzk-bin>
References: <20250325134349.2476458-1-cjd@cjdns.fr>
 <20250325134349.2476458-9-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325134349.2476458-9-cjd@cjdns.fr>

On Tue, Mar 25, 2025 at 01:43:47PM +0000, Caleb James DeLisle wrote:
> Add "smartfiber" vendor prefix for manufactorer of EcoNet based boards.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


