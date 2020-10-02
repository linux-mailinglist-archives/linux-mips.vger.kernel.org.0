Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545662810B6
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 12:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgJBKqQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 06:46:16 -0400
Received: from mail.thorsis.com ([92.198.35.195]:37725 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgJBKqQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Oct 2020 06:46:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id CDED399;
        Fri,  2 Oct 2020 12:46:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ROFvAfO2yA2R; Fri,  2 Oct 2020 12:46:13 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id EE74646E1; Fri,  2 Oct 2020 12:46:11 +0200 (CEST)
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
Subject: Re: [PATCH v6 2/7] dt-bindings: leds: Convert pwm to yaml
Date:   Fri, 02 Oct 2020 12:46:03 +0200
Message-ID: <9895379.VNsV0mSTfq@ada>
In-Reply-To: <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
References: <20200930234637.7573-1-post@lespocky.de> <20200930234637.7573-3-post@lespocky.de> <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hei hei,

Am Freitag, 2. Oktober 2020, 11:31:09 CEST schrieb Krzysztof Kozlowski:
> On Thu, 1 Oct 2020 at 01:52, Alexander Dahl <post@lespocky.de> wrote:
> > The example was adapted in the following ways:
> > 
> > - make use of the now supported 'function' and 'color' properties
> > - remove pwm nodes, those are documented elsewhere
> > - tweake node names to be matched by new dtschema rules
> 
> tweak? or align?

Depends on if schema actually checks it (child nodes) or if it's just DT 
policy (parent node).  I'll reword in v7.

> > License was discussed with the original author.
> 
> Since you relicense their work, you need an ack or signed off from
> every author. You cannot just say "I discussed" and post it. That way
> I could pretend (lie) I talked to Linus and try to relicense Linux to
> BSD...

I know.  Peter promised to give his Ack publicly on the list back when I 
worked on v2 or v3, so he is in Cc since then, but apparently he did not yet 
post it. ;-)

> You need acks/SoB from Peter and Russel.

Well, I should add Russel in v7, too, then.

Thanks
Alex



