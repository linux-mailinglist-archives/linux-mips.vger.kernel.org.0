Return-Path: <linux-mips+bounces-9695-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AA1AFE7E5
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 13:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2455A1BC4BBE
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 11:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CC62D1F69;
	Wed,  9 Jul 2025 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+8o9/H9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD12528DB7B;
	Wed,  9 Jul 2025 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060986; cv=none; b=JBJrJgtbkvkKdw8/I68TgQj1OTzpF3QNcZYHMmP7yxf6f5UX6TRkhQJLkNVqAP2lIQ7/OT8lXNZ3j6EGjTBq0DIAx9oBLeWBNWS/JREx0qh84Ls8/QJBbl4hcKF3YNNkQoKqfYT5YFG3Sf3uIoc4b/fB4Ak4lWxwGwgxkrBy+e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060986; c=relaxed/simple;
	bh=rnrcKNFDvtzE1G7HLcjWDoj9d1wK6tddqGGd8H1wIVc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ccu4P+IWYdz0NIIbBU43QPPgqsYAiqD/wey2mL0KlwP8JyM8Q/CTxWETlh1F802byMGf5/SYb+uGreGQLLbI6wbBWGuBx+ZznLj9MyNC3dJX432PO/2qOZM+0+vunBU1HUWbJ75XqDeocSpaWP4KQLHQV3U/baCQJBqsdyHRtao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+8o9/H9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57450C4CEF5;
	Wed,  9 Jul 2025 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752060986;
	bh=rnrcKNFDvtzE1G7HLcjWDoj9d1wK6tddqGGd8H1wIVc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g+8o9/H9nux7mnifj3cg/4hXWjUlCYOROAxqeBI9sNKWoIIw/hP+LjBUh2QY10PfH
	 KSBFyTn7yKgszc34+sBIC6PE3JLzrSLsGuco4AAfE8HDPFfMyWC+gp0JPF1bwAu25O
	 H21Dwnv/XbO9MddF+S3qeZzEmOxkgWihsG5k6qWrrmwTcOVOkT/x6tCoFEEmPZZWHE
	 Mgd5Bkte6LEPYZRRbEzIdoRjhJmAzALSP75K5av1JhIwtMNngq+Cr9WLMQ8xzv2NrF
	 X+ILBo5z9HYm4n/5CEmXtIGTiePq6wLbPtFsBHd1t7XHHLtlGCKKuxLXHSZLWkDBGK
	 MhiIXQhz2Jr/w==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <242832f225ae68018111648ea9934dc059741567.1751989463.git.geert+renesas@glider.be>
References: <242832f225ae68018111648ea9934dc059741567.1751989463.git.geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: img: Imagination Technologies sound should
 depend on MIPS
Message-Id: <175206098407.674109.10318726327489121881.b4-ty@kernel.org>
Date: Wed, 09 Jul 2025 12:36:24 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-07fe9

On Tue, 08 Jul 2025 17:47:29 +0200, Geert Uytterhoeven wrote:
> Before, all Imagination sound symbols were gated by the SND_SOC_IMG
> symbol, offering the user a simple option to hide them all.  After the
> removal of this gate symbol, all symbols are exposed to the user, even
> when configuring a kernel for a non-Imagination platform.
> Fix this by adding a dependency on MIPS, to prevent asking the user
> about these drivers when configuring a kernel for a different
> architecture.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: img: Imagination Technologies sound should depend on MIPS
      commit: 68e4dadacb7faa393b532b41bbf99a2dbfec3b1b

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


