Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE25337A1DD
	for <lists+linux-mips@lfdr.de>; Tue, 11 May 2021 10:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbhEKI2y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 May 2021 04:28:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:37642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231202AbhEKI2l (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 May 2021 04:28:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 967FD61432;
        Tue, 11 May 2021 08:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620721655;
        bh=uzIUXmmWVharUwwMxFDeaL2AN14Lz0cJsHF6MbAcCGM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R8dzV1HkYNv/mNUWY1V8C/GJk6Ff4RhJJ09ZbfacGWQEtvO3jsw1GLCV1d8wjP6BS
         SOjvJF3HimxxJ85iopOFWzLvFOimplB1rSY5qje7QdoQpo7Zc1Ts865C4smxdBct72
         BSTY56mPFuvpzBu/WaRzwby6YVU91SD8Zib0/QViDhqgeuGdCFcwmvsYgS9ARQg5kM
         X4UJs9Fo12iUetqtgfF0RPbGFtXca4Bi9mhBqcv7s42XtXaA5MWf1X+SKVhsVIoMl4
         +UjTkOtPfV1Pg/7nzKQvqRVMKdnuObDRrLYMxyUO2rQVIoZxFupC69kVCljTJjeS8N
         9TVMtTKmetd1w==
From:   Mark Brown <broonie@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Jaroslav Kysela <perex@perex.cz>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, alsa-devel@alsa-project.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] ASoC: jz4740-i2s: fix function name
Date:   Tue, 11 May 2021 09:25:47 +0100
Message-Id: <162072058168.33157.14483051619888083091.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <56f9c8518870263698b00d10de4821d2dc8932be.1619960935.git.hns@goldelico.com>
References: <56f9c8518870263698b00d10de4821d2dc8932be.1619960935.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 2 May 2021 15:08:55 +0200, H. Nikolaus Schaller wrote:
> This driver is not related to I2C protocol.
> 
> s/_i2c_/_i2s_/

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: jz4740-i2s: fix function name
      commit: 16f2a3cdaacaa7c077e238df45e4d38d6bc0a6c5

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
