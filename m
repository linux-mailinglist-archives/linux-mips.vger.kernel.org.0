Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08EF4437CB
	for <lists+linux-mips@lfdr.de>; Tue,  2 Nov 2021 22:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhKBVa2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Nov 2021 17:30:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:48750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229981AbhKBVa1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Nov 2021 17:30:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DF6F604D2;
        Tue,  2 Nov 2021 21:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635888472;
        bh=Wdy+R+mhNQrwqZyp2s0QHiaEem3L8ynEcoMWp7hsjsg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=c7UC/O2pppVm2DFxmC3eTWUy9CnD40XWqzw3HnUfoJwzbJjDZ2G8XPhw2iodF/qHc
         DiKV1Ajsd2aXoksyunHeftD3bpLLRBj6H42iqHPoseaQg/F3p/nvVp821qtBKYb7V/
         wqMLiwlm3FQ1nU8JSoT5l1Lu+vUBqoARN8d9hYYmetFAoWgx6tg31i4n3oRXLxpgl9
         bn5jeUWQ1Pgrdx1FpeJBq9Tjzn6sX+aAnTsEea21VLHheK2GgR2xMmt+q6/FfjB6S4
         24WcdyjLxuoNd/XJKvDvc/zyUh6gL5xnLdLkt+AU7LeHpT/m8XKvHeqOznJ8YmF7jF
         LefKU6BEi6GOw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211001172033.122329-1-paul@crapouillou.net>
References: <20211001172033.122329-1-paul@crapouillou.net>
Subject: Re: [PATCH] clk: ingenic: Fix bugs with divided dividers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-mips@vger.kernel.org, list@opendingux.net,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Tue, 02 Nov 2021 14:27:51 -0700
Message-ID: <163588847120.2993099.5234069019391601753@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Paul Cercueil (2021-10-01 10:20:33)
> Two fixes in one:
>=20
> - In the "impose hardware constraints" block, the "logical" divider
>   value (aka. not translated to the hardware) was clamped to fit in the
>   register area, but this totally ignored the fact that the divider
>   value can itself have a fixed divider.
>=20
> - The code that made sure that the divider value returned by the
>   function was a multiple of its own fixed divider could result in a
>   wrong value being calculated, because it was rounded down instead of
>   rounded up.
>=20
> Fixes: 4afe2d1a6ed5 ("clk: ingenic: Allow divider value to be divided")
> Co-developed-by: Artur Rojek <contact@artur-rojek.eu>
> Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
