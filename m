Return-Path: <linux-mips+bounces-5621-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA79840B3
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 10:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2135A28622E
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 08:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE36914F121;
	Tue, 24 Sep 2024 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTNrzwEy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28931FB4;
	Tue, 24 Sep 2024 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167194; cv=none; b=ZfEQvbwkzHqysankyjOPbBrqMoxDYX3t5OaMQWj7ommDNlIqxzw0Vk3yrs6Zvnk4JkZOabdvPIMhgbqLqRA5lvlxlksjJqMMvqlcWw8TNRQgf7aYjb6ELeypdTWpvrIEqUppPhFPEdCXUmxtyNxPXKCutWuydc22Nxup+1pMMaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167194; c=relaxed/simple;
	bh=VBMmEvfjzzLWHNeDIviji43x3zcFs+1GoNUYd+2S4ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWwWGrneF2gVb4Bzvi6jCVPQK1ZMM3jx4fQj/H05vmkPuOHht030SwecdlSTVqezDiINUCoVVtNdL2Cs5+xvGW9aQnE83hnvbTvPZArli2ewbCV0hM2yv4mPbJIDsBixEqctmdQGp7eEwpqh0aZXsBxIwzNaVaMn1gwYFNh0m8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTNrzwEy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BA4C4CEC4;
	Tue, 24 Sep 2024 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727167194;
	bh=VBMmEvfjzzLWHNeDIviji43x3zcFs+1GoNUYd+2S4ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTNrzwEykVIotlMAijrXbRqZjLQmZre7wQAaPqT4hBhu5Usf5uRMoqAf/LTY/7gbA
	 hMC+MWo/ehcwj92HCx5kjCwFLzQLXJUTH0y7h8Xqp/9kAOMVghJgoqVMN0JMPiGL8o
	 AahFg0pYI9+VZvUKNlIiQUb7FT6LJLI8BOk3beMn03kdp2wkeUtYeptM7pq7pqlX2I
	 LQgeH2i7Buf/iPmJRQe4SPopMqd74yKW5OkZiDZZC3jZOphFf8fBsqSrSlmPWqTgs7
	 fZ/rRoS/c2QLbvIhjoEuSHiPrU1kW7CK4LZhv/zQyaIcRhU1ipQZIokWgZv71kksNI
	 PCW81NsPbKAEg==
Date: Tue, 24 Sep 2024 10:39:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: Add Realtek switch
Message-ID: <jdqmrbjngrcmxtow2khhplvhhv6oh4msts4lggogfbgjj7fyfn@dve6dxeijywz>
References: <20240923225719.2999821-1-chris.packham@alliedtelesis.co.nz>
 <20240923225719.2999821-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923225719.2999821-2-chris.packham@alliedtelesis.co.nz>

On Tue, Sep 24, 2024 at 10:57:17AM +1200, Chris Packham wrote:
> Add device tree schema for the Realtek switch. Currently the only
> supported feature is the syscon-reboot which is needed to be able to
> reboot the board.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


