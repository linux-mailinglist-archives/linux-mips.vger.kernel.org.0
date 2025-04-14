Return-Path: <linux-mips+bounces-8593-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEFEA8852F
	for <lists+linux-mips@lfdr.de>; Mon, 14 Apr 2025 16:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2040D3BFF3F
	for <lists+linux-mips@lfdr.de>; Mon, 14 Apr 2025 14:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BF2297A66;
	Mon, 14 Apr 2025 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6A+4fEX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA28F2973DB;
	Mon, 14 Apr 2025 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639001; cv=none; b=BYMSAiKEHV1RjeISveDUOa+YvlC/DCfbycG2h5kY36mJbqZlV9GRFAQOAxE1IMzD1cn7PMAjhcNA4+ZBRaoXIGb/qsVelMDglK5Ovw9sXxiNHGuEmfAQK3aejCTAdq7i3a8MRqVLggIBsekIThXNm4A9Xmujvs25eLMdaV9W39M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639001; c=relaxed/simple;
	bh=/efdcXBCkp25/Whv4nPqxxiDxKeXYrIljk214SJcbtk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HzZaWRQ0dDfbYmDDKuQCfv4hJ2a5NYLJgIY6j92J/A5jzBoHSyRiK+ZYSZqMTK4sJwomVpzqZZbeer/qoy9Is14deVvDMTp8DqpTjrqglL/lmtsXN6rOjFug8FBOcCcTkGc+V/3NLBQbQjU6IXQFbAD0Ue9OYtNFFTkbjj2HNwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6A+4fEX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F7CC4CEEC;
	Mon, 14 Apr 2025 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744639000;
	bh=/efdcXBCkp25/Whv4nPqxxiDxKeXYrIljk214SJcbtk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k6A+4fEXe7SHkW6I6+sdgDNidr/hWTyi5YOiRu2mVojqOAxbbfHtKzflStaYBmy2u
	 a16daAogKddexBTxm7P9VUpnEvnAbNFPU8e7x8A6K7kkTPy3Kk7nE1PDz6L+tbZ/1V
	 /zX+Om0AGw7RNg6k9+6ANrc1/PfyE519FdavAIC5JtNn/ywktWbiKXZnlXtsEP01/f
	 mgL+1ZalDZIa1gqErc1oE1ea2tzdW2pjlVe23B6HmW+KBvcluU5F91/3mvZ2gJZG/j
	 R7iY6fMS38QZGq3DoBhHB1wAx4DS7GU0bidyNVCa1+wcrDXq5p0Mkbf5WA5yBSisWa
	 cpG20PRBe0LHw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20250409-loongson1-ac97-v2-0-65d5db96a046@gmail.com>
References: <20250409-loongson1-ac97-v2-0-65d5db96a046@gmail.com>
Subject: Re: [PATCH v2 0/4] Add support for Loongson-1 AC97
Message-Id: <174463899776.86688.5147297198063500549.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:56:37 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 09 Apr 2025 18:29:30 +0800, Keguang Zhang wrote:
> Add the driver and dt-binding document for Loongson-1 AC97.
> Add the dt-binding document for Realtek ALC203 Codec.
> Add DT support for the AC97 generic codec driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: Add Loongson-1 AC97 Controller
      commit: d60007fc9b739d939d5b6148c25805f206c836f9
[2/4] ASoC: dt-bindings: Add Realtek ALC203 Codec
      commit: 0142b45000457b9d112d40d5685d0898e51ed52f
[3/4] ASoC: loongson: Add Loongson-1 AC97 Driver
      commit: 1fc55a2baef5289c9535ce10a4f5f37664ce854a
[4/4] ASoC: ac97: Add DT support
      commit: 436a3cc8afbf34bb68166c2c5c19ca5113c0c756

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


