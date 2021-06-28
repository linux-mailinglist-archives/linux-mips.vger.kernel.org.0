Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A360F3B5750
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 04:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbhF1Cv5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 22:51:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:57348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1Cv4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 22:51:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29A7961607;
        Mon, 28 Jun 2021 02:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624848571;
        bh=5nsNOrZsTVxacPUS/6i3DBZ64RYQ0EV6foVs8Zqp76Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bxysx5xprks0umN++gZ33HOKkmWiLpBpwsAc0gYW3rco0o1JiEi+5PpRvMkqgT7fu
         m+V/azKR60ahzf4l6CExKnFzNyU9QPLCWM6BDmlZd+c2TTghWJXFd6qTfjtOdxTUn2
         f+aB7zBKRMbFz6RMh+NiAQBsdMjTaf21yeuO81JW7m28xAGkJb9TXgFf0JIiz42iC+
         M4VFlOcDREhg47zg6/ui0keOBGk4vpFHL+rYK+nRUDvIkwf4k+swTyl7d7wcmAPeYW
         p9DA40KyrJMcPViLQtEy+IgjFV8BNwt6L2lPKB6qwGIN7zWiOwQyRb0TAUOWJO4amI
         ll1cUK3gHlwJg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210530164923.18134-2-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net> <20210530164923.18134-2-paul@crapouillou.net>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: ingenic: Add ingenic,jz4760{,b}-cgu compatibles
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?utf-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Sun, 27 Jun 2021 19:49:28 -0700
Message-ID: <162484856881.2516444.839345627395127167@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Paul Cercueil (2021-05-30 09:49:18)
> Add ingenic,jz4760-cgu and ingenic,jz4760b-cgu compatible strings for
> the JZ4760 and JZ4760B SoCs respectively.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
