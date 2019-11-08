Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A86FF516F
	for <lists+linux-mips@lfdr.de>; Fri,  8 Nov 2019 17:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfKHQps (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Nov 2019 11:45:48 -0500
Received: from muru.com ([72.249.23.125]:40840 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbfKHQps (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 Nov 2019 11:45:48 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5C24280D4;
        Fri,  8 Nov 2019 16:46:22 +0000 (UTC)
Date:   Fri, 8 Nov 2019 08:45:43 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] RFC: dt-bindings: add img,pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20191108164543.GD5610@atomide.com>
References: <cover.1573124770.git.hns@goldelico.com>
 <4292cec1fd82cbd7d42742d749557adb01705574.1573124770.git.hns@goldelico.com>
 <CAL_Jsq+ri3AXb=qhedBzQ6WufLm4aPrSqNxXiHd3_=mH3vJ8xw@mail.gmail.com>
 <52549A4C-F49D-4FE9-9CD2-B331FB486BA9@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52549A4C-F49D-4FE9-9CD2-B331FB486BA9@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191107 16:56]:
> > Am 07.11.2019 um 15:35 schrieb Rob Herring <robh+dt@kernel.org>:
> > On Thu, Nov 7, 2019 at 5:06 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >> Clock, Reset and power management should be handled
> >> by a parent node or elsewhere.
> > 
> > That's probably TI specific...
> 
> Yes and no.
> 
> For example the img4780 seems to need a clock reference in the
> gpu node. But it could maybe connected in a parent node like recent
> TI SoC do with the target-module approach.

The clocks are implemented at the SoC glue layer and/or the
interconnect layer, and then the device probably has it's
own clock gate controls.

> And our goal is to end up with a common driver for all SoC and architectures
> in far future. Then, probably clock, reset and power management should
> be handled in the same way.

Yeah so that's standard Linux features such as PM runtime
and genpd basically :)

So you can just leave out the clocks paragraph from the
binding. Then if clocks are really needed beyond PM runtime
and genpd, those can always be added later.

We just need a super minimal binding to start with that
only uses standard properties, then more can be added
later if needed.

Regards,

Tony
