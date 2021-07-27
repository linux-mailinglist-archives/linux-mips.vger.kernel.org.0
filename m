Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECCD3D6AF8
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jul 2021 02:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234196AbhGZXlC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Jul 2021 19:41:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:57864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233770AbhGZXlC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 26 Jul 2021 19:41:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E84FF60C51;
        Tue, 27 Jul 2021 00:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627345290;
        bh=jx7GrUjcBVT4+QbmqnGbi6IvhiI5CLtmhVggNmKVUU8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bN0owBW/W8+hcAOGEtiAIhijoEATVuN/+t1MSymdEmMpYUikvHigO6eNG1xyNFqzr
         q2yWLXLPBCxO+Fh7xEeZg9QE3MaDq4ufdqibSsrJprqDbXzDhfqmTMGpf0rHkwACBX
         DTs509F7RRObj8L/yjmGXM1vBwSqVeq8wZfdCy0xJZiN5pc7IcYsf2cszDFGHrt5Oa
         XUoWvKpiPubRdKaSZMqigNwG5KDsYYjGdROgUD2sPKFUpLK7ErDd20pTs/T0R8Vo5Q
         dTVb7KheJhWzDl7J74IT2ja6moU4gtJJbTu7jLYgi0oST45+BMODzRf/quC4lEslS7
         EvcpJ6IxcIUpw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210723022543.4095-4-jiaxun.yang@flygoat.com>
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com> <20210723022543.4095-4-jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v4 3/9] clk: pistachio: Make it selectable for generic MIPS kernel
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Date:   Mon, 26 Jul 2021 17:21:28 -0700
Message-ID: <162734528861.2368309.16849274181317725077@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Jiaxun Yang (2021-07-22 19:25:37)
> We're moving pistachio to generic MIPS kernel. The clk driver
> should be avilable to the generic MIPS kernel.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
