Return-Path: <linux-mips+bounces-2227-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30239876D56
	for <lists+linux-mips@lfdr.de>; Fri,  8 Mar 2024 23:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFBB2B20FC5
	for <lists+linux-mips@lfdr.de>; Fri,  8 Mar 2024 22:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1862C36AF8;
	Fri,  8 Mar 2024 22:52:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net [46.105.63.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173E336139
	for <linux-mips@vger.kernel.org>; Fri,  8 Mar 2024 22:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.63.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709938369; cv=none; b=bqmtI4blapJxhv8XI6UsX/BPJKagKtsW+hHd8aaysw5U6aKCSRyAImTUCURMicuxbw2gS3VNhGSGTQ7uxI6EYbaICLWEti8RrmUkdbW3GvQ4gzhgZCOne0CZU5s9myhWodN5LbCG5boIQJsAsGNThcVaFVN/tROTXKDSLmseC4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709938369; c=relaxed/simple;
	bh=JC/1Hu15t3XDRrwUWjQx6XQH7Jgd9AvFXSl+dsOCvpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rZeJAuCzgzWh+TpeSa9rncN4ilOSC2N99sI/kRtt0xxD/kI6CcXt2hUKMD+rgTF+dX7CtMf3TWnHXckgDR2pnWVbsbbMKaPT+hKtuFRxomAwp1tYkF8NQlaC7MdFq+HrLUgMPrruYKsC7aIvBBbDs1EaoW5NnLVtAP64ilmCvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.63.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.17.43])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4Ts1dy0XXwz1NWp
	for <linux-mips@vger.kernel.org>; Fri,  8 Mar 2024 22:52:38 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ntc96 (unknown [10.110.96.185])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7A5501FDF9;
	Fri,  8 Mar 2024 22:52:33 +0000 (UTC)
Received: from etezian.org ([37.59.142.103])
	by ghost-submission-6684bf9d7b-ntc96 with ESMTPSA
	id 9KAtF7GW62U7/wgAM1TUiA
	(envelope-from <andi@etezian.org>); Fri, 08 Mar 2024 22:52:33 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-103G0052d1e97d6-28cc-4232-bc2f-0242f8e7f9a9,
                    2D11F706EFA52336831762ECFB2C8F5C1953C755) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
Subject: Re: (subset) [PATCH v3 00/11] Add Mobileye EyeQ5 support to the
 Nomadik I2C controller & use hrtimers for timeouts
Message-Id: <170993835026.2617902.961311079016126204.b4-ty@kernel.org>
Date: Fri, 08 Mar 2024 23:52:30 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 10859586080687524573
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrieeigddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhephfdukeehgfegueeuleehveejueegveeiudejgfegteffvdetjeektdeltdeiueeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht

Hi

On Wed, 06 Mar 2024 18:59:20 +0100, Théo Lebrun wrote:
> This series adds two tangent features to the Nomadik I2C controller:
> 
>  - Add a new compatible to support Mobileye EyeQ5 which uses the same IP
>    block as Nomadik.
> 
>    It has two quirks to be handled:
>     - The memory bus only supports 32-bit accesses. Avoid readb() and
>       writeb() calls that might generate byte load/store instructions.
>     - We must write a value into a shared register region (OLB)
>       depending on the I2C bus speed.
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[01/11] dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c bindings and example
        commit: 1b9a8e8af0d969ad8f2deece827e691a1b07ba1b
[02/11] i2c: nomadik: rename private struct pointers from dev to priv
        commit: ae9977eefc4a1e6e8fda619f5b8734efb6f11b58
[03/11] i2c: nomadik: simplify IRQ masking logic
        commit: 43f58f3e4b6678f7138461e17a37eb3aed223bf5
[04/11] i2c: nomadik: use bitops helpers
        commit: 9ab4b2a4faf459514f2c84c5302b207b4bb8b1e1
[05/11] i2c: nomadik: support short xfer timeouts using waitqueue & hrtimer
        commit: 127b87a5d11571932ea7f4d8115f4effc2f110a8
[06/11] i2c: nomadik: replace jiffies by ktime for FIFO flushing timeout
        commit: 0aaab5ad3a615bab4e1d401f545f77889377fffd
[07/11] i2c: nomadik: fetch i2c-transfer-timeout-us property from devicetree
        commit: 0148feec0a51445d29a773e55bc8be9aa3b61a8f
[08/11] i2c: nomadik: support Mobileye EyeQ5 I2C controller
        commit: 983548d0e62a93146f35185e6c49e568b05fb44d
[09/11] i2c: nomadik: sort includes
        commit: e275c0cf70e47304bc63c050c14129237c588123


