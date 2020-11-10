Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C182AD777
	for <lists+linux-mips@lfdr.de>; Tue, 10 Nov 2020 14:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730663AbgKJNZc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 08:25:32 -0500
Received: from muru.com ([72.249.23.125]:47948 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgKJNZb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 10 Nov 2020 08:25:31 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F409180BA;
        Tue, 10 Nov 2020 13:25:34 +0000 (UTC)
Date:   Tue, 10 Nov 2020 15:25:25 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>
Subject: Re: [PATCH v7 09/12] ARM: dts: omap: Fix schema warnings for pwm-leds
Message-ID: <20201110132525.GK26857@atomide.com>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-10-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-10-post@lespocky.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* Alexander Dahl <post@lespocky.de> [201005 23:36]:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.

Applying into omap-for-v5.11/dt thanks.

Tony
