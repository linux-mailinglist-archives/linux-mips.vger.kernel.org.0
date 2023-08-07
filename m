Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 966ED772FEE
	for <lists+linux-mips@lfdr.de>; Mon,  7 Aug 2023 21:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjHGTyY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Aug 2023 15:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjHGTyW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Aug 2023 15:54:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E029010FF
        for <linux-mips@vger.kernel.org>; Mon,  7 Aug 2023 12:54:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 68CF262186
        for <linux-mips@vger.kernel.org>; Mon,  7 Aug 2023 19:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB06C433C7;
        Mon,  7 Aug 2023 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691438059;
        bh=tEbnU09vPVyTnjYTEByjdm9ue6dsfCiNeNTAbZgnfDk=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=s6yMBKDj6TChjpPAPdjqPI7Gd0bKNEE9JS0/iM2SgMgn4guDb/EJsyG9xRT0GkHpC
         MLO/k6WFXGFlW7PdRWGXfY5b6SWVm0ut+Wmw28lv/CHBSRHc2IZnKfWFRBa6tqL/KI
         iWRysJziuE1tfcEFlkZdZa/Lact4HWRgkMO4RWJweRv5WRv310xlclO3CxNimpAwNZ
         lOGkpSUe+SBIgK53uhxBA9V/JnPGMQgCQtGda4KnGklcdyNsmuMbjZKGFAessEugp0
         5dJFzxlgoI7znv2RbOr0OBOYlD9NFY6Dm77c0yyhdt0Czv8x/2GD8MSpUh5JDIBwUU
         hS6PNI26UN4/A==
From:   Mark Brown <broonie@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-mips@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20230712-asoc-jz-maple-v1-1-3f745adf96e5@kernel.org>
References: <20230712-asoc-jz-maple-v1-1-3f745adf96e5@kernel.org>
Subject: Re: [PATCH] ASoC: jz4740: Update to use maple tree register cache
Message-Id: <169143805855.302632.5921951627576966633.b4-ty@kernel.org>
Date:   Mon, 07 Aug 2023 20:54:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 12 Jul 2023 12:14:21 +0100, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache. In
> v6.5 it has also acquired the ability to generate multi-register writes in
> sync operations, bringing performance up to parity with the rbtree cache
> there.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: jz4740: Update to use maple tree register cache
      commit: 1ec6dffdedae4cbbd6e33b1d9be0e5a3dbb31804

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

