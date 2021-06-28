Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3823B5754
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 04:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbhF1CwD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 22:52:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1CwD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 22:52:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F1C461607;
        Mon, 28 Jun 2021 02:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624848578;
        bh=hVlpuy9+TPkmTJ4AmwBj5D05xhmr3bIYPLozZDNwCho=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XNKrXAVecAiBmASP+9u/gCUZu/b5c84VuhXpT+xyPBelLbiHDCj3u/BoIh6xBUk/H
         E4Cu2LzBl6zKiptd3ABISHAwi16jRpzlw9iApdICbBzK44ZXItFjMtTMVyfWMD7PjC
         1hdsAr8+ajqhNE5Br3Ki9+SfhOdwN8ttzvs8+j6+lynAWBtL6Qn3j/8XdNcomSyXtd
         T43tABeaW8UCwKkJq0qGQopzs8j3D21DJ2TbpFSZCgt2qwn0g+bzZW09T4MafGvJKR
         mljFWmGRFPcSogtgDXImNzNCCsH8bdqDBF1D0FblS3AZ6oOZuO6KsDq6KBeweERRsG
         KURc5BBjDbeBg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210530164923.18134-3-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net> <20210530164923.18134-3-paul@crapouillou.net>
Subject: Re: [PATCH v2 2/6] clk: Support bypassing dividers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?utf-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Sun, 27 Jun 2021 19:49:37 -0700
Message-ID: <162484857732.2516444.10099499446355358025@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Paul Cercueil (2021-05-30 09:49:19)
> When a clock is declared as both CGU_CLK_DIV and CGU_CLK_MUX, the CGU
> code expects the mux to be applied first, the divider second.
>=20
> On the JZ4760, and maybe on some other SoCs, some clocks also have a mux
> setting and a divider, but the divider is not applied to all parents
> selectable from the mux.
>=20
> This could be solved by creating two clocks, one with CGU_CLK_DIV and
> one with CGU_CLK_MUX, but that would increase the number of clocks.
>=20
> Instead, add a 8-bit mask to CGU_CLK_DIV clocks. If the bit
> corresponding to the parent clock's index is set, the divider is
> bypassed.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
