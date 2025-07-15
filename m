Return-Path: <linux-mips+bounces-9817-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BD7B054C1
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jul 2025 10:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 713027B300C
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jul 2025 08:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2DE274B35;
	Tue, 15 Jul 2025 08:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yyk0S7eO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1377274648;
	Tue, 15 Jul 2025 08:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567709; cv=none; b=YrIsh2Oa085Lyg0Zwu1UVFYrxiROvR4Cx9ftrlr1SjD4x0fVI4t7cBlD7woz/8q4jQHG+tF+va4QijJ4edDKdzsBSJHMVaDLzTH83QOCiHma0uUjr1fdgq0H2oheiYLIDSWoR2U+mzHJymyrz7ivEIcZVc9SA7hPTxKYepFmh84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567709; c=relaxed/simple;
	bh=ebyRrw2T66Vzg5kyH0139ZzFXfnA3ppd4smjTMuCtCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNE1KY4G5xYGUsPMqKXy611jeaDVFo87C2bEAiAwpn7yatYc9lmyKjD5wtO0ZKLhvzw09wKvI3qcTfrKfyGVVW3HoMeYJCg/GpvE8vukKwUyps0YqSbxJa+0Dd1UmsQ7pSY19OvL5XIzXDH0WGpEGTHMt/6PMpizLL+LvXUoCLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yyk0S7eO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065E6C4CEE3;
	Tue, 15 Jul 2025 08:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752567709;
	bh=ebyRrw2T66Vzg5kyH0139ZzFXfnA3ppd4smjTMuCtCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yyk0S7eOz/0KbQcEVcC5HVGT72qMwkR1B39BAzmJtFx98gqSqwZ4cYEgYVtBzfVC2
	 3LUSs4MzmTyUthDeusmxzQyPAnItNXqPDSAaBKGncGsxf674KT3iPqjsNMH8QJF50r
	 uns7xxoYXavnWYAXKTs5ke1MooR+1YlpXF/d4IFkViu3sQYGMfTC4R167CnyCrP3cb
	 OBKhOQA8y3xL1n+i6OobBanD3L+f9z5hM3J90JBoCLiFFV+dvjL7KIouxwwUIC0nQ4
	 +sBbdKX1FQ5v8tLfgxCXp1VLxKiZKu/aGa85eNPomMFjn+FlTuilFKATMst1z1SvvE
	 kyUrS5zSO/XCg==
Date: Tue, 15 Jul 2025 10:21:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: gpio: Create a trivial GPIO schema
Message-ID: <20250715-hidden-marmoset-of-serenity-dcbfcc@krzk-bin>
References: <20250714201959.2983482-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714201959.2983482-1-robh@kernel.org>

On Mon, Jul 14, 2025 at 03:19:51PM -0500, Rob Herring (Arm) wrote:
> Many simple GPIO controllers without interrupt capability have the same
> schema other than their compatible value. Combine all these bindings
> into a single schema. The criteria to be included here is must use 2
> cells, have no interrupt capability, have 0 or 1 "reg" entries, and
> have no other resources (like clocks).
> 
> Note that "ngpios" is now allowed in some cases it wasn't before and
> constraints on it have been dropped.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> We could also do this for ones with interrupts, but that seems a bit
> more varied.
> 
> v2:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


