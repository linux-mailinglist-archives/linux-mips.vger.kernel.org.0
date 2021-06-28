Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1E83B5765
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 04:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232067AbhF1Cwa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 22:52:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:57846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232055AbhF1Cwa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 22:52:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2115261607;
        Mon, 28 Jun 2021 02:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624848605;
        bh=RySPZek1BY+U0NUQ1iPVV8k2zZqZcm37XKiMsboR6E4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CgM/kpa2jfP9wNIQLu1qwD09yLc8y21FkFzJXKifZ6pac/sYiYjLwVx7+NohdTnsh
         bFTPFfMK8E85sZ6vgexxZx+Y6kTMc32ccNddw+xYxPgmY/3yGHCLSN/gor2b1PD0qx
         Kgx5i/0kSHJI1Y2GwlgHKyaYnbBE9nH3JfZBBRlyVBBUAUd8SHVRg0nhhXTXyYplA0
         3DSHhAR3TgWZ8n/LCmsTR41tdUhaS9+ds6hvZD8pebAUUXG/nxio5XfacMn1DClaOU
         SNuXIaKZorJ8BIeQPQdf7OG9z1et715kfZTUUZxs0n9+SpaxRUZxjwJ8wOBkl3fmU2
         +Kqn4jOHqgfTg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210530164923.18134-7-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net> <20210530164923.18134-7-paul@crapouillou.net>
Subject: Re: [PATCH v2 6/6] clk: ingenic: Add support for the JZ4760
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?utf-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Sun, 27 Jun 2021 19:50:03 -0700
Message-ID: <162484860391.2516444.9536343468022864909@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Paul Cercueil (2021-05-30 09:49:23)
> Add the CGU code and the compatible string to the TCU driver to support
> the JZ4760 SoC.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
