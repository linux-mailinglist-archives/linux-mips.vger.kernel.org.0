Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A250145FAEB
	for <lists+linux-mips@lfdr.de>; Sat, 27 Nov 2021 02:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350595AbhK0BfR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Nov 2021 20:35:17 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:55832 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351315AbhK0BdQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Nov 2021 20:33:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3F91DB829B0;
        Sat, 27 Nov 2021 01:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F51C53FC1;
        Sat, 27 Nov 2021 01:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637976598;
        bh=7AWEXiGxKVo0rxNDO4Gv6765Xqx7YOoQNOOTEkYt5ck=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=ZrMFgaq6NFixSl9xJq9wHuGHgt0TQ3RCTqELC328nzVGzSru6ElAxtdRiUoI5NB1R
         tRfNSq1XelnckovGNfEe0au0rfS2/n/6EwLJ0yDieAo/SsG3Yk0bh2s4fdbEQPxryH
         3Jypruss4lfBfOk/rHiJQNFYp+AihDkd5/w8yfMuuv/rbXhuJm/e4JWfzrWLqCxxIv
         nteKI5SWy/B9s9RWY3XAitTm+7P/3D+1GjfQvh3QjFy4WXgejGQFU4xZAnoqN6S/Lx
         R9QEw0ESwUXRngkVrs3gpjcGe7JEO+AeqCP/Kor5Gjpmvg6wdj7shnaznQXtHR3Rnt
         H/4rD6VPk8bYQ==
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>,
        Paul Cercueil <paul@crapouillou.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        list@opendingux.net, linux-mips@vger.kernel.org
In-Reply-To: <20211125232543.117074-1-paul@crapouillou.net>
References: <20211125232543.117074-1-paul@crapouillou.net>
Subject: Re: [PATCH] ASoC: codecs/jz4770: Add missing gain control after DAC/ADC mixer
Message-Id: <163797659699.2987942.6238411233460719577.b4-ty@kernel.org>
Date:   Sat, 27 Nov 2021 01:29:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 25 Nov 2021 23:25:43 +0000, Paul Cercueil wrote:
> The capture and playback paths both have a configurable gain after their
> respective mixer, which can be set from -31 dB to 0 dB in 32 steps.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs/jz4770: Add missing gain control after DAC/ADC mixer
      commit: 0b189395945dc59d327c1e0588d144ce439dfa55

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
