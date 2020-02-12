Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 055C215B031
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2020 19:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbgBLSwv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Feb 2020 13:52:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:36238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728948AbgBLSwv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 12 Feb 2020 13:52:51 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A30E32073C;
        Wed, 12 Feb 2020 18:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581533570;
        bh=12+VKrS/b2omYtFrb/xDX4LmuK8OVdmgasTJNtuGZp4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=t1vJ507FKkJWdQ+ja8dsv9WjKFvuCZLswuvgueWtfnOZ6I6GlF4YGjWhBu2aqcSmA
         UcrgoqVpt/MTDhK+9+1Q8vPqm31Veaqc53ER4WZ1PThfJVCBcD1urHopmji+v7CJ0M
         v9UiOyql4mtf66OBXxNRN0N7bkPchBvyrAmIKA8c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200212101544.8793-2-geert+renesas@glider.be>
References: <20200212101544.8793-1-geert+renesas@glider.be> <20200212101544.8793-2-geert+renesas@glider.be>
Subject: Re: [PATCH 1/7] MIPS: ath79: Replace <linux/clk-provider.h> by <linux/of_clk.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        James Hartley <james.hartley@sondrel.com>,
        John Crispin <john@phrozen.org>,
        Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>
Date:   Wed, 12 Feb 2020 10:52:49 -0800
Message-ID: <158153356988.184098.3686114602761533254@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Geert Uytterhoeven (2020-02-12 02:15:38)
> The Atheros 7/9xxx platform code is not a clock provider, and just needs
> to call of_clk_init().
>=20
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
