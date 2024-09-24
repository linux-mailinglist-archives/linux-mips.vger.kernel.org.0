Return-Path: <linux-mips+bounces-5623-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEEB9840BB
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 10:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3F3E1F21771
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 08:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04C414F124;
	Tue, 24 Sep 2024 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xs1Q0TX7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B117214F10F;
	Tue, 24 Sep 2024 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167263; cv=none; b=uthUeCb3SzG8iNo2/kp9m47IcQzce/xhXYSFDaK+rHFGD1AEniVq4aOrDi2MtNyQrB9a8DQtaZA4ZLCzYnzrvY91RGiYN37o0BdP+1NlxSt/YnB02WF2W34BEJF9/UVmjH7B4DW17L0vV7pmsYzY+PjaqvdVay9sUNQxKC+e7UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167263; c=relaxed/simple;
	bh=CZGzooVvDJ5xV4Hj2DDyxrw4K01HEKRwaoPhkzf7DA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgH2ECjwFiF1j2lagHN6NxNXg9vRLHSOOFIc7m8AHDi0zR2Eq4Z8mOqwm21eHwBoft8ILYmnpazJRYUsZtQ2d+P89014pRfLRuqdZR6NeMg/SZAgpRO4tp4nnGcxmNYK2v5I28aIYrdxhsqoMs6XOxoMWDZuZiowN/jaQfAWGzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xs1Q0TX7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50217C4CEC4;
	Tue, 24 Sep 2024 08:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727167262;
	bh=CZGzooVvDJ5xV4Hj2DDyxrw4K01HEKRwaoPhkzf7DA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xs1Q0TX7+1DAotzDKcskegeldkdDCPsNUufU0P+V+6s4CL3vW2TJ80AwZvMz5h+vE
	 kDdPi0XzZ8ldCJJ+cXE1EBz8PIPoX6yTjrpyivsqPzAZALlszq0pl0WHgH2H/9Rb9q
	 kB6fniCYyQQNAndkx0FbkIBjYnP0lsUjHfo3AJEfPkmC5O8YyO1Rpxj81KvpHCLetr
	 zalxBFu72Dimu81RR7rH2HA6JZrbQ14Cg6+UO2bb3VmoaTkLwzO+tX2xgE0yp+5j8Q
	 Z2458fFe5ZUVZJt/xlEQ5Qis5B1/0xL+gddBTnJveYhNKP+meF1I5bhyN0UBKjNvRW
	 9YgD4yPWfP5SQ==
Date: Tue, 24 Sep 2024 10:40:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mips: dts: realtek: Add syscon-reboot node
Message-ID: <i2nqmh2ak26ewbs5fsfh6f5idmrlqzaxj3dbhojy4i7nxqeg4e@ugfbjgb3grc5>
References: <20240923225719.2999821-1-chris.packham@alliedtelesis.co.nz>
 <20240923225719.2999821-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923225719.2999821-3-chris.packham@alliedtelesis.co.nz>

On Tue, Sep 24, 2024 at 10:57:18AM +1200, Chris Packham wrote:
> The board level reset on systems using the RTL9302 can be driven via the
> switch. Use a syscon-reboot node to represent this.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v3:
>     - None
>     Changes in v2:
>     - drop redundant status = "okay"

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


