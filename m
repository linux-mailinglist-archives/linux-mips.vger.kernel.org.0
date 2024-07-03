Return-Path: <linux-mips+bounces-4124-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0E9926851
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 20:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61DA91F214C4
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 18:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDECF1849C6;
	Wed,  3 Jul 2024 18:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlFinWsa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07431DA313;
	Wed,  3 Jul 2024 18:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720031667; cv=none; b=PxpMPbRiGhSxFfFKgfGfPM1gTXQnFvjgQ7pqcDDN0goJqhJ0GVXPjK/s/4xTc8dCOwOI3a3ws2IqisHyZMaAUS9B5V7HxpWaSXlO2ccUn5tBeOO7q1W8cinwcH5DFIN5qsxoEYf55kJNlPt91xmCRpFdccWLXsOs5RKNU7s743k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720031667; c=relaxed/simple;
	bh=75LWJFdF9aagmw6N/35Fph3+fUpWNs+Pce1uKbQYf3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E+LvTszF2Bx6YM1Hm/rv2Phwm44jQpr81VVSLOE7ybfySN7j+Pq2vWrfcpjyu/anYLuVcJ+xRxuqDGThfWSfWAJL9GlDxeg0b0Nrbx8HGKs3ysttU9dpE4AOw80CJ93bQky18a0z6wHDYcxZydytGcEef5kABYUGlogE4Fvclrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlFinWsa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A33C32781;
	Wed,  3 Jul 2024 18:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720031667;
	bh=75LWJFdF9aagmw6N/35Fph3+fUpWNs+Pce1uKbQYf3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZlFinWsaNVrvGmZiNySxfxWG2sUm9QrY1MBykONGigKwpKDeYa0FHi8EKqXBxZJuy
	 dsflTJ9guyvawMQH4J1OX8SDt6pj/rPiloc86OspDM0jkQK1cBoz0J5RU4hVJuPezI
	 CxquH0GajkhBQ43C66pl/D4BpsQuO4oK6BJzmIk3bxrvEYxl+E7/rrW/ibS20Z5D+1
	 QhDpUu0gZi0lZ2J1k67ownG6xVGF9InQMeJANT7C9A6eWg+rvGibhwl1BRtmgFcE9/
	 isSK/HbjmPbXNIDWpfEzxypfSCP5E0ajN4t952uOuWjePgJBMzBYLMKLskq5hIwcaS
	 /WaETrjuuBkiQ==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
References: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
Subject: Re: [PATCH 0/9] ASoC: Constify struct regmap_config
Message-Id: <172003166452.103730.17308665420530881641.b4-ty@kernel.org>
Date: Wed, 03 Jul 2024 19:34:24 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Wed, 03 Jul 2024 18:20:56 +0200, Javier Carrasco wrote:
> This series adds the const modifier to the remaining regmap_config
> structs under sound/soc that are effectively used as const (i.e., only
> read after their declaration), but kept as writtable data.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: cs35l34: Constify struct regmap_config
      commit: cb148180125ef88a4c1c20ecf25337f1e45657bb
[2/9] ASoC: cs35l35: Constify struct regmap_config
      commit: 306e0317bddfbb6bea1ad31c3daeecaec0304295
[3/9] ASoC: cs35l36: Constify struct regmap_config
      commit: 0271df05e6fe92b7000dcce5058a0ed6af127ef6
[4/9] ASoC: cs53l30: Constify struct regmap_config
      commit: 52f0aa5fb9437013f7f35d61426de497a8927891
[5/9] ASoC: jz4760: Constify struct regmap_config
      commit: 8d9c0ede48f29c9fccd095952d657fc5696da9ac
[6/9] ASoC: jz4770: Constify struct regmap_config
      commit: 7abfa29ba6a43c5e25622de1ba1f1846b9c9b5e8
[7/9] ASoC: wsa881x: Constify struct regmap_config
      commit: 5ffab1d3f3f3281869b894070fe4438f307759ec
[8/9] ASoC: wsa883x: Constify struct regmap_config
      commit: 22c361dc7ce4d4d6a688febee57d6e4b130b96b3
[9/9] ASoC: wsa884x: Constify struct regmap_config
      commit: e15cc906b9c5af5414bb6002b6a036550bca6bd8

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


