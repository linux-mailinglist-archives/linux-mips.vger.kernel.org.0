Return-Path: <linux-mips+bounces-9713-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F021FB0018B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 14:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 561AC587C05
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 12:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D590024DCF8;
	Thu, 10 Jul 2025 12:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFnI9dTd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FF21EA73;
	Thu, 10 Jul 2025 12:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150105; cv=none; b=OjEExMDr+5o3bHav410NUegPbjnQmRHUGgSPWoO/UdBGoNp9a61dU3dQuewdrIrCiDDaaVVASquN/VMU7O2d+0dV5uycutaIx9Qejc6Dk+Uk9JFyZY5Sor1uqlu00IGXrVCiLMZqIcCVdZJ9ftMVR6qgDxQ8IerEcbLGFYbVT6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150105; c=relaxed/simple;
	bh=/tcf3W3XDJQJudjXHVgezZIZzMTl9XY6KDvu68tZFu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2yq5B1Uo1ToiTmMQi0qyUQeCmg61X8cbaaSTHC/WYqfRG0OTSgHQgkjSclOBrEHBwb94B84IJ09p243Ni6RPS6euHm9TmgDN7ahZdpC4FNWNmZfevx2ogmvG8iqGgWB6U208ks+i2CZJ4RxOEYOcWMaLvhrYm8D8AMcr4v4h8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFnI9dTd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA59C4CEE3;
	Thu, 10 Jul 2025 12:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752150105;
	bh=/tcf3W3XDJQJudjXHVgezZIZzMTl9XY6KDvu68tZFu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFnI9dTd8scvnDiNmAi68A9hRE/NFJPJeXhfB2BDUOa54UE5rRs8avzFGibUa+ruA
	 Aw9adBbcwvtEedJtRLC5BGyoVp+Mfa83ggHga4BZVZfCkpWDWFPZ9oSfZ8MBJJWe5H
	 wk3MjF5nPPBuTx2MMdw9wnZLFZMM3mq70KaqTO6nsUVYWotKhg8DP3n+1+rwD5mIxX
	 5joPOqRYV2l1RuSxXE7fAs8zvpGKzf8RFy+Z8CQacq2eQTyiTNm36YS6L+jnTn6gCK
	 GYb3AJdvno+7c4fmyLnfvoqbFOm93wJSDlDZnrAA70NSHEzHfgpVvRg0TA/W7BGJt6
	 Ig+DLolFFWYYw==
Date: Thu, 10 Jul 2025 14:21:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: mips: loongson: Add LS1B demo board
Message-ID: <20250710-black-cat-of-fame-ebcf94@krzk-bin>
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
 <20250709-loongson1-arch-v2-1-bcff6e518c09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709-loongson1-arch-v2-1-bcff6e518c09@gmail.com>

On Wed, Jul 09, 2025 at 07:05:52PM +0800, Keguang Zhang wrote:
> Document loongson,ls1b-demo, a board based on Loongson-1B.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  Documentation/devicetree/bindings/mips/loongson/devices.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


