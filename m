Return-Path: <linux-mips+bounces-5748-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705399158E
	for <lists+linux-mips@lfdr.de>; Sat,  5 Oct 2024 11:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1B1E1F22311
	for <lists+linux-mips@lfdr.de>; Sat,  5 Oct 2024 09:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DBE13699A;
	Sat,  5 Oct 2024 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaVYUAhI"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDAA17C77;
	Sat,  5 Oct 2024 09:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728121841; cv=none; b=jkOH6ULsgIoc5fljLpsGUDn4WsaLvHEiwQH752g6MiZp9ktrfkChTWDBJnCiGIVlEtYMwshnCModG35wd+EV7rl13XGpJ3NuBn/3SOYG8S+q1Ib5dIfmkgb7v4JzDNu5zrOgZLtbhZwbIZvm6N6FHomAOA6fyJe5Ev5AWZqu/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728121841; c=relaxed/simple;
	bh=wUQjLZzpHEAHwW5NYCB95sIsPmmiGfq1M5ccwnjqYcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tzST+ztKh1FnDz2TAMHZdpoVfuf0WhOyxEW9yQs8tRhg1SmoTrBxrhDz9aGO2vSkizxoGxwb3INNnnjn9TwSTpqijjA7vk2AVpDDoI2NoZeANlpsVWZPY6Fjeon6ZCmAUNb7Kcn9A5wdbAOSVrK+T4Q3zzEYgxdeIa5NGLPRumY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GaVYUAhI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9972FC4CEC2;
	Sat,  5 Oct 2024 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728121840;
	bh=wUQjLZzpHEAHwW5NYCB95sIsPmmiGfq1M5ccwnjqYcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GaVYUAhI+bKnmfCoaBMuc8M05yXqaDC4sXcuvXuJDBS5yOdV/CKkEcHImislnzgF4
	 vOu2dKkr+K+Qf5BfAy0uoYVbsB8YsuNKMCajV3BaBbhydc6U4nqU2xkDEnXt8WcpEE
	 QVrgnKeiE2MVo6oIxc8nsI+X+yb7eNl4IXHUgBEWHvRWvziK17GLEM/iIWmbls/x1M
	 dT6+WkQ8/530Fnu6I8UqjbPjG4vL/oUVg+cvAIVpATPKjtfQqQgqxZVVm9FlCK0F5g
	 nP+Xm9Voqi5gxgd+jnAytypKLyveK3mFYN2OfA6oas06qEknaatVi7gMI0tRoe++D9
	 KfiqWSRpw+CDQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, alsa-devel@alsa-project.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH treewide 00/11] ASoC: Clean up
 {hp,mic}-det-gpio handling
Message-Id: <172812183435.891737.5699490340500862525.b4-ty@kernel.org>
Date: Sat, 05 Oct 2024 10:50:34 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 27 Sep 2024 14:42:15 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The "gpio" suffix for GPIO consumers was deprecated a while ago, in
> favor of the "gpios" suffix.  However, there are still several users of
> the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
> drivers, and DT source files.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: fsl-asoc-card: Add missing handling of {hp,mic}-dt-gpios
        commit: cfd1054c65eefec30972416a83eb62920bc1ff8d
[02/11] ASoC: dt-bindings: Deprecate {hp,mic}-det-gpio
        commit: e58b3914ab8303a2783ec1873c17b7a83dd515f7

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


