Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D656864BD
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2019 16:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732815AbfHHOsm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Aug 2019 10:48:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:60586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbfHHOsl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Aug 2019 10:48:41 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9A572173E;
        Thu,  8 Aug 2019 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565275721;
        bh=ip5y6dS3z93opKHe2A5wm+Cj1WUaPJd1CfxGtTV6y/k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Kmc6cxo1tmL/b0B9Jg3h6uPuxP2RFntVvILJWjv8ZA/7tXozcXPE+bNWKEgyXhDp0
         5HC1gU+283Gi9ooXldMjVmpB7c0Plxn/p5JhhNdqLZSbuB3QpbfwzDqhYgNqTSNlY+
         4HV6LPHw7fACe/GZ925houOyyvzCH/FmPtMZFkto=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190724171615.20774-6-paul@crapouillou.net>
References: <20190724171615.20774-1-paul@crapouillou.net> <20190724171615.20774-6-paul@crapouillou.net>
Subject: Re: [PATCH v15 05/13] clk: ingenic: Add driver for the TCU clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me,
        Mathieu Malaterre <malat@debian.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
To:     Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Burton <paul.burton@mips.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 07:48:40 -0700
Message-Id: <20190808144840.D9A572173E@mail.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Paul Cercueil (2019-07-24 10:16:07)
> Add driver to support the clocks provided by the Timer/Counter Unit
> (TCU) of the JZ47xx SoCs from Ingenic.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

