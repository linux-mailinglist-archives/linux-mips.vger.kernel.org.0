Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1403B575C
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 04:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhF1CwR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 22:52:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:57656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232041AbhF1CwR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 22:52:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90C5161A0F;
        Mon, 28 Jun 2021 02:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624848592;
        bh=QKrQWOJp+97CSAnVtVVhtJpWeaE7HgPzRjSo8gt6Xs4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=n7BpDG7nlfkl6sVc5VtauR7ij6oMO9Vb+I7tEOXCIdA0q1I+hSIffduxEz1hRSGs+
         fvHPaOOr2RdhG/AqEjlTI0RnGlT8PfKHy5p/78pAyTEUh+t+Tv0Pa4oKJuIjUBGL0B
         iIQywyoc1GXxhsug+Uc/pyL+gmNw81jkDEkMW/E1Whk//ZRrX34mHLuaCYMBYXkNYS
         T/ZS7KWUG/WR5iEMapp3xyebSRsN43zHZ37nmLT7Ljf3TTiox+eM6bNiAapzS2RfeB
         fYG5r75sCOPTej327BJ11ptllb9uQGq9u1aPlMf2vnJV+q2lTMyyvIGHQkVchzdPBY
         CFj/IcUNS9Pbw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210530164923.18134-5-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net> <20210530164923.18134-5-paul@crapouillou.net>
Subject: Re: [PATCH v2 4/6] clk: ingenic: Remove pll_info.no_bypass_bit
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?utf-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Sun, 27 Jun 2021 19:49:51 -0700
Message-ID: <162484859150.2516444.13611912809661364397@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Paul Cercueil (2021-05-30 09:49:21)
> We can express that a PLL has no bypass bit by simply setting the
> .bypass_bit field to a negative value.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
