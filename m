Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7911AAF42
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 19:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416489AbgDORNX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 13:13:23 -0400
Received: from muru.com ([72.249.23.125]:49644 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1416483AbgDORNS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 13:13:18 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 54633810E;
        Wed, 15 Apr 2020 17:13:52 +0000 (UTC)
Date:   Wed, 15 Apr 2020 10:13:00 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        James Hogan <jhogan@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        linux-samsung-soc@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Daniel Vetter <daniel@ffwll.ch>, kernel@pyra-handheld.com
Subject: Re: [PATCH v6 01/12] dt-bindings: add img, pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20200415171300.GG37466@atomide.com>
References: <cover.1586939718.git.hns@goldelico.com>
 <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
 <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan>
 <72919514-0657-4B71-902F-3E775E528F64@goldelico.com>
 <f4fdca8a-d18c-a8d2-7f51-d1ebbbab3647@baylibre.com>
 <535CAEBE-F43E-4BFC-B989-612C81F0D7EF@goldelico.com>
 <20200415142124.yzfh6mtqq7cdq22e@gilmour.lan>
 <DC0A2DE2-3D77-46F8-8DE1-55050FDACC9B@goldelico.com>
 <20200415162151.rwym4ioqz27migfn@gilmour.lan>
 <45F411C0-150B-4FBA-A0E1-B863B3F36DF6@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45F411C0-150B-4FBA-A0E1-B863B3F36DF6@goldelico.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200415 16:43]:
> If you agree I can add the clocks/clock-names property as an
> optional property. This should solve omap and all others.

Yes the clock can be optional property no problem. If we have
a clock, we just enable/disable it from the pvr_runtime_suspend()
and pvr_runtime_resume() we alaready have in pvr-drv.c.

Regards,

Tony
