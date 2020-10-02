Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8EA281051
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 12:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgJBKHu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 06:07:50 -0400
Received: from mail.thorsis.com ([92.198.35.195]:37162 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgJBKHu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Oct 2020 06:07:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 4300DF15;
        Fri,  2 Oct 2020 12:07:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id be5NQOu1yRPO; Fri,  2 Oct 2020 12:07:47 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 1482C3B69; Fri,  2 Oct 2020 12:07:47 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-leds@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 3/7] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date:   Fri, 02 Oct 2020 12:07:38 +0200
Message-ID: <1708987.KbI9FDK2aH@ada>
In-Reply-To: <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
References: <20200930234637.7573-1-post@lespocky.de> <20200930234637.7573-4-post@lespocky.de> <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Krzysztof,

Am Freitag, 2. Oktober 2020, 11:21:10 CEST schrieb Krzysztof Kozlowski:
> On Thu, 1 Oct 2020 at 01:51, Alexander Dahl <post@lespocky.de> wrote:
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).
> 
> What warning? Please post them here and in every DTS patch.

ack

> Your schema does not enforce pwmleds node naming (the main node, not
> children), or at least I could not see it. You change multiple files
> in your patchset so are you sure that all these are justified by
> warnings pointed out by schema?

The rename was suggested by Rob [1], and I think you're right, those names are 
not (yet) enforced by schema?  So at least the commit message is misleading 
for now.  I'll have to see if I rather reword or update the schema again.

Greets
Alex

[1] https://lore.kernel.org/linux-leds/20200922155747.GA2734659@bogus/


