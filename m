Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F1A313DBF
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 19:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235721AbhBHSkH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 13:40:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:57894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235710AbhBHSjg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Feb 2021 13:39:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B47A760C3F;
        Mon,  8 Feb 2021 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612809535;
        bh=SJZ0NVTsr2Wlxcsv1fv1kCF7qQH9E81Nonfp1RQf2jc=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=aKgHoLgsSGyJMiXx+Ih+Tk1rC/2eMKt2fZf5+Sx31/ElTclR/w2bWqwtCygNbuWfj
         Yj4FV7LzG+aY+XAg//9s83baQAdpuEHLct4DpQyoyrF1NxO8ikj1i3vSemmIz55rcF
         KYDTVM1vcWpw66bXt7A1jTuj2M7bGRjf23/9FC6strvhdxFvbbZ2AbYrlO4owsSy1m
         xxqGkD7bWvBRQ3T/3HIOMseF7m0M7utgOvqpi4qz3ZM+3IBGkb4Arh4EjPyqiWo6xd
         rz90DTRAEU5TZ8/mmYFsmIZX8BA/aZWB5tBZTfyTdoZFmo1fteGJI+ch/wEloUKCcg
         0N8WQPz3D1i8g==
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        od@zcrc.me, Christophe Branchereau <cbranchereau@gmail.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
In-Reply-To: <20210123140958.12895-1-paul@crapouillou.net>
References: <20210123140958.12895-1-paul@crapouillou.net>
Subject: Re: [PATCH 1/3] dt-bindings: sound/ingenic: Add compatible strings for JZ4760(B) SoC
Message-Id: <161280948305.10741.16478273980568461792.b4-ty@kernel.org>
Date:   Mon, 08 Feb 2021 18:38:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 23 Jan 2021 14:09:56 +0000, Paul Cercueil wrote:
> Add the ingenic,jz4760b-codec and ingenic,jz4760-codec compatible
> strings.
> 
> In the process, convert the previous compatible strings to use an enum
> instead.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] dt-bindings: sound/ingenic: Add compatible strings for JZ4760(B) SoC
      commit: 45a90d4aba1781aa382d4aeedebcac7cc78e1927
[2/3] ASoC: codec/ingenic: Depend on MACH_INGENIC
      commit: bad929b81ce25bba1c3e9d91848ffdc166974256
[3/3] ASoC: codec: Add driver for JZ4760 internal codec
      commit: d9cd22e9c87cb61488d00f7279cfb2abf5238879

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
