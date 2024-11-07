Return-Path: <linux-mips+bounces-6712-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C059C035D
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 12:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D22021C2125A
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 11:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8EA1F12EB;
	Thu,  7 Nov 2024 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWZa3o68"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A951373;
	Thu,  7 Nov 2024 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977625; cv=none; b=np5Ne2Wr0FX1/6rsp3N+i/+Gm/kBV6H1o5zDS46J9SjiEI7wAhuzn7JIBrimPTdsMVcdbfPXJl5JUf0Te80UR1VKIOKeksVJGcydQvbO0MgAcE0g+HWLgFis1p9r7hoA3e7AmWDONOcd68bFyuRGWCEO4vC5tbTw9NTQ3PI52XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977625; c=relaxed/simple;
	bh=wWy454JTOGwB3Dt5B8irjoHMNnCGPA3U2n8E8e3Bk0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fC3qaTV7OFG7wVIUC90hbv328pXsz85bJ/0lMlCnn6yPBA//QUiBdGDmlxzGx86WS4sP4efOWlFNLn0qWtnUBe2c1dSbgKyqt66n0ypApQPouIQwH14j2BuedPQI/RhG6OiSP7uFHQPTTJ7RTRxFmPA1k6Nkpegzse4x3eJk5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWZa3o68; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3D8C4CECC;
	Thu,  7 Nov 2024 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977624;
	bh=wWy454JTOGwB3Dt5B8irjoHMNnCGPA3U2n8E8e3Bk0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWZa3o68QMtmlz5POUfbiLm5sYgt9IukvYZXN97Djjp9HIdmseiG15pDIVmBC6RiA
	 m2POD/vZ4N06dRngbW2hegsUAdIFmM/r86xPqXoLUPY4D0BTkQ7Y/W8jjnxYLKRadn
	 6pvdun9SekcnvlcAE/R/faCsTcDAueuGZXcpO2ZLfG8SL4eFlNWtJWzUnykueK3CFa
	 0WJ23Z+8RlCz9+fPUa1uNv2z6pXpFbOUj+9ORYnifzISrGxwQEEuhJ+OC3ft2fv0DD
	 4asM8n3W0BkaqI4fbNgICo9Og/FQv+ZgLBWjyjAJwyR6vibJrt85QY2gVIiO4Mq1oC
	 H5F67hRkq2pOw==
Date: Thu, 7 Nov 2024 12:07:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: Fix repeated words
Message-ID: <huswmfhrf4mfewxchalts4chpddo4z67bg3kmsr3cfhhstob75@pzzuwfcvoiay>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-2-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107061124.105930-2-xandfury@gmail.com>

On Wed, Nov 06, 2024 at 11:11:23PM -0700, Abhinav Saxena wrote:
> Fix unintentional word repetitions in devicetree binding documentation:
> - usb.txt: Fix repeated "two"
> - mvebu-devbus.txt: Fix repeated "from"
> - gpio.txt: Fix repeated "Both"
> - pinctrl-bindings.txt: Fix repeated "device"
> - cavium/bootbus.txt: Fix repeated "one"

This we see from the diff. This is trivial commit, so rather write
concise commit msg.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

With changes above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


